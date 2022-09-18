package com.example.hrms.core.auth.jwt;

public class JwtProperties {
    public static final String SECRET = "SomeSecretForJWTGeneration";
    public static final int EXPIRATION_TIME = 864_000_000; // 10 days
    public static final String TOKEN_PREFIX = "Bearer ";
    public static final String HEADER_STRING = "Authorization";
    public static final int MILLISECONDS_TO_MINUTES = 60 * 1000;
    public static final int AUTHENTICATION_MINUTE = 1440;
}
