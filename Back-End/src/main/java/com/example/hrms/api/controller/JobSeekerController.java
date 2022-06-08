package com.example.hrms.api.controller;

import com.example.hrms.business.abstracts.JobSeekerService;
import com.example.hrms.business.abstracts.LanguagesService;
<<<<<<< Updated upstream
import com.example.hrms.entities.concretes.*;
=======
import com.example.hrms.entities.concretes.JobSeeker;
import com.example.hrms.entities.concretes.Languages;
>>>>>>> Stashed changes
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

<<<<<<< Updated upstream
import com.example.hrms.business.abstracts.*;
=======
import java.util.List;
>>>>>>> Stashed changes


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
