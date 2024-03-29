Feature: Deleting Projects
  In order to remove a project
  As a user
  I should be able to click delete

  Background:
    Given there are the following users:
      | email              | password | admin |
      | admin@ticketee.com | password | true  |
    And I am signed in as them

  Scenario: Deleting a project
    Given there is a project called "TextMate 2"
    And I am on the homepage
    When I follow "TextMate 2"
    When I follow "Delete Project"

    Then I should see "Project has been deleted."
    And I should not see "TextMate 2"
