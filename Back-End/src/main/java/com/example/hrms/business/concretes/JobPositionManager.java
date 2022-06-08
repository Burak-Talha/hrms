package com.example.hrms.business.concretes;

import java.util.List;


import com.example.hrms.entities.concretes.JobPosition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
<<<<<<< Updated upstream
import com.example.hrms.entities.concretes.*;
import com.example.hrms.business.abstracts.*;
import com.example.hrms.dataaccess.abstracts.*;
=======
import com.example.hrms.business.abstracts.JobPositionService;
import com.example.hrms.dataaccess.abstracts.JobPositionDao;
>>>>>>> Stashed changes

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
