package com.lms.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
/*
 * @Author himanshu.upadhyay
 * @info below is the starting point of application
 */

@SpringBootApplication
public class LmsApplication  extends SpringBootServletInitializer{

	public static void main(String[] args) {
		SpringApplication.run(LmsApplication.class, args);
	}
	
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder builder)
	{
    return builder.sources(LmsApplication.class);
	  
	}
}
