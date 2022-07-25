package com.company.user;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class UserController {
  @Autowired private UserService service;

  @GetMapping("/users")
  public String showUsersList(Model model){
    List<User> listUsers = service.listAll();
    model.addAttribute("listUsers", listUsers);
    return "users";
  }

  @GetMapping("/users/new")
  public String showNewForm(Model model){
    model.addAttribute("user", new User());
    return "user_form";
  }

  @PostMapping("/users/save")
  public String saveUser(User user, RedirectAttributes ra){
    service.save(user);
    ra.addFlashAttribute("message","The user been saved successfully!!");
    return "redirect:/users";
  }
}
