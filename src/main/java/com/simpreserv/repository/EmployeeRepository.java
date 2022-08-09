package com.simpreserv.repository;

import com.simpreserv.model.Employee;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface EmployeeRepository extends JpaRepository<Employee, Integer> {

  Long countByEmployeeId(Integer employeeId);

  @Query("SELECT e FROM Employee e WHERE e.carnet = ?1")
  Employee findByCarnet(String carnet);

  @Query("SELECT e FROM Employee e WHERE CONCAT(e.firstName, e.lastName, e.carnet) LIKE %?1%")
  public List<Employee> findAll(String keyword);
}
