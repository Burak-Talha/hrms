package com.example.hrms.core.security.dataAccess;

import com.example.hrms.core.security.entity.UserDetails;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDetailsDao extends JpaRepository<UserDetails, Integer> {
    List<UserDetails> getAuthoritiesByEmail(String email);
    UserDetails getUserDetailsByEmail(String email);
    UserDetails findUserDetailsByEmailAndPassword(String email, String password);
}
