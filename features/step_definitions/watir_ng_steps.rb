Given /^an element exists on a web page$/ do
  @browser.goto "https://docs.angularjs.org/guide/directive"
end

Given /^an element does not exist on a web page$/ do
  @browser.goto "http://www.google.com"
end

When /^I use a (standard|directive) identifier to find it$/ do |id|
  elements = {
    "standard"  => {
      "element" => :h2,
      "identifier" => { id: "creating-directives" }
    },
    "directive" => {
      "element" => :div,
      "identifier" => { ng_show: "loading" }
    }
  }
  
  @element = @browser.send(elements[id]["element"], elements[id]["identifier"])
end

Then /^the element is located$/ do
  expect(@element).to exist
end

Then /^the element is not found$/ do
  expect(@element).to_not exist
end


