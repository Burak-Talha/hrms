package com.example.hrms.core.auth.entity;


public record UserLoginDTO(String email, String password){

    public String getEmail(){
        return this.email;
    }

    public String getPassword(){
        return this.password;
    }
}
