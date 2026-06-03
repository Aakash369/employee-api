package com.employee.employeeapi.service;

import com.employee.employeeapi.model.Employee;
import com.employee.employeeapi.repository.EmployeeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class EmployeeService {

    @Autowired
    private EmployeeRepository employeeRepository;

    // CREATE
    public Employee createEmployee(Employee employee) {
        if (employee.getEmployeeId() == null || employee.getEmployeeId().isEmpty()) {
            throw new IllegalArgumentException("Employee ID cannot be empty!");
        }
        if (employee.getName() == null || employee.getName().isEmpty()) {
            throw new IllegalArgumentException("Employee name cannot be empty!");
        }
        if (employee.getAddress() == null || employee.getAddress().isEmpty()) {
            throw new IllegalArgumentException("Employee address cannot be empty!");
        }
        if (employee.getDob() == null) {
            throw new IllegalArgumentException("Employee date of birth cannot be empty!");
        }
        if (employeeRepository.existsById(employee.getEmployeeId())) {
            throw new RuntimeException("Employee with ID " + employee.getEmployeeId() + " already exists!");
        }
        return employeeRepository.save(employee);
    }

    // READ ALL
    public List<Employee> getAllEmployees() {
        return employeeRepository.findAll();
    }

    // READ ONE
    public Optional<Employee> getEmployeeById(String employeeId) {
        return employeeRepository.findById(employeeId);
    }

    // UPDATE
    public Employee updateEmployee(String employeeId, Employee updatedEmployee) {
        updatedEmployee.setEmployeeId(employeeId);
        return employeeRepository.save(updatedEmployee);
    }

    // DELETE
    public void deleteEmployee(String employeeId) {
        if (!employeeRepository.existsById(employeeId)) {
            throw new RuntimeException("Employee with ID " + employeeId + " not found!");
        }
        employeeRepository.deleteById(employeeId);
    }
}