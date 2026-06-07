package com.employee.employeeapi.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.time.LocalDate;
import java.time.Period;

@Entity
@Table(name = "employee")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Employee {

    @Id
    @Column(name = "employee_id")
    private String employeeId;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "address", nullable = false)
    private String address;

    @Column(name = "dob", nullable = false)
    private LocalDate dob;

    @Column(name = "salary", nullable = false)
    private Double salary;

    @Column(name = "tax", nullable = false)
    private Double tax;

    @Transient
    private int age;

    public int getAge() {
        if (this.dob == null) return 0;
        return Period.between(this.dob, LocalDate.now()).getYears();
    }
}