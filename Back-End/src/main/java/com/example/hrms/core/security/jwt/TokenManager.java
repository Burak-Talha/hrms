package com.example.hrms.core.security.jwt;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.example.hrms.core.security.entity.UserDetails;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;
import java.security.Key;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

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



    private String generateToken(HttpServletRequest request, UserDetails userDetails, String ... strings) {
        return JWT.create()
                .withSubject(String.valueOf(strings))
                .withIssuer(request.getRequestURL().toString())
                .withIssuedAt(new Date(System.currentTimeMillis()))
                .withExpiresAt(new Date(System.currentTimeMillis() + validity))
                .withClaim("roles", String.valueOf(userDetails.getGrantedAuthorities())).sign(Algorithm.HMAC256("secret_key".getBytes()));
    }


    public String generateAuthenticationToken(HttpServletRequest request, UserDetails userDetails){
        String token = generateToken(request, userDetails, userDetails.getEmail(), userDetails.getPassword());
        jwtToken.setToken(token);
        jwtDao.save(jwtToken);
        return token;
    }

    public String generateAuthorizationToken(HttpServletRequest request, UserDetails userDetails){
        String token = generateToken(request, userDetails, userDetails.getEmail(), userDetails.getPassword());
        jwtToken.setToken(token);
        jwtDao.save(jwtToken);
        return token;
    }

    public String refreshToken(String oldToken, HttpServletRequest request, UserDetails userDetails){
        // Create a new token -> delete exist old token -> generate new one -> save to db -> return to client
        String token = generateAuthenticationToken(request, userDetails);
        jwtDao.deleteJWTTokenByToken(oldToken);
        jwtToken.setToken(token);
        jwtDao.save(jwtToken);
        return token;
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