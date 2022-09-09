package com.example.hrms.core.auth.jwt;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.security.web.util.matcher.RequestMatcher;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

@Component
public class JwtTokenFilter extends OncePerRequestFilter {

    private RequestMatcher loginRequestMatcher = new AntPathRequestMatcher("auth/login");
    private RequestMatcher logoutRequestMatcher = new AntPathRequestMatcher("auth/logout");

    @Autowired
    private TokenManager tokenManager;

    @Override
    protected void doFilterInternal(HttpServletRequest httpServletRequest,
                                    HttpServletResponse httpServletResponse,
                                    FilterChain filterChain) throws ServletException, IOException {

        /**
         * "Bearer 123hab2355"
         */
        final String authHeader = httpServletRequest.getHeader("Authorization");

        String username = null;
        String token = null;

    if(loginRequestMatcher.matches(httpServletRequest) || logoutRequestMatcher.matches(httpServletRequest))
    {
        return;
    }
    else
    {
        if (authHeader != null && authHeader.contains("Bearer")) {
            token = authHeader.substring(7);
            if (tokenManager.tokenValidate(token) == false) {
            throw new ServletException("The Token is not valid");
            }
        }
    }
        filterChain.doFilter(httpServletRequest, httpServletResponse);
    }
}
