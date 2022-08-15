package com.simpreserv.repository;

import com.simpreserv.model.Reservation;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface ReservationRepository extends JpaRepository<Reservation, Integer> {

  @Query("SELECT r FROM Reservation r WHERE CONCAT(r.employeeId,r.reservationBalance,r.idReservation) LIKE %?1%")
  public List<Reservation> findAll(String keyword);
  Long countByIdReservation(Integer idReservation);
}
