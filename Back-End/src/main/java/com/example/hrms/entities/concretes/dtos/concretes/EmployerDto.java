package com.example.hrms.entities.concretes.dtos.concretes;

import com.example.hrms.core.login.UserLoginDto;
import com.example.hrms.entities.concretes.dtos.abstracts.DTOs;
import lombok.Data;
import lombok.Getter;

import java.io.Serializable;

@Data
public class EmployerDto extends UserLoginDto implements Serializable, DTOs {
    private final String email;
    private final String password;
}
