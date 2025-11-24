package com.lms.demo.data.model;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "book")
@Data
public class Book {
  @Id
  @Column(name = "isbn")
  @JsonProperty("isbn")
  private String isbn;

  @Column(name = "title")
  @JsonProperty("title")
  private String title;

  @Column(name = "cover")
  @JsonProperty("cover")
  private String cover;

  @Column(name = "publisher")
  @JsonProperty("publisher")
  private String publisher;

  @Column(name = "pages")
  @JsonProperty("pages")
  private int pages;

  @Column(name = "available")
  @JsonProperty("available")
  private int available;


}
