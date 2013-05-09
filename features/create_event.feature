Feature: Create event
  As a speaker
  I want to create a event and get its link
  To share with the audience

  Scenario: Happy path
    Given I am on "the home page"
    And I fill in event name with "My first event"
    When I click "Create"
    Then I should see "Event created"
    And I should see "myfirstevent1"

  Scenario: Event id already exists
    Given I am on "the home page"
    And event with id "myfirstevent1" already exists
    And I fill in event name with "My first event"
    When I click "Create"
    Then I should see "Event created"
    And I should not see "myfirstevent1"
    And I should see "myfirstevent2"

