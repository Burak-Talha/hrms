package com.example.hrms.core.auth.business.abstracts;

import com.example.hrms.core.utilities.results.Result;

public interface RoleService {

    String getAuthoritiesByEmail(String email);

    Result addADMINRoleToUserDetailsByEmail(String email);
    Result addUSERRoleToUserDetailsByEmail(String email);
    Result deleteAuthorityFromUserDetailsByEmail(String email, String applicationUserRole);
}
