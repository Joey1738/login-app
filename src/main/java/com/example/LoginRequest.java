package com.example.dto;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

public class LoginRequest {

    // Rule 1: Email cannot be empty or just whitespace
    // Rule 2: Must match standard email formatting (contains @, domain, etc.)
    @NotBlank(message = "Email address must not be blank")
    @Email(message = "Please provide a valid email format")
    private String email;

    // Rule 3: Password cannot be blank
    // Rule 4: Must meet a minimum length requirement
    @NotBlank(message = "Password must not be blank")
    @Size(min = 8, message = "Password must be at least 8 characters long")
    private String password;

    // Default constructor needed for JSON deserialization
    public LoginRequest() {}

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}