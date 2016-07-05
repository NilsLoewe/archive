Feature: Sign in

  In order to use vedascan
  As a researcher
  I have to login

  Scenario: Researcher signs in successfully
    Given the researcher exists
    And  the researcher is not logged in
    When the researcher logs in with valid credentials
    Then the researcher should see a successful login message
    When the researcher returns to the start page
    Then the researcher should be logged in

  Scenario: User enters wrong email
    Given the researcher exists
    And  the researcher is not logged in
    When the researcher logs in with a wrong email
    Then the researcher see an invalid login message
    And the researcher should be logged out

  Scenario: User enters wrong password
    Given the researcher exists
    And  the researcher is not logged in
    When the researcher logs in with a wrong password
    Then the researcher see an invalid login message
    And the researcher should be logged out
