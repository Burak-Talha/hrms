package com.example.hrms.core;

import com.example.hrms.core.utilities.results.DataResult.DataResult;
import com.example.hrms.entities.concretes.Employer;
import lombok.Data;
import org.springframework.stereotype.Service;

@Data
@Service
public class EmployerLoginPremonitory {
    DataResult<Employer> employerDataResult;
}
