package com.example.hrms.dataaccess.abstracts;

import com.example.hrms.entities.concretes.TechName;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TechNameDao extends JpaRepository<TechName, Integer> {
}
