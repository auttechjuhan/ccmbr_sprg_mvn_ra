Feature: User API
  As a user
  I want to be able to retrieve and manipulate users
  So that I can manage users

Background:
  Given I am an authorized user
    """
    {
      "userName": "juansitoMED",
      "password": "Test@@123"
    }
    """
  When I send a POST request to "/Account/v1/GenerateToken"
  Then the response status code should be 200
  And I store the token in the "token" variable

Scenario: Retrieve all users
  When I send a GET request to "/users"
  Then the response status code should be 200
  And the response body should contain a list of users