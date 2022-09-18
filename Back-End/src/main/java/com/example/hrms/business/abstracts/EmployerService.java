package com.example.hrms.business.abstracts;

import com.example.hrms.core.utilities.results.DataResults.DataResults;
import com.example.hrms.core.utilities.results.Result;
import com.example.hrms.entities.concretes.Employer;
import com.example.hrms.entities.dtos.concretes.EmployerRegistryDTO;

public interface EmployerService {

 Result add(EmployerRegistryDTO registryDTO);
 Result update(Employer employer, String email);
 DataResults<Employer> getAll();

}
