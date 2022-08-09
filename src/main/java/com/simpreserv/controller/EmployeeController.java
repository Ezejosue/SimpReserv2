package com.simpreserv.controller;

import com.simpreserv.model.Employee;
import com.simpreserv.model.NotFoundException;
import com.simpreserv.service.EmployeeService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class EmployeeController {

  @Autowired
  private EmployeeService employeeService;

  @GetMapping("/employees")
  public String showEmployeesList(Model model, @Param("keyword") String keyword){
    List<Employee> listEmployees = employeeService.listAll(keyword);
    model.addAttribute("listEmployees", listEmployees);
    model.addAttribute("keyword", keyword);
    return "employees";
  }

  @GetMapping("/employees/new")
  public String showNewForm(Model model){
    model.addAttribute("employee", new Employee());
    model.addAttribute("pageTitle", "Add New Employee");
    return "employee_form";
  }

  @PostMapping("/employees/save")
  public String saveEmployee(Employee employee, RedirectAttributes ra){
    employeeService.save(employee);
    ra.addFlashAttribute("message","The employee has been saved successfully!!");
    return "redirect:/employees";
  }

  @GetMapping("/employee/edit/{id}")
  public String showEditForm(@PathVariable("id") Integer id, Model model, RedirectAttributes ra){
    try {
      Employee employee = employeeService.get(id);
      model.addAttribute("employee", employee);
      model.addAttribute("pageTitle", "Edit Employee (ID: "+ id +")");
      ra.addFlashAttribute("message","The Employee ID " + id + " has been updated");
      return "employee_form";
    } catch (NotFoundException e) {
      ra.addFlashAttribute("message",e.getMessage());
      return "redirect:/employee";
    }
  }

  @GetMapping("/employee/delete/{id}")
  public String deleteEmployee(@PathVariable("id") Integer id, RedirectAttributes ra){
    try {
      employeeService.delete(id);
      ra.addFlashAttribute("message","The Employee ID " + id + " has been eliminated");
    } catch (NotFoundException e) {
      ra.addFlashAttribute("message",e.getMessage());
    }
    return "redirect:/employees";
  }
}
