Feature: Identifying HTML elements with ng directives

  Scenario: Locating HTML elements with standard identifiers
    Given an element exists on a web page
    When I use a standard identifier to find it
    Then the element is located

  Scenario: Locating HTML elements with ng directives
    Given an element exists on a web page
    When I use a directive identifier to find it
    Then the element is located

  Scenario: Not locating HTML elements with standard identifiers
    Given an element does not exist on a web page
    When I use a standard identifier to find it
    Then the element is not found

  Scenario: Not locating HTML elements with ng directives
    Given an element does not exist on a web page
    When I use a directive identifier to find it
    Then the element is not found
