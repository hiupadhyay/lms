package com.lms.demo.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class UserDto {

    private String email;
    private String password;
    private String repeatPassword;
    private String userName;
    private String dob;

}
