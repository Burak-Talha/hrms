package com.example.hrms.business.concretes;

import com.example.hrms.business.abstracts.JobExperiencesService;
import com.example.hrms.entities.concretes.JobExperiences;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JobExperiencesManager implements JobExperiencesService {

    private JobExperiencesDao jobExperiencesDao;

    @Autowired
    public JobExperiencesManager(JobExperiencesDao jobExperiencesDao) {
        this.jobExperiencesDao = jobExperiencesDao;
    }


    @Override
    public List<JobExperiences> getAll() {
        return jobExperiencesDao.findAll();
    }

    @Override
    public void add(JobExperiences jobExperiences) {
        jobExperiencesDao.save(jobExperiences);
    }

    @Override
    public void update(JobExperiences jobExperiences) {
        jobExperiencesDao.save(jobExperiences);
    }

    @Override
    public void delete(JobExperiences jobExperiences) {
        jobExperiencesDao.delete(jobExperiences);
    }
}
