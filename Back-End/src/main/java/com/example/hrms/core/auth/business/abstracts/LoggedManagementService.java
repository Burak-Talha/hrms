package com.example.hrms.core.auth.business.abstracts;


import com.example.hrms.core.auth.entity.UserDetails;

public interface LoggedManagementService {

    void initializeToSystem(UserDetails userDetails);
    UserDetails getSessionData();
    boolean getIsLogged();
    void clearSessionData();
}
