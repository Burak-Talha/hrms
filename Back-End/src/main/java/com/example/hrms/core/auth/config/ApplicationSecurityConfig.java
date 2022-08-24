package com.example.hrms.core.auth.config;

import com.example.hrms.core.auth.entity.ApplicationUserRole;
import org.springframework.context.annotation.Bean;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.BeanIds;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import java.util.Arrays;

@EnableWebSecurity
public class ApplicationSecurityConfig extends WebSecurityConfigurerAdapter {



    @Bean(name = BeanIds.AUTHENTICATION_MANAGER)
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

    @Override
    protected void configure(HttpSecurity httpSecurity) throws Exception{
        httpSecurity.cors().and().csrf().disable();
        httpSecurity.authorizeRequests().mvcMatchers(HttpMethod.GET, "/auth/getall").hasAuthority(ApplicationUserRole.ADMIN.name());
        httpSecurity.authorizeRequests().mvcMatchers(HttpMethod.POST, "/auth/login").permitAll();
        //httpSecurity.authorizeRequests().mvcMatchers(HttpMethod.GET, "/getall").hasRole(ApplicationUserRole.ADMIN.name());
        //httpSecurity.authorizeRequests().mvcMatchers(HttpMethod.GET, "/getall").hasAuthority(ApplicationUserRole.ADMIN.name());
        //httpSecurity.authorizeRequests().mvcMatchers(HttpMethod.GET, "/getall").hasAuthority("ROLE_"+ApplicationUserRole.ADMIN.name());
    }

    @Order(1)
    @Bean
    CorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration configuration = new CorsConfiguration();
        configuration.addAllowedOriginPattern("*");
        configuration.setAllowedMethods(Arrays.asList("*"));
        configuration.setAllowedHeaders(Arrays.asList("*"));
        configuration.setAllowCredentials(true);
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", configuration);
        return source;
    }
}
