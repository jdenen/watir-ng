Feature: Identifying HTML elements with ng directives

  Background:
    Given I've navigated to a web page
    
  Scenario Outline: Identifying existing elements
    When I identify an element with a "<identifier>" of "<value>"
    Then I found the "<element>"
    
    Examples:
    | identifier | value               | element |
    | ng_include | partialPath         | div     |
    | id         | creating-directives | h2      |
    | ng_show    | loading             | div     |

  Scenario Outline: Identifying non-existent elements
    When I identify an element with a "<identifier>" of "<value>"
    Then the element is missing
    
    Examples:
    | identifier | value |
    | ng_focus   | foo   |
    | ng_click   | bar   |
    | id         | fizz  |
    | class      | buzz  |
