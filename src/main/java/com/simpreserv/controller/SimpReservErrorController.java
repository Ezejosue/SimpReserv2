package com.simpreserv.controller;

import javax.persistence.criteria.CriteriaBuilder.In;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

public class SimpReservErrorController implements ErrorController {

  private static final Logger LOGGER = LoggerFactory.getLogger(SimpReservErrorController.class);

  public String getErrorPath() {
    return "/error";
  }

  @GetMapping("/error")
  public String handleError(HttpServletRequest request, Model model) {
    String errorPage = "error";
    String pageTitle = "Error";
    Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
    if (status != null) {
      Integer statusCode = Integer.valueOf(status.toString());
      if (statusCode == HttpStatus.NOT_FOUND.value()) {
        pageTitle = "Page Not Found";
        errorPage = "errorPages/404";
        LOGGER.error("Error 404");
      } else if (statusCode == HttpStatus.INTERNAL_SERVER_ERROR.value()) {
        pageTitle = "Internal Server Error";
        errorPage = "errorPages/500";
        LOGGER.error("Error 500");
      } else if (statusCode == HttpStatus.FORBIDDEN.value()) {
        pageTitle = "Forbidden Error";
        errorPage = "errorPages/403";
        LOGGER.error("Error 403");
      }
    }

    model.addAttribute("pageTitle", pageTitle);
    return errorPage;
  }
}
