package com.lms.demo.controller;

import com.lms.demo.data.model.Book;
import com.lms.demo.data.model.Order;
import com.lms.demo.data.repository.BookRepository;
import com.lms.demo.data.repository.OrderRepository;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api")
@Api(value = "searchController", description = "This enpoints returns books, makesBooking, cancellation")
public class MyController {

    @Autowired
    private BookRepository bookRepository;
    @Autowired
    private OrderRepository orderRepository;


    @RequestMapping(value = "/getBooks", method = RequestMethod.GET, produces = "application/json")
    @ApiOperation(value = "to get total number of books in library", response = List.class)
    public List<Book> getBooks() {
        List<Book> li = new ArrayList<Book>();
        bookRepository.findAll().forEach(li::add);
        return li;
    }

    @RequestMapping(value = "/getBookingDetails", method = RequestMethod.GET,
            produces = "application/json")
    @ApiOperation(value = "to get total number of booking made", response = List.class)
    public List<Order> getBookingDetails() {
        List<Order> li = new ArrayList<Order>();
        orderRepository.findAll().forEach(li::add);
        return li;
    }


    @RequestMapping(value = "/count", method = RequestMethod.GET, produces = "application/json")
    @ApiOperation(value = "to get count of books", response = Long.class)
    public long countNoofBooks() {
        return bookRepository.count();
    }

    @RequestMapping(value = "/addBook", method = RequestMethod.POST, produces = "application/json")
    @ApiOperation(value = "to add new book in library", response = String.class)
    public void addBooks(@RequestBody List<Book> books) {
        System.out.println(books);
        bookRepository.saveAll(books);


    }

    @RequestMapping(value = "/delBook", method = RequestMethod.POST, produces = "application/json")
    @ApiOperation(value = "to delete book from library", response = String.class)
    public void delBooks(@RequestBody List<Book> books) {
        System.out.println(books);
        bookRepository.deleteAll(books);


    }

    @RequestMapping(value = "/makeBooking", method = RequestMethod.POST,
            produces = "application/json")
    @ApiOperation(value = "to make booking from library", response = String.class)
    public void makeBooking(@RequestBody Order orderDetails) {
        orderRepository.save(orderDetails);


    }

    @RequestMapping(value = "/cancelBooking", method = RequestMethod.POST,
            produces = "application/json")
    @ApiOperation(value = "to cancel booking from library", response = String.class)
    public void cancelBooking(@RequestBody String orderDetails) {
        System.out.println(orderDetails.split(":")[0]);
        orderRepository.deleteByOrderId(orderDetails);


    }

}
