Feature: Anonymous user login
In order to access content for authenticated users
As an anonymous user
I want to be able to login
 
  Scenario: Login
    Given I am on "/user"
    When I fill in "lsolesen" for "edit-name"
    And I fill in "klan1n" for "edit-pass"
    And I press "Log in"
    Then I should see "Log ud"
