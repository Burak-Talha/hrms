package com.example.hrms.entities.concretes.converters.abstracts.base;

import com.example.hrms.entities.concretes.dtos.abstracts.DTOs;

public interface Converter<T extends DTOs>{
    public long getId(T entity);
}
