Feature: See ratings
  As an speaker
  I want to the rating of my events
  So I can improve his performance

  Background:
    Given I am logged in
    And the event named "the first event" and rated with 1

  Scenario: Happy path
    Given I am browsing the ratings page for event with slug "thefirstevent1"
    And I wait a while
    