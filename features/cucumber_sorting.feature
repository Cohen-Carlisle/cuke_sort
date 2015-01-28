Feature: Cucumber Sorting
  
  Scenario Outline: Doing the sorting
    And I do the sort by "<step>"
  
  Example:
  | step |
  | a list of ints |
  | I sort the list "start" to "end" |
  | the list is sorted |
