package com.example.hrms.dataaccess.abstracts;



import com.example.hrms.core.dataAccess.UserDao;
import com.example.hrms.entities.concretes.*;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EmployerDao extends JpaRepository<Employer, Integer>, UserDao<Employer> {
}