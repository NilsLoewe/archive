Feature: Edit a category

  As a user
  I want to edit an existing category
  In order to describe the category

  Scenario: No category to edit
    Given the user is on the home page
      And the user exists
      And the user is logged in
      And the user goes to the categories page
     Then the user should be on the categories page
     Then there should not be a button "Save"
     Then there should not be a link "Bearbeiten"

  Scenario: Successful edit
    Given the user is on the home page
      And the user exists
      And the user is logged in
      And the user goes to the categories page
     Then the user should be on the categories page
     When the user provides a title for the new category
      And the user clicks the create category link
     Then there should be one categories
     When the user clicks the edit category link
     Then there should be a button "Save"
     When the user enters his text
      And the user clicks the save button
     Then the user should be on the categories page

