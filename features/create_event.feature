Feature: Create event
  As a speaker
  I want to create a event and get its link
  To share with the audience

  Background:
    Given there are not events
    And I am logged in

  Scenario: Happy path
    Given I am on "the new event page"
    And I fill in "event[name]" with "My first event"
    And I fill in "event[date]" with tomorrow
    When I press "saveButton"
    Then I should see "myfirstevent1"

  Scenario: Event id already exists
    Given I am on "the new event page"
    And event named "My first event" already exists
    And I fill in "event[name]" with "My first event"
    And I fill in "event[date]" with tomorrow
    When I press "saveButton"
    Then I should see "myfirstevent2"

  Scenario: Date is not valid
    Given I am on "the new event page"
    And I fill in "event[name]" with "My first event"
    And I fill in "event[date]" with yesterday
    When I press "saveButton"
    Then I should see "Error"

  Scenario: Name is blank
    Given I am on "the new event page"
    And I fill in "event[name]" with " "
    And I fill in "event[date]" with yesterday
    When I press "saveButton"
    Then I should see "Error"