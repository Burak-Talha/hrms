package com.example.hrms.config.web;

import com.example.hrms.core.auth.entity.UserDetails;
import com.example.hrms.core.auth.jwt.JWTToken;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class BeanConfig {

    @Bean
    public UserDetails getUserDetails(){
        return new UserDetails();
    }


    @Bean
    public JWTToken getJwtToken(){
        return new JWTToken();
    }
}
