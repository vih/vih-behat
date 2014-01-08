Feature: Anonymous user should be able to decide interest area
In order to capture the interest of people signing up
As an course administrator
I want to be able create a checklist with different options the user can choose from

  Scenario: When viewing a course, a checkbox with interests is shown
    Given I am on "/kortekurser"
    When I follow "Kajakkursus"
    Then I should see radio buttons with "Interested in EPP2 course"
      And radiobuttons with "Interested in kayak trip"
  
  @api
  Scenario: Be able to add different options for each course
    Given I am logged in as a user with the "administrator" role
    When I edit "Kajakkursus"
    Then I should see "Interesser"
      And be able to add different options for the interest field as the anonymous user should be able to choose between when going to the add to cart form
    When I edit "Kajakkursus"
    Then I should see "Interesser"
      And be able to add different options for the interest field as the anonymous user should be able to choose between when going to the add to cart form
