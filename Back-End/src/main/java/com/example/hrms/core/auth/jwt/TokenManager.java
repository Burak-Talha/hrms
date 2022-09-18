package com.example.hrms.core.auth.jwt;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.Claim;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.example.hrms.core.auth.dataAccess.UserDetailsDao;
import com.example.hrms.core.utilities.results.Result;
import com.example.hrms.core.utilities.results.SuccessResult;
import io.jsonwebtoken.Claims;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.annotation.Resources;

@Service
public class TokenManager implements TokenService {

    Date date;
    UserDetailsDao userDetailsDao;
    JwtDao jwtDao;


    @Autowired
    public TokenManager(Date date, UserDetailsDao userDetailsDao, JwtDao jwtDao) {
        this.date = date;
        this.userDetailsDao = userDetailsDao;
        this.jwtDao = jwtDao;
    }

    JWTToken jwtToken;

    private String generateToken(int validityMinute, String email) {
        return JWT.create()
                .withSubject(String.valueOf(email))
                .withIssuedAt(new Date(System.currentTimeMillis()))
                .withExpiresAt(new Date(System.currentTimeMillis() + validityMinute * JwtProperties.MILLISECONDS_TO_MINUTES))
                .sign(Algorithm.HMAC256(JwtProperties.SECRET));
    }

    public String generateAuthenticationToken(String email, int validMinute){
        String token = generateToken(validMinute, email);
        jwtToken = jwtDao.getJWTTokenByEmail(email);
        if(jwtToken == null) {
            jwtToken.setEmail(email);
            jwtToken.setAbsoluteExpireDate(new Date(date.getYear(), date.getMonth(), date.getDay() + 15));
            jwtDao.save(jwtToken);
        }
        return token;
    }

    public boolean tokenValidate(String token) {
        DecodedJWT decodedJWT = getClaims(token);
        String email = decodedJWT.getSubject();

        JWTToken jwtToken = jwtDao.getJWTTokenByEmail(email);
        boolean isAbsoluteExpireActive = jwtToken.getAbsoluteExpireDate().after(date);

        if (isExpired(token) && !isAbsoluteExpireActive) {
            return true;
        }

        jwtDao.delete(jwtToken);
        return false;
    }

    public boolean isExpired(String token) {
        DecodedJWT decodedJWT = getClaims(token);
        return decodedJWT.getExpiresAt().after(new Date(System.currentTimeMillis()));
    }

    public boolean shouldRefreshForAuthentication(String token){
        DecodedJWT decodedJWT = getClaims(token);
        JWTToken jwtToken = jwtDao.getJWTTokenByEmail(decodedJWT.getSubject());

        // Expiration Time - Current time
        double leftMinutes = jwtToken.getAbsoluteExpireDate().getTime() * JwtProperties.MILLISECONDS_TO_MINUTES - date.getTime() * JwtProperties.MILLISECONDS_TO_MINUTES;
        if(leftMinutes <= 10 && leftMinutes <= -5){
            return true;
        }
        return false;
    }

    public DecodedJWT getClaims(String token) {
        JWTVerifier verifier = JWT.require(Algorithm.HMAC256(JwtProperties.SECRET.getBytes())).build();
        DecodedJWT decodedJWT = verifier.verify(token);
        return decodedJWT;
    }

    public String getSubject(String token){
        JWTVerifier verifier = JWT.require(Algorithm.HMAC256(JwtProperties.SECRET.getBytes())).build();
        DecodedJWT decodedJWT = verifier.verify(token);
        decodedJWT.getSubject();
        return decodedJWT.getSubject();
    }

}