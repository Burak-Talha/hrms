package com.example.hrms.core.security.jwt;

import com.example.hrms.core.security.entity.UserDetails;

import javax.servlet.http.HttpServletRequest;

public interface TokenService {
    String generateAuthenticationToken(HttpServletRequest request, UserDetails userDetails);
    String generateAuthorizationToken(HttpServletRequest request, UserDetails userDetails);
    boolean tokenValidate(String token);
    boolean isExpired(String token);
    String getUsernameToken(String token);
    double getValidity();
}
