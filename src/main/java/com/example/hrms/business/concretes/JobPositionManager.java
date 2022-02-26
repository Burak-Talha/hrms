package com.example.hrms.business.concretes;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.hrms.entities.concretes.*;
import com.example.hrms.business.abstracts.JobPositionService;
import com.example.hrms.dataaccess.abstracts.JobPositionDao;

@Service
public class JobPositionManager implements JobPositionService{

	private JobPositionDao jobPositionDao;
	
	@Autowired
	public JobPositionManager(JobPositionDao jobPositionDao) {
		this.jobPositionDao = jobPositionDao;
	}
	
	@Override
	public List<JobPosition> getAll() {
		return jobPositionDao.findAll();
	}
	
	@Override
	public void add(JobPosition jobPosition) {
		jobPositionDao.save(jobPosition);
	}
}
