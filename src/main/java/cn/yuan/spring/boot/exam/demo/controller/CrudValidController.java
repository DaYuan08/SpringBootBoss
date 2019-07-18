package cn.yuan.spring.boot.exam.demo.controller;

import cn.yuan.spring.boot.exam.demo.mapper.AccountMapper;
import cn.yuan.spring.boot.exam.demo.model.Account;
import cn.yuan.spring.boot.exam.demo.model.Hobby;
import static cn.yuan.spring.boot.exam.demo.utils.HeaderImgUtils.getPath;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.validation.Valid;
import java.util.LinkedList;
import java.util.List;

@Component
@Controller
@RequestMapping("/crudValid")
public class CrudValidController {

    @Autowired
    private AccountMapper mapper;

    @Autowired
    private HttpServletRequest request;

    @Autowired
    private HttpSession session;

    private Integer verification;

    private Integer status;

    @GetMapping
    public void jsp(@ModelAttribute("account") Account account,ModelMap map){
        search(null,null,null,0,0,1,10,account,map);
    }

    @PostMapping("/add")
    public String add(@RequestPart("header") Part headerImg, @Valid @ModelAttribute("account") Account account, BindingResult result, String[] hobby, @RequestHeader String referer) {
        if(headerImg.getSize() == 0){
            result.addError(new FieldError("account","headerImg","请上传头像."));
        }
        if(result.hasErrors()){
            verification = 0;
            request.setAttribute("verification", verification);
            request.setAttribute("referer", referer);
            return "crudValid";
        }
        account.setHeaderImg(getPath(headerImg));
        status = mapper.addAccount(account);
        if(hobby != null){
            List<Hobby> hobbies = new LinkedList<>();
            for (String hy:hobby) {
                hobbies.add(new Hobby(account.getId(),hy));
            }
            mapper.addHobby(hobbies);
        }
        session.setAttribute("status",status);
        return "redirect:"+referer;
    }

    @PostMapping("/delete")
    public String delete(String[] ids){
        mapper.deleteHobby(ids);
        status = mapper.deleteAccount(ids);
        session.setAttribute("status",status);
        return "redirect:"+request.getHeader("Referer");
    }

    @PostMapping("update")
    public String update(@RequestPart("header") Part headerImg, @Valid @ModelAttribute("account") Account account, BindingResult result, String[] hobby){
        if(result.hasErrors()){
            verification = 1;
            request.setAttribute("verification", verification);
            return "crudValid";
        }
        if(headerImg.getSize() != 0){
            account.setHeaderImg(getPath(headerImg));
        }
        status = mapper.updateAccount(account);
        if(hobby != null){
            mapper.deleteHobby(new String[]{String.valueOf(account.getId())});
            List<Hobby> hobbies = new LinkedList<>();
            for (String hy:hobby) {
                hobbies.add(new Hobby(account.getId(),hy));
            }
            mapper.addHobby(hobbies);
        }
        session.setAttribute("status",status);
        return "redirect:"+request.getHeader("Referer");
    }

    @GetMapping("/search")
    public String search(String name, Integer minAge, Integer maxAge, Integer nativePlace, Integer sex, Integer page, Integer pageSize, @ModelAttribute("account") Account account, ModelMap map){
        int count = mapper.count(name,minAge,maxAge,nativePlace,sex);
        pageSize = pageSize != null ?pageSize :10;
        int maxPage = (int) Math.ceil((double)count/pageSize);
        page = page != null ?page > maxPage ?maxPage :page :1;
        int row = (page - 1) * pageSize;
        List<Account> accountList = mapper.searchAll(name,minAge,maxAge,nativePlace,sex,row,pageSize);
        map.put("name",name);
        map.put("minAge",minAge);
        map.put("maxAge",maxAge);
        map.put("nativePlace",nativePlace);
        map.put("sex",sex);
        session.setAttribute("cpage",page);
        session.setAttribute("maxPage",maxPage);
        session.setAttribute("pageSize",pageSize);
        session.setAttribute("accountCount",count);
        session.setAttribute("accountList",accountList);
        return "crudValid";
    }

}
