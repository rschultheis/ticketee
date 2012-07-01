Feature: Hidden Links
  In order to clean up the user experience
  As a system
  Links for actions should be hidden is user does not have permission for them

  Background:
    Given there are the following users:
      | email              | password | admin |
      | user@ticketee.com  | password | false |
      | admin@ticketee.com | password | true  |
    And there is a project called "TextMate 2"
    And user "user@ticketee.com" has created a ticket for this project:
      | title  | description       |
      | Shiny! | My eyes! My eyes! |
    And "user@ticketee.com" can view the "TextMate 2" project

  Scenario: New Project link hidden for non-signed in user
    Given I am on the homepage
    Then I should not see the "New Project" link

  Scenario: New Project link hidden for non-admins
    Given I am signed in as "user@ticketee.com"
    Then I should not see the "New Project" link

  Scenario: New Project link shown to admins
    Given I am signed in as "admin@ticketee.com"
    Then I should see the "New Project" link


  Scenario: Edit Project link hidden for non-admins
    Given I am signed in as "user@ticketee.com"
    When I follow "TextMate 2"
    Then I should not see the "Edit Project" link

  Scenario: Edit Project link shown to admins
    Given I am signed in as "admin@ticketee.com"
    When I follow "TextMate 2"
    Then I should see the "Edit Project" link


  Scenario: Delete Project link hidden for non-admins
    Given I am signed in as "user@ticketee.com"
    When I follow "TextMate 2"
    Then I should not see the "Delete Project" link

  Scenario: Delete Project link shown to admins
    Given I am signed in as "admin@ticketee.com"
    When I follow "TextMate 2"
    Then I should see the "Delete Project" link

  Scenario: New ticket link is shown to a user with permission
    Given "user@ticketee.com" can view the "TextMate 2" project
    And "user@ticketee.com" can create tickets on the "TextMate 2" project
    And I am signed in as "user@ticketee.com"
    When I follow "TextMate 2"
    Then I should see "New Ticket"

  Scenario: New ticket link is hidden from a user without permission
    Given "user@ticketee.com" can view the "TextMate 2" project
    And I am signed in as "user@ticketee.com"
    When I follow "TextMate 2"
    Then I should not see the "New Ticket" link

  Scenario: New ticket link is shown to admins
    Given I am signed in as "admin@ticketee.com"
    When I follow "TextMate 2"
    Then I should see the "New Ticket" link

  Scenario: Edit ticket link is shown to a user with permission
    Given "user@ticketee.com" can view the "TextMate 2" project
    And "user@ticketee.com" can edit tickets on the "TextMate 2" project
    And I am signed in as "user@ticketee.com"
    When I follow "TextMate 2"
    And I follow "Shiny!"
    Then I should see the "Edit" link

  Scenario: Edit ticket link is hidden from a user without permission
    Given "user@ticketee.com" can view the "TextMate 2" project
    And I am signed in as "user@ticketee.com"
    When I follow "TextMate 2"
    And I follow "Shiny!"
    Then I should not see the "Edit" link

  Scenario: Edit ticket link is shown to admins
    Given I am signed in as "admin@ticketee.com"
    When I follow "TextMate 2"
    And I follow "Shiny!"
    Then I should see the "Edit" link

  Scenario: Delete ticket link is shown to a user with permission
    Given "user@ticketee.com" can view the "TextMate 2" project
    And "user@ticketee.com" can delete tickets in the "TextMate 2" project
    And I am signed in as "user@ticketee.com"
    When I follow "TextMate 2"
    And I follow "Shiny!"
    Then I should see "Delete"

  Scenario: Delete ticket link is hidden from a user without permission
    Given "user@ticketee.com" can view the "TextMate 2" project
    And I am signed in as "user@ticketee.com"
    When I follow "TextMate 2"
    And I follow "Shiny!"
    Then I should not see the "Delete" link

  Scenario: Delete ticket link is shown to admins
    Given I am signed in as "admin@ticketee.com"
    When I follow "TextMate 2"
    And I follow "Shiny!"
    Then I should see the "Delete" link