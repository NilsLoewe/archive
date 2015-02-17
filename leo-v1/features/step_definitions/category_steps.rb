Then(/^the user should be on the categories page$/) do
  page.should have_content "Alle Kategorien"
end

Then(/^the user should be on the edit categories page$/) do
  page.should have_content "Kategorie editieren"
end

When(/^the user provides a title for the new category$/) do
  fill_in "category_title", :with => "My fancy category"
end

When(/^the user clicks the create category link$/) do
  click_button "add"
end

When(/^the user adds a category$/) do
  fill_in "category_title", :with => "My fancy category"
  click_button "add"
end

Then(/^there should be (\d+) categories$/) do |categories|
  page.all("h3").count.should eql(categories.to_i)
end

Then(/^there should be one categories$/) do
  page.should have_content "My fancy category"
end

Then(/^there should be no categories$/) do
  page.should_not have_content "My fancy category"
end

Then /^there should( not)? be a button "([^"]*)"$/ do |negate, name|
  expectation = negate ? :should_not : :should
  begin
    field = find_button(name)
  rescue Capybara::ElementNotFound
    # In Capybara 0.4+ #find_field raises an error instead of returning nil
  end
  field.send(expectation, be_present)
end

Then /^there should( not)? be a link "([^"]*)"$/ do |negate, name|
  expectation = negate ? :should_not : :should
  begin
    field = find_link(name)
  rescue Capybara::ElementNotFound
    # In Capybara 0.4+ #find_field raises an error instead of returning nil
  end
  field.send(expectation, be_present)
end

When(/^the user clicks the edit category link$/) do
  click_link "Kategorie editieren"
end

When(/^the user enters his text$/) do
  fill_in "category_content", :with => "My fancy description"
end

When(/^the user clicks the save button$/) do
  click_button "Save"
end

Then(/^the user should see his description$/) do
  page.should have_content "My fancy description"
end

When(/^the user clicks the delete category link$/) do
  click_link "Kategorie entfernen"
end

When(/^the user clicks the add objective link$/) do
  click_link "Add objective"
end

Then(/^the user should see an objective form$/) do
  page.should have_content "Enter the new objective"
end

When(/^the user enters a title for the objective$/) do
  fill_in "objective_title", :with => "My fancy objective"
end

When(/^the user clicks the add button$/) do
  click_button "Add"
end

When(/^the user clicks the New Objective button$/) do
  click_button "New Objective"
end

Then(/^there should be (\d+) strategic objectives$/) do |objectives|
  page.should have_content "Strategic objectives: " + objectives
end
