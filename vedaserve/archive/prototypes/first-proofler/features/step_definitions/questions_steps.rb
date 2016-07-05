Then(/^there should be (\d) questions$/) do |number_of_questions|
  if number_of_questions.to_i > 0
    page.should have_selector('.test-question', :count => number_of_questions.to_i)
  else
    page.should_not have_selector('.question-card')
  end
end

Then(/^there should be a add question link$/) do
  page.should have_selector('.new_question')
end

Then(/^the researcher should see the add question card$/) do
  page.should have_content('Add new question')
end

When(/^the researcher adds a question$/) do
  click_link('Add new question')
  fill_in 'question_title', :with => 'my question'
  click_button 'Create'
end

Then(/^the researcher should see the new question$/) do
  page.should have_content('my question')
end

Then(/^the researcher should not see the new question$/) do
  page.should_not have_content('my question')
end

When(/^the researcher disables the new question$/) do
  find(:css, '#enable').set(false)
end

Then(/^the researcher quits adding questions$/) do
  click_link 'Done, selecting questions'
end
