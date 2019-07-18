package cn.yuan.spring.boot.exam.demo.model;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Pager {

    private Integer row;
    private Integer page;
    private Integer pageSize;
    private Integer total;
    private Integer totalPage;

    public static Pager of(Integer page, Integer pageSize){
        return of(page, pageSize, null);
    }

    public static Pager of(Integer page, Integer pageSize, Integer total){
        Pager pager = new Pager();
        pager.total = total;
        pager.page = page;
        pager.pageSize = pageSize;
        if(total != null){
            pager.totalPage = (int) Math.ceil((double)total/pageSize);
            pager.page = page > pager.totalPage ? pager.totalPage : page;
            pager.row = (page - 1) * pageSize;
        }
        return pager;
    }
}
