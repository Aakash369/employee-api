# Employee CRUD API

Spring Boot REST API for Employee CRUD operations using MySQL.

## Tech Stack
- Java 17
- Spring Boot
- Spring Data JPA
- MySQL
- Maven
- Bruno (API Testing)

## Employee Fields
- `employeeId` - String (e.g. EMP001)
- `name` - String
- `address` - String
- `dob` - Date
- `salary` - Double
- `tax` - Double

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

## Example JSON
```json
{
  "employeeId": "EMP001",
  "name": "Alice Johnson",
  "address": "123 Main St, Dallas, TX",
  "dob": "1990-04-15",
  "salary": 75000.0,
  "tax": 8.0
}
```