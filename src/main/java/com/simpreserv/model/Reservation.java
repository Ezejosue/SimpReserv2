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
@Table(name = "reservations")
public class Reservation {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "reservation_id")
  @Getter
  @Setter
  private Integer idReservation;

  @CreationTimestamp
  @Column(name = "reservation_date", nullable = false)
  @Getter
  @Setter
  private Timestamp createTime;

  @UpdateTimestamp
  @Column(name = "update_time")
  @Getter
  @Setter
  private Timestamp updateTime;

  @Getter @Setter private String checkinDate;

  @Getter @Setter private String checkoutDate;

  @Getter @Setter private Float reservationBalance;

  @Column(name = "EMPLOYEE_employee_id", nullable = false)
  @Getter
  @Setter
  private Integer employeeId;

  @Column(name = "CLIENT_client_id", nullable = false)
  @Getter
  @Setter
  private Integer clientId;

  @Column(name = "ROOM_room_id", nullable = false)
  @Getter
  @Setter
  private Integer roomId;

  @Column(name = "RESERVATION_STATUS_reservation_status_id", nullable = false)
  @Getter
  @Setter
  private Integer reservationStatus;

  public Reservation() {}

  public Reservation(
      Integer idReservation,
      Timestamp createTime,
      Timestamp updateTime,
      String checkinDate,
      String checkoutDate,
      Float reservationBalance,
      Integer employeeId,
      Integer clientId,
      Integer roomId,
      Integer reservationStatus) {
    this.idReservation = idReservation;
    this.createTime = createTime;
    this.updateTime = updateTime;
    this.checkinDate = checkinDate;
    this.checkoutDate = checkoutDate;
    this.reservationBalance = reservationBalance;
    this.employeeId = employeeId;
    this.clientId = clientId;
    this.roomId = roomId;
    this.reservationStatus = reservationStatus;
  }

  @Override
  public String toString() {
    return "Reservation{"
        + "idReservation="
        + idReservation
        + ", createTime="
        + createTime
        + ", updateTime="
        + updateTime
        + ", checkinDate="
        + checkinDate
        + ", checkoutDate="
        + checkoutDate
        + ", reservationBalance="
        + reservationBalance
        + ", employeeId="
        + employeeId
        + ", clientId="
        + clientId
        + ", roomId="
        + roomId
        + ", reservationStatus="
        + reservationStatus
        + '}';
  }
}
