package com.example.hrms.core.auth.jwt;

public interface TokenService {
    String generateAuthenticationToken(String email, int validMinute);
    boolean tokenValidate(String token);
    boolean isExpired(String token);
}
