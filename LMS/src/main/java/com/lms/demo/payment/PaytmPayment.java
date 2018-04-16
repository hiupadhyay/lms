package com.lms.demo.payment;

import org.springframework.stereotype.Service;

@Service("paytmPayment")
public class PaytmPayment implements PaymentGateway {

  @Override
   public String pay() {
    
    return "Your request has been processed from Paytm end";
  }

}
