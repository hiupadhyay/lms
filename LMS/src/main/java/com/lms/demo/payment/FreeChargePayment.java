package com.lms.demo.payment;

import org.springframework.stereotype.Service;

@Service("freeChargePayment")
public class FreeChargePayment implements PaymentGateway{

  

  public String pay() {
    return "Your request has been processed from Freecharge end";
    
  }

}
