package com.example.hrms.core.security.business.abstracts;


import com.example.hrms.core.security.entity.UserDetails;

public interface LoggedManagementService {

    void initializeToSystem(UserDetails userDetails);
    UserDetails getSessionData();
    boolean getIsLogged();
    void clearSessionData();
}
