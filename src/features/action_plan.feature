Feature: To test the interaction on "Action Plan" page, wal_13

  Scenario Outline: To navigate to wal_13 and select each category

    Given I navigate to wal_13
    And I select <name>
    Then I get to "My Action Plan" page
    And <name> tab is expanded
    And The "Submit" button inside <name> is <color>

  Examples:
  |            name              |     color     |
  | Find Out Where My Money Goes |    Cerulean   |
  | Make a Smart Spending Plan   |      Jade     |
  |      Build My Savings        | Persian Green |







