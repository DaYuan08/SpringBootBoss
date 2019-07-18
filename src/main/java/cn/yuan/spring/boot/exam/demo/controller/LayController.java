package cn.yuan.spring.boot.exam.demo.controller;

import cn.yuan.spring.boot.exam.demo.mapper.AccountMapper;
import cn.yuan.spring.boot.exam.demo.model.Account;
import cn.yuan.spring.boot.exam.demo.model.AccountResponse;
import cn.yuan.spring.boot.exam.demo.model.Hobby;
import cn.yuan.spring.boot.exam.demo.model.Pager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.LinkedList;
import java.util.List;


@RestController
@RequestMapping("/lay")
@CrossOrigin
public class LayController {

    @Autowired
    private AccountMapper mapper;

    @PostMapping
    public AccountResponse add(@RequestBody @Valid Account account) {
        mapper.addAccount(account);
        if(account.getHobby() != null){
            List<Hobby> hobbies = new LinkedList<>();
            for (String hy:account.getHobby()) {
                hobbies.add(new Hobby(account.getId(),hy));
            }
            mapper.addHobby(hobbies);
        }
        return AccountResponse.ofSuccess();
    }

    @DeleteMapping
    public AccountResponse delete(String[] ids){
        mapper.deleteHobby(ids);
        mapper.deleteAccount(ids);
        return AccountResponse.ofSuccess();
    }

    @PutMapping
    public AccountResponse update(@RequestBody @Valid Account account){
        mapper.updateAccount(account);
        if(account.getHobby() != null){
            mapper.deleteHobby(new String[]{String.valueOf(account.getId())});
            List<Hobby> hobbies = new LinkedList<>();
            for (String hy:account.getHobby()) {
                hobbies.add(new Hobby(account.getId(),hy));
            }
            mapper.addHobby(hobbies);
        }
        return AccountResponse.ofSuccess();
    }

    @GetMapping("/{id}")
    public AccountResponse getAccount(@PathVariable("id") Integer id){
        return AccountResponse.ofSuccess(mapper.getAccount(id));
    }

    @GetMapping
    public AccountResponse search(String name, Integer minAge, Integer maxAge, Integer nativePlace, Integer sex, @RequestParam(value = "page", defaultValue = "1") Integer page, @RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize){
        int count = mapper.count(name,minAge,maxAge,nativePlace,sex);
        Pager pager = Pager.of(page,pageSize,count);
        List<Account> accountList = mapper.searchAll(name, minAge, maxAge, nativePlace, sex, pager.getRow(), pager.getPageSize());
        return AccountResponse.ofWithPager(0,accountList,pager);
    }


}
