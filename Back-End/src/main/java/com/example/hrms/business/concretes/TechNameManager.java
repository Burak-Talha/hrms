package com.example.hrms.business.concretes;

import com.example.hrms.business.abstracts.TechNameService;
import com.example.hrms.dataaccess.abstracts.TechNameDao;
import com.example.hrms.entities.concretes.TechName;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TechNameManager implements TechNameService {

    private TechNameDao techNameDao;

    @Autowired
    public TechNameManager(TechNameDao techNameDao) {
        this.techNameDao = techNameDao;
    }



    @Override
    public List<TechName> getAll() {
        return techNameDao.findAll();
    }

    @Override
    public void add(TechName techName) {
        techNameDao.save(techName);
    }

    @Override
    public void update(TechName techName) {
        techNameDao.save(techName);
    }

    @Override
    public void delete(TechName techName) {
        techNameDao.delete(techName);
    }
}
