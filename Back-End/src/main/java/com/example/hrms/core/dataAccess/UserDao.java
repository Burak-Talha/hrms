package com.example.hrms.core.dataAccess;

public interface UserDao<T> {


    T findByEmail(String email);
}
