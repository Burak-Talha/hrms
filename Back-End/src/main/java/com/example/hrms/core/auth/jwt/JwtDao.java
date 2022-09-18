package com.example.hrms.core.auth.jwt;

import org.springframework.data.jpa.repository.JpaRepository;

public interface JwtDao extends JpaRepository<JWTToken, Integer> {

    JWTToken getJWTTokenByEmail(String email);
}
