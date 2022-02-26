package com.example.hrms.business.abstracts;

import java.util.List;

import com.example.hrms.entities.concretes.Employee;


public interface EmployeeService {
public void add(Employee employee);
public List<Employee> getAll();

}
