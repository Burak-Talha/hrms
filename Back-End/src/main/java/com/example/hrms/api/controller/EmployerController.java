package com.example.hrms.api.controller;

import com.example.hrms.core.auth.entity.UserLoginDTO;
import com.example.hrms.core.utilities.results.DataResult.DataResult;
import com.example.hrms.core.utilities.results.DataResults.DataResults;
import com.example.hrms.core.utilities.results.Result;
import com.example.hrms.entities.concretes.dtos.concretes.EmployerRegistryDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.web.bind.annotation.*;

import com.example.hrms.business.abstracts.EmployerService;
import com.example.hrms.business.abstracts.JobAdvertisementService;
import com.example.hrms.entities.concretes.Employer;
import com.example.hrms.entities.concretes.JobAdvertisement;

@RestController
@RequestMapping("api/employer/")
public class EmployerController {

	private final EmployerService employerService;
	private JobAdvertisementService jobAdvertisementService;


	@Autowired
	public EmployerController(EmployerService employerService, JobAdvertisementService jobAdvertisementService) {
		this.employerService = employerService;
		this.jobAdvertisementService = jobAdvertisementService;
	}

	@PutMapping("update/{email}")
	public Result update(@RequestBody Employer employer, @PathVariable("email") String email){
		return employerService.update(employer, email);
	}

	// Working 16/11/21
	@GetMapping("getall")
	public DataResults<Employer> getAll(){
		return employerService.getAll();
	}
	
	// Working without wrong boolean value 16/11/21
	@PostMapping("addadvertisement")
	public void addAdvertisement(@RequestBody JobAdvertisement jobAdvertisement) {
		jobAdvertisementService.add(jobAdvertisement);
	}
	
	@PutMapping("updateadvertisement")
	public void updateAdvertisement(@RequestBody JobAdvertisement jobAdvertisement) {
		jobAdvertisementService.update(jobAdvertisement);
	}
	
	@GetMapping("getadvertisement/{id}")
	public JobAdvertisement getAdvertisement(@PathVariable("id") int id) {
		return jobAdvertisementService.getAdvertisementByEmployeeId(id);
	}


	@PostMapping("register")
	public void register(@RequestBody EmployerRegistryDTO registryDTO){
		employerService.add(registryDTO);
	}

}
