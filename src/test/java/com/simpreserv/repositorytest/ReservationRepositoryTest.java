package com.simpreserv.repositorytest;

import com.simpreserv.model.Reservation;
import com.simpreserv.repository.ReservationRepository;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.test.annotation.Rollback;

@DataJpaTest
@AutoConfigureTestDatabase(replace = Replace.NONE)
@Rollback(value = false)
public class ReservationRepositoryTest {
  @Autowired private TestEntityManager testEntityManager;
  @Autowired private ReservationRepository repository;

  @Test
  public void testListAllReservation() {
    Iterable<Reservation> reservations = repository.findAll();
    Assertions.assertThat(reservations).hasSizeGreaterThan(0);
    for (Reservation reservation : reservations) {
      System.out.println(reservation);
    }
  }
}
