package com.example.hrms.core.auth.jwt;

public class JwtProperties {
    public static final String SECRET = "SomeSecretForJWTGeneration";
    public static final int MILLISECONDS_TO_MINUTES = 60 * 1000;

    public static final int AUTHENTICATION_ABSOLUTE_EXPIRATION_MINUTE = 1440;
    public static final int AUTHENTICATION_EXPIRATION_MINUTE = 720;
    public static final int AUTHORIZATON_EXPIRATION_MINUTE = 360;
    public static final String TOKEN_PREFIX = "Bearer ";
    public static final String AUTHENTICATION_HEADER_STRING = "Authentication";
    public static final String AUTHORIZATION_HEADER_STRING = "Authorization";
}
