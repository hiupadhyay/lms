package com.lms.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;


@Component
public class ContainerB {
	
	public ContainerA containera;
	@Autowired
	public ContainerB( @Lazy ContainerA containera)
	{
		this.containera=containera;
	}
	

}
