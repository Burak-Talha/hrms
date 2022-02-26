package com.example.hrms.dataaccess.abstracts;

import com.example.hrms.entities.concretes.Languages;
import org.springframework.data.jpa.repository.JpaRepository;

public interface LanguagesDao extends JpaRepository<Languages, Integer> {

}
