package cn.yuan.spring.boot.exam.demo.controller;

import cn.yuan.spring.boot.exam.demo.mapper.AccountMapper;
import cn.yuan.spring.boot.exam.demo.model.Account;
import cn.yuan.spring.boot.exam.demo.model.Hobby;
import static cn.yuan.spring.boot.exam.demo.utils.HeaderImgUtils.getPath;
import static org.springframework.format.annotation.DateTimeFormat.ISO.DATE;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

@Component
@Controller
@RequestMapping("/crud")
public class CrudController {

    @Autowired
    private AccountMapper mapper;

    @Autowired
    private HttpServletRequest request;

    @GetMapping
    public void jsp(){
        search(null,null,null,0,0,1,10);
    }

    @PostMapping("/add")
    public String add(@RequestPart("headerFile") Part headerImg, String name, Integer nativePlace, Integer age, Integer sex, @DateTimeFormat(iso = DATE) Date birthDay, String[] hobby) {
        Account account = new Account();
        account.setHeaderImg(getPath(headerImg));
        account.setName(name);
        account.setNativePlace(nativePlace);
        account.setAge(age);
        account.setSex(sex);
        account.setBirthDay(birthDay);
        Integer state = mapper.addAccount(account);
        if(hobby != null){
            List<Hobby> hobbies = new LinkedList<>();
            for (String hy:hobby) {
                hobbies.add(new Hobby(account.getId(),hy));
            }
            mapper.addHobby(hobbies);
        }
        request.setAttribute("state",state);
        return "redirect:"+request.getHeader("Referer");
    }

    @PostMapping("/delete")
    public String delete(String[] ids){
        mapper.deleteHobby(ids);
        Integer state = mapper.deleteAccount(ids);
        request.setAttribute("state",state);
        return "redirect:"+request.getHeader("Referer");
    }

    @PostMapping("update")
    public String update(Integer accountId, @RequestParam("headerFile") Part headerImg, String name, Integer nativePlace, Integer age, Integer sex, @DateTimeFormat(iso = DATE) Date birthDay, String[] hobby){
        Account account = new Account();
        if(headerImg.getSize() != 0){
            account.setHeaderImg(getPath(headerImg));
        }
        account.setId(accountId);
        account.setName(name);
        account.setNativePlace(nativePlace);
        account.setAge(age);
        account.setSex(sex);
        account.setBirthDay(birthDay);
        Integer state = mapper.updateAccount(account);
        if(hobby != null){
            mapper.deleteHobby(new String[]{String.valueOf(account.getId())});
            List<Hobby> hobbies = new LinkedList<>();
            for (String hy:hobby) {
                hobbies.add(new Hobby(account.getId(),hy));
            }
            mapper.addHobby(hobbies);
        }
        request.setAttribute("state",state);
        return "redirect:"+request.getHeader("Referer");
    }

    @GetMapping("/search")
    public String search(String name, Integer minAge, Integer maxAge, Integer nativePlace, Integer sex, Integer page, Integer pageSize){
        int count = mapper.count(name,minAge,maxAge,nativePlace,sex);
        pageSize = pageSize != null ?pageSize :10;
        int maxPage = (int) Math.ceil((double)count/pageSize);
        page = page != null ?page > maxPage ?maxPage :page :1;
        int row = (page - 1) * pageSize;
        List<Account> accountList = mapper.searchAll(name,minAge,maxAge,nativePlace,sex,row,pageSize);
        request.setAttribute("cpage",page);
        request.setAttribute("maxPage",maxPage);
        request.setAttribute("pageSize",pageSize);
        request.setAttribute("name",name);
        request.setAttribute("minAge",minAge);
        request.setAttribute("maxAge",maxAge);
        request.setAttribute("nativePlace",nativePlace);
        request.setAttribute("sex",sex);
        request.setAttribute("accountCount",count);
        request.setAttribute("accountList",accountList);
        return "crud";
    }

}
