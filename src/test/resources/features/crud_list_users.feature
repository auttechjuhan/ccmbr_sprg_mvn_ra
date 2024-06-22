Feature: Get list of users

  Background: User is Logged In

    Given the reqres-in site is available as me


  Scenario: Get the list of users

    When I send a GET request to reqres-in site
    Then the response status code should be 200
    And the response should contain "data"
    