package com.lms.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

  @GetMapping("/Login")
  public String getRequest()
  {
    System.out.println("returning call from Login user....");
    return "home";
  }
  @GetMapping("/register")
  public String registerUser()
  {
    System.out.println("returning call from Login user....");
    return "register";
  }
  
  @GetMapping("/search")
  public String searchDetails()
  {
    System.out.println("returning call from Login user....");
    return "search";
  }
}
