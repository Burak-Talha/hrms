package com.example.hrms.business.abstracts;

import com.example.hrms.entities.concretes.Languages;

import java.util.List;

public interface LanguagesService {
     void add(Languages languages);
     List<Languages> getAll();
}
