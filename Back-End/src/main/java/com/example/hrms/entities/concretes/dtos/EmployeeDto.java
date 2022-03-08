package com.example.hrms.entities.concretes.dtos;

import lombok.Data;

import java.io.Serializable;

@Data
public class EmployeeDto implements Serializable {
    private final int id;
    private final String email;
    private final String password;
}
