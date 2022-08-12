package com.simpreserv.service;

import com.simpreserv.model.NotFoundException;
import com.simpreserv.model.User;
import com.simpreserv.repository.UserRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class UserService {

  @Autowired
  private UserRepository userRepository;

  public Page<User> listAll(int pageNumber) {
    Pageable pageable = PageRequest.of(pageNumber-1, 10);
    return userRepository.findAll(pageable);
  }

  public List<User> listAllForReport() {
    return userRepository.findAll();
  }

  public List<User> listAll(String keyword) {
    if (keyword != null) {
      return userRepository.findAll(keyword);
    }
    return userRepository.findAll();
  }

  public void save(User user) {
    userRepository.save(user);
  }

  public User get(Integer id) throws NotFoundException {
    Optional<User> result = userRepository.findById(id);
    if (result.isPresent()) {
      return result.get();
    }
    throw new NotFoundException("Could not find any users with ID " + id);
  }

  public void delete(Integer userId) throws NotFoundException {
    Long count = userRepository.countByUserId(userId);
    if (count == null || count == 0) {
      throw new NotFoundException("Could not find any users with ID " + userId);
    }
    userRepository.deleteById(userId);
  }
}
