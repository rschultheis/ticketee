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
