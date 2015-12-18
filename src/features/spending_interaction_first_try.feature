Feature: To test the interaction on "Where Do You Spend the Most" page, wal_5

  Scenario: To navigate to wal_5 and test the selection functionality with 7 selections

    Given I navigate to wal_5
    And I select 7 expenses
    And I press Done button
    Then I get to "Where Can You Cut Costs?" page
    And The 7 selected expenses are displayed

  Scenario: To navigate to wal_5 and test the selection functionality with 6 selections

    Given I navigate to wal_5
    And I select 6 expenses
    And I press Done button
    Then I get to "Where Can You Cut Costs?" page
    And The 6 selected expenses are displayed

  Scenario: To navigate to wal_5 and test the selection functionality with 5 selections

    Given I navigate to wal_5
    And I select 5 expenses
    And I press Done button
    Then I get to "Where Can You Cut Costs?" page
    And The 5 selected expenses are displayed

  Scenario: To navigate to wal_5 and test the selection functionality with 4 selections

    Given I navigate to wal_5
    And I select 4 expenses
    And I press Done button
    Then I get to "Where Can You Cut Costs?" page
    And The 4 selected expenses are displayed

  Scenario: To navigate to wal_5 and test the selection functionality with 3 selections

    Given I navigate to wal_5
    And I select 3 expenses
    And I press Done button
    Then I get to "Where Can You Cut Costs?" page
    And The 3 selected expenses are displayed

  Scenario: To navigate to wal_5 and test the selection functionality with 2 selections

    Given I navigate to wal_5
    And I select 2 expenses
    And I press Done button
    Then I get to "Where Can You Cut Costs?" page
    And The 2 selected expenses are displayed

  Scenario: To navigate to wal_5 and test the selection functionality with 1 selections

    Given I navigate to wal_5
    And I select 1 expenses
    And I press Done button
    Then I get to "Where Can You Cut Costs?" page
    And The 1 selected expenses are displayed

  Scenario: To navigate to wal_5 and test the selection functionality with 8 selections

    Given I navigate to wal_5
    And I select 8 expenses
    And I press Done button
    Then I get to "Where Can You Cut Costs?" page
    And The 8th selected expense is not displayed

  Scenario: To navigate to wal_5 and test the selection functionality with 0 selections

    Given I navigate to wal_5
    And I wait 25 seconds
    And I press Done button
    Then I get to "Where Do You Spend the Most?" page