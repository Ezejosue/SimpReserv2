package com.simpreserv.repository;

import com.simpreserv.model.Client;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface ClientRepository extends JpaRepository<Client, Integer> {

  @Query(
      "SELECT u FROM Client u WHERE CONCAT(u.clientId, u.firstName, u.lastName, u.docNumber, u.email, u.enabled) LIKE %?1%")
  public List<Client> findAll(String keyword);

  Long countByClientId(Integer clientId);
}
