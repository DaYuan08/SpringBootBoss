<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<%@ taglib  uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Crud Valid</title>
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
    <script src="/bootstrap/js/jquery-3.2.1.min.js"></script>
    <script src="/bootstrap/js/bootstrap.js"></script>
    <style>
        label{
            padding: 20px 10px 0px;
        }
        button{
            width: 64px;
            height: 38px;
            background-color: #009688;
            color:white;
        }
    </style>
</head>
<body>
<div style="margin:auto;">
    <form action="/crudValid/search" class="form-inline form-horizontal" style="text-align: center;" method="get">
        <label>
            用户名
            <input type="text" class="form-control" name="name" placeholder="请输入" value="${name eq null or name eq '' ?请输入用户名 :name }">
        </label>
        <label>
            年龄
            <input class="form-control" type="number" style="width:110px" name="minAge" value="${minAge }" min="0" max="200"/>
            <input class="form-control" type="number" style="width:110px" name="maxAge" value="${maxAge }" max="200"/>
        </label>
        <label>
            性别
            <select name="sex" class="form-control" style="width:210px">
                <option value="0" <c:if test="${sex == 0 }">selected</c:if>>不限</option>
                <option value="1" <c:if test="${sex == 1 }">selected</c:if>>男</option>
                <option value="2" <c:if test="${sex == 2 }">selected</c:if>>女</option>
            </select>
        </label>
        <label>
            籍贯
            <select name="nativePlace" class="form-control" style="width:210px">
                <option value="0" <c:if test="${nativePlace == 0 }">selected</c:if>>不限</option>
                <option value="1" <c:if test="${nativePlace == 1 }">selected</c:if>>北京市</option>
                <option value="2" <c:if test="${nativePlace == 2 }">selected</c:if>>上海市</option>
                <option value="3" <c:if test="${nativePlace == 3 }">selected</c:if>>重庆市</option>
                <option value="4" <c:if test="${nativePlace == 4 }">selected</c:if>>天津市</option>
                <option value="5" <c:if test="${nativePlace == 5 }">selected</c:if>>香港</option>
                <option value="6" <c:if test="${nativePlace == 6 }">selected</c:if>>澳门</option>
                <option value="7" <c:if test="${nativePlace == 7 }">selected</c:if>>河北省</option>
                <option value="8" <c:if test="${nativePlace == 8 }">selected</c:if>>山西省</option>
                <option value="9" <c:if test="${nativePlace == 9 }">selected</c:if>>辽宁省</option>
                <option value="10" <c:if test="${nativePlace == 10 }">selected</c:if>>吉林省</option>
                <option value="11" <c:if test="${nativePlace == 11 }">selected</c:if>>黑龙江省</option>
                <option value="12" <c:if test="${nativePlace == 12 }">selected</c:if>>江苏省</option>
                <option value="13" <c:if test="${nativePlace == 13 }">selected</c:if>>浙江省</option>
                <option value="14" <c:if test="${nativePlace == 14 }">selected</c:if>>安徽省</option>
                <option value="15" <c:if test="${nativePlace == 15 }">selected</c:if>>福建省</option>
                <option value="16" <c:if test="${nativePlace == 16 }">selected</c:if>>江西省</option>
                <option value="17" <c:if test="${nativePlace == 17 }">selected</c:if>>山东省</option>
                <option value="18" <c:if test="${nativePlace == 18 }">selected</c:if>>河南省</option>
                <option value="19" <c:if test="${nativePlace == 19 }">selected</c:if>>湖北省</option>
                <option value="20" <c:if test="${nativePlace == 20 }">selected</c:if>>湖南省</option>
                <option value="21" <c:if test="${nativePlace == 21 }">selected</c:if>>广东省</option>
                <option value="22" <c:if test="${nativePlace == 22 }">selected</c:if>>海南省</option>
                <option value="23" <c:if test="${nativePlace == 23 }">selected</c:if>>四川省</option>
                <option value="24" <c:if test="${nativePlace == 24 }">selected</c:if>>贵州省</option>
                <option value="25" <c:if test="${nativePlace == 25 }">selected</c:if>>云南省</option>
                <option value="26" <c:if test="${nativePlace == 26 }">selected</c:if>>陕西省</option>
                <option value="27" <c:if test="${nativePlace == 27 }">selected</c:if>>甘肃省</option>
                <option value="28" <c:if test="${nativePlace == 28 }">selected</c:if>>青海省</option>
                <option value="29" <c:if test="${nativePlace == 29 }">selected</c:if>>台湾省</option>
                <option value="30" <c:if test="${nativePlace == 30 }">selected</c:if>>广西壮族自治区</option>
                <option value="31" <c:if test="${nativePlace == 31 }">selected</c:if>>宁夏回族自治区</option>
                <option value="32" <c:if test="${nativePlace == 32 }">selected</c:if>>内蒙古自治区</option>
                <option value="33" <c:if test="${nativePlace == 33 }">selected</c:if>>新疆维吾尔自治区</option>
                <option value="34" <c:if test="${nativePlace == 34 }">selected</c:if>>西藏自治区</option>
            </select>
        </label>
        <button type="submit" class="btn"><span class="glyphicon glyphicon-search"></span></button>
    </form>
    <div style="padding-top:60px">
        <button type="button" class="btn" data-toggle="modal" data-target="#delete" >删除</button>
        <div class="modal fade" id="delete">
            <div class="modal-dialog" style="width: 40%;">
                <div class="modal-content">
                    <div class="modal-header" style="font-size: 20px;">
                        危险操作，需再次确认!
                        <button class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        确认删除所选用户？
                    </div>
                    <div class="modal-footer">
                        <form action="/crudValid/delete" id="deleteIds" method="post">
                            <button class="btn btn-info" data-dismiss="modal">取消</button>
                            <button type="submit" class="btn btn-danger" >确认</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <button type="button" id="addBtn" class="btn" data-toggle="modal" data-target="#insert">添加</button>
        <div class="modal fade" id="insert">
            <div class="modal-dialog" style="width: 50%;">
                <div class="modal-content">
                    <div class="modal-header" style="font-size:20px;">
                        请填写以下信息
                        <button class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <form:form action="/crudValid/add" modelAttribute="account" method="post" enctype="multipart/form-data" style="margin:auto;" class="form-horizontal">
                            <input type="hidden" name="token" value="addBtn" />
                            <div class="row">
                                <span class="col-xs-4 control-label" style="text-align:right;">头像</span>
                                <input class="col-xs-8 form-control" style="width:52%;height:32px; " type="file" name="header" accept="image/jpeg, image/jpg, image/png"/>
                                <form:errors path="headerImg" cssClass="has-error"/>
                            </div>
                            <div class="row">
                                <span class="col-xs-4 control-label" style="text-align:right;">用户名</span>
                                <form:input class="col-xs-8 form-control" style="width:52%;height:32px;" placeholder="请输入用户名" path="name"/>
                                <form:errors path="name" cssClass="has-error"/>
                            </div>
                            <div class="row">
                                <span class="col-xs-4 control-label" style="text-align:right;">籍贯</span>
                                <form:select path="nativePlace" class="col-xs-8 form-control" style="width:52%;height:32px;">
                                    <form:option value="0" >请选择户籍所在地</form:option>
                                    <form:option value="1" >北京市</form:option>
                                    <form:option value="2" >上海市</form:option>
                                    <form:option value="3" >重庆市</form:option>
                                    <form:option value="4" >天津市</form:option>
                                    <form:option value="5" >香港</form:option>
                                    <form:option value="6" >澳门</form:option>
                                    <form:option value="7" >河北省</form:option>
                                    <form:option value="8" >山西省</form:option>
                                    <form:option value="9" >辽宁省</form:option>
                                    <form:option value="10" >吉林省</form:option>
                                    <form:option value="11" >黑龙江省</form:option>
                                    <form:option value="12" >江苏省</form:option>
                                    <form:option value="13" >浙江省</form:option>
                                    <form:option value="14" >安徽省</form:option>
                                    <form:option value="15" >福建省</form:option>
                                    <form:option value="16" >江西省</form:option>
                                    <form:option value="17" >山东省</form:option>
                                    <form:option value="18" >河南省</form:option>
                                    <form:option value="19" >湖北省</form:option>
                                    <form:option value="20" >湖南省</form:option>
                                    <form:option value="21" >广东省</form:option>
                                    <form:option value="22" >海南省</form:option>
                                    <form:option value="23" >四川省</form:option>
                                    <form:option value="24" >贵州省</form:option>
                                    <form:option value="25" >云南省</form:option>
                                    <form:option value="26" >陕西省</form:option>
                                    <form:option value="27" >甘肃省</form:option>
                                    <form:option value="28" >青海省</form:option>
                                    <form:option value="29" >台湾省</form:option>
                                    <form:option value="30" >广西壮族自治区</form:option>
                                    <form:option value="31" >宁夏回族自治区</form:option>
                                    <form:option value="32" >内蒙古自治区</form:option>
                                    <form:option value="33" >新疆维吾尔自治区</form:option>
                                    <form:option value="34" >西藏自治区</form:option>
                                </form:select>
                                <form:errors path="nativePlace" cssClass="has-error"/>
                            </div>
                            <div class="row">
                                <span class="col-xs-4 control-label" style="text-align:right;">年龄</span>
                                <form:input class="col-xs-8 form-control" style="width:52%;height:32px;" type="number" placeholder="请输入年龄" path="age"/>
                                <form:errors path="age" cssClass="has-error"/>
                            </div>
                            <div class="row">
                                <span class="col-xs-4 control-label" style="text-align:right;">性别</span>
                                <form:select path="sex" class="col-xs-8 form-control" style="width:52%;height:32px;">
                                    <form:option value="1">男</form:option>
                                    <form:option value="2">女</form:option>
                                </form:select>
                                <form:errors path="sex" cssClass="has-error"/>
                            </div>
                            <div class="row">
                                <span class="col-xs-4 control-label" style="text-align:right;">生日</span>
                                <form:input class="col-xs-4 form-control" style="width:52%;height:32px;" type="date" path="birthDay" />
                                <form:errors path="birthDay" cssClass="has-error"/>
                            </div>
                            <div class="row">
                                <span class="col-xs-4 control-label" style="text-align:right;">爱好</span>
                                <label class="checkbox-inline">
                                    <input type="checkbox" name="hobby" value="篮球">篮球
                                </label>
                                <label class="checkbox-inline">
                                    <input type="checkbox" name="hobby" value="足球">足球
                                </label>
                                <label class="checkbox-inline">
                                    <input type="checkbox" name="hobby" value="羽毛球">羽毛球
                                </label>
                                <label class="checkbox-inline">
                                    <input type="checkbox" name="hobby" value="乒乓球">乒乓球
                                </label>
                            </div>
                            <div class="row col-xs-offset-7">
                                <input class="btn btn-default" type="reset" style="width:32%"/>
                                <input class="btn btn-info" type="submit" style="width:32%"/>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <table class="table table-hover table-bordered">
        <tr style="background-color:#EDEDED">
            <td>
                <input type="checkbox"/>
            </td>
            <th>id</th>
            <th>头像</th>
            <th>用户名</th>
            <th>籍贯</th>
            <th>年龄</th>
            <th>性别</th>
            <th>生日</th>
            <th>爱好</th>
            <th>操作</th>
        </tr>
        <c:set var="place" value="${['未知','北京市','上海市','重庆市','天津市','香港','澳门','河北省','山西省','辽宁省','吉林省','黑龙江省','江苏省','浙江省','安徽省','福建省','江西省','山东省','河南省','湖北省','湖南省','广东省','海南省','四川省','贵州省','云南省','陕西省','甘肃省','青海省','台湾省','广西壮族自治区','宁夏回族自治区','内蒙古自治区','新疆维吾尔自治区','西藏自治区']}"/>
        <c:forEach items="${accountList}" var="account">
            <tr>
                <td>
                    <input type="checkbox" name="ids" value="${account.id }" form="deleteIds"/>
                </td>
                <td>${account.id }</td>
                <td>
                    <img src="${PageContext.request.contextPath}/${account.headerImg }" style="width:24px;height:24px;">
                </td>
                <td>${account.name}</td>
                <td>${place[account.nativePlace]}</td>
                <td>${account.age}</td>
                <td>${account.sex == 0 ? "不限" : account.sex == 1 ? "男" : "女"}</td>
                <td><f:formatDate value="${account.birthDay}" pattern="yyyy-MM-dd"/></td>
                <td>${fn:substring(account.hobby, 1, fn:indexOf(account.hobby, "]")) == '' or account.hobby == null ?'不食人间烟火' :fn:substring(account.hobby, 1, fn:indexOf(account.hobby, "]"))}</td>
                <td>
                    <button class="btn btn-success glyphicon glyphicon-pencil" id="updateBtn${account.id}" style="height: 30px; font-size: 10px;" data-toggle="modal" data-target="#update${account.id }" >编辑</button>
                    <div class="modal fade" id="update${account.id }">
                        <div class="modal-dialog" style="width: 50%;">
                            <div class="modal-content">
                                <div class="modal-header" style="font-size:20px;">
                                    请填写要修改信息（选填）
                                    <button class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <div class="modal-body">
                                    <form:form action="/crudValid/update" style="margin:auto;" class="form-horizontal" enctype="multipart/form-data" method="post" modelAttribute="account">
                                        <form:input type="hidden" path="id" value="${account.id }" />
                                        <div class="row">
                                            <span class="col-xs-4 control-label" style="text-align:right;">头像</span>
                                            <input class="col-xs-8 form-control" style="width:52%;height:32px; " type="file" name="header" accept="image/jpeg, image/jpg, image/png"/>
                                        </div>
                                        <div class="row">
                                            <span class="col-xs-4 control-label" style="text-align:right;">用户名</span>
                                            <form:input class="col-xs-8 form-control" style="width:52%;height:32px;" type="text" path="name" value="${account.name}"/>
                                            <form:errors path="name" cssClass="has-error"/>
                                        </div>
                                        <div class="row">
                                            <span class="col-xs-4 control-label" style="text-align:right;">籍贯</span>
                                            <form:select path="nativePlace" class="col-xs-8 form-control" style="width:52%;height:32px;">
                                                <option value="0" <c:if test="${account.nativePlace == 0 }">selected</c:if>>请选择户籍所在地</option>
                                                <option value="1" <c:if test="${account.nativePlace == 1 }">selected</c:if>>北京市</option>
                                                <option value="2" <c:if test="${account.nativePlace == 2 }">selected</c:if>>上海市</option>
                                                <option value="3" <c:if test="${account.nativePlace == 3 }">selected</c:if>>重庆市</option>
                                                <option value="4" <c:if test="${account.nativePlace == 4 }">selected</c:if>>天津市</option>
                                                <option value="5" <c:if test="${account.nativePlace == 5 }">selected</c:if>>香港</option>
                                                <option value="6" <c:if test="${account.nativePlace == 6 }">selected</c:if>>澳门</option>
                                                <option value="7" <c:if test="${account.nativePlace == 7 }">selected</c:if>>河北省</option>
                                                <option value="8" <c:if test="${account.nativePlace == 8 }">selected</c:if>>山西省</option>
                                                <option value="9" <c:if test="${account.nativePlace == 9 }">selected</c:if>>辽宁省</option>
                                                <option value="10" <c:if test="${account.nativePlace == 10 }">selected</c:if>>吉林省</option>
                                                <option value="11" <c:if test="${account.nativePlace == 11 }">selected</c:if>>黑龙江省</option>
                                                <option value="12" <c:if test="${account.nativePlace == 12 }">selected</c:if>>江苏省</option>
                                                <option value="13" <c:if test="${account.nativePlace == 13 }">selected</c:if>>浙江省</option>
                                                <option value="14" <c:if test="${account.nativePlace == 14 }">selected</c:if>>安徽省</option>
                                                <option value="15" <c:if test="${account.nativePlace == 15 }">selected</c:if>>福建省</option>
                                                <option value="16" <c:if test="${account.nativePlace == 16 }">selected</c:if>>江西省</option>
                                                <option value="17" <c:if test="${account.nativePlace == 17 }">selected</c:if>>山东省</option>
                                                <option value="18" <c:if test="${account.nativePlace == 18 }">selected</c:if>>河南省</option>
                                                <option value="19" <c:if test="${account.nativePlace == 19 }">selected</c:if>>湖北省</option>
                                                <option value="20" <c:if test="${account.nativePlace == 20 }">selected</c:if>>湖南省</option>
                                                <option value="21" <c:if test="${account.nativePlace == 21 }">selected</c:if>>广东省</option>
                                                <option value="22" <c:if test="${account.nativePlace == 22 }">selected</c:if>>海南省</option>
                                                <option value="23" <c:if test="${account.nativePlace == 23 }">selected</c:if>>四川省</option>
                                                <option value="24" <c:if test="${account.nativePlace == 24 }">selected</c:if>>贵州省</option>
                                                <option value="25" <c:if test="${account.nativePlace == 25 }">selected</c:if>>云南省</option>
                                                <option value="26" <c:if test="${account.nativePlace == 26 }">selected</c:if>>陕西省</option>
                                                <option value="27" <c:if test="${account.nativePlace == 27 }">selected</c:if>>甘肃省</option>
                                                <option value="28" <c:if test="${account.nativePlace == 28 }">selected</c:if>>青海省</option>
                                                <option value="29" <c:if test="${account.nativePlace == 29 }">selected</c:if>>台湾省</option>
                                                <option value="30" <c:if test="${account.nativePlace == 30 }">selected</c:if>>广西壮族自治区</option>
                                                <option value="31" <c:if test="${account.nativePlace == 31 }">selected</c:if>>宁夏回族自治区</option>
                                                <option value="32" <c:if test="${account.nativePlace == 32 }">selected</c:if>>内蒙古自治区</option>
                                                <option value="33" <c:if test="${account.nativePlace == 33 }">selected</c:if>>新疆维吾尔自治区</option>
                                                <option value="34" <c:if test="${account.nativePlace == 34 }">selected</c:if>>西藏自治区</option>
                                            </form:select>
                                            <form:errors path="nativePlace" cssClass="has-error"/>
                                        </div>
                                        <div class="row">
                                            <span class="col-xs-4 control-label" style="text-align:right;">年龄</span>
                                            <form:input class="col-xs-8 form-control" style="width:52%;height:32px;" type="number" placeholder="当前年龄：${account.age}" path="age" value="${account.age}"/>
                                            <form:errors path="age" cssClass="has-error"/>
                                        </div>
                                        <div class="row">
                                            <span class="col-xs-4 control-label" style="text-align:right;">性别</span>
                                            <form:select path="sex" class="col-xs-8 form-control" style="width:52%;height:32px;">
                                                <option value="1" <c:if test="${account.sex == 1 }">selected</c:if>>男</option>
                                                <option value="2" <c:if test="${account.sex == 2 }">selected</c:if>>女</option>
                                            </form:select>
                                            <form:errors path="sex" cssClass="has-error"/>
                                        </div>
                                        <div class="row">
                                            <span class="col-xs-4 control-label" style="text-align:right;">生日</span>
                                            <input class="col-xs-4 form-control" style="width:52%;height:32px;" type="date" name="birthDay" value="<f:formatDate value="${account.birthDay}" pattern="yyyy-MM-dd"/>"/>
                                        </div>
                                        <div class="row">
                                            <span class="col-xs-4 control-label" style="text-align:right;">爱好</span>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" name="hobby" value="篮球" <c:if test="${fn:contains(account.hobby,'篮球')}">checked</c:if> >篮球
                                            </label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" name="hobby" value="足球" <c:if test="${fn:contains(account.hobby,'足球')}">checked</c:if> >足球
                                            </label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" name="hobby" value="羽毛球" <c:if test="${fn:contains(account.hobby,'羽毛球')}">checked</c:if> >羽毛球
                                            </label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" name="hobby" value="乒乓球" <c:if test="${fn:contains(account.hobby,'乒乓球')}">checked</c:if> >乒乓球
                                            </label>
                                        </div>
                                        <div class="row col-xs-offset-4">
                                            <input class="btn btn-default" type="reset" style="width:32%"/>
                                            <input class="btn btn-info" type="submit" style="width:32%"/>
                                        </div>
                                    </form:form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <button class="btn btn-danger glyphicon glyphicon-trash" style="height: 30px; font-size: 10px" data-toggle="modal" data-target="#deleteSingle${account.id }" onclick="return remove(${account.id })" >删除</button>
                    <%--<div class="modal fade" id="deleteSingle${account.id }">
                        <div class="modal-dialog" style="width: 40%;">
                            <div class="modal-content">
                                <div class="modal-header" style="font-size: 20px;">
                                    危险操作，需再次确认!
                                    <button class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <div class="modal-body">
                                    确认删除用户："${account.name}"？
                                </div>
                                <div class="modal-footer">
                                    <form action="/crudValid/delete" method="post">
                                        <input type="hidden" name="ids" value="${account.id}">
                                        <button class="btn btn-default" data-dismiss="modal">取消</button>
                                        <button type="submit" class="btn btn-danger">确定</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>--%>
                </td>
            </tr>
        </c:forEach>
    </table>
    <div style="text-align: center;">
        <ul class="pagination">
            <c:choose>
                <c:when test="${maxPage > 1}">
                    <li <c:if test="${cpage le 1}">class="disabled"</c:if> >
                        <a href="/crudValid/search?name=${name}&minAge=${minAge}&maxAge=${maxAge}&sex=${sex}&nativePlace=${nativePlace}&page=${cpage - 1}&pageSize=${pageSize}"><span>&laquo;</span></a>
                    </li>
                    <c:forEach begin="1" var="i" end="${maxPage}">
                        <li <c:if test="${cpage == i}"> class="active"</c:if> >
                            <a href="/crudValid/search?name=${name}&minAge=${minAge}&maxAge=${maxAge}&sex=${sex}&nativePlace=${nativePlace}&page=${i}&pageSize=${pageSize}">${i}</a>
                        </li>
                    </c:forEach>
                    <li <c:if test="${cpage ge maxPage}">class="disabled"</c:if> >
                        <a href="/crudValid/search?name=${name}&minAge=${minAge}&maxAge=${maxAge}&sex=${sex}&nativePlace=${nativePlace}&page=${cpage + 1}&pageSize=${pageSize}"><span>&raquo;</span></a>
                    </li>
                </c:when>
                <c:when test="${maxPage == 0}">
                    <b>当前系统没有用户符合查询信息.</b>
                </c:when>
                <c:otherwise>
                    <b>当前系统用户信息已全部显示，查询结果总数为：${accountCount}条数据.</b>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
    <div style="text-align: center;">
        <b>每页显示</b><input style="width:36px;height:22px;text-align: center;" type="number" name="pageSize" value="${pageSize}" id="changeSize" onkeypress="changeURLArg()"><b>条，输入后按回车.</b>
    </div>
