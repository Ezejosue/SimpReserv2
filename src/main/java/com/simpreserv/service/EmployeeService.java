package com.simpreserv.service;

import com.simpreserv.model.Employee;
import com.simpreserv.model.NotFoundException;
import com.simpreserv.repository.EmployeeRepository;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EmployeeService {

  @Autowired private EmployeeRepository employeeRepository;

  public List<Employee> listAll(String keyword){
    if (keyword!=null){
      return employeeRepository.findAll(keyword);
    }
    return employeeRepository.findAll();
  }

  public void save(Employee employee) {employeeRepository.save(employee);}

  public Employee get(Integer id) throws NotFoundException {
    Optional<Employee> result = employeeRepository.findById(id);
    if (result.isPresent()){
      return result.get();
    }
    throw new NotFoundException("Could not find any employees with ID " + id);
  }

  public void delete(Integer employeeId) throws NotFoundException {
    Long count = employeeRepository.countByEmployeeId(employeeId);
    if (count==null || count==0){
      throw new NotFoundException("Could not find any employees with ID " + employeeId);
    }
    employeeRepository.deleteById(employeeId);
  }

}
