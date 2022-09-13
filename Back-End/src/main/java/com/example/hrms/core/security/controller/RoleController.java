package com.example.hrms.core.security.controller;

import com.example.hrms.core.security.business.abstracts.RoleService;
import com.example.hrms.core.utilities.results.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/role/")
public class RoleController {

    RoleService roleService;

    @Autowired
    public RoleController(RoleService roleService) {
        this.roleService = roleService;
    }

    @PutMapping("getby/{email}")
    public String getAuthoritiesByEmail(@PathVariable("email") String email) {
        return roleService.getAuthoritiesByEmail(email);
    }

    @PatchMapping("add/adminroleto/{email}")
    public Result addAdminRoleTo(@PathVariable("email") String email) {
        return roleService.addADMINRoleToUserDetailsByEmail(email);
    }

    @PatchMapping("add/userroleto/{email}")
    public Result addUserRoleTo(@PathVariable("email") String email) {
        return roleService.addUSERRoleToUserDetailsByEmail(email);
    }

    @DeleteMapping("remove/adminrolefrom/{email}")
    public Result removeAdminRoleFrom(@PathVariable("email") String email, @PathVariable("role") String role) {
        return roleService.deleteAuthorityFromUserDetailsByEmail(email, role);
    }


}
