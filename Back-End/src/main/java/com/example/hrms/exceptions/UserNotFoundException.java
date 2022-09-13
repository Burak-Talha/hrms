package com.example.hrms.exceptions;

public class UserNotFoundException extends LoginError {
    public UserNotFoundException(String message) {
        super(message);
    }
}
