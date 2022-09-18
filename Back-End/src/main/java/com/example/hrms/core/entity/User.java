package com.example.hrms.core.entity;

import lombok.Data;

import javax.persistence.*;

@Data
public class User {

    private String email;
    private String password;
}
