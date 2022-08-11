package com.example.hrms.core.login;


import com.example.hrms.core.EmployerLoginPremonitory;
import com.example.hrms.core.GoogleEmployerLoginPremonitory;
import com.example.hrms.core.dataAccess.UserDao;
import com.example.hrms.core.entity.User;
import com.example.hrms.core.utilities.results.DataResult.ErrorDataResult;
import com.example.hrms.core.utilities.results.DataResult.SuccessDataResult;
import com.example.hrms.entities.concretes.Employer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.annotation.RequestScope;

import java.util.List;
import java.util.Map;

@Component
@RequestScope
public class LoginManager{
    private LoggedManagementService loggedManagementService;

    private GoogleEmployerLoginPremonitory googleEmployerLoginPremonitory;
    private EmployerLoginPremonitory employerLoginPremonitory;
    private String password;
    private String email;


    @Autowired
    public LoginManager(LoggedManagementService loggedManagementService, GoogleEmployerLoginPremonitory googleEmployerLoginPremonitory, EmployerLoginPremonitory employerLoginPremonitory){
        this.loggedManagementService = loggedManagementService;
        this.googleEmployerLoginPremonitory = googleEmployerLoginPremonitory;
        this.employerLoginPremonitory = employerLoginPremonitory;
    }

    public boolean login(UserLoginDto userLoginDto, UserDao userDao){
        Object user = userDao.findByEmailAndPassword(userLoginDto.getEmail(), userLoginDto.getPassword());
        if(user != null){
            loggedManagementService.setEmail(userLoginDto.getEmail());
            employerLoginPremonitory.setEmployerDataResult(new SuccessDataResult<Employer>((Employer) userDao.findByEmail(String.valueOf(userLoginDto.getEmail())), "Login transaction generated successfully"));
            System.out.println("Logged in email : "+loggedManagementService.getEmail());
            return true;
        }
    return false;
    }

    public boolean googleLogin(Map<String, Object> googleUser, UserDao userDao){
        if((boolean) googleUser.get("email_verified") == true && userDao.findByEmail((String) googleUser.get("email")) != null){
            loggedManagementService.setEmail(String.valueOf(googleUser.get("email")));
            googleEmployerLoginPremonitory.setEmployerDataResult(new SuccessDataResult<Employer>((Employer) userDao.findByEmail(String.valueOf(googleUser.get("email")))));
            return true;
        }
            googleEmployerLoginPremonitory.setEmployerDataResult(new ErrorDataResult("Fail google auth"));
        return false;
    }

    public void logout(){
        loggedManagementService.setEmail(null);
        googleEmployerLoginPremonitory.setEmployerDataResult(null);
        employerLoginPremonitory.setEmployerDataResult(null);
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