package com.example.hrms.dataaccess.abstracts;

import com.example.hrms.entities.concretes.dtos.EmployeeDto;
import org.springframework.data.jpa.repository.JpaRepository;


import com.example.hrms.entities.concretes.Employee;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface EmployeeDao extends JpaRepository<Employee, Integer>{

    List<String> getByEmailNotNull();

    List<String> getByPasswordNotNull();

    List<Employee> findByPasswordIsNotNullAndEmailIsNotNull();

    @Query("SELECT e.id, e.email, e.password FROM Employee e")
    List<EmployeeDto> getIdAndMailAndPassword();
}