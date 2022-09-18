package com.example.hrms.core.auth.filters;

import com.auth0.jwt.JWT;
import com.example.hrms.core.auth.dataAccess.UserDetailsDao;
import com.example.hrms.core.auth.entity.UserDetails;
import com.example.hrms.core.auth.jwt.JwtProperties;
import com.example.hrms.core.auth.jwt.TokenManager;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.www.BasicAuthenticationFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.Key;

import static com.auth0.jwt.algorithms.Algorithm.HMAC256;
import static com.auth0.jwt.algorithms.Algorithm.HMAC512;


public class JwtAuthorizationFilter extends BasicAuthenticationFilter {

    private UserDetailsDao userDetailsDao;
    private TokenManager tokenManager;

    @Autowired
    UserDetails userDetails;

    public JwtAuthorizationFilter(AuthenticationManager authenticationManager, TokenManager tokenManager, UserDetailsDao userDetailsDao) {
        super(authenticationManager);
        this.tokenManager = tokenManager;
        this.userDetailsDao = userDetailsDao;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {

        Authentication authentication = getUsernamePasswordAuthentication(request, response);
        Authentication targetAuthentication = SecurityContextHolder.getContext().getAuthentication();

        // dont insert same instances
        if(authentication != targetAuthentication) {
            SecurityContextHolder.getContext().setAuthentication(authentication);

        }
        }


        // Continue filter execution
        filterChain.doFilter(request, response);
    }

    private Authentication getUsernamePasswordAuthentication(HttpServletRequest request, HttpServletResponse httpServletResponse) {
        String authenticationToken = request.getHeader(JwtProperties.AUTHENTICATION_HEADER_STRING)
                .replace(JwtProperties.TOKEN_PREFIX, "");

        if (authenticationToken != null) {
            // parse the token and validate it
            // Search in the DB if we find the user by token subject (username)
            // If so, then grab user details and create spring auth token using username, pass, authorities/roles

            if (tokenManager.tokenValidate(authenticationToken)) {

                String email = tokenManager.getSubject(authenticationToken);

                // Need any new token?
                if (tokenManager.shouldRefreshForAuthentication(authenticationToken)) {
                    httpServletResponse.setHeader(JwtProperties.AUTHENTICATION_HEADER_STRING, tokenManager.generateAuthenticationToken(email, JwtProperties.AUTHENTICATION_EXPIRATION_MINUTE));
                }

                // Check we have already this authentication
                if (email == SecurityContextHolder.getContext().getAuthentication().getName()) {
                    try {
                        userDetails = userDetailsDao.findUserDetailsByEmail(email);
                    } catch (UsernameNotFoundException notFoundException) {
                        System.out.println("Kullanıcı bulunamadı.");
                    }
                    UsernamePasswordAuthenticationToken auth = new UsernamePasswordAuthenticationToken(email, null, userDetails.getAuthorities());
                    return auth;
                }
            }
            return null;
        }
        return null;
    }
}
