Feature: Register

  In order to become a researcher
  A user
  has to register for VedaScan

  Scenario: Researcher accesses the register page
    Given the researcher is logged in
    When the researcher goes to the register page
    Then the researcher should be on the home page

  Scenario: User registers with invalid email
    When the researcher goes to the register page
    And the researcher registers with an invalid email
    Then the researcher should see an invalid email message

  Scenario: User signs up without password
    When the researcher goes to the register page
    And the researcher registers without a password
    Then the researcher should see a missing password message

  Scenario: User signs up without password confirmation
    When the researcher goes to the register page
    And the researcher registers without a password confirmation
    Then the researcher should see a missing password confirmation message

  Scenario: User signs up with mismatched password and confirmation
    When the researcher goes to the register page
    And the researcher registers with a mismatched password confirmation
    Then the researcher should see a mismatched password message
