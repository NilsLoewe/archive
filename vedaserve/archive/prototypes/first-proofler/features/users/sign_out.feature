Feature: Sign out

  To protect my account from unauthorized access
  A researcher
  Should be able to sign out

  Scenario: Researcher signs out
    Given the researcher is logged in
    When the researcher logs out
    Then the researcher should be on the home page
