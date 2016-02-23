Given /^I register a custom directive$/ do
  WatirNg.register :ng_custom
end

When /^I open the test page$/ do
  path = File.expand_path "../../support/test.html", __FILE__
  @browser = Watir::Browser.start "file://#{path}"
end

When /^I identify an element by standard identifier$/ do
  @span = @browser.span(id: 'span-id') 
end

When /^I identify an element by ng directive$/ do
  @span = @browser.span(ng_class: 'span-ng-class')
end

When /^I identify an element by custom directive$/ do
  @span = @browser.span(ng_custom: 'span-ng-custom')
end

Then /^the element is found$/ do
  require 'pry'; binding.pry
  expect(@span.exist?).to eq true
end
