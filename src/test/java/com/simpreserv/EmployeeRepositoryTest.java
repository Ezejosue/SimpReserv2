package com.simpreserv;

import com.simpreserv.model.Employee;
import com.simpreserv.repository.EmployeeRepository;
import java.util.Optional;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.test.annotation.Rollback;

@DataJpaTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
@Rollback(false)
public class EmployeeRepositoryTest {

  @Autowired
  private EmployeeRepository repo;
  @Autowired
  private TestEntityManager entityManager;

  @Test
  public void testAddNew() {
    Employee employee = new Employee();
    employee.setFirstName("Gabriela");
    employee.setLastName("Alas");
    employee.setCarnet("GP200123");
    employee.setPositionId(1);
    employee.setShiftId(1);
    Employee savedEmployee = repo.save(employee);
    Employee existEmployee = entityManager.find(Employee.class, savedEmployee.getEmployeeId());
    Assertions.assertThat(existEmployee.getCarnet()).isEqualTo(employee.getCarnet());
    Assertions.assertThat(savedEmployee).isNotNull();
    Assertions.assertThat(savedEmployee.getEmployeeId()).isGreaterThan(0);


  }

  @Test
  public void testListAll() {
    Iterable<Employee> employees = repo.findAll();
    Assertions.assertThat(employees).hasSizeGreaterThan(0);
    for (Employee employee : employees) {
      System.out.println(employee);
    }
  }

  @Test
  public void testUpdate(){
    Integer employeeId = 2;
    Optional<Employee> optionalEmployee = repo.findById(employeeId);
    Employee employee = optionalEmployee.get();
    employee.setPositionId(2);
    repo.save(employee);

    Employee updatedEmployee = repo.findById(employeeId).get();
    Assertions.assertThat(updatedEmployee.getPositionId()).isEqualTo(2);
  }

  @Test
  public void testGet(){
    Integer employeeId = 2;
    Optional<Employee> optionalEmployee = repo.findById(employeeId);
    Assertions.assertThat(optionalEmployee).isPresent();
    System.out.println(optionalEmployee.get());
  }

  @Test
  public void testDelete(){
    Integer employeeId = 2;
    repo.deleteById(employeeId);
    Optional<Employee> optionalEmployee = repo.findById(employeeId);
    Assertions.assertThat(optionalEmployee).isNotPresent();
  }

  @Test
  public void testFindByCarnet(){
    String carnet = "GP200123";
    Employee employee = repo.findByCarnet(carnet);
    Assertions.assertThat(employee).isNotNull();
  }
}
