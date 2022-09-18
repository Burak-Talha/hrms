package com.example.hrms.core.auth.jwt;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name="jwt_tokens")
@Data
@NoArgsConstructor
public class JWTToken {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="id")
    private int id;

    @Column(name="email")
    private String email;

    @Column(name="absolute_expire_date")
    Date absoluteExpireDate;

}
