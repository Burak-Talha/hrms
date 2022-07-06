package com.example.hrms.business.abstracts;

import java.util.List;

import com.example.hrms.core.utilities.results.DataResult;
import com.example.hrms.entities.concretes.Employer;

import com.example.hrms.entities.concretes.dtos.concretes.EmployerDto;


public interface EmployerService {

public DataResult<Employer> login(String mail, String password);
public DataResult<Employer> add(Employer employee);
public List<Employer> getAll();
List<EmployerDto> getMailAndPasswords();


}
