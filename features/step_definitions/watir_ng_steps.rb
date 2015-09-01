Given /^I've navigated to a web page$/ do
  @browser.goto "https://docs.angularjs.org/guide/directive"
end

Given /^I register a custom directive with WatirNg$/ do
  WatirNg.custom_directives << :ng_foo
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

Then /^no error is raised$/ do
  expect{ @element.exist? }.to_not raise_error
end

