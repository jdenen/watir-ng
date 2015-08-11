# Given /^I am using a WebDriver instance patched with WatirNg$/ do
#   @browser = Watir::Browser.new
# end

# Given /^I have navigated to "(.*)"$/ do |url|
#   @browser.goto url
# end

# When /^I identify a "(.*)" element with an "(.*)" of "(.*)"$/ do |tag, ng, value|
#   identifier = { ng.to_sym => value }
#   @element = @browser.send(tag, identifier)
# end

# Then /^my WebDriver instance reports the element (\w+)$/ do |expectation|
#   expectation == "present" ? @element.present? : !@element.present?
# end

Given /^I've navigated to a web page$/ do
  @browser.goto "https://docs.angularjs.org/guide/directive"
end

When /^I identify an element with a "(.*)" of "(.*)"$/ do |locator, value|
  @element = @browser.element(locator.to_sym => value)
end

Then /^I found the "(.*)"$/ do |html|
  expect(@element.tag_name).to eq html
end

Then /^the element is missing$/ do
  expect(@element.present?).to be false
end

