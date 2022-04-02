package com.lms.demo.controller;

import com.lms.demo.data.model.Book;
import com.lms.demo.data.model.Order;
import com.lms.demo.data.repository.BookRepository;
import com.lms.demo.data.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api")
public class BookController {

    @Autowired
    private BookRepository bookRepository;
    @Autowired
    private OrderRepository orderRepository;


    @RequestMapping(value = "/getBooks", method = RequestMethod.GET, produces = "application/json")
    public List<Book> getBooks() {
        List<Book> li = new ArrayList<>();
        bookRepository.findAll().forEach(li::add);
        return li;
    }

    @RequestMapping(value = "/getBookingDetails", method = RequestMethod.GET,
            produces = "application/json")
    public List<Order> getBookingDetails() {
        List<Order> li = new ArrayList<Order>();
        orderRepository.findAll().forEach(li::add);
        return li;
    }


    @RequestMapping(value = "/count", method = RequestMethod.GET, produces = "application/json")
    public long countNoofBooks() {
        return bookRepository.count();
    }

    @RequestMapping(value = "/addBook", method = RequestMethod.POST, produces = "application/json")
    public void addBooks(@RequestBody List<Book> books) {
        System.out.println(books);
        bookRepository.saveAll(books);


    }

    @RequestMapping(value = "/delBook", method = RequestMethod.POST, produces = "application/json")
    public void delBooks(@RequestBody List<Book> books) {
        System.out.println(books);
        bookRepository.deleteAll(books);


    }

    @RequestMapping(value = "/makeBooking", method = RequestMethod.POST,
            produces = "application/json")
    public void makeBooking(@RequestBody Order orderDetails) {
        orderRepository.save(orderDetails);


    }

    @RequestMapping(value = "/cancelBooking", method = RequestMethod.POST,
            produces = "application/json")
    public void cancelBooking(@RequestBody String orderDetails) {
        System.out.println(orderDetails.split(":")[0]);
        orderRepository.deleteByOrderId(orderDetails);


    }

}
