package com.lms.demo.controller;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import com.lms.demo.data.model.Book;
import com.lms.demo.data.model.Order;
import com.lms.demo.data.model.User;
import com.lms.demo.data.repository.BookRepository;
import com.lms.demo.data.repository.OrderRepository;
import com.lms.demo.payment.PaymentGateway;

@RestController
public class MyController {

  @Autowired
  @Qualifier("freeChargePayment")
  PaymentGateway payment;
  @Autowired
  BookRepository bookRepository;
  @Autowired
  OrderRepository orderRepository;


  @RequestMapping(value = "/getData", method = RequestMethod.GET, produces = "application/json")
  public List<User> demoText() {
    List<User> user = new ArrayList<User>();
    if (payment.pay().equals("Your request has been processed from Paytm end")) {
      System.out.println("Payment done sucessfully through Paytm Platform........");
      User u1 = new User("101", "Himanshu", "01-04-1991", "XYZ");
      user.add(u1);
    } else {
      System.out.println("Payment done sucessfully through FreeCharge Platform........");
      User u1 = new User("101", "Himanshu", "01-04-1991", "XYZ");
      user.add(u1);
      User u2 = new User("102", "Upadhyay", "13-10-1990", "ABC");
      user.add(u2);
    }
    return user;
  }

  @RequestMapping(value = "/getBooks", method = RequestMethod.GET, produces = "application/json")
  public List<Book> getBooks() {
    List<Book> li = new ArrayList<Book>();
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
