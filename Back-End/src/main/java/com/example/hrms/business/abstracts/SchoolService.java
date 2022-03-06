package com.example.hrms.business.abstracts;

import com.example.hrms.entities.concretes.School;

import java.util.List;

public interface SchoolService {
    public List<School> getAll();
    public void add(School school);
    public void update(School school);
    public void delete(School school);

}
