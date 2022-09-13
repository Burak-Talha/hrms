package com.example.hrms.core.security.jwt;

import org.springframework.data.jpa.repository.JpaRepository;

public interface JwtDao extends JpaRepository<JWTToken, Integer> {

    void deleteJWTTokenByToken(String token);

    JWTToken getJWTTokenByToken(String token);
}
