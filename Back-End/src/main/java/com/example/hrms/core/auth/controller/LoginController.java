package com.example.hrms.core.auth.controller;

import com.example.hrms.core.auth.business.abstracts.LoginAndRoleService;
import com.example.hrms.core.auth.dataAccess.UserDetailsDao;
import com.example.hrms.core.auth.entity.UserDetails;
import com.example.hrms.core.auth.entity.UserLoginDTO;
import com.example.hrms.core.utilities.results.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RestController
@RequestMapping("/auth/")
public class LoginController{

    LoginAndRoleService loginAndRoleService;
    UserDetailsDao userDetailsDao;

    @Autowired
    public LoginController(LoginAndRoleService loginAndRoleService, UserDetailsDao userDetailsDao) {
        this.loginAndRoleService = loginAndRoleService;
        this.userDetailsDao = userDetailsDao;
    }

    @PostMapping("login")
    public Result login(@RequestBody UserLoginDTO userLoginDTO, HttpServletRequest httpServletRequest) {
        return loginAndRoleService.login(userLoginDTO, httpServletRequest);
    }

    @GetMapping("get")
    public UserLoginDTO get(){
        return new UserLoginDTO("ads", "sdf");
    }

    @PostMapping("logout")
    public Result logout() {
        return loginAndRoleService.logout();
    }

    @GetMapping("getall")
    public List<UserDetails> getAll(){
        return userDetailsDao.findAll();
    }
}
