# @author-JuanTous [@Masha]
# A more declarative style hides the details of how the application’s capabilities are implemented.

Feature: Get list of users

Background: The user is logged in
  Given the reqres-in site is available as me

Scenario: The system retrieves the list of users
  When a GET request is sent to "/api/users"
  Then the system responds with status code 200
  And the response contains "data"

Scenario: The system retrieves a single user by ID
  Given a user with ID 2 exists
  When a GET request is sent to "/api/users/2"
  Then the system responds with status code 200
  And the response contains "data"
  And the response contains "id" with value 2

Scenario: The system attempts to retrieve a user that does not exist
  Given a user with ID 23 does not exist
  When a GET request is sent to "/api/users/23"
  Then the system responds with status code 404
  And the response contains "error" with value "Not Found"

Scenario: The system retrieves the list of users with pagination
  When a GET request is sent to "/api/users?page=2"
  Then the system responds with status code 200
  And the response contains "data"
  And the response contains "total_pages"

Scenario: The system retrieves the total number of users
  When a GET request is sent to "/api/users"
  Then the system responds with status code 200
  And the response contains "total" with a value greater than or equal to 0

Scenario: The system retrieves users with specific attributes
  When a GET request is sent to "/api/users"
  Then the system responds with status code 200
  And the response contains "data" with "first_name" and "last_name"