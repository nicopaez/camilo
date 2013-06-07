Given(/^I fill in "(.*?)" with tomorrow$/) do |field|
  fill_in(field, :with => Date.today+1)
end

Given(/^event named "(.*?)" already exists$/) do |event_name|
  e = Event.new
  e.name = event_name
  e.date = Date.today + 1
  e.account = Account.first
  e.save
end

Given /^there are not events$/ do
  Rating.all.destroy
  Event.all.destroy
end

Given /^I want to rate "([^"]*)"$/ do | event_name |
  event = Event.find_by_name(event_name)
  visit "/events/rate/#{event.slug}"
end

When /^I fill in "([^"]*)" with yesterday$/ do |field|
  fill_in(field, :with => Date.today-1)
end

Given /^I am logged in$/ do
  visit "/login"
  fill_in("name", :with => "cucumber_user")
  fill_in("email", :with => "cucumber_user@someplace.com")
  click_button "submit"
end

When(/^I wait a while$/) do
  sleep(2)
end

Given(/^the event named "(.*?)" and rated with (\d+)$/) do |event_name, rate|
  e = Event.new
  e.name = event_name
  e.date = Date.today + 1
  e.account = Account.first
  e.save
  r = Rating.for_event(e)
  r.value = rate
  r.save
end

Given(/^I am browsing the ratings page for event with slug "(.*?)"$/) do |event_slug|
  visit "/events/#{event_slug}/ratings"
end