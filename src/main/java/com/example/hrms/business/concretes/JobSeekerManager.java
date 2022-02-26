package com.example.hrms.business.concretes;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.hrms.business.abstracts.JobSeekerService;
import com.example.hrms.dataaccess.abstracts.JobSeekerDao;
import com.example.hrms.entities.concretes.JobSeeker;

@Service
public class JobSeekerManager implements JobSeekerService{

	private JobSeekerDao jobSeekerDao;
	
	@Autowired
	public JobSeekerManager(JobSeekerDao jobSeekerDao) {
		this.jobSeekerDao = jobSeekerDao;
	}

	@Override
	public void add(JobSeeker jobSeeker) {
		jobSeekerDao.save(jobSeeker);
		System.out.println("Yeni iş arayan eklendi"+ jobSeeker.getName());
	}

	@Override
	public List<JobSeeker> getAll() {
		return jobSeekerDao.findAll();
	}

}
