package com.example.hrms.business.abstracts;


import java.util.Map;
import com.example.hrms.core.utilities.results.DataResult.DataResult;
import com.example.hrms.core.utilities.results.DataResults.DataResults;
import com.example.hrms.core.utilities.results.Result;
import com.example.hrms.entities.concretes.Employer;
import com.example.hrms.entities.concretes.dtos.concretes.EmployerLoginDto;

public interface EmployerService {

 boolean login(EmployerLoginDto employerDto);
 boolean googleLogin(Map<String, Object> googleUser);
 DataResult<Employer> getGoogleLoginResult();
 DataResult<Employer> getLoginResult();
 void logout();
 Result add(Employer employee);
 Result update(Employer employer, String email);
 Result updateCriticalInfo(EmployerLoginDto employerLoginDto, String email);
 DataResults<Employer> getAll();

 public String getMail();

}
