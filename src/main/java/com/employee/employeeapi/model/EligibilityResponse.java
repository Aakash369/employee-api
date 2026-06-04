package com.employee.employeeapi.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class EligibilityResponse {

    private String employeeId;
    private String name;
    private int age;
    private boolean eligible;
    private String status;
    private String reason;
}