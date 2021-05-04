@solaranalytics
Feature: Analytics Events for Solar panel validation on plans page

  Scenario: Validate Analytics event for solar panels as Yes for Residential Address
    Given user has opened the website link in a browser and creates 'E2E_Analytics_Resi_Solar_Yes' to save evidences
    And user has navigated to 'RES' plans page
    And user validates details on plans page for 'RES'
    And user initiates the call to capture analytics events
    When user enters the address "61 Cleveland Avenue, CROMER NSW 2099" on plans page
    Then user validates the data layer is updated for solar as 'yes'
    And user closes the spy on datalayer

  Scenario: Validate Analytics event for solar panels as No for Residential Address
    Given user has opened the website link in a browser and creates 'E2E_Analytics_Resi_Solar_No' to save evidences
    And user has navigated to 'RES' plans page
    And user validates details on plans page for 'RES'
    And user initiates the call to capture analytics events
    When user enters the address "271 Heatherhill Road, FRANKSTON VIC 3199" on plans page
    Then user validates the data layer is updated for solar as 'no'
    And user closes the spy on datalayer

  Scenario: Validate Analytics event for solar panels as Unknown for Residential Address
    Given user has opened the website link in a browser and creates 'E2E_Analytics_Resi_Solar_Unknown' to save evidences
    And user has navigated to 'RES' plans page
    And user validates details on plans page for 'RES'
    And user initiates the call to capture analytics events
    When user enters the address "Unit 1 297 Dorset Road, CROYDON VIC 3136" on plans page
    Then user validates the data layer is updated for solar as 'unknown'
    When user selects 'Total Plan'
    And user moves on to fill the qualifier
    And user selects 'New' on qualifier
    And user provides all other details on qualifier page
      |customerType| connectionAddress                   | movingType|propertyType|
      |RES         | Unit 1 297 Dorset Road, CROYDON VIC 3136|Non-Moving |Renter      |
    Then user validates the data layer is updated for solar as 'unknown'
    And user closes the spy on datalayer

  Scenario: Validate Analytics event for solar panels as Blocked for Residential Address
    Given user has opened the website link in a browser and creates 'E2E_Analytics_Resi_Solar_Blocked' to save evidences
    And user has navigated to 'RES' plans page
    And user validates details on plans page for 'RES'
    And user initiates the call to capture analytics events
    When user enters the address "19 Willington Street, TURRELLA NSW 2205" on plans page
    Then user validates the data layer is updated for solar as 'blocked'
    And user closes the spy on datalayer

  Scenario: Validate Analytics event for solar panels as Yes for Business Address
    Given user has opened the website link in a browser and creates 'E2E_Analytics_BSME_Solar_Yes' to save evidences
    And user has navigated to 'BUS' plans page
    Then user validates details on plans page for 'BUS'
    And user initiates the call to capture analytics events
    When user enters the address "6 Kultarr Lane, THROSBY ACT 2914" on plans page
    Then user validates the data layer is updated for solar as 'yes'
    And user closes the spy on datalayer

  Scenario: Validate Analytics event for solar panels as No for Business Address
    Given user has opened the website link in a browser and creates 'E2E_Analytics_BSME_Solar_No' to save evidences
    And user has navigated to 'BUS' plans page
    Then user validates details on plans page for 'BUS'
    And user initiates the call to capture analytics events
    When user enters the address "320 Crown Street, SURRY HILLS NSW 2010" on plans page
    Then user validates the data layer is updated for solar as 'no'
    And user closes the spy on datalayer

  Scenario: Validate Analytics event for solar panels as Yes for Campaign User
    Given user has opened the 'offer' link in a browser and creates 'E2E_Analytics_Offer_Solar_Yes' to save evidences
    When user provides "2000" and clicks on show me plan link
    And user initiates the call to capture analytics events
    And user clicks on Add plan button
    And user selects 'New' on qualifier
    And user provides all other details on qualifier page
      |customerType| connectionAddress                  | movingType|propertyType|
      |RES         | 61 Cleveland Avenue, CROMER NSW 2099|Non-Moving |Renter      |
    Then user validates the data layer is updated for solar as 'yes'
    And user closes the spy on datalayer
