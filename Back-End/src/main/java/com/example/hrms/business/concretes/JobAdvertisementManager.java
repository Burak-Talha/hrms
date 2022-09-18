package com.example.hrms.business.concretes;


import com.example.hrms.business.abstracts.JobAdvertisementService;
import com.example.hrms.dataaccess.abstracts.JobAdvertisementDao;
import com.example.hrms.entities.concretes.JobAdvertisement;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;





@Service
public class JobAdvertisementManager implements JobAdvertisementService{

	private JobAdvertisementDao jobAdvertisementDao;

	@Autowired
	public JobAdvertisementManager(JobAdvertisementDao jobAdvertisementDao) {
		this.jobAdvertisementDao = jobAdvertisementDao;
	}
	
	// Working 18//11/21
	@Override
	public void add(JobAdvertisement jobAdvertisement) {
		jobAdvertisementDao.save(jobAdvertisement);
		System.out.println("İş ilanı eklendi");
	}
	// Working 18//11/21
	@Override
	public void update(JobAdvertisement jobAdvertisement) {
		jobAdvertisementDao.save(jobAdvertisement);
		System.out.println("İş ilanı güncellendi");
	}

	// Working 18/11/21
	@Override
	public List<JobAdvertisement> getAll() {
		return (List<JobAdvertisement>) jobAdvertisementDao.findAll();
	}
	
	// Error 18/11/21
	
	@Override public JobAdvertisement getAdvertisementByEmployeeId(int id){
	return jobAdvertisementDao.getById(id); 
	}
	

}