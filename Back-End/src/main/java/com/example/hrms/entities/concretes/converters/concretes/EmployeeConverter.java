package com.example.hrms.entities.concretes.converters.concretes;

import com.example.hrms.entities.concretes.converters.abstracts.base.Converter;
import com.example.hrms.entities.concretes.converters.abstracts.sub.IEmployeeConverter;
import com.example.hrms.entities.concretes.dtos.concretes.EmployeeDto;
import lombok.NoArgsConstructor;


public class EmployeeConverter implements IEmployeeConverter {

    public EmployeeConverter(){

    }

    @Override
    public long getId(EmployeeDto employeeDto) {
        return employeeDto.getId();
    }

    public EmployeeDto getMailAndPassword(){
    return null;
    }
}
