Feature: Viewing Projects
  In order to view projects
  As a user
  I should be able to see a list of projects

  Background:
    Given there are the following users:
      | email             | password |
      | user@ticketee.com | password |
    And I am signed in as them
    And there is a project called "TextMate 2"
    And there is a project called "Internet Explorer"
    And "user@ticketee.com" can view the "TextMate 2" project

  Scenario: Listing all projects
    And I am on the homepage
    Then I should not see "Internet Explorer"
    When I follow "TextMate 2"
    Then I should be on the project page for "TextMate 2"
