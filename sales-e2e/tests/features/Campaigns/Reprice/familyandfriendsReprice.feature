@DR21.6.1.repricetest @DR21.7.1.campaign @DR21.9.5.campaign

Feature:E2E scenario for familyandfriends campaigns

  Scenario: Validate reprice data for familyandfriends campaign for NSW
    Given user has opened the 'familyandfriends' link in a browser and creates 'Reprice_familyandfriends_campaign_NSW' to save evidences
    When user provides email "nathan.glen@energyaustralia.com.au" and "2000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Family and Friends' 'familyandfriends' for 'NSW' state

  Scenario: Validate reprice data for familyandfriends campaign for ACT
    Given user has opened the 'familyandfriends' link in a browser and creates 'Reprice_familyandfriends_campaign_ACT' to save evidences
    When user provides email "nathan.glen@energyaustralia.com.au" and "2600" and clicks on show me plan link
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Family and Friends' 'familyandfriends' for 'ACT' state

  Scenario: Validate reprice data for familyandfriends campaign for SA
    Given user has opened the 'familyandfriends' link in a browser and creates 'Reprice_familyandfriends_campaign_SA' to save evidences
    When user provides email "nathan.glen@energyaustralia.com.au" and "5000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Family and Friends' 'familyandfriends' for 'SA' state

  Scenario: Validate reprice data for familyandfriends campaign for QLD
    Given user has opened the 'familyandfriends' link in a browser and creates 'Reprice_familyandfriends_campaign_QLD' to save evidences
    When user provides email "nathan.glen@energyaustralia.com.au" and "4000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Family and Friends' 'familyandfriends' for 'QLD' state
