package com.example.hrms.business.abstracts;

import java.util.List;


import com.example.hrms.entities.concretes.*;

public interface JobPositionService {

	public List<JobPosition> getAll();
	public void add(JobPosition jobPosition);
}
