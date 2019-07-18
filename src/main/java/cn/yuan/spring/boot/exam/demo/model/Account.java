package cn.yuan.spring.boot.exam.demo.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Range;

import javax.validation.constraints.*;
import java.util.Date;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Account {

    private Integer id;
    private String headerImg;

    @NotEmpty(message = "请填写用户名！")
    @Pattern(regexp = "[A-Za-z0-6\\.,_\\-\u4e00-\u9fa5]{4,10}",message = "系统支持的用户名格式为：中英文大小写数字0-6，特殊符号“_-.,”,长度4到10位.")
    private String name;

    @NotNull(message = "请选择籍贯.")
    @Range(min = 0,max = 34,message = "请选择系统支持的籍贯.")
    private Integer nativePlace;

    @NotNull(message = "请填写年龄！系统支持的年龄范围为：0~200.")
    @Range(min = 0,max = 200,message = "系统支持的年龄范围为：0~200.")
    private Integer age;

    @NotNull(message = "请选择性别.")
    @Range(min = 0,max = 2)
    private Integer sex;

    @NotNull(message = "请填写生日日期！")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date birthDay;

    private List<String> hobby;

}
