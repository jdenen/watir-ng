Given /^I am using a WebDriver instance patched with WatirNg$/ do
  @browser = Watir::Browser.new
end

Given /^I have navigated to "(.*)"$/ do |url|
  @browser.goto url
end

When /^I identify a "(.*)" element with an "(.*)" of "(.*)"$/ do |tag, ng, value|
  identifier = { ng.to_sym => value }
  @element = @browser.send(tag, identifier)
end

Then /^my WebDriver instance knows the element exists$/ do
  @element.exists?
end

Then /^my WebDriver instance sees the element$/ do
  @element.visible?
end
