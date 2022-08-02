package com.example.hrms.business.concretes;


import com.example.hrms.core.login.LoginManager;
import com.example.hrms.core.utilities.results.*;
import com.example.hrms.core.utilities.results.DataResult.DataResult;
import com.example.hrms.core.utilities.results.DataResult.ErrorDataResult;
import com.example.hrms.core.utilities.results.DataResult.SuccessDataResult;
import com.example.hrms.core.utilities.results.DataResults.DataResults;
import com.example.hrms.core.utilities.results.DataResults.ErrorDataResults;
import com.example.hrms.core.utilities.results.DataResults.SuccessDataResults;
import com.example.hrms.entities.concretes.dtos.concretes.EmployerDto;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.stereotype.Service;

import com.example.hrms.business.abstracts.EmployerService;
import com.example.hrms.dataaccess.abstracts.EmployerDao;
import com.example.hrms.entities.concretes.Employer;
import org.springframework.web.bind.annotation.CrossOrigin;

import java.util.List;
import java.util.Map;


@CrossOrigin(origins = "http://localhost:8080", maxAge = 3600)
@Service
public class EmployerManager implements EmployerService {

	Employer employer;

	private final EmployerDao employerDao;
	public LoginManager loginManager;
	
	@Autowired
	public EmployerManager(EmployerDao employeeDao, LoginManager loginManager) {
		this.employerDao = employeeDao;
		this.loginManager = loginManager;
	}


	@Override
	public DataResult<Employer> login(EmployerDto employerDto) {
		if(loginManager.login(employerDto, employerDao) == true){
			employer = employerDao.findByEmail(employerDto.getEmail());
			return new SuccessDataResult<Employer>(employer, "Kullanıcı eşleşti");
		}
		return new ErrorDataResult("Kullanıcı eşleşemedi");
	}

	@Override
	public DataResult<Employer> googleLogin(Map<String, Object> googleUser) {
			if(loginManager.googleLogin(googleUser, employerDao) == true){
				employer = employerDao.findByEmail(loginManager.getServiceMail());
				return new SuccessDataResult<Employer>(employer, "Google Login transaction generated successfully");
			}
		return new ErrorDataResult("Fail google auth");
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
