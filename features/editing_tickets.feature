Feature: Editing Tickets
  In order to edit a ticket
  As a user
  I want to be able to use a form

  Background:
    Given there is a project called "TextMate 2"
    And that project has a ticket:
      | title          | description                   |
      | Make it shiny! | Gradients! Starbursts! Oh my! |
    And I am on the homepage
    And I follow "TextMate 2"
    And I follow "Make it shiny!"
    When I follow "Edit Ticket"

  Scenario: Updating a ticket
    When I fill in "Title" with "Make it really shiny!"
    And I press "Update Ticket"
    Then I should see "Ticket has been updated."
    And I should see "Make it really shiny!"
    But I should not see "Make it shiny!"

  Scenario: Updating a ticket with invalid information
    When I fill in "Title" with ""
    And I press "Update Ticket"
    Then I should see "Ticket has not been updated."

