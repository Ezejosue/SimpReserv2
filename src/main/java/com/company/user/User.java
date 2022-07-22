package com.company.user;

import javax.persistence.*;
import lombok.Getter;
import lombok.Setter;


@Entity
@Table(name = "users")
public class User {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Getter @Setter
  private Integer id;

  @Column(nullable = false, unique = true, length = 45)
  @Getter @Setter
  private String email;

  @Column(length = 15, nullable = false)
  @Getter @Setter
  private String password;

  @Column(length = 15, nullable = false, name = "first_name")
  @Getter @Setter
  private String firstName;

  @Column(length = 15, nullable = false, name = "last_name")
  @Getter @Setter
  private String lastName;

  @Override
  public String toString() {
    return "User{" +
        "id=" + id +
        ", email='" + email + '\'' +
        ", password='" + password + '\'' +
        ", firstName='" + firstName + '\'' +
        ", lastName='" + lastName + '\'' +
        '}';
  }
}
