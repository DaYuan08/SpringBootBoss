package cn.yuan.spring.boot.exam.demo.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AccountResponse {

    private Integer code;
    private String desc;
    private Object data;
    private Pager pager;

    public static AccountResponse of(Integer code, Object data) {
        return ofWithPager(code, data, null);
    }

    public static AccountResponse ofWithPager(Integer code, Object data, Pager pager) {
        AccountResponse response = new AccountResponse();
        response.code = code;
        response.desc = "ok";
        response.data = data;
        response.pager = pager;
        return response;
    }

    public static AccountResponse ofSuccess() {
        return ofSuccess(null);
    }

    public static AccountResponse ofSuccess(Object data) {
        return ofSuccessWithPage(data, null);
    }

    public static AccountResponse ofFail(Object data) {
        return ofWithPager(10000, data, null);
    }

    public static AccountResponse ofSuccessWithPage(Object data, Pager pager) {
        return ofWithPager(0, data, pager);
    }
}
