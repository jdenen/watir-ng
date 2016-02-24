Feature: Identifying HTML elements with ng directives

  Scenario: Locating elements with standard identifiers
    When I open the test page
    And I identify an element by standard identifier
    Then the element is found

  Scenario: Locating elements with ng directives
    When I open the test page
    And I identify an element by ng directive
    Then the element is found

  Scenario: Locating elements with custom directives
    When I open the test page
    And I identify an element by custom directive
    Then the element is found
