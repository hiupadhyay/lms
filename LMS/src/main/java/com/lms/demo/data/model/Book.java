package com.lms.demo.data.model;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Book")
@Data
public class Book {
  @Id
  @Column(name = "ISBN")
  private String ISBN;
  @Column(name = "title")
  private String title;
  @Column(name = "cover")
  private String cover;
  @Column(name = "publisher")
  private String publisher;
  @Column(name = "pages")
  private int pages;
  @Column(name = "available")
  private int available;


}
