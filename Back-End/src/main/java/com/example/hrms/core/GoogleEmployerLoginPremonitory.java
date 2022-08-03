package com.example.hrms.core;

import com.example.hrms.core.utilities.results.DataResult.DataResult;
import com.example.hrms.entities.concretes.Employer;
import lombok.Data;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

@Data
@SessionScope
@Service
public class GoogleEmployerLoginPremonitory {

    DataResult<Employer> employerDataResult;

}
