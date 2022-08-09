package com.simpreserv.controller;

import com.simpreserv.model.User;
import com.simpreserv.repository.UserRepository;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MainController {

  @Autowired
  private UserRepository userRepository;

  @GetMapping("")
  public String viewHomePage() {
    return "index";
  }

  @GetMapping("/register")
  public String showSignUpForm(Model model) {
    model.addAttribute("user", new User());
    return "signup_form";
  }

  @PostMapping("/process_register")
  public String processRegistration(User user) {
    BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
    String encodedPassword = encoder.encode(user.getPassword());
    user.setPassword(encodedPassword);
    //user.setCreateTime(Timestamp.valueOf(LocalDateTime.now()));
    userRepository.save(user);
    return "register_success";
  }

  @GetMapping("/list_users")
  public String viewUsersList() {
    return "users";
  }

  @GetMapping("/list_employees")
  public String viewEmployeesList() {
    return "employees";
  }
}
