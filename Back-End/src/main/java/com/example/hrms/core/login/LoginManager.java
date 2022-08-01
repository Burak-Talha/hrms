package com.example.hrms.core.login;


import com.example.hrms.core.dataAccess.UserDao;
import com.example.hrms.core.entity.User;
import org.springframework.stereotype.Component;
import org.springframework.web.context.annotation.RequestScope;

import java.util.Map;

@Component
@RequestScope
public class LoginManager{
    private LoggedManagementService loggedManagementService;
    private String password;
    private String email;


    public LoginManager(LoggedManagementService loggedManagementService){
        this.loggedManagementService = loggedManagementService;
    }

    public boolean login(UserLoginDto userLoginDto, UserDao userDao){
        Object user = userDao.findByEmailAndPassword(userLoginDto.getEmail(), userLoginDto.getPassword());
        if(user != null){
            loggedManagementService.setEmail(userLoginDto.getEmail());
            System.out.println("Logged in email : "+loggedManagementService.getEmail());
            return true;
        }
    return false;
    }

    public boolean googleLogin(Map<String, Object> googleUser, UserDao userDao){
        if((boolean) googleUser.get("email_verified") == true && userDao.findByEmail((String) googleUser.get("email")) != null){
            System.out.println(googleUser.get("email"));
            loggedManagementService.setEmail(String.valueOf(googleUser.get("email")));
            return true;
        }
        return false;
    }

    public String getServiceMail(){
        return loggedManagementService.getEmail();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

}
