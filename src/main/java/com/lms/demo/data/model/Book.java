package com.lms.demo.data.model;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;

@Entity
@Table(name = "book")
@Data
public class Book {
  @Id
  @Column(name = "isbn")
  @NotBlank
  @JsonProperty("isbn")
  private String isbn;

  @Column(name = "title")
  @NotBlank
  @JsonProperty("title")
  private String title;

  @Column(name = "cover")
  @JsonProperty("cover")
  private String cover;

  @Column(name = "publisher")
  @JsonProperty("publisher")
  private String publisher;

  @Column(name = "pages")
  @Min(1)
  @JsonProperty("pages")
  private int pages;

  @Column(name = "available")
  @Min(0)
  @JsonProperty("available")
  private int available;


}
