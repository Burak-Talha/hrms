package com.example.hrms.exceptions;

public class NoAuthorizationError extends Exception{
    String message;
    public NoAuthorizationError(String message){
        this.message = message;
    }
    public NoAuthorizationError(){
    }
}
