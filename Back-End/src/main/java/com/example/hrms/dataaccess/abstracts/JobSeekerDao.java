package com.example.hrms.dataaccess.abstracts;

import org.springframework.data.jpa.repository.JpaRepository;



import com.example.hrms.entities.concretes.JobSeeker;

public interface JobSeekerDao extends JpaRepository<JobSeeker, Integer>{

}
