package com.lms.demo.data.repository;

import com.lms.demo.data.model.User;
import org.springframework.data.repository.CrudRepository;

public interface UserRepository extends CrudRepository<User, Long> {
}
