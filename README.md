# Employee CRUD API

Spring Boot REST API for Employee CRUD operations using MySQL, with Drools Rule Engine for eligibility checking.

## Tech Stack
- Java 17
- Spring Boot
- Spring Data JPA
- MySQL
- Maven
- Drools Rule Engine
- Bruno (API Testing)

## Project Structure
```
src/main/java/com/employee/employeeapi/
├── config/       → DroolsConfig.java     (Drools configuration)
├── controller/   → EmployeeController    (API endpoints)
├── model/        → Employee.java         (Database entity)
│                 → EligibilityResponse   (Drools response object)
├── repository/   → EmployeeRepository    (Database queries)
├── service/      → EmployeeService       (Business logic)
src/main/resources/
├── rules/        → eligibility.drl       (Drools eligibility rules)
```

## Employee Fields
- `employeeId` - String (e.g. EMP001)
- `name` - String
- `address` - String
- `dob` - Date
- `salary` - Double
- `tax` - Double
- `age` - Calculated from DOB (not stored in DB)

## Database Setup
Run the SQL script in MySQL Workbench:
```sql
SOURCE database/employee_db.sql;
```
Then update your password in `src/main/resources/application.properties`

## Run The Application
Open the project in IntelliJ and click the Run button.
API runs at: `http://localhost:8080`

## API Endpoints
| Method | URL | Description |
|--------|-----|-------------|
| GET | /api/employees | Get all employees |
| GET | /api/employees/{id} | Get employee by ID |
| POST | /api/employees | Create new employee |
| PUT | /api/employees/{id} | Update employee |
| DELETE | /api/employees/{id} | Delete employee |
| GET | /api/employees/{id}/eligibility | Check employee eligibility via Drools |

## How Drools Works in This Project

Drools is a Business Rule Management System (BRMS) that separates business rules from Java code. Instead of writing if/else conditions inside Java, the eligibility rules are defined in a `.drl` file. This means rules can be changed without modifying or redeploying the Java code.

### What is KieSession?
KIE stands for Knowledge Is Everything. A KieSession is the runtime session that acts as a bridge between Java code and the Drools rule engine. Think of it as a meeting room where Java brings the data (Employee) and Drools brings the rules (eligibility.drl), and together they produce a result (EligibilityResponse).

### How KieSession works in our project:
```
Step 1 → Java fetches Employee from MySQL database
Step 2 → Java creates an empty EligibilityResponse object
Step 3 → Both objects are inserted into KieSession as facts
Step 4 → fireAllRules() is called — Drools checks all rules against the employee age
Step 5 → The matching rule fills in the EligibilityResponse automatically
Step 6 → KieSession is disposed to free memory
Step 7 → Filled EligibilityResponse is returned as JSON
```

```java
kieSession.insert(employee);     // Hand employee data to Drools
kieSession.insert(response);     // Hand empty response to Drools
kieSession.fireAllRules();       // Drools fires the matching rule
kieSession.dispose();            // Clean up and free memory
return response;                 // Return the filled response as JSON
```

### Before and After fireAllRules():
```
Before → response = { eligible: null, status: null, reason: null }
After  → response = { eligible: true, status: "Eligible", reason: "Age 25 is within range (25-45)." }
```

## Drools Eligibility Rules
Rules are defined in `src/main/resources/rules/eligibility.drl`

| Age Range | Status | Eligible |
|-----------|--------|---------|
| Below 25 | Ineligible | ❌ |
| 25 to 45 | Eligible | ✅ |
| 45 to 55 | Considerable | ✅ |
| Above 55 | Ineligible | ❌ |

## Test Employees for Eligibility
| Employee ID | Name | DOB | Age | Expected Status |
|-------------|------|-----|-----|-----------------|
| EMP006 | Aakash Sagar | 2001-06-04 | 25 (today!) | ✅ Eligible (Boundary Case) |
| EMP009 | Young Test | 2005-01-01 | 21 | ❌ Ineligible (Too Young) |
| EMP010 | Mid Test | 1975-01-01 | 51 | ✅ Considerable (45-55) |
| EMP011 | Senior Test | 1965-01-01 | 61 | ❌ Ineligible (Too Old) |

## API Test Results

### 1. Get All Employees
- **Request:** GET /api/employees
- **Response:** 200 OK
  ![Get All Employees](images/Get-allEmployees.jpg)

### 2. Get Employee By ID
- **Request:** GET /api/employees/EMP001
- **Response:** 200 OK
  ![Get Employee By ID](images/Get-employeeByID.jpg)

### 3. Create Employee
- **Request:** POST /api/employees
- **Response:** 201 Created
  ![Create Employee](images/Post-createEmployee.jpg)

### 4. Duplicate ID Error
- **Request:** POST /api/employees (with existing ID)
- **Response:** 409 Conflict
- **Message:** `Employee with ID already exists!`
  ![Duplicate Error](images/Employee-Duplication.jpg)

### 5. Delete Non-Existing Employee
- **Request:** DELETE /api/employees/EMP999
- **Response:** 404 Not Found
- **Message:** `Employee with ID not found!`
  ![Delete Not Found](images/Delete-nonExistFeild.jpg)

### 6. Empty Employee Creation
- **Request:** POST /api/employees with empty body
- **Response:** 400 Bad Request
- **Message:** `Employee ID cannot be empty!`
  ![Empty Body Error](images/Not-Null.jpg)

### 7. Employee Eligibility Check (Drools)
- **Request:** GET /api/employees/{id}/eligibility
- **Response:** 200 OK

#### Example Response:
```json
{
  "employeeId": "EMP006",
  "name": "Aakash Sagar",
  "age": 25,
  "eligible": true,
  "status": "Eligible",
  "reason": "Age 25 is within eligible range (25-45)."
}
```

## Example JSON
```json
{
  "employeeId": "EMP001",
  "name": "Aarav Sharma",
  "address": "Sector 21, Dwarka, New Delhi",
  "dob": "1992-03-15",
  "salary": 75000.0,
  "tax": 8.0
}
```