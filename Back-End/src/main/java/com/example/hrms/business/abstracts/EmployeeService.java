package com.example.hrms.business.abstracts;

import java.util.List;

import com.example.hrms.entities.concretes.Employee;
<<<<<<< Updated upstream
import com.example.hrms.entities.concretes.dtos.concretes.EmployeeDto;
=======
>>>>>>> Stashed changes


public interface EmployeeService {

public Employee login(String mail, String password);
public void add(Employee employee);
public List<Employee> getAll();
public List<Employee>findByPasswordIsNotNullAndEmailIsNotNull();
List<EmployeeDto> getIdMailAndPassword();


}
