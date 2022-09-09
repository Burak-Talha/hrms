package com.example.hrms.core.auth.jwt;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name="jwt_tokens")
public class JWTToken {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="id")
    private int id;

    @Column(name="token")
    private String token;
}
