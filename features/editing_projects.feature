Feature: Editing Projects
  In order to update project information
  As a user
  I should be able to use a form to change project details

  Background:
    Given there are the following users:
      | email              | password | admin |
      | admin@ticketee.com | password | true  |
    And I am signed in as them
    Given there is a project called "TextMate 2"
    And I am on the homepage
    When I follow "TextMate 2"
    When I follow "Edit Project"

  Scenario: Updating a project
    Then I fill in "Name" with "TextMate 2 beta"
    And I press "Update Project"
    Then I should see "Project has been updated."
    And I should be on the project page for "TextMate 2 beta"

  Scenario: Updating a project with invalid attributes is bad
    Then I fill in "Name" with ""
    And I press "Update Project"
    Then I should see "Project has not been updated."
