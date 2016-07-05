Feature: Delete a category

  As a user
  I want to remove an existing category
  because it no longer exists in my life

  Scenario: No category to delete
    Given the user is on the home page
      And the user exists
      And the user is logged in
      And the user goes to the categories page
     Then the user should be on the categories page
     Then there should not be a button "Save"
     Then there should not be a link "Delete"

  Scenario: Successful removal
    Given the user is on the home page
      And the user exists
      And the user is logged in
      And the user goes to the categories page
     Then the user should be on the categories page
     When the user provides a title for the new category
      And the user clicks the create category link
     Then there should be one categories
     When the user clicks the edit category link
     Then the user should be on the edit categories page
     When the user clicks the delete category link
     Then there should be no categories
