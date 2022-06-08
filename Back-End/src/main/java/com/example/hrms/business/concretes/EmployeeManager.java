package com.example.hrms.business.concretes;

import java.util.List;


<<<<<<< Updated upstream
import com.example.hrms.entities.concretes.dtos.concretes.EmployeeDto;
=======
>>>>>>> Stashed changes
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.hrms.business.abstracts.EmployeeService;
import com.example.hrms.dataaccess.abstracts.EmployeeDao;
import com.example.hrms.entities.concretes.Employee;

// Bütün controller sınıflarında ilk başta @Getter anotasyonu yüzünden bir sorun meydana geliyor ve null değer döndürüyor 18//11/21
@Service
public class EmployeeManager implements EmployeeService{

	Employee employee;

	private EmployeeDao employeeDao;
	
	@Autowired
	public EmployeeManager(EmployeeDao employeeDao) {
		this.employeeDao = employeeDao;
	}

	@Override
	public Employee login(String email, String password) {
		employee = employeeDao.findByEmailAndPassword(email, password);
		if(employee!=null){
			System.out.println("Kullanıcı eşleşti!");
			return employee;
		}
		System.out.println("Kullanıcı eşleşmedi");
		return null;
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
