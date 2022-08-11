package com.simpreserv.controllertest;

import com.simpreserv.controller.UserController;
import com.simpreserv.model.User;
import com.simpreserv.repository.UserRepository;
import com.simpreserv.service.UserService;
import java.util.ArrayList;
import java.util.List;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;

@WebMvcTest(UserController.class)
public class UserControllerTests {

  @MockBean private UserService userService;
  @MockBean private UserRepository repo;

  @Test
  public void testListAll() {
    List<User> userList = new ArrayList<>();
    userList.add(new User(1, null, null, "a", "123", false, 1, 1));
    userList.add(new User(2, null, null, "acf", "123", true, 1, 1));
    userList.add(new User(3, null, null, "adeee", "123", false, 1, 1));
    Mockito.when(userService.listAll("a")).thenReturn(userList);
    System.out.println("OKAY");
  }
}
