package com.simpreserv.controller;

import com.simpreserv.model.NotFoundException;
import com.simpreserv.model.User;
import com.simpreserv.service.UserService;
import com.simpreserv.util.UserEXCELExporter;
import com.simpreserv.util.UserPDFExporter;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class UserController {

  @Autowired private UserService userService;

  @GetMapping("/users")
  public String showUsersList(Model model, @Param("keyword") String keyword) {
    List<User> listUsers = userService.listAll(keyword);
    model.addAttribute("listUsers", listUsers);
    model.addAttribute("keyword", keyword);
    return "users";
  }

  @GetMapping("/users/new")
  public String showNewForm(Model model) {
    model.addAttribute("user", new User());
    model.addAttribute("pageTitle", "Add New User");
    return "user_form";
  }

  @PostMapping("/users/save")
  public String saveUser(User user, RedirectAttributes ra) {
    BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
    String encodedPassword = encoder.encode(user.getPassword());
    user.setPassword(encodedPassword);
    userService.save(user);
    ra.addFlashAttribute("message", "The user has been saved successfully!!");
    return "redirect:/users";
  }

  @GetMapping("/users/edit/{id}")
  public String showEditForm(@PathVariable("id") Integer id, Model model, RedirectAttributes ra) {
    try {
      User user = userService.get(id);
      model.addAttribute("user", user);
      model.addAttribute("pageTitle", "Edit User (ID: " + id + ")");
      ra.addFlashAttribute("message", "The user ID " + id + " has been updated");
      return "user_form";
    } catch (NotFoundException e) {
      ra.addFlashAttribute("message", e.getMessage());
      return "redirect:/users";
    }
  }

  @GetMapping("/users/delete/{id}")
  public String deleteUser(@PathVariable("id") Integer id, RedirectAttributes ra) {
    try {
      userService.delete(id);
      ra.addFlashAttribute("message", "The user ID " + id + " has been eliminated");
    } catch (NotFoundException e) {
      ra.addFlashAttribute("message", e.getMessage());
    }
    return "redirect:/users";
  }

  @GetMapping("/users/export")
  public void exportToPDF(HttpServletResponse response) throws IOException {
    response.setContentType("application/pdf");
    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
    String currentDateTime = dateFormat.format(new Date());
    String headerKey = "Content-Disposition";
    String headerValue = "attachment; filename=users_" + currentDateTime + ".pdf";

    response.setHeader(headerKey, headerValue);

    List<User> userList = userService.listAll();
    UserPDFExporter exporter = new UserPDFExporter(userList);
    exporter.export(response);
  }

  @GetMapping("/users/exportEXCEL")
  public void exportToEXCEL(HttpServletResponse response) throws IOException {
    response.setContentType("application/octet-stream");
    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
    String currentDateTime = dateFormat.format(new Date());
    String headerKey = "Content-Disposition";
    String headerValue = "attachment; filename=users_" + currentDateTime + ".xlsx";

    response.setHeader(headerKey, headerValue);
    List<User> userList = userService.listAll();
    UserEXCELExporter excelExporter = new UserEXCELExporter(userList);
    excelExporter.export(response);
  }
}
