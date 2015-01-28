Feature: Cucumber Sorting
  
  Scenario: Doing the sorting
    Given a list of ints
    When I sort the list "start" to "end"
    Then the list is sorted
  
  Scenario: Sort by Stepception
    And I do the sort by stepcalls within stepcalls
    | a list of ints |
    | I sort the list "start" to "end" |
    | the list is sorted |
