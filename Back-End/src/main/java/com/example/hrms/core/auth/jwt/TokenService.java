package com.example.hrms.core.auth.jwt;

public interface TokenService {
    String generateAuthenticationToken(String email, String pass);
    String generateAuthorizationToken(String email);
    boolean tokenValidate(String token);
    boolean isExpired(String token);
    String getUsernameToken(String token);
    double getValidity();
}
