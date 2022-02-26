package com.example.hrms.business.concretes;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.hrms.business.abstracts.EmployeeService;
import com.example.hrms.dataaccess.abstracts.EmployeeDao;
import com.example.hrms.entities.concretes.Employee;

// Bütün controller sınıflarında ilk başta @Getter anotasyonu yüzünden bir sorun meydana geliyor ve null değer döndürüyor 18//11/21
@Service
public class EmployeeManager implements EmployeeService{

	private EmployeeDao employeeDao;
	
	@Autowired
	public EmployeeManager(EmployeeDao employeeDao) {
		this.employeeDao = employeeDao;
	}

	// Buraya mailin web sitesiyle aynı domaine sahip kişilerin kayıt yaptırabileceği kuralı konacak
	@Override
	public void add(Employee employee) {
		employeeDao.save(employee);
		System.out.println("Kullanıcı eklendi"+employee.getCorporationName());
	}

	@Override
	public List<Employee> getAll() {
		for(Employee employee : employeeDao.findAll()) {
			System.out.println(employee.getCorporationName());
		}
		return employeeDao.findAll();
	}
}
