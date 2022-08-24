package com.example.hrms.core.auth.business.concretes;


import com.example.hrms.core.auth.business.abstracts.LoggedManagementService;
import com.example.hrms.core.auth.business.abstracts.LoginAndRoleService;
import com.example.hrms.core.auth.business.abstracts.RoleService;
import com.example.hrms.core.auth.dataAccess.UserDetailsDao;
import com.example.hrms.core.auth.entity.UserDetails;
import com.example.hrms.core.auth.entity.UserLoginDTO;
import com.example.hrms.core.utilities.results.ErrorResult;
import com.example.hrms.core.utilities.results.Result;
import com.example.hrms.core.utilities.results.SuccessResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import static org.springframework.security.web.context.HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY;

@Service
public class LoginManager implements LoginAndRoleService, UserDetailsService {

    RoleService roleService;
    LoggedManagementService loggedManagementService;
    UserDetailsDao userDetailsDao;
    PasswordEncoder passwordEncoder;

    @Resource
    AuthenticationManager authenticationManager;

    @Autowired
    public LoginManager(RoleService roleService, LoggedManagementService loggedManagementService, UserDetailsDao userDetailsDao, PasswordEncoder passwordEncoder) {
        this.roleService = roleService;
        this.loggedManagementService = loggedManagementService;
        this.userDetailsDao = userDetailsDao;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public Result login(UserLoginDTO userLoginDTO, HttpServletRequest req) {
        UserDetails userDetails = userDetailsDao.getUserDetailsByEmail(userLoginDTO.getEmail());

        if(userDetails == null) {
            return new ErrorResult("User not found");
        }
        if(userLoginDTO.getEmail() == null || userLoginDTO.getPassword() == null) {
            return new ErrorResult("Username and password are required");
        }
        if(loggedManagementService.getIsLogged() == true){
            return new ErrorResult("User is already logged");
        }
        userDetails.setGrantedAuthorities(userDetails.getGrantedAuthorities());
        userDetails.setPassword(passwordEncoder.encode(userLoginDTO.getPassword()));
        loggedManagementService.initializeToSystem(userDetails);

        UsernamePasswordAuthenticationToken authReq
                = new UsernamePasswordAuthenticationToken(userLoginDTO.getEmail(), userLoginDTO.getPassword());
        Authentication auth = authenticationManager.authenticate(authReq);

        SecurityContext sc = SecurityContextHolder.getContext();
        sc.setAuthentication(auth);
        HttpSession session = req.getSession(true);
        session.setAttribute(SPRING_SECURITY_CONTEXT_KEY, sc);
        return new SuccessResult("User logged");
    }

    @Override
    public UserDetails loadUserByUsername(String username){
        return userDetailsDao.getUserDetailsByEmail(username);
    }

    @Override
    public Result logout() {

        loggedManagementService.clearSessionData();
        SecurityContext sc = SecurityContextHolder.getContext();
        sc.setAuthentication(null);

        return new SuccessResult("User logged out");
    }
}
