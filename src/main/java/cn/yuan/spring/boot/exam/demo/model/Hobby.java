package cn.yuan.spring.boot.exam.demo.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Hobby {

    private int id;
    private int accountId;
    private String hobby;

    public Hobby(int accountId, String hobby) {
        this.accountId = accountId;
        this.hobby = hobby;
    }
}
