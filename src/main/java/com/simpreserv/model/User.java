package com.simpreserv.model;

import java.sql.Timestamp;
import javax.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;


@Entity
@Table(name = "USERS")
public class User {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "user_id")
  @Getter
  @Setter
  private Integer userId;

  @CreationTimestamp
  @Column(name = "create_time", nullable = false)
  @Getter
  @Setter
  private Timestamp createTime;

  @UpdateTimestamp
  @Column(name = "update_time")
  @Getter
  @Setter
  private Timestamp updateTime;

  @Column(nullable = false, unique = true)
  @Getter
  @Setter
  private String email;

  @Column(nullable = false)
  @Getter
  @Setter
  private String password;

  @Getter
  @Setter
  private boolean enabled;

  @Column(name = "EMPLOYEES_employee_id", nullable = false)
  @Getter
  @Setter
  private Integer employeeId;

  @Column(name = "USER_TYPES_user_type_id", nullable = false)
  @Getter
  @Setter
  private Integer userTypeId;

  public User() {
  }

  public User(Integer userId, Timestamp createTime, Timestamp updateTime, String email,
      String password, boolean enabled, Integer employeeId, Integer userTypeId) {
    this.userId = userId;
    this.createTime = createTime;
    this.updateTime = updateTime;
    this.email = email;
    this.password = password;
    this.enabled = enabled;
    this.employeeId = employeeId;
    this.userTypeId = userTypeId;
  }

  @Override
  public String toString() {
    return "User{" +
        "userId=" + userId +
        ", createTime=" + createTime +
        ", updateTime=" + updateTime +
        ", email='" + email + '\'' +
        ", password='" + password + '\'' +
        ", enabled=" + enabled +
        ", employeeId=" + employeeId +
        ", userTypeId=" + userTypeId +
        '}';
  }
}
