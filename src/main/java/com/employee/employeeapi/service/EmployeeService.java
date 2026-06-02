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
        employeeRepository.deleteById(employeeId);
    }
}