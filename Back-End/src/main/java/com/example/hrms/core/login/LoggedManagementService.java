package com.example.hrms.core.login;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.ApplicationScope;
import org.springframework.web.context.annotation.SessionScope;

@Getter
@Setter
@Service
public class LoggedManagementService {
    private String email;
}
