package com.lms.demo.controller;

import com.lms.demo.data.model.Book;
import com.lms.demo.data.model.Order;
import com.lms.demo.data.repository.BookRepository;
import com.lms.demo.data.repository.OrderRepository;
import com.lms.demo.dto.CancelBookingRequest;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import javax.validation.Valid;
import java.util.Collections;

@RestController
@RequestMapping("/api")
public class BookController {

    private final BookRepository bookRepository;
    private final OrderRepository orderRepository;

    public BookController(BookRepository bookRepository, OrderRepository orderRepository) {
        this.bookRepository = bookRepository;
        this.orderRepository = orderRepository;
    }

    @GetMapping(value = "/getBooks", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<Book>> getBooks() {
        return ResponseEntity.ok(bookRepository.findAll());
    }

    @GetMapping(value = "/getBookingDetails", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<Order>> getBookingDetails() {
        return ResponseEntity.ok(orderRepository.findAll());
    }

    @GetMapping(value = "/count", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Long> countNoofBooks() {
        return ResponseEntity.ok(bookRepository.count());
    }

    @PostMapping(value = "/addBook", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> addBooks(@Valid @RequestBody List<Book> books) {
        if (books == null || books.isEmpty()) {
            return ResponseEntity.badRequest()
                    .body(Collections.singletonMap("message", "Provide at least one book."));
        }
        boolean hasInvalid = books.stream().anyMatch(this::invalidBookPayload);
        if (hasInvalid) {
            return ResponseEntity.badRequest()
                    .body(Collections.singletonMap("message", "Invalid book payload: ISBN/title required, pages > 0, available >= 0."));
        }
        bookRepository.saveAll(books);
        return ResponseEntity.accepted().build();
    }

    @PostMapping(value = "/delBook", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Void> delBooks(@RequestBody List<Book> books) {
        if (books == null || books.isEmpty()) {
            return ResponseEntity.badRequest().build();
        }
        bookRepository.deleteAll(books);
        return ResponseEntity.noContent().build();
    }

    @PostMapping(value = "/makeBooking", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Order> makeBooking(@Valid @RequestBody Order orderDetails) {
        if (orderDetails.getBookingDate() == null) {
            orderDetails.setBookingDate(new java.sql.Date(System.currentTimeMillis()));
        }
        Order saved = orderRepository.save(orderDetails);
        return ResponseEntity.ok(saved);
    }

    @PostMapping(value = "/cancelBooking", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Void> cancelBooking(@Valid @RequestBody CancelBookingRequest request) {
        orderRepository.deleteByBookingId(request.getBookingId());
        return ResponseEntity.noContent().build();
    }

    private boolean invalidBookPayload(Book book) {
        return book == null
                || !StringUtils.hasText(book.getIsbn())
                || !StringUtils.hasText(book.getTitle())
                || book.getPages() <= 0
                || book.getAvailable() < 0;
    }
}
