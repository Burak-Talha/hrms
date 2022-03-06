package com.example.hrms.entities.concretes.DTOs;

import com.example.hrms.dataaccess.abstracts.EmployeeDao;
import lombok.*;

import javax.persistence.Entity;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Data
public class EmployeeDTO {

    public String mail;
    public String password;

}
