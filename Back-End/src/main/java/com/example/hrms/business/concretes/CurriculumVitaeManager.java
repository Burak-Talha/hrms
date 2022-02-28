package com.example.hrms.business.concretes;

import java.util.List;

import com.example.hrms.business.abstracts.CurriculumVitaeService;
import org.springframework.stereotype.Service;
import com.example.hrms.dataaccess.abstracts.CurriculumVitaeDao;
import com.example.hrms.entities.concretes.CurriculumVitae;

@Service
public class CurriculumVitaeManager implements CurriculumVitaeService {

	private CurriculumVitaeDao curriculumVitaeDao;
	
	public CurriculumVitaeManager(CurriculumVitaeDao curriculumVitaeDao) {
		this.curriculumVitaeDao = curriculumVitaeDao;
	}

	@Override
	public List<CurriculumVitae> getAll() {
		return curriculumVitaeDao.findAll();
	}

	@Override
	public void add(CurriculumVitae curriculumVitae) {
		curriculumVitaeDao.save(curriculumVitae);
	}	

}
