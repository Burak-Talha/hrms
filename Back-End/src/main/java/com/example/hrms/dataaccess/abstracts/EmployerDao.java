package com.example.hrms.dataaccess.abstracts;


import com.example.hrms.entities.concretes.dtos.concretes.*;


import org.springframework.data.jpa.repository.JpaRepository;


import com.example.hrms.entities.concretes.*;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EmployerDao extends JpaRepository<Employer, Integer>{

    List<Employer> findByPasswordIsNotNullAndEmailIsNotNull();

    @Query("SELECT e.email, e.password FROM Employer e")
    List<EmployerDto> getMailAndPassword();

    Employer findByEmailAndPassword(String email, String password);
}