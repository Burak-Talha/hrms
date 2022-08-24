package com.example.hrms.core.auth.business.abstracts;

import com.example.hrms.core.auth.entity.UserDetails;
import com.example.hrms.core.auth.entity.UserLoginDTO;
import com.example.hrms.core.utilities.results.Result;

import javax.servlet.http.HttpServletRequest;

public interface LoginAndRoleService {

    Result login(UserLoginDTO userLoginDTO, HttpServletRequest req);
    UserDetails loadUserByUsername(String username);
    Result logout();

}
