@DR21.6.1.repricetest

Feature:E2E scenario for total plan plus campaigns

  Scenario: Validate reprice data for comeback campaign for NSW
    Given user has opened the 'comeback' link in a browser and creates 'Reprice_comeback_campaign_NSW' to save evidences
    When user provides "2000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Total Plan Plus' 'comeback' for 'NSW' state

  Scenario: Validate reprice data for comeback campaign for ACT
    Given user has opened the 'comeback' link in a browser and creates 'Reprice_comeback_campaign_ACT' to save evidences
    When user provides "2600" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Total Plan Plus' 'comeback' for 'ACT' state

  Scenario: Validate reprice data for comeback campaign for SA
    Given user has opened the 'comeback' link in a browser and creates 'Reprice_comeback_campaign_SA' to save evidences
    When user provides "5000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Total Plan Plus' 'comeback' for 'SA' state

  Scenario: Validate reprice data for comeback campaign for QLD
    Given user has opened the 'comeback' link in a browser and creates 'Reprice_comeback_campaign_QLD' to save evidences
    When user provides "4000" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Total Plan Plus' 'comeback' for 'QLD' state

  Scenario: Validate reprice data for total-plan-plus campaign for NSW
    Given user has opened the 'total-plan-plus' link in a browser and creates 'Reprice_total-plan-plus_campaign_NSW' to save evidences
    When user provides "2000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Total Plan Plus' 'total-plan-plus' for 'NSW' state

  Scenario: Validate reprice data for total-plan-plus campaign for ACT
    Given user has opened the 'total-plan-plus' link in a browser and creates 'Reprice_total-plan-plus_campaign_ACT' to save evidences
    When user provides "2600" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Total Plan Plus' 'total-plan-plus' for 'ACT' state

  Scenario: Validate reprice data for total-plan-plus campaign for SA
    Given user has opened the 'total-plan-plus' link in a browser and creates 'Reprice_total-plan-plus_campaign_SA' to save evidences
    When user provides "5000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Total Plan Plus' 'total-plan-plus' for 'SA' state

  Scenario: Validate reprice data for total-plan-plus campaign for QLD
    Given user has opened the 'total-plan-plus' link in a browser and creates 'Reprice_total-plan-plus_campaign_QLD' to save evidences
    When user provides "4000" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Total Plan Plus' 'total-plan-plus' for 'QLD' state
