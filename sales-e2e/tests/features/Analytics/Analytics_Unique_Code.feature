@analytics @campaign21.7.2.analytics

Feature:Analytics Events for Unique Code validation

  Scenario: Validate Analytics event for unique code for Campaign page with OfferCode as the unique code
    Given user has opened the 'partner-program' link in a browser and creates 'E2E_Analytics_UniqueCode_BIZOFFER5' to save evidences
    And user initiates the call to capture analytics events
    When user provides "BIZOFFER5" and "2000" and clicks on show me plan link
    And user is presented with the plans
    Then user validates the data layer is updated for unique code as 'BIZOFFER5'
    And user closes the spy on datalayer

  Scenario: Validate Analytics event for unique code for Campaign page with Email as the unique code
    Given user has opened the 'familyandfriends' link in a browser and creates 'E2E_Analytics_UniqueCode_NA' to save evidences
    And user initiates the call to capture analytics events
    When user provides email "avilash.parida@energyaustralia.com.au" and "2000" and clicks on show me plan link
    And user is presented with the plans
    Then user validates the data layer is updated for unique code as 'NA'
    And user closes the spy on datalayer
