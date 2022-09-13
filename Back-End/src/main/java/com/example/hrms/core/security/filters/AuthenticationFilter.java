package com.example.hrms.core.security.filters;

import com.example.hrms.core.security.dataAccess.UserDetailsDao;
import com.example.hrms.core.security.entity.UserDetails;
import com.example.hrms.core.security.jwt.TokenManager;
import com.example.hrms.exceptions.AccessDeniedException;
import com.example.hrms.exceptions.UserNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AuthenticationFilter extends UsernamePasswordAuthenticationFilter {



    private final AuthenticationManager authenticationManager;

    @Autowired
    private UserDetailsDao userDetailsDao;
    @Autowired
    private TokenManager tokenManager;
    @Autowired
    PasswordEncoder passwordEncoder;

    public AuthenticationFilter(AuthenticationManager authenticationManager) {
        this.authenticationManager = authenticationManager;
    }

    @Override
    public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response) throws AuthenticationException {
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");

        UserDetails userDetails = userDetailsDao.getUserDetailsByEmail(email);

        if(userDetails == null) {
            try {
                throw new UserNotFoundException("User not found");
            } catch (UserNotFoundException e) {
                throw new RuntimeException(e);

        }
        if(email == null || pass == null) {
            throw new NullPointerException("Username and password are required");
        }

        userDetails.setGrantedAuthorities(userDetails.getGrantedAuthorities());
        userDetails.setPassword(passwordEncoder.encode(pass));


        UsernamePasswordAuthenticationToken authenticationToken
                = new UsernamePasswordAuthenticationToken(email, pass);
        Authentication auth = authenticationManager.authenticate(authenticationToken);


        return authenticationManager.authenticate(auth);
    }

    @Override
    protected void successfulAuthentication(HttpServletRequest request, HttpServletResponse response, FilterChain chain, Authentication authentication) throws IOException, ServletException {
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        String accessToken = tokenManager.generateAuthenticationToken(request, userDetails);

        response.setHeader("access_token", accessToken);
        super.successfulAuthentication(request, response, chain, authentication);
    }

    @Override
    protected void unsuccessfulAuthentication(HttpServletRequest request, HttpServletResponse response, AuthenticationException failed) throws IOException, ServletException {
        failed.addSuppressed(new AccessDeniedException("Access Denied for those credentials"));
        super.unsuccessfulAuthentication(request, response, failed);
    }

}
