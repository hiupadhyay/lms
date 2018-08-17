package com.lms.demo.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
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
@RequestMapping("/api")
@Api(value="searchController",description="This enpoints returns books, makesBooking, cancellation")
public class MyController {

	@Autowired
	@Qualifier("freeChargePayment")
	PaymentGateway payment;
	@Autowired
	BookRepository bookRepository;
	@Autowired
	OrderRepository orderRepository;


	@RequestMapping(value = "/getData", method = RequestMethod.GET, produces = "application/json")
	@ApiOperation(value="to get Dummy data from user", response=List.class)
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
	@ApiOperation(value="to get total number of books in library", response=List.class)
	public List<Book> getBooks() {
		List<Book> li = new ArrayList<Book>();
		bookRepository.findAll().forEach(li::add);
		return li;
	}

	@RequestMapping(value = "/getBookingDetails", method = RequestMethod.GET,
			produces = "application/json")
	@ApiOperation(value="to get total number of booking made", response=List.class)
	public List<Order> getBookingDetails() {
		List<Order> li = new ArrayList<Order>();
		orderRepository.findAll().forEach(li::add);
		return li;
	}


	@RequestMapping(value = "/count", method = RequestMethod.GET, produces = "application/json")
	@ApiOperation(value="to get count of books", response=Long.class)
	public long countNoofBooks() {
		return bookRepository.count();
	}

	@RequestMapping(value = "/addBook", method = RequestMethod.POST, produces = "application/json")
	@ApiOperation(value="to add new book in library", response=String.class)
	public void addBooks(@RequestBody List<Book> books) {
		System.out.println(books);
		bookRepository.saveAll(books);


	}

	@RequestMapping(value = "/delBook", method = RequestMethod.POST, produces = "application/json")
	@ApiOperation(value="to delete book from library", response=String.class)
	public void delBooks(@RequestBody List<Book> books) {
		System.out.println(books);
		bookRepository.deleteAll(books);



	}

	@RequestMapping(value = "/makeBooking", method = RequestMethod.POST,
			produces = "application/json")
	@ApiOperation(value="to make booking from library", response=String.class)
	public void makeBooking(@RequestBody Order orderDetails) {
		orderRepository.save(orderDetails);



	}

	@RequestMapping(value = "/cancelBooking", method = RequestMethod.POST,
			produces = "application/json")
	@ApiOperation(value="to cancel booking from library", response=String.class)
	public void cancelBooking(@RequestBody String orderDetails) {
		System.out.println(orderDetails.split(":")[0]);
		orderRepository.deleteByOrderId(orderDetails);



	}

}
