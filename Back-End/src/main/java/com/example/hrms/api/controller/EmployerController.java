package com.example.hrms.api.controller;

import java.util.List;

import com.example.hrms.business.concretes.EmployerManager;
import com.example.hrms.core.login.LoginManager;
import com.example.hrms.core.utilities.results.DataResult.DataResult;
import com.example.hrms.core.utilities.results.DataResults.DataResults;
import com.example.hrms.core.utilities.results.Result;
import com.example.hrms.entities.concretes.dtos.concretes.EmployerDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
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
@RequestMapping("api/employer/")
public class EmployerController {

	private final EmployerService employerService;
	private JobAdvertisementService jobAdvertisementService;

	@Autowired
	public EmployerController(EmployerService employerService, JobAdvertisementService jobAdvertisementService) {
		this.employerService = employerService;
		this.jobAdvertisementService = jobAdvertisementService;
	}

	// Working 16/11/21
	@PostMapping("add")
	public Result add(@RequestBody Employer employee) {
		return employerService.add(employee);
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
	
	@PostMapping("updateadvertisement")
	public void updateAdvertisement(@RequestBody JobAdvertisement jobAdvertisement) {
		jobAdvertisementService.update(jobAdvertisement);
	}

	@GetMapping("logout")
	public void logout(){
		employerService.logout();
	}

	@GetMapping("google-logout")
	public void googleLogout(){employerService.googleLogout();}

	@GetMapping("mail")
	public String getMail(){
		return employerService.getMail();
	}
	
	@GetMapping("getadvertisement/{id}")
	public JobAdvertisement getAdvertisement(@PathVariable("id") int id) {
		return jobAdvertisementService.getAdvertisementByEmployeeId(id);
	}

	@PostMapping("login")
	public DataResult<Employer> login(@RequestBody EmployerDto employerDto){
		return employerService.login(employerDto);
	}

	@GetMapping("google-login")
	public boolean googleLogin(OAuth2AuthenticationToken oAuth2AuthenticationToken){
		return employerService.googleLogin(oAuth2AuthenticationToken.getPrincipal().getAttributes());
	}

	@GetMapping("google-login-result")
	public DataResult<Employer> getGoogleLoginResult(){
		return employerService.getGoogleLoginResult();
	}

	@PostMapping("register")
	public void register(@RequestBody Employer employee){
		employerService.add(employee);
	}

}
