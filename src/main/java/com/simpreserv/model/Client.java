package com.simpreserv.model;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
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

@ApiModel(description = "Clients' entity information and details.")
@Entity
@Table(name = "CLIENTS")
public class Client {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "client_id")
  @Getter
  @Setter
  private Integer clientId;

  @ApiModelProperty(notes = "Should take the date only on inserts.")
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

  @Column(name = "first_name")
  @Getter
  @Setter
  private String firstName;

  @Column(name = "last_name")
  @Getter
  @Setter
  private String lastName;

  @Column(name = "doc_number")
  @Getter
  @Setter
  private String docNumber;

  @Getter @Setter private String email;

  @Getter @Setter private boolean enabled;

  @Override
  public String toString() {
    return "Clients{"
        + "clientId="
        + clientId
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
        + ", docNumber='"
        + docNumber
        + '\''
        + ", email='"
        + email
        + '\''
        + ", enabled="
        + enabled
        + '}';
  }
}
