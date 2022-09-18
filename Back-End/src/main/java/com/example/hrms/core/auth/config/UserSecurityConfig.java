package com.example.hrms.core.auth.config;

import com.example.hrms.core.auth.entity.UserDetails;
import com.example.hrms.core.auth.jwt.JWTToken;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Lazy;
import org.springframework.core.annotation.Order;
import org.springframework.data.repository.cdi.Eager;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.Date;

@Configuration
public class UserSecurityConfig{

    @Bean
    public PasswordEncoder getPasswordEncoder(){
        return new BCryptPasswordEncoder(10);
    }

    @Bean
    public UserDetails getUserDetails(){
        return new UserDetails();
    }

    @Bean
    public Date getDate(){
        return new Date();
    }

    @Bean
    public JWTToken getJwtToken(){
        return new JWTToken();
    }

}
