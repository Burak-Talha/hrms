package com.example.hrms.dataaccess.abstracts;
import org.springframework.data.jpa.repository.JpaRepository;

import com.example.hrms.entities.concretes.JobAdvertisement;


public interface JobAdvertisementDao extends JpaRepository<JobAdvertisement, Integer>{
	
	//@Query("from job_advertisement where employee_id =: employeeId")
	//public List<JobAdvertisement> getAdvertisementByEmployeeId(int employeeId);
}
