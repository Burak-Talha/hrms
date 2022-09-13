package com.example.hrms.aspects;

import com.example.hrms.core.utilities.results.DataResults.DataResults;
import com.example.hrms.core.utilities.results.Result;
import com.example.hrms.entities.concretes.Employer;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Component;

@Aspect
@Component
@EnableAspectJAutoProxy
public class LoggerAspect {

    @After("execution(* com.example.hrms.business.concretes.EmployerManager.getAll(..))")
    public void afterLoggingAdd() throws Throwable {
        //System.out.println("Transaction generated :"+results.isSuccess());
/*        System.out.println("Method name :"+joinPoint.getSignature());
        DataResults<Employer> employers = (DataResults<Employer>) joinPoint.proceed();*/
        //System.out.println(employers.isSuccess());
        System.out.println("### LOG: advice that runs AFTER the method ###");
    }

}
