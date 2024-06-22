Feature: List Users

  As a user
  I want to retrieve a list of users
  So that I can verify the API response

  @listUsers
  Scenario: List Users
    When I send a GET HTTP request
    Then I receive a valid response with a list of users


  Scenario: Get List of Users
    Given I am an authorized user
    When I send a GET request to "/users"
    Then the response status code should be 200
    And the response body should contain a list of users