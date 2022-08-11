package com.simpreserv.service;

import com.simpreserv.model.Client;
import com.simpreserv.model.NotFoundException;
import com.simpreserv.repository.ClientRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ClientService {

  @Autowired private ClientRepository clientRepository;

  public List<Client> listAll(){
    return clientRepository.findAll();
  }

  public List<Client> listAll(String keyword) {
    if (keyword != null) {
      return clientRepository.findAll(keyword);
    }
    return clientRepository.findAll();
  }

  public void save(Client client) {
    clientRepository.save(client);
  }

  public Client get(Integer id) throws NotFoundException {
    Optional<Client> result = clientRepository.findById(id);
    if (result.isPresent()) {
      return result.get();
    }
    throw new NotFoundException("Could not find any clients with ID " + id);
  }

  public void delete(Integer clientId) throws NotFoundException {
    Long count = clientRepository.countByClientId(clientId);
    if (count == null || count == 0) {
      throw new NotFoundException("Could not find any clients with ID " + clientId);
    }
    clientRepository.deleteById(clientId);
  }
}
