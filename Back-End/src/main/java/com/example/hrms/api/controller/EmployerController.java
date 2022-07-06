package com.example.hrms.api.controller;

import java.util.List;

import com.example.hrms.business.concretes.EmployerManager;
import com.example.hrms.core.utilities.results.DataResult;
import com.example.hrms.core.utilities.results.SuccessDataResult;
import com.example.hrms.entities.concretes.dtos.concretes.EmployerDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.hrms.business.abstracts.EmployerService;
import com.example.hrms.business.abstracts.JobAdvertisementService;
import com.example.hrms.entities.concretes.Employer;
import com.example.hrms.entities.concretes.JobAdvertisement;

@RestController
@RequestMapping("api/employee/")
public class EmployerController {

	private EmployerService employerService;
	private JobAdvertisementService jobAdvertisementService;
	private EmployerManager employerManager;

	@Autowired
	public EmployerController(EmployerService employeeService, JobAdvertisementService jobAdvertisementService, EmployerManager employerManager) {
		this.employerService = employeeService;
		this.jobAdvertisementService = jobAdvertisementService;
		this.employerManager = employerManager;
	}

	// Working 16/11/21
	@PostMapping("add")
	public DataResult<Employer> add(@RequestBody Employer employee) {
		return employerService.add(employee);
	}
	
	// Working 16/11/21
	@GetMapping("getall")
	public DataResult<Employer> getAll(){
		return new SuccessDataResult<Employer>(employerService.getAll(), true);
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
	public DataResult<Employer> login(@RequestBody EmployerDto employeeDto){
		return employerService.login(employeeDto.getEmail(), employeeDto.getPassword());
	}

	@PostMapping("register")
	public void register(@RequestBody Employer employee){
		employerService.add(employee);
	}

	@GetMapping("getshortdata")
	public List<EmployerDto> getMailAndPassword(){
		return employerService.getMailAndPasswords();
	}
}
