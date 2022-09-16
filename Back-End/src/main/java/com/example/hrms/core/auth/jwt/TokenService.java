package com.example.hrms.core.auth.jwt;

public interface TokenService {
    String generateAuthenticationToken(String email, String pass, int validMinute);
    String generateAuthenticationToken(String emailAndPass, int validMinute);
    String generateAuthorizationToken(String email, int validMinute);
    boolean tokenValidate(String token);
    boolean isExpired(String token);
    String getUsernameToken(String token);
}
