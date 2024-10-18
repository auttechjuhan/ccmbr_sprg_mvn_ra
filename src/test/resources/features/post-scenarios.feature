# @author-JuanTous [@Masha]
# A more declarative style hides the details of how the application’s capabilities are implemented.

Feature: User Management

Background: The user is logged in
  Given Masha is logged in

### POST Create

Scenario: The system creates a new user
  Given Masha is logged in
  When Masha sends a POST request to "/api/users" with the following data:
    """
    {
      "name": "John Doe",
      "job": "Software Engineer"
    }
    """
  Then the system responds with status code 201
  And the response contains "name" with value "John Doe"
  And the response contains "job" with value "Software Engineer"
  And the response contains "id" with a value greater than 0

Scenario: The system attempts to create a new user with invalid data
  Given Masha is logged in
  When Masha sends a POST request to "/api/users" with the following data:
    """
    {
      "name": ""
    }
    """
  Then the system responds with status code 400
  And the response contains "error" with value "Name is required"

### POST Register - successful

Scenario: The system registers a new user successfully
  Given Masha is logged in
  When Masha sends a POST request to "/api/register" with the following data:
    """
    {
      "email": "johndoe@example.com",
      "password": "password123"
    }
    """
  Then the system responds with status code 200
  And the response contains "token" with a value greater than 0
  And the response contains "id" with a value greater than 0

Scenario: The system registers a new user with existing email
  Given Masha is logged in
  When Masha sends a POST request to "/api/register" with the following data:
    """
    {
      "email": "existinguser@example.com",
      "password": "password123"
    }
    """
  Then the system responds with status code 400
  And the response contains "error" with value "Email already exists"

### POST Register - unsuccessful

Scenario: The system attempts to register a new user with invalid email
  Given Masha is logged in
  When Masha sends a POST request to "/api/register" with the following data:
    """
    {
      "email": "invalidemail",
      "password": "password123"
    }
    """
  Then the system responds with status code 400
  And the response contains "error" with value "Invalid email"

Scenario: The system attempts to register a new user with weak password
  Given Masha is logged in
  When Masha sends a POST request to "/api/register" with the following data:
    """
    {
      "email": "johndoe@example.com",
      "password": "weak"
    }
    """
  Then the system responds with status code 400
  And the response contains "error" with value "Password is too weak"

### POST Login - successful

Scenario: The system logs in an existing user successfully
  Given Masha is logged in
  When Masha sends a POST request to "/api/login" with the following data:
    """
    {
      "email": "existinguser@example.com",
      "password": "password123"
    }
    """
  Then the system responds with status code 200
  And the response contains "token" with a value greater than 0
  And the response contains "id" with a value greater than 0

Scenario: The system logs in an existing user with incorrect password
  Given Masha is logged in
  When Masha sends a POST request to "/api/login" with the following data:
    """
    {
      "email": "existinguser@example.com",
      "password": "wrongpassword"
    }
    """
  Then the system responds with status code 401
  And the response contains "error" with value "Invalid password"

### POST Login - unsuccessful

Scenario: The system attempts to log in a non-existent user
  Given Masha is logged in
  When Masha sends a POST request to "/api/login" with the following data:
    """
    {
      "email": "nonexistentuser@example.com",
      "password": "password123"
    }
    """
  Then the system responds with status code 401
  And the response contains "error" with value "User  not found"

Scenario: The system attempts to log in with invalid email
    Given Masha is logged in
    When Masha sends a POST request to "/api/login" with the following data:
      """
      {
        "email": "invalidemail",
        "password": "password123"
      }
      """
    Then the system responds with status code 400
    And the response contains "error" with value "Invalid email"