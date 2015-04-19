Feature: Identifying HTML elements with ng directives

  Scenario: Checking for an element using an ng directive
    Given I am using a WebDriver instance patched with WatirNg
    And I have navigated to "https://docs.angularjs.org/guide/directive"
    When I identify a "div" element with an "ng_include" of "partialPath"
    Then my WebDriver instance knows the element exists
    And my WebDriver instance sees the element

  Scenario: Checking for an element using a non-ng identifier
    Given I am using a WebDriver instance patched with WatirNg
    And I have navigated to "http://www.google.com"
    When I identify a "text_field" element with an "id" of "lst-ib"
    Then my WebDriver instance knows the element exists
    And my WebDriver instance sees the element
