package com.example.hrms.entities.concretes.converters.concretes;

import com.example.hrms.entities.concretes.converters.abstracts.sub.IEmployeeConverter;
import com.example.hrms.entities.concretes.dtos.concretes.EmployerDto;


public class EmployeeConverter implements IEmployeeConverter {

    public EmployeeConverter(){

    }

    @Override
    public long getId(EmployerDto employeeDto) {
        return employeeDto.getId();
    }

    public EmployerDto getMailAndPassword(){
    return null;
    }
}
