package com.lms.demo.data.repository;

import org.springframework.data.repository.CrudRepository;
import com.lms.demo.data.model.Book;
import org.springframework.stereotype.Repository;

public interface BookRepository extends CrudRepository<Book, Long> {
// List<Book> findBook(String criteria, String type);
}
