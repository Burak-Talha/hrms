package com.example.hrms.business.abstracts;


import java.util.Map;

import com.example.hrms.core.auth.entity.UserLoginDTO;
import com.example.hrms.core.utilities.results.DataResult.DataResult;
import com.example.hrms.core.utilities.results.DataResults.DataResults;
import com.example.hrms.core.utilities.results.Result;
import com.example.hrms.entities.concretes.Employer;
import com.example.hrms.entities.concretes.dtos.concretes.EmployerRegistryDTO;

public interface EmployerService {

 Result add(EmployerRegistryDTO registryDTO);
 Result update(Employer employer, String email);
 DataResults<Employer> getAll();

}
