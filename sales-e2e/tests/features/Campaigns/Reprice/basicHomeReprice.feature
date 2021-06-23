@DR21.6.1.repricetest @DR21.7.1.campaign

Feature:E2E scenario for basic-home campaigns

  Scenario: Validate reprice data for basic-home campaign for NSW
    Given user has opened the 'basic-home' link in a browser and creates 'Reprice_basicHome_campaign_NSW' to save evidences
    When user provides "2000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Basic Home' 'basic-home' for 'NSW' state

  Scenario: Validate reprice data for basic-home campaign for ACT
    Given user has opened the 'basic-home' link in a browser and creates 'Reprice_basicHome_campaign_ACT' to save evidences
    When user provides "2600" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Basic Home' 'basic-home' for 'ACT' state

  Scenario: Validate reprice data for basic-home campaign for SA
    Given user has opened the 'basic-home' link in a browser and creates 'Reprice_basicHome_campaign_SA' to save evidences
    When user provides "5000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Basic Home' 'basic-home' for 'SA' state

  Scenario: Validate reprice data for basic-home campaign for QLD
    Given user has opened the 'basic-home' link in a browser and creates 'Reprice_basicHome_campaign_QLD' to save evidences
    When user provides "4000" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Basic Home' 'basic-home' for 'QLD' state

  Scenario: Validate reprice data for basichome-canstarblue campaign for NSW
    Given user has opened the 'basichome-canstarblue' link in a browser and creates 'Reprice_basichomeCanstarblue_campaign_NSW' to save evidences
    When user provides "2000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Basic Home' 'basichome-canstarblue' for 'NSW' state

  Scenario: Validate reprice data for basichome-canstarblue campaign for ACT
    Given user has opened the 'basichome-canstarblue' link in a browser and creates 'Reprice_basichomeCanstarblue_campaign_ACT' to save evidences
    When user provides "2600" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Basic Home' 'basichome-canstarblue' for 'ACT' state

  Scenario: Validate reprice data for basichome-canstarblue campaign for SA
    Given user has opened the 'basichome-canstarblue' link in a browser and creates 'Reprice_basichomeCanstarblue_campaign_SA' to save evidences
    When user provides "5000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Basic Home' 'basichome-canstarblue' for 'SA' state

  Scenario: Validate reprice data for basichome-canstarblue campaign for QLD
    Given user has opened the 'basichome-canstarblue' link in a browser and creates 'Reprice_basichomeCanstarblue_campaign_QLD' to save evidences
    When user provides "4000" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Basic Home' 'basichome-canstarblue' for 'QLD' state

  Scenario: Validate reprice data for basichome-finder campaign for NSW
    Given user has opened the 'basichome-finder' link in a browser and creates 'Reprice_basichomefinder_campaign_NSW' to save evidences
    When user provides "2000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Basic Home' 'basichome-finder' for 'NSW' state

  Scenario: Validate reprice data for basichome-finder campaign for ACT
    Given user has opened the 'basichome-finder' link in a browser and creates 'Reprice_basichomefinder_campaign_ACT' to save evidences
    When user provides "2600" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Basic Home' 'basichome-finder' for 'ACT' state

  Scenario: Validate reprice data for basichome-finder campaign for SA
    Given user has opened the 'basichome-finder' link in a browser and creates 'Reprice_basichomefinder_campaign_SA' to save evidences
    When user provides "5000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Basic Home' 'basichome-finder' for 'SA' state

  Scenario: Validate reprice data for basichome-finder campaign for QLD
    Given user has opened the 'basichome-finder' link in a browser and creates 'Reprice_basichomefinder_campaign_QLD' to save evidences
    When user provides "4000" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Basic Home' 'basichome-finder' for 'QLD' state
