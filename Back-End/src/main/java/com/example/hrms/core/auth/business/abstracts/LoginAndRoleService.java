package com.example.hrms.core.auth.business.abstracts;

import com.example.hrms.core.auth.entity.UserDetails;
import com.example.hrms.core.auth.entity.UserLoginDTO;
import com.example.hrms.core.utilities.results.Result;
import org.springframework.security.core.Authentication;

import javax.servlet.http.HttpServletRequest;

public interface LoginAndRoleService {

    Authentication login(UserLoginDTO userLoginDTO, HttpServletRequest req) throws Exception;
    UserDetails loadUserByUsername(String username);
    Result logout();

}
