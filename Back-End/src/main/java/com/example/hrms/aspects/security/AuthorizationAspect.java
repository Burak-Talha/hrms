package com.example.hrms.aspects.security;

import com.example.hrms.core.security.jwt.JwtDao;
import org.apache.log4j.*;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Component;


@Aspect
@Component
@EnableAspectJAutoProxy
public class AuthorizationAspect {

    Logger logger =  org.apache.log4j.Logger.getLogger(AuthorizationAspect.class);

    JwtDao jwtDao;

    @Autowired
    public AuthorizationAspect(JwtDao jwtDao) {
        this.jwtDao = jwtDao;
    }

/*
    @Around("execution(* com.example.hrms.business.concretes.*.*(..)) && args(httpRequest))")
    public void checkAuthorization(ProceedingJoinPoint joinPoint, HttpServletRequest httpRequest) throws Exception {
        String token = httpRequest.getHeader("Authorization").substring(7);
        if(jwtDao.getJWTTokenByToken(token) != null){
            logger.info("Authorization successful");
            return;
        }
        throw new Exception("There is no Authorization or No required permissions");
    }*/

}
