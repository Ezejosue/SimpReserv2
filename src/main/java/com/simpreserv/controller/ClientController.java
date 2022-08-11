package com.simpreserv.controller;

import com.simpreserv.model.Client;
import com.simpreserv.model.NotFoundException;
import com.simpreserv.model.User;
import com.simpreserv.service.ClientService;
import com.simpreserv.util.ClientEXCELExporter;
import com.simpreserv.util.ClientPDFExporter;
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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class ClientController {

  @Autowired private ClientService clientService;

  @GetMapping("/clients")
  public String showClientsList(Model model, @Param("keyword") String keyword) {
    List<Client> listClients = clientService.listAll(keyword);
    model.addAttribute("listClients", listClients);
    model.addAttribute("keyword", keyword);
    return "clients";
  }

  @GetMapping("/clients/new")
  public String showNewForm(Model model) {
    model.addAttribute("client", new Client());
    model.addAttribute("pageTitle", "Add New Client");
    return "client_form";
  }

  @PostMapping("/clients/save")
  public String saveClient(Client client, RedirectAttributes ra) {
    clientService.save(client);
    ra.addFlashAttribute("message", "The client has been saved succesfully!!");
    return "redirect:/clients";
  }

  @GetMapping("/clients/edit/{id}")
  public String showEditForm(@PathVariable("id") Integer id, Model model, RedirectAttributes ra) {
    try {
      Client client = clientService.get(id);
      model.addAttribute("client", client);
      model.addAttribute("pageTitle", "Edit Client (ID: " + id + ")");
      ra.addFlashAttribute("message", "The Client ID " + id + " has been updated");
      return "client_form";
    } catch (NotFoundException e) {
      ra.addFlashAttribute("message", e.getMessage());
      return "redirect:/clients";
    }
  }

  @GetMapping("/clients/delete/{id}")
  public String deleteClient(@PathVariable("id") Integer id, RedirectAttributes ra) {
    try {
      clientService.delete(id);
      ra.addFlashAttribute("message", "The Client ID " + id + " has been eliminated");
    } catch (NotFoundException e) {
      ra.addFlashAttribute("message", e.getMessage());
    }
    return "redirect:/clients";
  }

  @GetMapping("/clients/export")
  public void exportToPDF(HttpServletResponse response) throws IOException {
    response.setContentType("application/pdf");
    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
    String currentDateTime = dateFormat.format(new Date());
    String headerKey = "Content-Disposition";
    String headerValue = "attachment; filename=clients_" + currentDateTime + ".pdf";

    response.setHeader(headerKey, headerValue);

    List<Client> clientList = clientService.listAll();
    ClientPDFExporter exporter = new ClientPDFExporter(clientList);
    exporter.export(response);
  }

  @GetMapping("/clients/exportEXCEL")
  public void exportToEXCEL(HttpServletResponse response) throws IOException {
    response.setContentType("application/octet-stream");
    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
    String currentDateTime = dateFormat.format(new Date());
    String headerKey = "Content-Disposition";
    String headerValue = "attachment; filename=clients_" + currentDateTime + ".xlsx";

    response.setHeader(headerKey, headerValue);
    List<Client> clientList = clientService.listAll();
    ClientEXCELExporter excelExporter = new ClientEXCELExporter(clientList);
    excelExporter.export(response);
  }
}
