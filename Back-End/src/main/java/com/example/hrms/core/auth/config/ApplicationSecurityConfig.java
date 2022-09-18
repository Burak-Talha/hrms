package com.example.hrms.core.auth.config;

import com.example.hrms.core.auth.business.abstracts.LoginAndRoleService;
import com.example.hrms.core.auth.dataAccess.UserDetailsDao;
import com.example.hrms.core.auth.entity.ApplicationUserRole;
import com.example.hrms.core.auth.filters.JwtAuthenticationFilter;
import com.example.hrms.core.auth.filters.JwtAuthorizationFilter;
import com.example.hrms.core.auth.jwt.TokenManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.BeanIds;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import java.util.Arrays;

@EnableWebSecurity
public class ApplicationSecurityConfig extends WebSecurityConfigurerAdapter {

    private LoginAndRoleService loginAndRoleService;
    private UserDetailsDao userDetailsDao;
    private PasswordEncoder passwordEncoder;
    private TokenManager tokenManager;

    @Autowired
    public ApplicationSecurityConfig(LoginAndRoleService loginAndRoleService, UserDetailsDao userDetailsDao, PasswordEncoder passwordEncoder, TokenManager tokenManager) {
        this.loginAndRoleService = loginAndRoleService;
        this.userDetailsDao = userDetailsDao;
        this.passwordEncoder = passwordEncoder;
        this.tokenManager = tokenManager;
    }

    @Bean(name = BeanIds.AUTHENTICATION_MANAGER)
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

    @Override
    protected void configure(HttpSecurity httpSecurity) throws Exception {

        JwtAuthenticationFilter jwtAuthenticationFilter = new JwtAuthenticationFilter(authenticationManagerBean(), tokenManager);
        JwtAuthorizationFilter jwtAuthorizationFilter = new JwtAuthorizationFilter(authenticationManagerBean(), tokenManager, userDetailsDao);
        jwtAuthenticationFilter.setFilterProcessesUrl("/auth/login");

        httpSecurity.cors().and().csrf().disable();
        httpSecurity.authorizeRequests().mvcMatchers(HttpMethod.GET, "/api/employer/getall").hasAuthority(ApplicationUserRole.USER.name());
        //httpSecurity.authorizeRequests().mvcMatchers(HttpMethod.POST, "/auth/login").permitAll();
        httpSecurity.addFilter(jwtAuthenticationFilter);
        httpSecurity.addFilterAfter(jwtAuthorizationFilter, UsernamePasswordAuthenticationFilter.class);

        httpSecurity.logout()
                .logoutRequestMatcher(new AntPathRequestMatcher("/auth/logout")).logoutSuccessUrl("/")
                .invalidateHttpSession(true);
    }

    @Override
    protected void configure(AuthenticationManagerBuilder builder){
        builder.authenticationProvider(authenticationProvider());
    }

    @Bean
    DaoAuthenticationProvider authenticationProvider(){
        DaoAuthenticationProvider daoAuthenticationProvider = new DaoAuthenticationProvider();
        daoAuthenticationProvider.setPasswordEncoder(passwordEncoder);
        daoAuthenticationProvider.setUserDetailsService((UserDetailsService) this.loginAndRoleService);

        return daoAuthenticationProvider;
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
