Feature: Researches Index

  In order to use proofler
  As a researcher
  I want to create researches

  Background:
    Given the researcher exists
    And the researcher is logged in
    And there are some researches

  Scenario: New Researcher has one research
    When the researcher goes to the home page
    Then there should be 1 research
     And there should be an add research link
    When the researcher goes to the research page
    Then there should be 1 research
     And there should be an add research link
    When the researcher adds another research
    When the researcher goes to the research page
    Then there should be 2 researches
     And there should be an add research link
    
