Feature: Identifying HTML elements with ng directives

  Background:
    Given I am using a WebDriver instance patched with WatirNg

  Scenario: Checking for an element using an ng directive
    Given I have navigated to "https://docs.angularjs.org/guide/directive"
    When I identify a "div" element with an "ng_include" of "partialPath"
    Then my WebDriver instance reports the element present

  Scenario: Checking for an element using a non-ng identifier
    Given I have navigated to "http://www.google.com"
    When I identify a "text_field" element with an "id" of "lst-ib"
    Then my WebDriver instance reports the element present

  Scenario Outline: Checking for a non-existant element
    Given I have navigated to "http://www.google.com"
    When I identify a "<element>" element with an "<identifier>" of "<value>"
    Then my WebDriver instance reports the element missing

    Examples:
    | element    | identifier | value |
    | div        | ng_focus   | foo   |
    | a          | ng_show    | bar   |
    | text_field | id         | fizz  |
    | button     | class      | buzz  | 
    
