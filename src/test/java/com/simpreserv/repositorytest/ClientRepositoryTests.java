package com.simpreserv.repositorytest;

import static org.junit.jupiter.api.Assertions.*;

import com.simpreserv.model.Client;
import com.simpreserv.repository.ClientRepository;
import java.util.List;
import java.util.Optional;
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
public class ClientRepositoryTests {
  @Autowired private ClientRepository clientRepository;

  @Autowired private TestEntityManager testEntityManager;

  @Test
  public void testListAll() {
    Iterable<Client> clients = clientRepository.findAll();
    Assertions.assertThat(clients).hasSizeGreaterThan(0);
    for (Client client : clients) {
      System.out.println(client);
    }
  }

  @Test
  public void testListByKeyword() {
    String keyword = "684610930";
    List<Client> clients = clientRepository.findAll(keyword);
    Assertions.assertThat(clients).doesNotContainNull();
    for (Client client : clients) {
      System.out.println(client);
    }
  }

  @Test
  public void testAddNew() {
    Client client = new Client();
    client.setFirstName("Jose");
    client.setLastName("Barahona");
    client.setDocNumber("03201960-3");
    client.setEmail("jcbatwork@gmail.com");
    client.setEnabled(true);
    Client savedClient = clientRepository.save(client);
    Client existClient = testEntityManager.find(Client.class, savedClient.getClientId());
    Assertions.assertThat(existClient.getDocNumber()).isEqualTo(client.getDocNumber());
    Assertions.assertThat(savedClient).isNotNull();
    Assertions.assertThat(savedClient.getClientId()).isGreaterThan(0);
  }

  @Test
  public void testUpdate() {
    Integer clientId = 101;
    Optional<Client> optionalClient = clientRepository.findById(clientId);
    Client client = optionalClient.get();
    client.setLastName("Aleman");
    clientRepository.save(client);

    Client updatedClient = clientRepository.findById(clientId).get();
    Assertions.assertThat(updatedClient.getLastName()).isEqualTo("Aleman");
  }

  @Test
  public void testDelete() {
    Integer clientId = 101;
    clientRepository.deleteById(clientId);
    Optional<Client> optionalClient = clientRepository.findById(clientId);
    Assertions.assertThat(optionalClient).isNotPresent();
  }
}
