package com.example.hrms.dataaccess.abstracts;

import org.springframework.data.jpa.repository.JpaRepository;


import com.example.hrms.entities.concretes.Employee;

public interface EmployeeDao extends JpaRepository<Employee, Integer>{

}
