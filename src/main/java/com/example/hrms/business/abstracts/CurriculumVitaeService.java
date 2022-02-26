package com.example.hrms.business.abstracts;

import java.util.List;

import com.example.hrms.entities.concretes.CurriculumVitae;

public interface CurriculumVitaeService {
	
	void add(CurriculumVitae curriculumVitae);
	List<CurriculumVitae>getAll();
}
