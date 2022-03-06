package com.example.hrms.business.abstracts;

import com.example.hrms.entities.concretes.TechName;

import java.util.List;

public interface TechNameService {
    public List<TechName> getAll();
    public void add(TechName techName);
    public void update(TechName techName);
    public void delete(TechName techName);
}
