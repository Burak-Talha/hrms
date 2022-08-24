package com.example.hrms.core.auth.business.concretes;

import com.example.hrms.core.auth.business.abstracts.LoggedManagementService;
import com.example.hrms.core.auth.entity.UserDetails;
import lombok.Data;
import org.springframework.stereotype.Service;

@Data
@Service
public class LoggedManagementManager implements LoggedManagementService {
    UserDetails userDetailsData;
    boolean isAlreadyLogged;


    @Override
    public void initializeToSystem(UserDetails userDetails) {
        this.userDetailsData = userDetails;
        this.isAlreadyLogged = true;
    }

    @Override
    public UserDetails getSessionData() {
        return this.userDetailsData;
    }

    @Override
    public boolean getIsLogged() {
        return isAlreadyLogged;
    }

    @Override
    public void clearSessionData() {
        this.userDetailsData = null;
        isAlreadyLogged = false;
    }

}
