### UTILITY METHODS ###

def create_visitor
  @visitor ||= { :name => 'Testy McUserton', :email => 'example@example.com',
    :password => 'changeme', :password_confirmation => 'changeme' }
end

def find_researcher
  @user ||= User.where(:email => @visitor[:email]).first
end

def create_unconfirmed_researcher
  create_visitor
  delete_researcher
  register
  visit '/users/sign_out'
end

def create_researcher
  create_visitor
  delete_researcher
  @user = FactoryGirl.create(:user, @visitor)
  @user.confirm!
end

def delete_researcher
  @user ||= User.where(:email => @visitor[:email]).first
  @user.destroy unless @user.nil?
end

def register
  delete_researcher
  visit '/users/sign_up'
  fill_in 'user_name', :with => @visitor[:name]
  fill_in 'user_email', :with => @visitor[:email]
  fill_in 'user_password', :with => @visitor[:password]
  fill_in 'user_password_confirmation', :with => @visitor[:password_confirmation]
  click_button 'Sign up'
  find_researcher
end

def log_in
  visit '/users/sign_in'
  fill_in 'user_email', :with => @visitor[:email]
  fill_in 'user_password', :with => @visitor[:password]
  click_button 'Sign in'
end

def log_out
  visit '/users/sign_out'
end

### GIVEN ###
Given /^the researcher is not logged in$/ do
  log_out
end

Given /^the researcher is logged in$/ do
  create_researcher
  log_in
end

Given /^the researcher exists$/ do
  create_researcher
end

Given /^the researcher does not exist$/ do
  create_visitor
  delete_researcher
end

Given /^the researcher exists as an unconfirmed user$/ do
  create_unconfirmed_researcher
end

### WHEN ###
When /^the researcher logs in with valid credentials$/ do
  create_visitor
  log_in
end

When /^the researcher logs out$/ do
  visit '/users/sign_out'
end

When /^the researcher registers with valid user data$/ do
  create_visitor
  register
end

When /^the researcher registers with an invalid email$/ do
  create_visitor
  @visitor = @visitor.merge(:email => "notanemail")
  register
end

When /^the researcher registers without a password confirmation$/ do
  create_visitor
  @visitor = @visitor.merge(:password_confirmation => "")
  register
end

When /^the researcher registers without a password$/ do
  create_visitor
  @visitor = @visitor.merge(:password => "")
  register
end

When /^the researcher registers with a mismatched password confirmation$/ do
  create_visitor
  @visitor = @visitor.merge(:password_confirmation => "changeme123")
  register
end

When /^the researcher returns to the start page$/ do
  visit '/'
end

When /^the researcher logs in with a wrong email$/ do
  @visitor = @visitor.merge(:email => "wrong@example.com")
  log_in
end

When /^the researcher logs in with a wrong password$/ do
  @visitor = @visitor.merge(:password => "wrongpass")
 log_in
end

When /^the researcher edits his account details$/ do
  click_link "Edit account"
  fill_in "user_name", :with => "newname"
  fill_in "user_current_password", :with => @visitor[:password]
  click_button "Update"
end

### THEN ###
Then /^the researcher should be logged in$/ do
  page.should have_content "Logout"
  page.should_not have_content "Sign up"
  page.should_not have_content "Login"
end

Then /^the researcher should be logged out$/ do
  page.should have_content "Register"
  page.should have_content "Login"
  page.should_not have_content "Logout"
end

Then /^the researcher should see a forgot password link$/ do
  page.should have_content "Forgot your password?"
end

Then /^the researcher should see a confirmation link message$/ do
  page.should have_content "A message with a confirmation link has been sent to your email address"
end

Then /^the researcher should see a confirmation success message$/ do
  page.should have_content "Your account was successfully confirmed. You are now signed in"
end

Then /^the researcher see an unconfirmed account message$/ do
  page.should have_content "You have to confirm your account before continuing."
end

Then /^the researcher should see a successful login message$/ do
  page.should have_content "Signed in successfully."
end

Then /^the researcher should see a successful registration message$/ do
  page.should have_content "Welcome! You have signed up successfully."
end

Then /^the researcher should see an invalid email message$/ do
  page.should have_content "Email is invalid"
end

Then /^the researcher should see a missing password message$/ do
  page.should have_content "Password can't be blank"
end

Then /^the researcher should see a missing password confirmation message$/ do
  page.should have_content "Password confirmation doesn't match Password"
end

Then /^the researcher should see a mismatched password message$/ do
  page.should have_content "Password confirmation doesn't match Password"
end

Then /^the researcher should see a logged out message$/ do
  page.should have_content "Signed out successfully."
end

Then /^the researcher see an invalid login message$/ do
  page.should have_content "Invalid email or password."
end

Then /^the researcher should see an account edited message$/ do
  page.should have_content "You updated your account successfully."
end

Then /^the researcher should see his name$/ do
  create_researcher
  page.should have_content @user[:name]
end
