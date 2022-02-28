package com.example.hrms.dataaccess.abstracts;

import com.example.hrms.entities.concretes.DTOs.EmployeeDTO;
import org.springframework.data.jpa.repository.JpaRepository;


import com.example.hrms.entities.concretes.Employee;

import java.util.List;

public interface EmployeeDao extends JpaRepository<Employee, Integer>{

    List<String> getMail();
    List<String> getPassword();
    void login();
    List<EmployeeDTO> getMailAndPassword();
}
