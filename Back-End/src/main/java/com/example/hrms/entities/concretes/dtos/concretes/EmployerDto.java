package com.example.hrms.entities.concretes.dtos.concretes;

import com.example.hrms.entities.concretes.dtos.abstracts.DTOs;
import lombok.Data;
import lombok.Getter;

import java.io.Serializable;

@Data
@Getter
public class EmployerDto implements Serializable, DTOs {
    private final int id;
    private final String email;
    private final String password;
}
