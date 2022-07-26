package com.example.hrms.business.abstracts;

import java.util.List;

import com.example.hrms.core.utilities.results.DataResult.DataResult;
import com.example.hrms.core.utilities.results.DataResults.DataResults;
import com.example.hrms.core.utilities.results.Result;
import com.example.hrms.entities.concretes.Employer;

import com.example.hrms.entities.concretes.dtos.concretes.EmployerDto;


public interface EmployerService {

public DataResult<Employer> login(String mail, String password);
public Result add(Employer employee);
public DataResults<Employer> getAll();
List<EmployerDto> getMailAndPasswords();


}
