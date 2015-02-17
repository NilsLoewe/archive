Feature: Add an objective to a category

  As a user
  I want to add a new objective to an existing category
  In order to describe new longterm objectives

  Scenario: Successful add
    Given the user is on the home page
      And the user exists
      And the user is logged in
      And the user goes to the categories page
     Then the user should be on the categories page
     When the user provides a title for the new category
      And the user clicks the create category link
     Then there should be one categories
     #Then there should be a button "Neues Ziel"
     #When the user enters a title for the objective
     #When the user clicks the New Objective button
     #Then there should be one categories
     #Then there should be 1 strategic objectives
     #When the user enters a title for the objective
     #When the user clicks the New Objective button
     #Then there should be one categories
     #Then there should be 2 strategic objectives
