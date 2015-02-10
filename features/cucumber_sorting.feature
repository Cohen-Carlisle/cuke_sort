Feature: Cucumber Sorting
  
  @normal
  Scenario: Doing the sorting
    Given a list of ints
    When I sort the list "start" to "end"
    Then the list is sorted
  
  @table
  Scenario: Sort by Stepception
    * I do the sort by stepcalls within stepcalls
    | a list of ints                   |
    | I sort the list "start" to "end" |
    | the list is sorted               |

  @global
  Scenario Outline: Global sorting
    * <step>
    Examples:
    | step                             |
    | a list of ints                   |
    | I sort the list "start" to "end" |
    | the list is sorted               |
