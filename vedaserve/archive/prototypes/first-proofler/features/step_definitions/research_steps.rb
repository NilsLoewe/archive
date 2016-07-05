When(/^the researcher adds another research$/) do
  click_link 'Add new research'
  fill_in 'research_title', :with => 'my research'
  click_button 'Create'
end

When /^the researcher clicks the create research link$/ do
  click_link 'Start new research'
end

Then(/^there should be (\d) research(es)?$/) do |number_of_researches, _|
  if number_of_researches.to_i > 0
    page.should have_selector('.research-card', :count => number_of_researches.to_i)
  else
    page.should_not have_selector('.research-card')
  end
end

Given(/^there are some researches$/) do
  @number_of_researches = all('.research-card').count
end

Then(/^there should be (an|no) additional research(es)?$/) do |how_many, _|
  if how_many == 'no'
    offset = 0
  else
    offset = 1
  end
  page.should have_selector('.research-card', count: @number_of_researches + offset)
end

Then(/^there should be an add research link$/) do
  page.should have_content 'Add new research'
end

Then(/^the researcher clicks the add research link$/) do
  click_link 'Add new research'
end

Then(/^there should be a title field$/) do
  page.should have_content 'Title'
end

When(/^the researcher fills in a title$/) do
  fill_in 'research_title', :with => 'my research'
end

When(/^the researcher clicks the create button$/) do
  click_button 'Create'
end

Then(/^the researcher should see the research page$/) do
  page.should have_content 'my research'
end

Then(/^the researcher should see an error message$/) do
  #page.should have_content "Please enter a title"
end

Given(/^the researcher creates a research$/) do
  click_link 'Add new research'
  fill_in 'research_title', :with => 'my research'
  click_button 'Create'
end

Given(/^the researcher configures the questions$/) do
  click_link 'Add new questions'
end

Then(/^the researcher should see the done link$/) do
  page.should have_content 'Done, selecting questions'
end
