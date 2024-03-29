Feature: Deleting Tickets
  In order to delete a ticket
  As a user
  I want to be able to click a delete link

  Background:
    Given there are the following users:
      | email             | password |
      | user@ticketee.com | password |
    And I am signed in as them
    And there is a project called "TextMate 2"
    And "user@ticketee.com" can view the "TextMate 2" project
    And "user@ticketee.com" can delete tickets in the "TextMate 2" project
    And user "user@ticketee.com" has created a ticket for this project:
      | title          | description                   |
      | Make it shiny! | Gradients! Starbursts! Oh my! |
    And I am on the homepage
    And I follow "TextMate 2"
    And I follow "Make it shiny!"

  Scenario: Deleting a ticket
    When I follow "Delete Ticket"
    Then I should see "Ticket has been deleted."
    And I should be on the project page for "TextMate 2"
