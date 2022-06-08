package com.example.hrms.dataaccess.abstracts;

<<<<<<< Updated upstream
import com.example.hrms.entities.concretes.dtos.concretes.*;
=======
>>>>>>> Stashed changes
import org.springframework.data.jpa.repository.JpaRepository;


import com.example.hrms.entities.concretes.*;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface EmployeeDao extends JpaRepository<Employee, Integer>{

    List<Employee> findByPasswordIsNotNullAndEmailIsNotNull();

    @Query("SELECT e.id, e.email, e.password FROM Employee e")
    List<EmployeeDto> getIdAndMailAndPassword();

    Employee findByEmailAndPassword(String email,String password);
}