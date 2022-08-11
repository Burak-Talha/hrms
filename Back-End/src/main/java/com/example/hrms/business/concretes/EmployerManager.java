package com.example.hrms.business.concretes;


import com.example.hrms.core.EmployerLoginPremonitory;
import com.example.hrms.core.GoogleEmployerLoginPremonitory;
import com.example.hrms.core.login.LoginManager;
import com.example.hrms.core.utilities.results.*;
import com.example.hrms.core.utilities.results.DataResult.DataResult;
import com.example.hrms.core.utilities.results.DataResult.ErrorDataResult;
import com.example.hrms.core.utilities.results.DataResult.SuccessDataResult;
import com.example.hrms.core.utilities.results.DataResults.DataResults;
import com.example.hrms.core.utilities.results.DataResults.ErrorDataResults;
import com.example.hrms.core.utilities.results.DataResults.SuccessDataResults;
import com.example.hrms.entities.concretes.dtos.concretes.EmployerLoginDto;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.CrossOrigin;

import com.example.hrms.business.abstracts.EmployerService;
import com.example.hrms.dataaccess.abstracts.EmployerDao;
import com.example.hrms.entities.concretes.Employer;


import java.util.List;
import java.util.Map;


@CrossOrigin(origins = "http://localhost:8080", maxAge = 3600)
@Service
public class EmployerManager implements EmployerService {

	Employer employer;
	Authentication authentication;

	private final EmployerDao employerDao;
	private LoginManager loginManager;
	private AuthenticationManager authenticationManager;
	private GoogleEmployerLoginPremonitory googleEmployerLoginPremonitory;
	private EmployerLoginPremonitory employerLoginPremonitory;
	private boolean isRememberMeOn;
	@Autowired
	public EmployerManager(EmployerDao employerDao, Authentication authentication, LoginManager loginManager, GoogleEmployerLoginPremonitory googleEmployerLoginPremonitory, EmployerLoginPremonitory employerLoginPremonitory, AuthenticationManager authenticationManager) {
		this.employerDao = employerDao;
		this.loginManager = loginManager;
		this.googleEmployerLoginPremonitory = googleEmployerLoginPremonitory;
		this.employerLoginPremonitory = employerLoginPremonitory;
		this.authenticationManager = authenticationManager;
		this.authentication = authentication;
	}





	@Override
	public boolean login(EmployerLoginDto employerDto) {
		System.out.println(this.isRememberMeOn);
		if(loginManager.login(employerDto, employerDao) == true){
			return true;
		}
		employerLoginPremonitory.setEmployerDataResult(new ErrorDataResult("Fail auth"));
		return false;
	}

	@Override
	public boolean googleLogin(Map<String, Object> googleUser) {
			if(loginManager.googleLogin(googleUser, employerDao) == true){
				return true;
			}
			return false;
	}

	@Override
	public DataResult<Employer> getGoogleLoginResult() {
		return googleEmployerLoginPremonitory.getEmployerDataResult();
	}

	@Override
	public DataResult<Employer> getLoginResult() {
		return employerLoginPremonitory.getEmployerDataResult();
	}


	@Override
	public void logout() {
		loginManager.logout();
	}


	// Buraya mailin web sitesiyle aynı domaine sahip kişilerin kayıt yaptırabileceği kuralı konacak
	@Override
	public Result add(Employer employer) {
		if(employer.getPassword().length() >= 8 && employer.getEmail().length() >= 8) {
			employerDao.save(employer);
			return new SuccessResult( "The register transaction completed successfully");
		}
			return new ErrorResult("Your password length should be bigger than 8 character");
	}

	@Override
	public Result update(Employer employer, String email) {
		Employer oldEmployer;
		if(employer.getPassword().length() >= 8 && employer.getEmail().length() >= 8){
				oldEmployer = employerDao.findByEmail(email);
				oldEmployer.setEmail(employer.getEmail());
				oldEmployer.setPassword(employer.getPassword());
				oldEmployer.setCorporationName(employer.getCorporationName());
				oldEmployer.setWebSiteName(employer.getCorporationName());
				employerDao.save(oldEmployer);
			    System.out.println(oldEmployer.getWebSiteName());
				return new SuccessResult();
		}
		return new ErrorResult();
	}

	@Override
	public Result updateCriticalInfo(EmployerLoginDto employerLoginDto, String email) {
		Employer oldEmployer;
			if(employerLoginDto.getPassword().length() >= 8 && employerLoginDto.getEmail().length() >= 8){
				oldEmployer = employerDao.findByEmail(email);
				System.out.println("Çalıştım");
				oldEmployer.setEmail(employerLoginDto.getEmail());
				oldEmployer.setPassword(employerLoginDto.getPassword());
				employerDao.save(oldEmployer);
				return new SuccessResult();
			}
		return new ErrorResult();
	}

	@Override
	public DataResults<Employer> getAll() {
		List<Employer> employers = employerDao.findAll();
		if(employers.isEmpty()){
			return new ErrorDataResults();
		}
		return new SuccessDataResults<Employer>(employerDao.findAll(), "All employers listed");
	}


	@Override
	public String getMail() {
		return loginManager.getServiceMail();
	}

}
