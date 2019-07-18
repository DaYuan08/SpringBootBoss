package cn.yuan.spring.boot.exam.demo.mapper;

import cn.yuan.spring.boot.exam.demo.model.Account;
import cn.yuan.spring.boot.exam.demo.model.Hobby;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface AccountMapper {

    int addAccount(Account account);
    int addHobby(@Param("hobbies")List<Hobby> hobbies);
    int deleteAccount(@Param("ids")String[] ids);
    int deleteHobby(@Param("ids")String[] ids);
    int updateAccount(Account account);
    List<Account> searchAll(@Param("name") String name, @Param("minAge")Integer minAge, @Param("maxAge")Integer maxAge, @Param("nativePlace")Integer nativePlace, @Param("sex")Integer sex, @Param("row")Integer row, @Param("pageSize")Integer pageSize);
    Account getAccount(Integer id);
    int count(@Param("name")String name, @Param("minAge")Integer minAge, @Param("maxAge")Integer maxAge, @Param("nativePlace")Integer nativePlace, @Param("sex")Integer sex);
}
