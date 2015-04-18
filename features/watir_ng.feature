Feature: Identifying HTML elements with ng directives

  Scenario: Checking for an element using an ng directive
    Given I am using a WebDriver instance patched with WatirNg
    And I have navigated to "https://docs.angularjs.org/guide/directive"
    When I identify a "div" element with an "ng_include" of "partialPath"
    Then my WebDriver instance knows the element exists
    And my WebDriver instance sees the element
