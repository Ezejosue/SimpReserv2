package com.simpreserv.service;

import com.simpreserv.model.NotFoundException;
import com.simpreserv.model.Reservation;
import com.simpreserv.repository.ReservationRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReservationService {

  @Autowired private ReservationRepository repository;

  public List<Reservation> listAll() {
    return repository.findAll();
  }

  public List<Reservation> listAll(String keyword) {
    if (keyword != null) {
      return repository.findAll(keyword);
    }
    return repository.findAll();
  }

  public void save(Reservation reservation) {
    repository.save(reservation);
  }

  public Reservation get(Integer id) throws NotFoundException {
    Optional<Reservation> reservation = repository.findById(id);
    if (reservation.isPresent()) {
      return reservation.get();
    }
    throw new NotFoundException("Could not find any reservations with ID " + id);
  }

  public void delete(Integer reservationId) throws NotFoundException {
    Long count = repository.countByIdReservation(reservationId);
    if (count == null || count == 0) {
      throw new NotFoundException("Could not find any reservations with ID" + reservationId);
    }
    repository.deleteById(reservationId);
  }
}
