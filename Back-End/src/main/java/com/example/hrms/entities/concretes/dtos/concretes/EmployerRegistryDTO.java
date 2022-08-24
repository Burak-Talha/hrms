package com.example.hrms.entities.concretes.dtos.concretes;

import com.example.hrms.entities.concretes.Employer;

public record EmployerRegistryDTO(Employer employer, String password){
    public Employer getEmployer(){
        return this.employer;
    }
    public String getPassword(){
        return this.password;
    }
}

