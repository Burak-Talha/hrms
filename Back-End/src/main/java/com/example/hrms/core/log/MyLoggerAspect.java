package com.example.hrms.core.log;


import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Component;

@Aspect
@Component
@EnableAspectJAutoProxy
public class MyLoggerAspect {

    Logger logger = LoggerFactory.getLogger(MyLoggerAspect.class);

    @After("execution(* com.example.hrms.business.concretes.EmployerManager.getAll(..))")
    public void afterLoggingAdd(JoinPoint joinPoint) {
        logger.info("### LOG: advice that runs AFTER the method ###");
    }

    /*@Around("execution(* com.example.hrms.business.concretes.EmployerManager.*(..))")
    public void aroundLoggingAdd(ProceedingJoinPoint joinPoint) {
        logger.info("### LOG: advice that runs AROUND the method ###");
    }*/

    @Before("execution(* com.example.hrms.business.concretes.EmployerManager.*(..))")
    public void beforeLoggingAdd() {
        logger.info("### LOG: advice that runs BEFORE the method ###");
    }
}