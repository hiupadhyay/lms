package com.lms.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {



	@GetMapping("/Login")
	public String getRequest() {
		System.out.println("returning call from Login user....");
		return "login";
	}

	@GetMapping("/Register")
	public String registerUser() {
		System.out.println("returning call from Login user....");
		return "register";
	}

	@GetMapping("/search")
	public String searchDetails() {
		// logger.debug("Debug message");

		return "search";
	}

	@GetMapping("/")
	public String others() {
		return searchDetails();
	}
}
