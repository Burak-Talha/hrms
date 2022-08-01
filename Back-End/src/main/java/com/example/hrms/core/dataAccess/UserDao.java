package com.example.hrms.core.dataAccess;

public interface UserDao<T> {

    T findByEmailAndPassword(String email, String password);
    T findByEmail(String email);
}
