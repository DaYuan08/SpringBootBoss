let place = ['未知', '北京市', '上海市', '重庆市', '天津市', '香港', '澳门', '河北省', '山西省', '辽宁省', '吉林省', '黑龙江省', '江苏省', '浙江省', '安徽省', '福建省', '江西省', '山东省', '河南省', '湖北省', '湖南省', '广东省', '海南省', '四川省', '贵州省', '云南省', '陕西省', '甘肃省', '青海省', '台湾省', '广西壮族自治区', '宁夏回族自治区', '内蒙古自治区', '新疆维吾尔自治区', '西藏自治区'];
let sexs = ['未填写', '男', '女'];
layui.use(['form','table','layer','laydate','upload'], function () {
    window.$ = window.jQuery = layui.$;
    let tb = layui.table;
    let form = layui.form;
    let layer = layui.layer;
    let laydate = layui.laydate;
    let upload = layui.upload;
    let tabRef = tb.render({
        elem: '#table',
        page: true,
        limit: 5,
        limits: [5, 10, 20, 50, 100],
        toolbar: '#toolbar',
        url: '/lay',
        cols: [[
            { field: 'id', title: 'id', type: 'checkbox', fixed: 'left' },
            { field: 'id', title: 'id', sort: true },
            { field: 'headerImg', title: '头像', templet: function (data) {
                    return '<img width="24px" height="24px" src='+data.headerImg+'/>';
                }},
            { field: 'name', title: '用户名', sort: true },
            {
                field: 'nativePlace', title: '籍贯', sort: true, templet: function (row) {
                    return place[row.nativePlace];
                }
            },
            { field: 'age', title: '年龄', sort: true },
            {
                field: 'sex', title: '性别', sort: true, templet: function (row) {
                    return sexs[row.sex];
                }
            },
            { field: 'birthDay', title: '生日', sort: true},
            { field: 'hobby', title: '爱好' },
            { toolbar: '#tool', title: '操作' }
        ]],
        request: { limitName: 'pageSize' },
        parseData: function (reset) {
            return {
                code: reset.code,
                data: reset.data,
                count: reset.pager.total,
            }
        }
    });
    form.verify({
        username: [/[a-zA-Z0-6\.,_\-\u4e00-\u9fa5]{4,10}/,'系统支持的用户名格式为：中英文大小写数字0-6，特殊符号“ . , _ - ”,长度4到10位.'],
        age: function (value,item) {
            if(value < 0 || value > 200){
                return '系统支持的年龄范围为：0~200.';
            }
        }
    })
    form.on('submit(search)', function (data) {
        tabRef.reload({
            where: data.field
        });
        return false;
    })
    form.on('submit(form)', function (data) {
        let id = data.field.id;
        let method = 'POST';
        if (id) {
            method = 'PUT';
        }
        let xhr = new XMLHttpRequest();
        xhr.onload = function () {
            let res = xhr.response;
            if(res.code === 0){
                tabRef.reload();
                layer.closeAll();
            }else{
                layer.msg("操作失败.",{icon :0});
            }
        }
        xhr.responseType = 'json';
        xhr.open(method,"/lay");
        xhr.setRequestHeader("Content-Type", 'application/json')
        xhr.send(JSON.stringify(data.field));
        return false;
    })
    tb.on('toolbar(tab-tool)', function (data) {
        switch (data.event) {
            case 'add': {
                layer.open({
                    type: 1,
                    title: '新增.',
                    content: document.getElementById("form").innerHTML,
                    area: '600px',
                    success: function () {
                        form.render();
                        laydate.render({
                            elem: '.birthDay'
                        });
                        upload.render({
                            auto: false,
                            bindAction: '#affirm',
                            elem: '#upload',
                            url: '/upload',
                            acceptMime: 'image/jpeg, image/jpg, image/png',
                            before: function(obj){
                                obj.preview(function(index, file, result){
                                    $('#headerPreview').attr('src', result);
                                });
                            },
                            done: function(res){
                                if(res.code === 0){
                                    layer.msg("上传成功.",{icon:1});
                                    $('#headerPath').val(res.data);
                                }else{
                                    layer.msg("上传失败.",{icon:0});
                                }
                            }
                        });
                    }
                })
            } break;
            case 'delete': {
                let status = tb.checkStatus('table');
                if (status.data.length === 0) {
                    layer.msg("至少勾选要删除的id.");
                    return;
                }
                layer.confirm("确认删除所选用户？", { icon: 2, title: "删除." }, function (index) {
                    let ids = status.data.map(function (row) {
                        return row.id;
                    });
                    let url = "?";
                    for (let i = 0; i < ids.length; i++) {
                        url += (i === 0 ? "" : "&") + "ids=" + ids[i];
                    }
                    let xhr = new XMLHttpRequest();
                    xhr.onload = function () {
                        tabRef.reload();
                    };
                    xhr.open("DELETE", '/lay' + url);
                    xhr.send();
                    layer.close(index);
                    layer.msg("删除成功.",{icon:1});
                })
                break;
            }
            default:
                break;
        }
    })
    tb.on('tool(tab-tool)', function (data) {
        if (data.event === 'edit') {
            let id = data.data.id;
            let xhr = new XMLHttpRequest();
            xhr.onload = function(){
                let res = xhr.response;
                if(res.code === 0){
                    let data = res.data;
                    layer.open({
                        type: 1,
                        title: '编辑.',
                        content: document.getElementById("form").innerHTML,
                        area: '600px',
                        success: function () {
                            laydate.render({
                                elem: '.birthDay'
                            });
                            form.val('form',data);
                            form.render();
                            $('#headerPreview').attr('src', data.headerImg);
                            upload.render({
                                auto: false,
                                bindAction: '#affirm',
                                elem: '#upload',
                                url: '/upload',
                                acceptMime: 'image/jpeg, image/jpg, image/png',
                                done: function(res){
                                    if(res.code === 0){
                                        layer.msg("上传成功.",{icon:1});
                                        $('#headerPath').val(res.data);
                                    }else{
                                        layer.msg("上传失败.",{icon:0});
                                    }
                                }
                            });
                        }
                    })
                }
            }
            xhr.responseType='json';
            xhr.open("GET","/lay/"+id);
            xhr.send();
        } else if (data.event === 'delete') {
            layer.confirm("确认删除该用户？", { icon: 2, title: "删除." }, function (row) {
                data.del();
                let xhr = new XMLHttpRequest();
                xhr.onload = function () {
                    tabRef.reload();
                }
                xhr.open("DELETE", '/lay?ids=' + data.data.id);
                xhr.send();
                layer.close(row);
                layer.msg("删除成功.",{icon:1});
            })
        }
    })
})