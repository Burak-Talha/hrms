package com.example.hrms.business.concretes;

import java.util.List;


import com.example.hrms.core.utilities.results.DataResult;
import com.example.hrms.core.utilities.results.ErrorDataResult;
import com.example.hrms.core.utilities.results.SuccessDataResult;
import com.example.hrms.entities.concretes.dtos.concretes.EmployeeDto;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.hrms.business.abstracts.EmployeeService;
import com.example.hrms.dataaccess.abstracts.EmployeeDao;
import com.example.hrms.entities.concretes.Employee;
import org.springframework.web.bind.annotation.CrossOrigin;

@CrossOrigin(origins = "http://localhost:8080", maxAge = 3600)
@Service
public class EmployeeManager implements EmployeeService{

	Employee employee;

	private EmployeeDao employeeDao;
	
	@Autowired
	public EmployeeManager(EmployeeDao employeeDao) {
		this.employeeDao = employeeDao;
	}

	@Override
	public DataResult<Employee> login(String email, String password) {
		employee = employeeDao.findByEmailAndPassword(email, password);
		System.out.println("System User email input :"+email);
		System.out.println("System User password input :"+password);
		if(employee!=null){
			System.out.println("Kullanıcı eşleşti!");
			return new SuccessDataResult<Employee>(employee, true, "The "+employee.getEmail()+" logged in");
		}
		return new ErrorDataResult("Kullanıcı eşleşemedi");
	}

	// Buraya mailin web sitesiyle aynı domaine sahip kişilerin kayıt yaptırabileceği kuralı konacak
	@Override
	public DataResult<Employee> add(Employee employee) {
		if(employee.getEmail().length() >= 8) {
			employeeDao.save(employee);
			return new SuccessDataResult<>(employee, true);
		}
			return new ErrorDataResult("No Entry");
	}

	@Override
	public List<Employee> getAll() {
		return employeeDao.findAll();
	}

	@Override
	public List<Employee> findByPasswordIsNotNullAndEmailIsNotNull() {
		return employeeDao.findByPasswordIsNotNullAndEmailIsNotNull();
	}

	@Override
	public List<EmployeeDto> getIdMailAndPassword() {



		return employeeDao.getIdAndMailAndPassword();
	}

}
