package com.example.hrms.core.auth.jwt;

import com.example.hrms.core.utilities.results.Result;
import com.example.hrms.core.utilities.results.SuccessResult;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;
import java.security.Key;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Service;

@Service
public class TokenManager implements TokenService {

    private static final int validity = 5 * 60 * 1000;
    Key key = Keys.secretKeyFor(SignatureAlgorithm.HS256);

    JwtDao jwtDao;

    @Autowired
    JWTToken jwtToken;

    @Autowired
    public TokenManager(JwtDao jwtDao) {
        this.jwtDao = jwtDao;
    }



    private String generateToken(String ... strings) {
        return Jwts.builder()
                .setSubject(String.valueOf(strings))
                .setIssuer("okcu73")
                .setIssuedAt(new Date(System.currentTimeMillis()))
                .setExpiration(new Date(System.currentTimeMillis() + validity))
                .signWith(key)
                .compact();
    }


    public String generateAuthenticationToken(String email, String pass){
        String token = generateToken(email, pass);
        jwtToken.setToken(token);
        jwtDao.save(jwtToken);
        return token;
    }

    public String generateAuthorizationToken(String email){
        String token = generateToken(email);
        jwtToken.setToken(token);
        jwtDao.save(jwtToken);
        return token;
    }

    public Result deleteJwtToken(String token){
        jwtDao.deleteJWTTokenByToken(token);
        return new SuccessResult();
    }

    public boolean tokenValidate(String token) {
        if (getUsernameToken(token) != null && isExpired(token) && jwtDao.getJWTTokenByToken(token) != null) {
            return true;
        }
        return false;
    }

    public String getUsernameToken(String token) {
        Claims claims = getClaims(token);
        return claims.getSubject();
    }

    public boolean isExpired(String token) {
        Claims claims = getClaims(token);
        return claims.getExpiration().after(new Date(System.currentTimeMillis()));
    }

    private Claims getClaims(String token) {
        return Jwts.parser().setSigningKey(key).parseClaimsJws(token).getBody();
    }

    public double getValidity(){
        return validity;
    }
}