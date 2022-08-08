package com.simpreserv.service;

import com.simpreserv.model.User;
import com.simpreserv.repository.UserRepository;
import com.simpreserv.model.UserNotFoundException;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
  @Autowired private UserRepository userRepository;

  public List<User> listAll(String keyword){
    if (keyword != null){
      return userRepository.findAll(keyword);
    }
    return userRepository.findAll();
  }

  public void save(User user) {
    userRepository.save(user);
  }

  public User get(Integer id) throws UserNotFoundException {
    Optional<User> result = userRepository.findById(id);
    if (result.isPresent()){
      return result.get();
    }
    throw new UserNotFoundException("Could not find any users with ID " + id);
  }

  public void delete(Integer userId) throws UserNotFoundException {
    Long count = userRepository.countByUserId(userId);
    if (count==null || count==0){
      throw new UserNotFoundException("Could not find any users with ID " + userId);
    }
    userRepository.deleteById(userId);
  }
}
