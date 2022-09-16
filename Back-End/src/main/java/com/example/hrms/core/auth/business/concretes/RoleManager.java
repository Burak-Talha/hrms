package com.example.hrms.core.auth.business.concretes;

import com.example.hrms.core.auth.business.abstracts.RoleService;
import com.example.hrms.core.auth.dataAccess.UserDetailsDao;
import com.example.hrms.core.auth.entity.ApplicationUserRole;
import com.example.hrms.core.auth.entity.UserDetails;
import com.example.hrms.core.utilities.results.ErrorResult;
import com.example.hrms.core.utilities.results.Result;
import com.example.hrms.core.utilities.results.SuccessResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoleManager implements RoleService {

    UserDetailsDao userDetailsDao;

    @Autowired
    public RoleManager(UserDetailsDao userDetailsDao) {
        this.userDetailsDao = userDetailsDao;
    }

    @Override
    public String getAuthoritiesByEmail(String email) {
        return userDetailsDao.findUserDetailsByEmail(email).getRoles();
    }

    @Override
    public Result addADMINRoleToUserDetailsByEmail(String email) {
        if (userDetailsDao.findUserDetailsByEmail(email) == null) {
            return new ErrorResult("User not found");
        }

        if(userDetailsDao.findUserDetailsByEmail(email).getRoles().contains(ApplicationUserRole.ADMIN.name())){
            return new ErrorResult("User already has admin role");
        }

        UserDetails userDetails = userDetailsDao.findUserDetailsByEmail(email);
        userDetails.setRoles(userDetails.getRoles() + "," + ApplicationUserRole.ADMIN.name());
        userDetailsDao.save(userDetails);

        return new SuccessResult("User has been given admin role");
    }

    @Override
    public Result addUSERRoleToUserDetailsByEmail(String email) {

        if (userDetailsDao.findUserDetailsByEmail(email) == null) {
            return new ErrorResult("User not found");
        }
/*
        if(userDetailsDao.getUserDetailsByEmail(email).getRoles().contains(ApplicationUserRole.USER.name())){
            return new ErrorResult("User already has user role");
        }
*/
        UserDetails userDetails = userDetailsDao.findUserDetailsByEmail(email);
        userDetails.setRoles(userDetails.getRoles() + "," + ApplicationUserRole.USER.name());
        userDetailsDao.save(userDetails);

        return new SuccessResult();
    }

    @Override
    public Result deleteAuthorityFromUserDetailsByEmail(String email, String applicationUserRole) {
        UserDetails userDetails = userDetailsDao.findUserDetailsByEmail(email);

        if(userDetails == null){
            return new ErrorResult("User not found");
        }

        if(applicationUserRole == "USER"){
            return new ErrorResult("Cannot delete user role");
        }

        userDetails.getRoles().replace(applicationUserRole, "");
        userDetailsDao.save(userDetails);
        return new SuccessResult();
    }

}
