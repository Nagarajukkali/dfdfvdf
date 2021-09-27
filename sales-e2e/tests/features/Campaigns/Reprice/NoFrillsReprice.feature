@DR21.6.1.repricetest @DR21.7.1.campaign @DR21.9.5.campaign

Feature:E2E scenario for no frills campaigns

  Scenario: Validate reprice data for no frills campaign for NSW
    Given user has opened the 'nofrills' link in a browser and creates 'Reprice_nofrills_campaign_NSW' to save evidences
    When user provides "2000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'No Frills' 'nofrills' for 'NSW' state

  Scenario: Validate reprice data for no frills campaign for ACT
    Given user has opened the 'nofrills' link in a browser and creates 'Reprice_nofrills_campaign_ACT' to save evidences
    When user provides "2600" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'No Frills' 'nofrills' for 'ACT' state

  Scenario: Validate reprice data for no frills campaign for SA
    Given user has opened the 'nofrills' link in a browser and creates 'Reprice_nofrills_campaign_SA' to save evidences
    When user provides "5000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'No Frills' 'nofrills' for 'SA' state

  Scenario: Validate reprice data for no frills campaign for QLD
    Given user has opened the 'nofrills' link in a browser and creates 'Reprice_nofrills_campaign_QLD' to save evidences
    When user provides "4000" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'No Frills' 'nofrills' for 'QLD' state

  Scenario: Validate reprice data for nofrills-canstarblue campaign for NSW
    Given user has opened the 'nofrills-canstarblue' link in a browser and creates 'Reprice_nofrills-canstarblue_campaign_NSW' to save evidences
    When user provides "2000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'No Frills' 'nofrills-canstarblue' for 'NSW' state

  Scenario: Validate reprice data for nofrills-canstarblue campaign for ACT
    Given user has opened the 'nofrills-canstarblue' link in a browser and creates 'Reprice_nofrills-canstarblue_campaign_ACT' to save evidences
    When user provides "2600" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'No Frills' 'nofrills-canstarblue' for 'ACT' state

  Scenario: Validate reprice data for nofrills-canstarblue campaign for SA
    Given user has opened the 'nofrills-canstarblue' link in a browser and creates 'Reprice_nofrills-canstarblue_campaign_SA' to save evidences
    When user provides "5000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'No Frills' 'nofrills-canstarblue' for 'SA' state

  Scenario: Validate reprice data for nofrills-canstarblue campaign for QLD
    Given user has opened the 'nofrills-canstarblue' link in a browser and creates 'Reprice_nofrills-canstarblue_campaign_QLD' to save evidences
    When user provides "4000" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'No Frills' 'nofrills-canstarblue' for 'QLD' state

  Scenario: Validate reprice data for nofrills-finder campaign for NSW
    Given user has opened the 'nofrills-finder' link in a browser and creates 'Reprice_nofrills-finder_campaign_NSW' to save evidences
    When user provides "2000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'No Frills' 'nofrills-finder' for 'NSW' state

  Scenario: Validate reprice data for nofrills-finder campaign for ACT
    Given user has opened the 'nofrills-finder' link in a browser and creates 'Reprice_nofrills-finder_campaign_ACT' to save evidences
    When user provides "2600" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'No Frills' 'nofrills-finder' for 'ACT' state

  Scenario: Validate reprice data for nofrills-finder campaign for SA
    Given user has opened the 'nofrills-finder' link in a browser and creates 'Reprice_nofrills-finder_campaign_SA' to save evidences
    When user provides "5000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'No Frills' 'nofrills-finder' for 'SA' state

  Scenario: Validate reprice data for nofrills-finder campaign for QLD
    Given user has opened the 'nofrills-finder' link in a browser and creates 'Reprice_nofrills-finder_campaign_QLD' to save evidences
    When user provides "4000" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'No Frills' 'nofrills-finder' for 'QLD' state
