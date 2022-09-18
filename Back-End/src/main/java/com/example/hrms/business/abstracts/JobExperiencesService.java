package com.example.hrms.business.abstracts;

import com.example.hrms.business.concretes.JobExperiencesDao;
import com.example.hrms.entities.concretes.JobExperiences;

import java.util.List;

public interface JobExperiencesService {
    public List<JobExperiences> getAll();
    public void add(JobExperiences jobExperiences);
    public void update(JobExperiences jobExperiences);
    public void delete(JobExperiences jobExperiences);
}
