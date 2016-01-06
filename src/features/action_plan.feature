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


  Scenario Outline: To navigate to wal_13, select each category and check steps

    Given I navigate to wal_13
    And I choose <name>
    Then I get to "My Action Plan" page
    Then <name> tab is expanded
    When I select each checkbox from <name>
    Then The selected steps from <name> are present in the Action Plan


    Examples:
      |            name              |     color     |
      | Find Out Where My Money Goes |    Cerulean   |
      | Make a Smart Spending Plan   |      Jade     |
      |      Build My Savings        | Persian Green |

  Scenario Outline: To navigate to wal_13, select each category and check/uncheck steps

    Given I navigate to wal_13
    And I choose <name>
    Then I get to "My Action Plan" page
    Then <name> tab is expanded
    When I select each checkbox from <name>
    And I deselect one of the checkboxes from <name>
    Then The deselected steps from <name> are not present in the Action Plan

    Examples:
      |            name              |     color     |
      | Find Out Where My Money Goes |    Cerulean   |
      | Make a Smart Spending Plan   |      Jade     |
      |      Build My Savings        | Persian Green |

  Scenario Outline: To navigate to wal_13, select each category and check/uncheck/check steps

    Given I navigate to wal_13
    And I choose <name>
    Then I get to "My Action Plan" page
    Then <name> tab is expanded
    When I select each checkbox from <name>
    And I deselect and select back one of the checkboxes from <name>
    Then The selected steps from <name> are present in the Action Plan

    Examples:
      |            name              |     color     |
      | Find Out Where My Money Goes |    Cerulean   |
      | Make a Smart Spending Plan   |      Jade     |
      |      Build My Savings        | Persian Green |