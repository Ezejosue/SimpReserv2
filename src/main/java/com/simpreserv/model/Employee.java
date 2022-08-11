package com.simpreserv.model;

import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

@Entity
@Table(name = "EMPLOYEES")
public class Employee {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "employee_id")
  @Getter
  @Setter
  private Integer employeeId;

  @CreationTimestamp
  @Column(name = "create_time", updatable = false)
  @Getter
  @Setter
  private Timestamp createTime;

  @UpdateTimestamp
  @Column(name = "update_time")
  @Getter
  @Setter
  private Timestamp updateTime;

  @Column(name = "first_name", nullable = false)
  @Getter
  @Setter
  private String firstName;

  @Column(name = "last_name", nullable = false)
  @Getter
  @Setter
  private String lastName;

  @Column(unique = true, nullable = false)
  @Getter
  @Setter
  private String carnet;

  @Setter @Getter private boolean enabled;

  @Column(name = "POSITIONS_position_id", nullable = false)
  @Setter
  @Getter
  private Integer positionId;

  @Column(name = "SHIFTS_shift_id", nullable = false)
  @Setter
  @Getter
  private Integer shiftId;

  @Override
  public String toString() {
    return "Employee{"
        + "employeeId="
        + employeeId
        + ", createTime="
        + createTime
        + ", updateTime="
        + updateTime
        + ", firstName='"
        + firstName
        + '\''
        + ", lastName='"
        + lastName
        + '\''
        + ", carnet='"
        + carnet
        + '\''
        + ", enabled="
        + enabled
        + ", positionId="
        + positionId
        + ", shiftId="
        + shiftId
        + '}';
  }
}
