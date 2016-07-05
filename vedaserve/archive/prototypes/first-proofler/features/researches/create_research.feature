Feature: Create Research

  In order to use proofler
  As a researcher
  I have to create a research

  Background:
    Given the researcher exists
    And the researcher is logged in
    And there are some researches

  Scenario: New Researcher has one research
    When the researcher goes to the home page
    Then there should be 1 research
     And there should be an add research link

  Scenario: New Researcher creates an additional research
    When the researcher clicks the add research link
    Then there should be a title field

    When the researcher fills in a title
     And the researcher clicks the create button
    Then the researcher should see the research page
    When the researcher goes to the home page
    Then there should be an additional research

  Scenario: New Researcher creates does not enter a title
    When the researcher clicks the add research link
    Then there should be a title field

    When the researcher clicks the create button
    Then the researcher should see an error message
     And there should be no additional researches







