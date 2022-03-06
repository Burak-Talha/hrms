package com.example.hrms.api.controller;

import java.util.List;


import com.example.hrms.business.abstracts.LanguagesService;
import com.example.hrms.entities.concretes.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.hrms.business.abstracts.*;


@RestController
@RequestMapping("api/jobseeker/")
public class JobSeekerController {
	
	private JobSeekerService jobSeekerService;
	private LanguagesService languagesService;
	private SchoolService schoolService;
	private TechNameService techNameService;
	private JobExperiencesService jobExperiencesService;
	private CurriculumVitaeService curriculumVitaeService;

	@Autowired
	public JobSeekerController(JobSeekerService jobSeekerService, LanguagesService languagesService, SchoolService schoolService, TechNameService techNameService, JobExperiencesService jobExperiencesService, CurriculumVitaeService curriculumVitaeService) {
		this.jobSeekerService = jobSeekerService;
		this.languagesService = languagesService;
		this.schoolService = schoolService;
		this.techNameService = techNameService;
		this.jobExperiencesService = jobExperiencesService;
		this.curriculumVitaeService = curriculumVitaeService;
	}

	// Working 16/11/21:
	@GetMapping("getall")
	public List<JobSeeker> getAll(){
		return jobSeekerService.getAll();
	}

	@GetMapping("getlanguages")
	public List<Languages> getLanguages(){
		return languagesService.getAll();
	}

	@GetMapping("getschools")
	public List<School> getSchools(){return schoolService.getAll();}

	@GetMapping("gettechnames")
	public List<TechName> getTechName(){return techNameService.getAll();}

	@GetMapping("getjobexperiences")
	public List<JobExperiences> getJobExperiences(){return jobExperiencesService.getAll();}

	@GetMapping("getcv")
	public List<CurriculumVitae> getCVs(){return curriculumVitaeService.getAll();}

	// Working 16/11/21
	@PostMapping("add")
	public void add(@RequestBody JobSeeker jobSeeker) {
		jobSeekerService.add(jobSeeker);
	}
	
	
	
}
