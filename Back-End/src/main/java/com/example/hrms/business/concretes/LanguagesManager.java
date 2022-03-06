package com.example.hrms.business.concretes;

import com.example.hrms.business.abstracts.LanguagesService;
import com.example.hrms.dataaccess.abstracts.LanguagesDao;
import com.example.hrms.entities.concretes.Languages;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LanguagesManager implements LanguagesService {

    private LanguagesDao languagesDao;

    public LanguagesManager(LanguagesDao languagesDao){
        this.languagesDao = languagesDao;
    }

    public void add(Languages languages){
        languagesDao.save(languages);
    }

    @Override
    public List<Languages> getAll() {
        return languagesDao.findAll();
    }
}
