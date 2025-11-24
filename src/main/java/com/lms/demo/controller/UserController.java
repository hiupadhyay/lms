package com.lms.demo.controller;

import com.lms.demo.data.model.User;
import com.lms.demo.data.repository.UserRepository;
import com.lms.demo.dto.UserDto;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import java.util.Collections;
import java.util.UUID;

@RestController
@RequestMapping("/user")
@Validated
public class UserController {

    private UserRepository userRepository;

    public UserController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @PostMapping(value = "/register", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> createUser(@Valid @RequestBody UserDto userDto) {
        if (!userDto.getPassword().equals(userDto.getRepeatPassword())) {
            return ResponseEntity.badRequest().body(Collections.singletonMap("message", "Passwords do not match"));
        }
        User createdUser = userRepository.save(mapUserDtoToUser(userDto));
        return ResponseEntity.ok(Collections.singletonMap("id", createdUser.getId()));
    }

    private User mapUserDtoToUser(UserDto userDto) {
        return new User(UUID.randomUUID().toString(), userDto.getName(), userDto.getDob(), userDto.getEmail(), userDto.getPassword());

    }
}
