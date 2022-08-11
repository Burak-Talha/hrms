package com.example.hrms.api.controller;

import com.example.hrms.core.utilities.results.DataResult.DataResult;
import com.example.hrms.core.utilities.results.DataResults.DataResults;
import com.example.hrms.core.utilities.results.Result;
import com.example.hrms.entities.concretes.dtos.concretes.EmployerLoginDto;
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

	// Working 16/11/21
	@PostMapping("add")
	public Result add(@RequestBody Employer employee) {
		return employerService.add(employee);
	}

	@PutMapping("update/{email}")
	public Result update(@RequestBody Employer employer, @PathVariable("email") String email){
		return employerService.update(employer, email);
	}

	@PatchMapping("update/criticalinfo/{email}")
	public Result updateCricitalInfo(@RequestBody EmployerLoginDto employerLoginDto, @PathVariable("email") String email){
		return employerService.updateCriticalInfo(employerLoginDto, email);
	}

	@GetMapping("getinfo")
	public EmployerLoginDto getEmployerLoginDto(){
		return new EmployerLoginDto("asdsad", "gldnfgnl");
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

	@GetMapping("logout")
	public void logout(){
		employerService.logout();
	}

	@GetMapping("mail")
	public String getMail(){
		return employerService.getMail();
	}
	
	@GetMapping("getadvertisement/{id}")
	public JobAdvertisement getAdvertisement(@PathVariable("id") int id) {
		return jobAdvertisementService.getAdvertisementByEmployeeId(id);
	}

	@PostMapping("login")
	public boolean login(@RequestBody EmployerLoginDto employerDto){
		return employerService.login(employerDto);
	}

	@GetMapping("google-login")
	public boolean googleLogin(OAuth2AuthenticationToken oAuth2AuthenticationToken){
		return employerService.googleLogin(oAuth2AuthenticationToken.getPrincipal().getAttributes());
	}

	@GetMapping("login-result")
	public DataResult<Employer> getLoginResult(){
		return employerService.getLoginResult();
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
