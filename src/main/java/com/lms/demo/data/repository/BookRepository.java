package com.lms.demo.data.repository;

import com.lms.demo.data.model.Book;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

public interface BookRepository extends JpaRepository<Book, String> {
// List<Book> findBook(String criteria, String type);
}
