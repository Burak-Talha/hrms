package com.example.hrms.api.controller;

import com.example.hrms.business.abstracts.EmployerService;
import com.example.hrms.core.utilities.results.DataResults.DataResults;
import com.example.hrms.core.utilities.results.Result;
import com.example.hrms.entities.dtos.concretes.EmployerRegistryDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.example.hrms.entities.concretes.Employer;

@RestController
@RequestMapping("api/employer/")
public class EmployerController {

	private final EmployerService employerService;

	@Autowired
	public EmployerController(EmployerService employerService) {
		this.employerService = employerService;
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

	@PostMapping("register")
	public void register(@RequestBody EmployerRegistryDTO registryDTO){
		employerService.add(registryDTO);
	}

	@GetMapping("got")
	public EmployerRegistryDTO getExampleMethod(){
		return new EmployerRegistryDTO(new Employer(), "");
	}
}
