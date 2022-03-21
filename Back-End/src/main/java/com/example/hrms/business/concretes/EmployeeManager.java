package com.example.hrms.business.concretes;

import java.util.List;


import com.example.hrms.entities.concretes.dtos.concretes.EmployeeDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.hrms.business.abstracts.EmployeeService;
import com.example.hrms.dataaccess.abstracts.EmployeeDao;
import com.example.hrms.entities.concretes.Employee;

// Bütün controller sınıflarında ilk başta @Getter anotasyonu yüzünden bir sorun meydana geliyor ve null değer döndürüyor 18//11/21
@Service
public class EmployeeManager implements EmployeeService{

	private List<String> mails;
	private List<String> passwords;
	private EmployeeDao employeeDao;
	
	@Autowired
	public EmployeeManager(EmployeeDao employeeDao) {
		this.employeeDao = employeeDao;
	}

	@Override
	public boolean login(String mail, String password) {

		passwords = employeeDao.getByPasswordNotNull();
		mails = employeeDao.getByEmailNotNull();

		int i = 0;

			while (i < passwords.size()) {
				if(mails.get(i).equals(mail) && passwords.get(i) == password){
					return true;
				}
			}

		return false;
	}

	// Buraya mailin web sitesiyle aynı domaine sahip kişilerin kayıt yaptırabileceği kuralı konacak
	@Override
	public void add(Employee employee) {
		employeeDao.save(employee);
		System.out.println("Kullanıcı eklendi"+employee.getCorporationName());
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
