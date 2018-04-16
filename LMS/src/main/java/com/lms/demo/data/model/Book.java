package com.lms.demo.data.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Book")
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

  @Override
  public String toString() {
    return "Book [ISBN=" + ISBN + ", title=" + title + ", cover=" + cover + ", publisher="
        + publisher + ", pages=" + pages + ", available=" + available + "]";
  }

  public Book(String iSBN, String title, String cover, String publisher, int pages, int available) {
    super();
    ISBN = iSBN;
    this.title = title;
    this.cover = cover;
    this.publisher = publisher;
    this.pages = pages;
    this.available = available;
  }

  public String getISBN() {
    return ISBN;
  }

  public void setISBN(String iSBN) {
    ISBN = iSBN;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getCover() {
    return cover;
  }

  public void setCover(String cover) {
    this.cover = cover;
  }

  public String getPublisher() {
    return publisher;
  }

  public void setPublisher(String publisher) {
    this.publisher = publisher;
  }

  public int getPages() {
    return pages;
  }

  public void setPages(int pages) {
    this.pages = pages;
  }

  public int getAvailable() {
    return available;
  }

  public void setAvailable(int available) {
    this.available = available;
  }

  public Book() {
    super();
  }

}