</div>
</body>
<script>
    function changeURLArg() {
        if(event.keyCode == 13){
            var size = document.getElementById('changeSize').value;
            var url = window.location.href;
            var pattern='pageSize=([^&]*)';
            var replaceText='pageSize='+size;
            if(url.match(pattern)){
                var tmp='/(pageSize=)([^&]*)/gi';
                tmp=url.replace(eval(tmp),replaceText);
                window.location.href = tmp;
            }else{
                if(url.match('[\?]')){
                    window.location.href = url+'&'+replaceText;
                }else{
                    window.location.href = url+'search?'+replaceText;
                }
            }
        }
    }
    function remove(id){
        console.info(id)
        var xhr = new XMLHttpRequest();
        xhr.onload = function(){
            console.info(xhr.responseText)
            location.reload();
        }
        xhr.open("POST", '/crudValid/delete?ids='+id);
        xhr.send();
    }
</script>
<script>
    var verify = ${requestScope.verification}
    if(verify == 0){
        document.getElementById("addBtn").click();
    }else if(verify == 1){
        document.getElementById("updateBtn${account.id}").click();
    }
</script>
<script>
    var state = ${sessionScope.status};
    if(state = 0){
        alert("操作失败.")
    }else {
        alert("操作成功.")
    }
</script>
</html>