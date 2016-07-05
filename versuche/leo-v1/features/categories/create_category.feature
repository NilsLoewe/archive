Feature: Create a category

  As a user
  I want to add a new category
  In order to describe new types of objectives

  Scenario: Successful creation
    Given the user is on the home page
      And the user exists
      And the user is logged in
     Then the user should be logged in
      And the user goes to the categories page
     Then the user should be on the categories page
     When the user provides a title for the new category
      And the user clicks the create category link
     Then there should be one categories

  Scenario: No title provided
    Given the user is on the home page
      And the user exists
      And the user is logged in
     Then the user should be logged in
      And the user goes to the categories page
     When the user clicks the create category link
     Then there should be no categories

  Scenario: Maximum number of categories
    Given the user is on the home page
      And the user exists
      And the user is logged in
     Then the user should be logged in
      And the user goes to the categories page
     Then there should be no categories
     Then there should be a button "add"
     When the user adds a category
     Then there should be 1 categories
     Then there should be a button "add"
     When the user adds a category
     Then there should be 2 categories
     Then there should be a button "add"
     When the user adds a category
     Then there should be 3 categories
     Then there should be a button "add"
     When the user adds a category
     Then there should be 4 categories
     Then there should be a button "add"
     When the user adds a category
     Then there should be 5 categories
     Then there should be a button "add"
     When the user adds a category
     Then there should be 6 categories
     Then there should be a button "add"
     When the user adds a category
     Then there should be 7 categories
     Then there should not be a button "add"
