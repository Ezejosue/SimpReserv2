package com.simpreserv.model;

public class UserNotFoundException extends Throwable {

  public UserNotFoundException(String message) {
    super(message);
  }
}
