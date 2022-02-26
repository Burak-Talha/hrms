package com.example.hrms.dataaccess.abstracts;

import org.springframework.data.jpa.repository.JpaRepository;


import com.example.hrms.entities.concretes.JobPosition;

public interface JobPositionDao extends JpaRepository<JobPosition, Integer>{

}
