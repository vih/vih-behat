Feature: Anonymous user can buy a course
In order to sell a course online
As an anonymous user
I want to be able to buy a course

  @api
  Scenario: An adminitrator can create a course
    Given I am logged in as a user with the "administrator" role
    When I am on "node/add/short_course_basic"
      And I fill in the following:
        | Title | Test course |
        | Body | This is a test course. |
      And I press "Save"
    Then I should see the text "Short Course Basic Test course has been created."

  Scenario: See a list with the courses
    Given I am on "/kortekurser"
    Then I should see "Korte kurser"

  Scenario: When viewing a course the prices are readily available for all room types
    Given I am on "/kortekurser"
    When I follow "Voksenkursus"
    Then I should see "Enkeltværelse - hvor to enkeltværelser deler bad og toilet i fælles forgang (2 000,00 kr.)"
      And "Dobbeltværelse - to indkvarteres på dobbeltværelse med bad og toilet (3 000,00 kr.)"

  Scenario: Buy a golf short course and pay online
    Given I am on "/kortekurser"
    When I follow "Golfkursus"
      And I fill in the following: 
        | Navn              | Svend Aage Thomsen |
        | CPR-nummer        | 101010-1942        |
        | Golf handicap     | 20                 |
        | Klub              | Vejle Golfklub     |
        | DGU-medlemsnummer | 10                 |
        | Sambo             | Vennerne           |
      And I press "Tilmeld"
    Then I should see "Du har allerede tilføjet nogen til tilmeldingen."
    When I follow "gå til betaling"
      And I fill in the following:
        | Fulde navn     | Svend Aage Thomsen |
        | Land           | DK                 |
        | Adresselinje 1 | Ørnebjergvej 28    |
        | Postnummer     | 7100               |
        | By             | Vejle              |
        | Telefon        | 75820811           |
      And I press "Fortsæt til næste trin"
    Then I should see "Gennemgå ordre"
    When I press "Fortsæt til næste trin"
    Then I should see the text "Vent venligst mens du bliver omdirigeret til betalingsserveren."

  Scenario: Buy a basic short course and pay online
    Given I am on "/kortekurser"
    When I follow "Voksenkursus"
      And I fill in the following: 
        | Navn       | Svend Aage Thomsen |
        | CPR-nummer | 101010-1942        |
      And I press "Tilmeld"
    Then I should see "Du har allerede tilføjet nogen til tilmeldingen."
    When I follow "gå til betaling"
      And I fill in the following:
        | Fulde navn     | Svend Aage Thomsen |
        | Land           | DK                 |
        | Adresselinje 1 | Ørnebjergvej 28    |
        | Postnummer     | 7100               |
        | By             | Vejle              |
        | Telefon        | 75820811           |
      And I press "Fortsæt til næste trin"
    Then I should see "Gennemgå ordre"
    When I press "Fortsæt til næste trin"
    Then I should see "Betaling"

  Scenario: Buy a kayak course without renting a kayak and pay online
    Given I am on "/kortekurser"
    When I follow "Kajakkursus"
      Then I should see "Vil du leje en kajak?"
    When I fill in the following:
        | Navn       | Svend Aage Thomsen |
        | CPR-nummer | 101010-1942        |
        | Sambo      | Knud Lundberg      |
      And I press "Tilmeld"
    Then I should see "Du har allerede tilføjet nogen til tilmeldingen."
    When I follow "gå til betaling"
      And I fill in the following:
        | Fulde navn     | Svend Aage Thomsen |
        | Land           | DK                 |
        | Adresselinje 1 | Ørnebjergvej 28    |
        | Postnummer     | 7100               |
        | By             | Vejle              |
        | Telefon        | 75820811           |
      And I press "Fortsæt til næste trin"
    Then I should see "Gennemgå ordre"
    When I press "Fortsæt til næste trin"
    Then I should see "Betaling"

  Scenario: Buy a family course and pay online
    Given I am on "/kortekurser"
    When I follow "Familiekursus"
      And I fill in the following: 
        | Navn       | Svend Aage Thomsen |
        | CPR-nummer | 101010-1942        |
      And I press "Tilmeld"
    Then I should see "Du har allerede tilføjet nogen til tilmeldingen."
    When I follow "gå til betaling"
      And I fill in the following:
        | Fulde navn     | Svend Aage Thomsen |
        | Land           | DK                 |
        | Adresselinje 1 | Ørnebjergvej 28    |
        | Postnummer     | 7100               |
        | By             | Vejle              |
        | Telefon        | 75820811           |
      And I press "Fortsæt til næste trin"
    Then I should see "Gennemgå ordre"
    When I press "Fortsæt til næste trin"
    Then I should see "Betaling"

  Scenario: When a course registration has already started
    Given I am on "/kortekurser"
    Then I should see "Du er allerede i gang med en tilmelding."
      And I should see "Du er ved at tilmelde dig dette kursus"

  Scenario: When no future courses are present the user should see a notice
    Given I am on "/korte kurser"
      And no short courses has been created
    Then I should see "Der er i øjeblikket ingen aktuelle kurser"
      And "Tilmeld dig vores nyhedsbrev"

