package com.example.hrms.api.controller;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.example.hrms.business.abstracts.JobPositionService;
import com.example.hrms.entities.concretes.JobPosition;


@RestController
@RequestMapping("/api/jobposition")
public class JobPositionController {

	private JobPositionService jobPositionService;

	@Autowired
	public JobPositionController(JobPositionService jobPositionService) {
		this.jobPositionService = jobPositionService;
	}
	
	// Working 16/11/21
	@PostMapping("add")
	public void add(@RequestBody JobPosition jobPosition) {
		jobPositionService.add(jobPosition);
	}
	
	// Working 16/11/21
	@GetMapping("/getall")
	public List<JobPosition>getAll(){
		return jobPositionService.getAll();
	}
	
}
