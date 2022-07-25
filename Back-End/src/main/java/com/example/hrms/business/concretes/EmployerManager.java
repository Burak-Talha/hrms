package com.example.hrms.business.concretes;


import com.example.hrms.core.utilities.results.DataResult;
import com.example.hrms.core.utilities.results.ErrorDataResult;
import com.example.hrms.core.utilities.results.Result;
import com.example.hrms.core.utilities.results.SuccessDataResult;
import com.example.hrms.entities.concretes.dtos.concretes.EmployerDto;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.hrms.business.abstracts.EmployerService;
import com.example.hrms.dataaccess.abstracts.EmployerDao;
import com.example.hrms.entities.concretes.Employer;
import org.springframework.web.bind.annotation.CrossOrigin;

import java.util.List;

@CrossOrigin(origins = "http://localhost:8080", maxAge = 3600)
@Service
public class EmployerManager implements EmployerService {

	Employer employer;

	private final EmployerDao employerDao;
	
	@Autowired
	public EmployerManager(EmployerDao employeeDao) {
		this.employerDao = employeeDao;
	}

	@Override
	public DataResult<Employer> login(String email, String password) {
		employer = employerDao.findByEmailAndPassword(email, password);
		System.out.println("System User email input :"+email);
		System.out.println("System User password input :"+password);
		if(employer !=null){
			System.out.println("Kullanıcı eşleşti!");
			return new SuccessDataResult<>(employer, "Kullanıcı eşleşti");
		}
		return new ErrorDataResult("Kullanıcı eşleşemedi");
	}

	// Buraya mailin web sitesiyle aynı domaine sahip kişilerin kayıt yaptırabileceği kuralı konacak
	@Override
	public Result add(Employer employer) {
		if(employer.getEmail().length() >= 8) {
			employerDao.save(employer);
			return new Result(true, "The register transaction completed successfully");
		}
			return new Result(false, "Your password length should be bigger than 8 character");
	}

	@Override
	public List<Employer> getAll() {
		return employerDao.findAll();
	}

	@Override
	public List<EmployerDto> getMailAndPasswords() {
		return employerDao.getMailAndPassword();
	}

}
