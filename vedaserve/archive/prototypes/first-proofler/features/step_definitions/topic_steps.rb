When(/^the researcher adds a topic$/) do
  fill_in "topic_title", :with => "my topic"
  click_button "add"
end

Then(/^the researcher should see the new topic$/) do
  page.should have_content "my topic"
end

