package com.example.hrms.core.security.business.abstracts;

import com.example.hrms.core.security.entity.UserDetails;
import com.example.hrms.core.utilities.results.Result;
import org.springframework.security.core.Authentication;

public interface LoginAndRoleService {

    UserDetails loadUserByUsername(String username);
    Result logout();

}
