package com.example.hrms.config.security;

import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import java.util.Arrays;

@EnableWebSecurity
public class ProjectSecurityConfig extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(HttpSecurity httpSecurity) throws Exception{
        // denyAll
        /*httpSecurity.cors().disable().csrf().disable().authorizeHttpRequests()
                .mvcMatchers("/api/employee/getall").permitAll()
                .mvcMatchers("/api/employee/login").permitAll()
                .and().formLogin()
                .and().httpBasic();*/

        httpSecurity.cors().and().csrf().disable();
        httpSecurity.authorizeHttpRequests().mvcMatchers("login").permitAll().and().authorizeHttpRequests().mvcMatchers("/api/employer/google-login").authenticated().and().oauth2Login();
    }

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
