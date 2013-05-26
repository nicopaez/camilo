Given(/^I fill in "(.*?)" with tomorrow$/) do |field|
  fill_in(field, :with => Date.today+1)
end

Given(/^event with named "(.*?)" already exists$/) do |event_name|
  e = Event.new
  e.name = event_name
  e.date = Date.today + 1
  e.save
end

Given /^there are not events$/ do
  Event.destroy
end

When /^I fill in "([^"]*)" with yesterday$/ do |field|
  fill_in(field, :with => Date.today-1)
end

Given(/^I am logged in$/) do
  visit "/login"
  fill_in("name", :with => "cucumber_user")
  fill_in("email", :with => "cucumber_user@someplace.com")
  click_button "submit"
end