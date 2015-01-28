Feature: Cucumber Sorting
  
  Scenario: Doing the sorting
    Given a list of ints
    When I sort the list "start" to "end"
    Then the list is sorted
  
  Scenario Outline: Sort by Stepception
    And I do the sort by "<step>"
  
  Examples:
    | step |
    | a list of ints |
    | I sort the list "start" to "end" |
    | the list is sorted |
