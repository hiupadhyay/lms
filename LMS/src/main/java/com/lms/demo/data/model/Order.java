package com.lms.demo.data.model;

import java.io.Serializable;
import java.sql.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.transaction.Transactional;

import lombok.Data;
import org.hibernate.annotations.GenericGenerator;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

@Entity
@Table(name = "order_details")
@Data
public class Order implements Serializable {

  /**
   * 
   */
  private static final long serialVersionUID = 1L;

  @Id @GeneratedValue(generator="system-uuid")
  @GenericGenerator(name="system-uuid", strategy = "uuid")
  @Column(name = "booking_id")
  private String booking_id;
  
  
  @Column(name = "ISBN")
  private String ISBN;
  
  @Column(name = "booking_date")
  private Date booking_date;

  @Column(name = "quantity")
  private int quantity;



 

}
