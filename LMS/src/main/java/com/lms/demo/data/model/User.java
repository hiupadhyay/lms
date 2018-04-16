package com.lms.demo.data.model;

public class User {

  private String id;
  private String name;
  private String dob;
  private String address;

  public User(String id, String name, String dob, String addres) {
    super();
    this.id = id;
    this.name = name;
    this.dob = dob;
    this.address = addres;
  }

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getDob() {
    return dob;
  }

  public void setDob(String dob) {
    this.dob = dob;
  }

  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }

}
