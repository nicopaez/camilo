Feature: Rate event
  As an attendee
  I want to rate an event
  So the speaker can improve his performance

  Background:
    Given event named "the first event" already exists

  Scenario: Happy path
    Given I want to rate "the first event"
    And I fill in "comment" with "Great!"
    When I follow "happyButton"
    And I wait a while    
    Then I should see "Gracias"