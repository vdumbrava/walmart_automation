Feature: To test the interaction on "How Much Might It Cost You" page, wal_2

  Scenario: To navigate to wal_2 and test the slider functionality -

    Given I navigate to wal_2
    And I move "ER Visit" slider to 500
    And I press "Next" button
    And I move "Broken Refrigerator" slider to 500
    And I press "Next" button
    And I move "Auto Repair" slider to 500
    And I press "Show Costs" button
    Then I get to "See How Your Guess Compares to the Actual Costs" page
    And  I see the Estimated Values

  Scenario: To navigate to wal_2 and test the slider functionality

    Given I navigate to wal_2
    And I move "ER Visit" slider to 500
    And I press "Next" button
    And I move "Broken Refrigerator" slider to 20
    And I press "Next" button
    And I move "Auto Repair" slider to 500
    And I press "Previous" button
    And I move "Broken Refrigerator" slider to 20
    And I press "Next" button
    And I press "Show Costs" button
    Then I get to "See How Your Guess Compares to the Actual Costs" page
    And  I see the Estimated Values