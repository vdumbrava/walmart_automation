Feature: To test the interaction on "Where Do You Spend the Most" page, wal_5

  Scenario Outline: To navigate to wal_5 and test the selection functionality with different numbers of selections

    Given I navigate to wal_5
    And I select <numberOfExpenses> expenses
    And I press "Done" button
    Then I get to "Where Can You Cut Costs?" page
    And The <numberOfExpenses> selected expenses are displayed

    Examples:
      |numberOfExpenses|
      |7|
      |6|
      |5|
      |4|
      |3|
      |2|
      |1|

  Scenario: To navigate to wal_5 and test the selection functionality with 8 selections

    Given I navigate to wal_5
    And I select 8 expenses
    And I press "Done" button
    Then I get to "Where Can You Cut Costs?" page
    And The 8th selected expense is not displayed

  Scenario: To navigate to wal_5 and test the selection functionality with 0 selections

    Given I navigate to wal_5
    And I wait 25 seconds
    And I press "Done" button
    Then I get to "Where Do You Spend the Most?" page