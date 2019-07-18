package cn.yuan.spring.boot.exam.demo.controller;

import cn.yuan.spring.boot.exam.demo.mapper.AccountMapper;
import cn.yuan.spring.boot.exam.demo.model.Account;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;

@Controller
@RequestMapping("/valid")
public class ValidController {

    @Autowired
    private AccountMapper mapper;

    @GetMapping
    public String validTest(@ModelAttribute("account") Account account){
        return "validtest";
    }

    @PostMapping("/test")
    public String add(@RequestPart("headerImg") MultipartFile headerImg, @Valid @ModelAttribute("account") Account account, BindingResult result){
        return "validtest";
    }
}
