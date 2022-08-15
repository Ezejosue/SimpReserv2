package com.simpreserv.controllertest;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import com.simpreserv.controller.UserController;
import com.simpreserv.model.User;
import com.simpreserv.service.UserService;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

@WebMvcTest(UserController.class)
public class UserControllerTests {

  @Autowired private MockMvc mockMvc;
  @MockBean private UserService userService;

  @Test
  public void testExportExcel() throws Exception {
    //List<User> userList = new ArrayList<>();
    //userList.add(new User(1, null, null, "a", "123", false, 1, 1));
    //userList.add(new User(2, null, null, "acf", "123", true, 1, 1));
    //userList.add(new User(3, null, null, "adeee", "123", false, 1, 1));
    //Mockito.when(userService.listAll()).thenReturn(userList);
    //String url = "/users/exportEXCEL";
    //MvcResult mvcResult =
    //    mockMvc.perform(MockMvcRequestBuilders.get(url)).andExpect(status().isOk()).andReturn();
    //byte[] bytes = mvcResult.getResponse().getContentAsByteArray();
    //Path path = Paths.get("users.xlsx");
    //Files.write(path, bytes);
  }
}
