package com.example.hrms.dataaccess.abstracts;
// Every inherit going to be write in here
import org.springframework.data.jpa.repository.JpaRepository;

import com.example.hrms.entities.concretes.CurriculumVitae;

public interface CurriculumVitaeDao extends JpaRepository<CurriculumVitae, Integer>{
}
