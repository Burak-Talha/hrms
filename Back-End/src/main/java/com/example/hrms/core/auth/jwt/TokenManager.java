package com.example.hrms.core.auth.jwt;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.example.hrms.core.auth.dataAccess.UserDetailsDao;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

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

    @Resource
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
        // turn into null
        if(jwtDao.getJWTTokenByEmail(email) == null) {
            // Cannot invoke "com.example.hrms.core.auth.jwt.JWTToken.setEmail(String)" because "this.jwtToken" is null
            // solve jwt token null problem
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