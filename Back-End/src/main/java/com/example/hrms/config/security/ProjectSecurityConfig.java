package com.example.hrms.config.security;

import com.example.hrms.business.abstracts.EmployerService;
import com.example.hrms.core.login.LoginManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.logout.LogoutHandler;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import java.util.Arrays;

@EnableWebSecurity
public class ProjectSecurityConfig extends WebSecurityConfigurerAdapter {

    LogoutHandler logoutHandler;
    LogoutSuccessHandler logoutSuccessHandler;
    LoginManager loginManager;

    @Autowired
    public ProjectSecurityConfig(LoginManager loginManager) {
        this.loginManager = loginManager;
    }

    @Override
    protected void configure(HttpSecurity httpSecurity) throws Exception{
        // denyAll
        /*httpSecurity.cors().disable().csrf().disable().authorizeHttpRequests()
                .mvcMatchers("/api/employee/getall").permitAll()
                .mvcMatchers("/api/employee/login").permitAll()
                .and().formLogin()
                .and().httpBasic();*/

        httpSecurity.cors().and().csrf().disable();
        httpSecurity.authorizeHttpRequests().mvcMatchers("login").permitAll().and().
                authorizeHttpRequests().mvcMatchers("/api/employer/google-login").authenticated().and().
                oauth2Login();
    }

    public void logoutTransaction(){
        loginManager.logout();
    }


    public void logout(HttpSecurity http) throws Exception {
        http.logout(logout -> logout
                        .logoutUrl("/api/employer/logout")
                        .logoutSuccessHandler(logoutSuccessHandler)
                        .invalidateHttpSession(true)
                        .addLogoutHandler(logoutHandler)
                );
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
