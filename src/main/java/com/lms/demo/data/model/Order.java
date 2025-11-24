package com.lms.demo.data.model;

import com.fasterxml.jackson.annotation.JsonProperty;
import java.io.Serializable;
import java.sql.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.Data;
import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "order_details")
@Data
public class Order implements Serializable {

  /**
   * 
   */
  private static final long serialVersionUID = 1L;

  @Id
  @GeneratedValue(generator = "system-uuid")
  @GenericGenerator(name = "system-uuid", strategy = "uuid")
  @Column(name = "booking_id")
  @JsonProperty("bookingId")
  private String bookingId;

  @Column(name = "ISBN")
  @JsonProperty("isbn")
  private String isbn;

  @Column(name = "booking_date")
  @JsonProperty("bookingDate")
  private Date bookingDate;

  @Column(name = "quantity")
  @JsonProperty("quantity")
  private int quantity;
}
