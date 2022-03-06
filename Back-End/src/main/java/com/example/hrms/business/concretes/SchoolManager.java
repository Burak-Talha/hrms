package com.example.hrms.business.concretes;

import com.example.hrms.business.abstracts.SchoolService;
import com.example.hrms.dataaccess.abstracts.SchoolDao;
import com.example.hrms.entities.concretes.School;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SchoolManager implements SchoolService {

    private SchoolDao schoolDao;


    @Autowired
    public SchoolManager(SchoolDao schoolDao) {
        this.schoolDao = schoolDao;
    }

    @Override
    public List<School> getAll() {
        return schoolDao.findAll();
    }

    @Override
    public void add(School school) {
        schoolDao.save(school);
    }

    @Override
    public void update(School school) {
        schoolDao.save(school);
    }

    @Override
    public void delete(School school) {
        schoolDao.delete(school);
    }
}
