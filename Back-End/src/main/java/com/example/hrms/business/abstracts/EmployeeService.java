package com.example.hrms.business.abstracts;

import java.util.List;

import com.example.hrms.entities.concretes.Employee;
import com.example.hrms.entities.concretes.dtos.EmployeeDto;


public interface EmployeeService {

public boolean login(String mail, String password);
public void add(Employee employee);
public List<Employee> getAll();
public List<Employee>findByPasswordIsNotNullAndEmailIsNotNull();
List<EmployeeDto> getIdMailAndPassword();


}
