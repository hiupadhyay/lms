package com.lms.demo.data.model;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

@Entity
@Table(name = "user")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User implements Serializable {

    @Id
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    @Column(name = "id")
    private String id;
    @Column(name = "name")
    @JsonProperty("name")
    private String name;
    @Column(name = "dob")
    @JsonProperty("dob")
    private String dob;
    @Column(name = "address")
    @JsonProperty("email")
    private String email;
    @Column(name = "password")
    @JsonProperty("password")
    private String password;
}
