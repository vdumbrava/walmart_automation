Feature: To test the interaction on "Action Plan" page, wal_13

  Scenario: To navigate to wal_13 and select each category

    Given I navigate to wal_13
    And I select "Find Out Where My Money Goes"
    Then I get to "My Action Plan" page
    And "Find Out Where My Money Goes" tab is expanded
    And The "Submit" button inside "Find Out Where My Money Goes" is "Cerulean"

    Given I open the page again
    And I select "Make a Smart Spending Plan"
    Then I get to "My Action Plan" page
    And "Make a Smart Spending Plan" tab is expanded
    And The "Submit" button inside "Make a Smart Spending Plan" is "Jade"


    Given I open the page again
    And I select "Build My Savings"
    Then I get to "My Action Plan" page
    And "Build My Savings" tab is expanded
    And The "Submit" button inside "Build My Savings" is "Persian Green"