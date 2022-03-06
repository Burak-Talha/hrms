package com.example.hrms.api.controller;

import java.util.List;


import com.example.hrms.business.abstracts.LanguagesService;
import com.example.hrms.entities.concretes.Languages;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.hrms.business.abstracts.*;
import com.example.hrms.entities.concretes.JobSeeker;


@RestController
@RequestMapping("api/jobseeker/")
public class JobSeekerController {
	
	private JobSeekerService jobSeekerService;
	private LanguagesService languagesService;

	@Autowired
	public JobSeekerController(JobSeekerService jobSeekerService, LanguagesService languagesService) {
		this.jobSeekerService = jobSeekerService;
		this.languagesService = languagesService;
	}

	// Working 16/11/21:
	@GetMapping("getall")
	public List<JobSeeker> getAll(){
		return jobSeekerService.getAll();
	}

	@GetMapping("/getlanguages")
	public List<Languages> getLanguages(){
		return languagesService.getAll();
	}

	// Working 16/11/21
	@PostMapping("add")
	public void add(@RequestBody JobSeeker jobSeeker) {

		jobSeekerService.add(jobSeeker);
	}
	
	
	
}
