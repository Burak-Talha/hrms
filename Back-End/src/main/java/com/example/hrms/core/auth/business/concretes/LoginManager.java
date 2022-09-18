package com.example.hrms.core.auth.business.concretes;


import com.example.hrms.core.auth.business.abstracts.LoginAndRoleService;
import com.example.hrms.core.auth.business.abstracts.RoleService;
import com.example.hrms.core.auth.dataAccess.UserDetailsDao;
import com.example.hrms.core.auth.entity.UserDetails;
import com.example.hrms.core.auth.jwt.TokenService;
import com.example.hrms.core.utilities.results.Result;
import com.example.hrms.core.utilities.results.SuccessResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class LoginManager implements UserDetailsService, LoginAndRoleService {

    RoleService roleService;
    UserDetailsDao userDetailsDao;

    @Autowired
    public LoginManager(UserDetailsDao userDetailsDao) {
        this.userDetailsDao = userDetailsDao;
    }

    PasswordEncoder passwordEncoder;
    TokenService tokenService;


/*    @Autowired
    public LoginManager(RoleService roleService, UserDetailsDao userDetailsDao, TokenService tokenService, PasswordEncoder passwordEncoder) {
        this.roleService = roleService;
        this.userDetailsDao = userDetailsDao;
        this.passwordEncoder = passwordEncoder;
        this.tokenService = tokenService;
    }*/
    @Override
    public UserDetails loadUserByUsername(String username){
        return userDetailsDao.findUserDetailsByEmail(username);
    }
/*
    @Override
    public Authentication login(UserLoginDTO userLoginDTO, HttpServletRequest req) throws Exception {
        UserDetails userDetails = userDetailsDao.getUserDetailsByEmail(userLoginDTO.getEmail());

        if(userDetails == null){
            throw new Exception("User no found");
        }

        userDetails.setGrantedAuthorities(userDetails.getGrantedAuthorities());
        userDetails.setPassword(passwordEncoder.encode(userLoginDTO.getPassword()));

        UsernamePasswordAuthenticationToken authReq
                = new UsernamePasswordAuthenticationToken(userLoginDTO.getEmail(), userLoginDTO.getPassword());
        Authentication auth = authenticationManager.authenticate(authReq);
        
        return authReq;
    }
*/
    @Override
    public Result logout() {
        SecurityContext sc = SecurityContextHolder.getContext();
        sc.setAuthentication(null);

        return new SuccessResult("User logged out");
    }
}
