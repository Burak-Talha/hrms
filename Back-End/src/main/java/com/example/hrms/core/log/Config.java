package com.example.hrms.core.log;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan(basePackages = {"com.example.hrms.core.log", "com.example.hrms.*"})
public class Config {
}
