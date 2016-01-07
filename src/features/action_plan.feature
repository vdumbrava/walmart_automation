Feature: To test the interaction on "Action Plan" page, wal_13

  Scenario Outline: To navigate to wal_13 and select each category

    Given I navigate to wal_13
    And I choose <name>
    Then I get to "My Action Plan" page
    And <name> tab is expanded
    And The "Submit" button inside <name> is <color>

  Examples:
  |            name              |     color     |
  | Find Out Where My Money Goes |    Cerulean   |
  | Make a Smart Spending Plan   |      Jade     |
  |      Build My Savings        | Persian Green |


  Scenario Outline: To navigate to wal_13, select each category and check/uncheck 1 step

    Given I navigate to wal_13
    And I choose <name>
    Then I get to "My Action Plan" page
    Then <name> tab is expanded
    When I select each checkbox from <name>
    And I deselect <numberOfDeselectedSteps> of the checkboxes from <name>
    Then <numberOfSelectedSteps> selected step(s) from <name> are present in the Action Plan

    Examples:
      |            name              |numberOfDeselectedSteps|numberOfSelectedSteps|
      | Find Out Where My Money Goes |           0           |          3          |
      | Find Out Where My Money Goes |           1           |          2          |
      | Find Out Where My Money Goes |           2           |          1          |
      | Make a Smart Spending Plan   |           0           |          3          |
      | Make a Smart Spending Plan   |           1           |          2          |
      | Make a Smart Spending Plan   |           2           |          1          |
      |      Build My Savings        |           0           |          3          |
      |      Build My Savings        |           1           |          2          |
      |      Build My Savings        |           2           |          1          |


  Scenario Outline: To navigate to wal_13, select each category and check/uncheck/check steps

    Given I navigate to wal_13
    And I choose <name>
    Then I get to "My Action Plan" page
    Then <name> tab is expanded
    When I select each checkbox from <name>
    And I unselect and select back one of the checkboxes from <name>
    Then 3 selected step(s) from <name> are present in the Action Plan

    Examples:
      |            name              |
      | Find Out Where My Money Goes |
      | Make a Smart Spending Plan   |
      |      Build My Savings        |