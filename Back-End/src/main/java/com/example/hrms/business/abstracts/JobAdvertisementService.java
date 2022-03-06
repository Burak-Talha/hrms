package com.example.hrms.business.abstracts;

import java.util.List;


import com.example.hrms.entities.concretes.JobAdvertisement;

public interface JobAdvertisementService {
public void add(JobAdvertisement jobAdvertisement);
public void update(JobAdvertisement jobAdvertisement);
public List<JobAdvertisement> getAll();
public JobAdvertisement getAdvertisementByEmployeeId(int id);
}
