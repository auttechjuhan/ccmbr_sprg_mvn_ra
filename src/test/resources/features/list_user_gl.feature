Feature: User API
    As a user
    I want to be able to retrieve and manipulate users
    So that I can manage users

    Scenario: Retrieve all users
        Given I have a list of users
        When I send a GET request to retrieve all users
        Then I should receive a list of users

    Scenario: Create a new user
        When I send a POST request to create a new user
        Then I should receive a created user response