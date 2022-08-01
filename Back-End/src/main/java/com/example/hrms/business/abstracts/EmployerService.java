package com.example.hrms.business.abstracts;

import java.util.List;
import java.util.Map;

import com.example.hrms.core.utilities.results.DataResult.DataResult;
import com.example.hrms.core.utilities.results.DataResults.DataResults;
import com.example.hrms.core.utilities.results.Result;
import com.example.hrms.entities.concretes.Employer;

import com.example.hrms.entities.concretes.dtos.concretes.EmployerDto;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;


public interface EmployerService {

 DataResult<Employer> login(EmployerDto employerDto);
 DataResult<Employer> googleLogin(Map<String, Object> googleUser);
 Result add(Employer employee);
 DataResults<Employer> getAll();

}
