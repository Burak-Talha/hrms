package com.example.hrms.core.auth.jwt;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.Claim;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.example.hrms.core.utilities.results.Result;
import com.example.hrms.core.utilities.results.SuccessResult;
import io.jsonwebtoken.Claims;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TokenManager implements TokenService {

    JwtDao jwtDao;
    Date date = new Date();

    @Autowired
    JWTToken jwtToken;

    @Autowired
    public TokenManager(JwtDao jwtDao) {
        this.jwtDao = jwtDao;
    }

    public JWTToken getJwtToken(String token){
        return jwtDao.getJWTTokenByToken(token);
    }

    private String generateToken(int validityMinute, String ... strings) {
        System.out.println(strings);
        return JWT.create()
                .withSubject(String.valueOf(strings))
                .withIssuedAt(new Date(System.currentTimeMillis()))
                .withExpiresAt(new Date(System.currentTimeMillis() + validityMinute * JwtProperties.MILLISECONDS_TO_MINUTES))
                .sign(Algorithm.HMAC256(JwtProperties.SECRET));
    }

    private String generateToken(int validityMinute, String email) {
        System.out.println(email);
        return JWT.create()
                .withSubject(String.valueOf(email))
                .withIssuedAt(new Date(System.currentTimeMillis()))
                .withExpiresAt(new Date(System.currentTimeMillis() + validityMinute * JwtProperties.MILLISECONDS_TO_MINUTES))
                .sign(Algorithm.HMAC256(JwtProperties.SECRET));
    }

    public String generateAuthenticationToken(String email, String pass, int validMinute){
        String token = JWT.create()
                .withSubject(String.valueOf(email))
                .withIssuedAt(new Date(System.currentTimeMillis()))
                .withExpiresAt(new Date(System.currentTimeMillis() + validMinute * JwtProperties.MILLISECONDS_TO_MINUTES))
                .sign(Algorithm.HMAC256(JwtProperties.SECRET));
        return token;
    }

    public String generateAuthenticationToken(String email, int validMinute){
        String token = generateToken(validMinute, email);
        jwtToken.setToken(token);
        jwtDao.save(jwtToken);
        return token;
    }

    public String generateAuthorizationToken(String email, int validMinute){
        String token = JWT.create()
                .withSubject(String.valueOf(email))
                .withIssuedAt(new Date(System.currentTimeMillis()))
                .withExpiresAt(new Date(System.currentTimeMillis() + validMinute * JwtProperties.MILLISECONDS_TO_MINUTES))
                .sign(Algorithm.HMAC256(JwtProperties.SECRET));
        return token;
    }

    public Result deleteJwtToken(String token){
        jwtDao.deleteJWTTokenByToken(token);
        return new SuccessResult();
    }

    public boolean tokenValidate(String token) {
        if (getSubject(token) != null && jwtDao.getJWTTokenByToken(token) != null) {
            return true;
        }
        return false;
    }

   /* public boolean tokenValidate(String token) {
        if (getSubject(token) != null && isExpired(token) && jwtDao.getJWTTokenByToken(token) != null) {
            return true;
        }
        return false;
    }*/

/*    public String getUsernameToken(String token) {
        Claims claims = getClaims(token);
        return claims.getSubject();
    }

    public boolean isExpired(String token) {
        Claims claims = getClaims(token);
        return claims.getExpiration().after(new Date(System.currentTimeMillis()));
    }

    public double shouldRefreshRetTime(String token){
        Claims claims = getClaims(token);
        // Expiration Time - Current time
        Long leftMinutes = (claims.getExpiration().getTime() * JwtProperties.MILLISECONDS_TO_MINUTES) - (claims.getIssuedAt().getTime() * JwtProperties.MILLISECONDS_TO_MINUTES);
        return leftMinutes;
    }

    public boolean shouldRefreshForAbsoluteAuthentication(String token, int conditionMinute){
        Claims claims = getClaims(token);
        if(date.getTime() * JwtProperties.MILLISECONDS_TO_MINUTES <= claims.getIssuedAt().getTime() * JwtProperties.MILLISECONDS_TO_MINUTES + JwtProperties.AUTHENTICATION_ABSOLUTE_EXPIRATION_MINUTE){
            return true;
        }
        return false;
    }

    public boolean shouldRefreshForAuthentication(String token, int conditionMinute){
        Claims claims = getClaims(token);
        // Expiration Time - Current time
        Long leftMinutes = (claims.getExpiration().getTime() * JwtProperties.MILLISECONDS_TO_MINUTES) - (claims.getIssuedAt().getTime() * JwtProperties.MILLISECONDS_TO_MINUTES);
        if(leftMinutes <= conditionMinute){
            return true;
        }
        return false;
    }

    public boolean shouldRefreshForAuthorization(String token, int conditionMinute){
        Claims claims = getClaims(token);
        // Expiration Time - Current time
        Long leftMinutes = (claims.getExpiration().getTime() * JwtProperties.MILLISECONDS_TO_MINUTES) - (claims.getIssuedAt().getTime() * JwtProperties.MILLISECONDS_TO_MINUTES);
        if(leftMinutes <= conditionMinute){
            return true;
        }
        return false;
    }*/

    public Claim getClaims(String token) {
        JWTVerifier verifier = JWT.require(Algorithm.HMAC256(JwtProperties.SECRET.getBytes())).build();
        DecodedJWT decodedJWT = verifier.verify(token);
        return  decodedJWT.getClaim(token);
    }

    public String getSubject(String token){
        JWTVerifier verifier = JWT.require(Algorithm.HMAC256(JwtProperties.SECRET.getBytes())).build();
        DecodedJWT decodedJWT = verifier.verify(token);
        return decodedJWT.getSubject();
    }

}