package com.example.hrms.business.abstracts;

import java.util.List;

import com.example.hrms.core.utilities.results.DataResult;
import com.example.hrms.core.utilities.results.SuccessDataResult;
import com.example.hrms.entities.concretes.Employee;

import com.example.hrms.entities.concretes.dtos.concretes.EmployeeDto;

import javax.xml.crypto.Data;


public interface EmployeeService {

public DataResult<Employee> login(String mail, String password);
public DataResult<Employee> add(Employee employee);
public List<Employee> getAll();
public List<Employee>findByPasswordIsNotNullAndEmailIsNotNull();
List<EmployeeDto> getIdMailAndPassword();


}
