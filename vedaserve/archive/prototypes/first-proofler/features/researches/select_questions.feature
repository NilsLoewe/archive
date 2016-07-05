Feature: Select Questions

  In order to use proofler
  As a researcher
  I have to select questions for my research

  Background:
    Given the researcher exists
     And  the researcher is logged in

  Scenario: New Researcher adds questions
    When the researcher creates a research
    Then there should be 0 questions
     And  there should be a add question link

    #When the researcher configures the questions
    #Then the researcher should see the done link
    #When the researcher adds a topic
    #Then the researcher should see the new topic
    #Then the researcher should see the add question card
    #When the researcher adds a question
    #Then the researcher should see the new question
    #And  the researcher quits adding questions
    #Then the researcher should see the new question
    #Then there should be 1 questions
    #When the researcher configures the questions
    #And  the researcher disables the new question
    #And  the researcher quits adding questions
    #Then the researcher should not see the new question

