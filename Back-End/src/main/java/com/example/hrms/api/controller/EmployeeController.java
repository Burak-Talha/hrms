package com.example.hrms.api.controller;

import java.util.List;

import com.example.hrms.business.concretes.EmployeeManager;
import com.example.hrms.core.utilities.results.DataResult;
import com.example.hrms.core.utilities.results.SuccessDataResult;
import com.example.hrms.entities.concretes.dtos.concretes.EmployeeDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.hrms.business.abstracts.EmployeeService;
import com.example.hrms.business.abstracts.JobAdvertisementService;
import com.example.hrms.entities.concretes.Employee;
import com.example.hrms.entities.concretes.JobAdvertisement;

import javax.xml.crypto.Data;

@RestController
@RequestMapping("api/employee/")
public class EmployeeController {

	private EmployeeService employeeService;
	private JobAdvertisementService jobAdvertisementService;
	private EmployeeManager employeeManager;
	private boolean isLoginSuccess;

	@Autowired
	public EmployeeController(EmployeeService employeeService, JobAdvertisementService jobAdvertisementService, EmployeeManager employeeManager) {
		this.employeeService = employeeService;
		this.jobAdvertisementService = jobAdvertisementService;
		this.employeeManager = employeeManager;
	}

	// Working 16/11/21
	@PostMapping("add")
	public DataResult<Employee> add(@RequestBody Employee employee) {
		return employeeService.add(employee);
	}
	
	// Working 16/11/21
	@GetMapping("getall")
	public List<Employee> getAll(){
		return employeeService.getAll();
	}
	
	// Working without wrong boolean value 16/11/21
	@PostMapping("addadvertisement")
	public void addAdvertisement(@RequestBody JobAdvertisement jobAdvertisement) {
		jobAdvertisementService.add(jobAdvertisement);
	}
	
	@PostMapping("updateadvertisement")
	public void updateAdvertisement(@RequestBody JobAdvertisement jobAdvertisement) {
		jobAdvertisementService.update(jobAdvertisement);
	}
	
	@GetMapping("getadvertisement/{id}")
	public JobAdvertisement getAdvertisement(@PathVariable("id") int id) {
		return jobAdvertisementService.getAdvertisementByEmployeeId(id);
	}

	@PostMapping("login")
	public DataResult<Employee> login(@RequestBody EmployeeDto employeeDto){
		return employeeService.login(employeeDto.getEmail(), employeeDto.getPassword());
	}

	@PostMapping("register")
	public void register(@RequestBody Employee employee){
		employeeService.add(employee);
	}

	@GetMapping("loginresult")
	public boolean loginResult(){
		return isLoginSuccess;
	}

	@GetMapping("getshortdata")
	public List<EmployeeDto> getIdMailAndPassword(){
		return employeeService.getIdMailAndPassword();
	}
}
