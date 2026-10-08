package com.example.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig {

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
            // Disable CSRF for stateless REST APIs
            .csrf().disable()
            .authorizeRequests()
                // Allow public access to login/auth endpoints
                .antMatchers("/api/auth/**").permitAll()
                // Require authentication for everything else
                .anyRequest().authenticated();

        return http.build();
    }
}