package com.lms.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ContainerA {

	
	public ContainerB containerB;
	@Autowired
	public ContainerA(ContainerB containerB)
	{
		this.containerB=containerB;
	}
	
	
	
}
