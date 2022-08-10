package com.simpreserv.controller;

import com.simpreserv.model.Client;
import com.simpreserv.model.NotFoundException;
import com.simpreserv.service.ClientService;
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
public class ClientController {

  @Autowired
  private ClientService clientService;

  @GetMapping("/clients")
  public String showClientsList(Model model, @Param("keyword") String keyword){
    List<Client> listClients = clientService.listAll(keyword);
    model.addAttribute("listClients", listClients);
    model.addAttribute("keyword", keyword);
    return "clients";
  }

  @GetMapping("/clients/new")
  public String showNewForm(Model model){
    model.addAttribute("client", new Client());
    model.addAttribute("pageTitle", "Add New Client");
    return "client_form";
  }

  @PostMapping("/clients/save")
  public String saveClient(Client client, RedirectAttributes ra){
    clientService.save(client);
    ra.addFlashAttribute("message", "The client has been saved succesfully!!");
    return "redirect:/clients";
  }

  @GetMapping("/clients/edit/{id}")
  public String showEditForm(@PathVariable("id") Integer id, Model model, RedirectAttributes ra){
    try{
      Client client = clientService.get(id);
      model.addAttribute("client", client);
      model.addAttribute("pageTitle", "Edit Client (ID: " + id + ")");
      ra.addFlashAttribute("message", "The Client ID " + id + " has been updated");
      return "client_form";
    }catch (NotFoundException e){
      ra.addFlashAttribute("message", e.getMessage());
      return "redirect:/clients";
    }
  }

  @GetMapping("/clients/delete/{id}")
  public String deleteClient(@PathVariable("id") Integer id, RedirectAttributes ra){
    try{
      clientService.delete(id);
      ra.addFlashAttribute("message", "The Client ID " + id + " has been eliminated");
    }catch(NotFoundException e){
      ra.addFlashAttribute("message", e.getMessage());
    }
    return "redirect:/clients";
  }

}
