Feature: Get list of users

Background: User is Logged In
  Given the reqres-in site is available as me

Scenario: Get the list of users
  When I send a GET request to "/api/users"
  Then the response status code should be 200
  And the response should contain "data"

Scenario: Get a single user by ID
  When I send a GET request to "/api/users/2"
  Then the response status code should be 200
  And the response should contain "data"
  And the response should contain "id" with value 2

Scenario: Get a user that does not exist
  When I send a GET request to "/api/users/23"
  Then the response status code should be 404
  And the response should contain "error" with value "Not Found"

Scenario: Get the list of users with pagination
  When I send a GET request to "/api/users?page=2"
  Then the response status code should be 200
  And the response should contain "data"
  And the response should contain "total_pages"

Scenario: Get the total number of users
  When I send a GET request to "/api/users"
  Then the response status code should be 200
  And the response should contain "total" with a value greater than or equal to 0

Scenario: Get users with specific attributes
  When I send a GET request to "/api/users"
  Then the response status code should be 200
  And the response should contain "data" with "first_name" and "last_name"