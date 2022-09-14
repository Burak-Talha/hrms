package com.example.hrms.business.concretes;

import com.example.hrms.core.auth.business.abstracts.LoginAndRoleService;
import com.example.hrms.core.auth.business.abstracts.RoleService;
import com.example.hrms.core.auth.dataAccess.UserDetailsDao;
import com.example.hrms.core.auth.entity.UserDetails;
import com.example.hrms.core.utilities.results.*;
import com.example.hrms.core.utilities.results.DataResults.DataResults;
import com.example.hrms.core.utilities.results.DataResults.ErrorDataResults;
import com.example.hrms.core.utilities.results.DataResults.SuccessDataResults;
import com.example.hrms.entities.dtos.concretes.EmployerRegistryDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.CrossOrigin;
import com.example.hrms.business.abstracts.EmployerService;
import com.example.hrms.dataaccess.abstracts.EmployerDao;
import com.example.hrms.entities.concretes.Employer;

import javax.annotation.Resource;
import java.util.List;

@CrossOrigin(origins = "http://localhost:8080", maxAge = 3600)
@Service
public class EmployerManager implements EmployerService {

	EmployerDao employerDao;
	UserDetailsDao userDetailsDao;
	RoleService roleService;
	LoginAndRoleService loginAndRoleService;
	PasswordEncoder passwordEncoder;

	@Autowired
	public EmployerManager(EmployerDao employerDao, UserDetailsDao userDetailsDao, RoleService roleService, LoginAndRoleService loginAndRoleService, PasswordEncoder passwordEncoder) {
		this.employerDao = employerDao;
		this.userDetailsDao = userDetailsDao;
		this.roleService = roleService;
		this.loginAndRoleService = loginAndRoleService;
		this.passwordEncoder = passwordEncoder;
	}

	@Resource
	UserDetails userDetails;

	@Override
	public Result add(EmployerRegistryDTO registryDTO) {
		if(registryDTO.getPassword().length() >= 8 && registryDTO.getEmployer().getEmail().length() >= 8) {

			userDetails.setEmail(registryDTO.getEmployer().getEmail());
			userDetails.setEnabled(true);
			userDetails.setPassword(passwordEncoder.encode(registryDTO.getPassword()));

			System.out.println(userDetails.getEmail());
			System.out.println(userDetails.getPassword());
			employerDao.save(registryDTO.getEmployer());
			userDetailsDao.save(userDetails);
			roleService.addUSERRoleToUserDetailsByEmail(userDetails.getEmail());

			return new SuccessResult("The register transaction completed successfully");
		}
			return new ErrorResult("Your password length should be bigger than 8 character");
	}

	@Override
	public Result update(Employer employer, String email) {
		Employer employer1 = employerDao.findByEmail(email);

		if(employer1.getEmail().length() <= 7) {
			return new ErrorResult("Your email length should be bigger than 7 character");
		}
		if(employer1.getWebSiteName().contains(".com")
				&& employer1.getWebSiteName().contains(".net")
				&& employer1.getWebSiteName().contains(".org")) {
			return new ErrorResult("Your website name should not contain com,net,org");
		}

		employer1 = employer;
		employerDao.save(employer1);
		return new SuccessResult("The update transaction completed successfully");

	}

	@Override
	public DataResults<Employer> getAll() {
		List<Employer> employers = employerDao.findAll();
		if(employers.isEmpty()){
			return new ErrorDataResults();
		}
		return new SuccessDataResults<Employer>(employerDao.findAll(), "All employers listed");
	}

}
