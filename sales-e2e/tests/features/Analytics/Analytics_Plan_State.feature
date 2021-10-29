@selectedplanstate @analytics

Feature: Analytics Events for Plan State validation on plans page

  Scenario: Validate Analytics event for plan state on Residential plans page when dual fuel is selected
    Given user has opened the website link in a browser and creates 'E2E_Analytics_Resi_Plan_State_Dual_Fuel' to save evidences
    When user has navigated to 'RES' plans page
    And user initiates the call to capture analytics events
    When user selects 'Total Plan'
    Then user validates the data layer is updated for selected plan as 'both'
    And user closes the spy on datalayer
  @analyticsfixtest
  Scenario: Validate Analytics event for plan state on Residential plans page when electricity fuel is selected
    Given user has opened the website link in a browser and creates 'E2E_Analytics_Resi_Plan_State_ELE_Fuel' to save evidences
    And user has navigated to 'RES' plans page
    And user initiates the call to capture analytics events
    When user have selected fuel as "ELE"
    Then user validates the data layer is updated for available plan for 'Residential' plans page for 'Electricity'
    When user selects 'Total Plan'
    Then user validates the data layer is updated for selected plan as 'electricity'
    When user closes the cart page
    And user enters the address "271 Heatherhill Road, FRANKSTON VIC 3199" on plans page
    And user selects 'No Frills'
    Then user validates the data layer for 'No Frills' plan selected by user for 'Electricity'
    When user closes the cart page
    And user selects 'Total Plan'
    Then user validates the data layer for 'Total Plan' plan selected by user for 'Electricity'
    And user closes the spy on datalayer
  @analyticsfixtest
  Scenario: Validate Analytics event for plan state on Residential plans page when gas fuel is selected
    Given user has opened the website link in a browser and creates 'E2E_Analytics_Resi_Plan_State_GAS_Fuel' to save evidences
    And user has navigated to 'RES' plans page
    And user initiates the call to capture analytics events
    When user have selected fuel as "GAS"
    Then user validates the data layer is updated for available plan for 'Residential' plans page for 'Gas'
    When user selects 'Total Plan'
    Then user validates the data layer is updated for selected plan as 'gas'
    When user closes the cart page
    And user enters the address "271 Heatherhill Road, FRANKSTON VIC 3199" on plans page
    And user selects 'No Frills'
    Then user validates the data layer for 'No Frills' plan selected by user for 'Gas'
    When user closes the cart page
    And user selects 'Total Plan'
    Then user validates the data layer for 'Total Plan' plan selected by user for 'Gas'
    And user closes the spy on datalayer

  Scenario: Validate Analytics event for plan state on Business plans page when dual fuel is selected
    Given user has opened the website link in a browser and creates 'E2E_Analytics_BSME_Plan_State_Dual_Fuel' to save evidences
    And user has navigated to 'BUS' plans page
    And user initiates the call to capture analytics events
    When user selects 'Total Plan - Business'
    And user selects gas 'Total Plan - Business'
    Then user validates the data layer is updated for selected plan as 'both'
    And user closes the spy on datalayer

  Scenario: Validate Analytics event for plan state on Business plans page when electricity fuel is selected
    Given user has opened the website link in a browser and creates 'E2E_Analytics_BSME_Plan_State_ELE_Fuel' to save evidences
    And user has navigated to 'BUS' plans page
    And user initiates the call to capture analytics events
    When user have selected fuel as "ELE"
    Then user validates the data layer is updated for available plan for 'Business' plans page for 'Electricity'
    When user selects 'Business Carbon Neutral'
    Then user validates the data layer is updated for selected plan as 'electricity'
    When user closes the cart page
    And user enters the address "320 Crown Street, SURRY HILLS NSW 2010" on plans page
      And user selects 'Business Balance - Business'
    Then user validates the data layer for 'Business Balance - Business' plan selected by user for 'Electricity'
    And user closes the spy on datalayer

  Scenario: Validate Analytics event for plan state on Business plans page when gas fuel is selected
    Given user has opened the website link in a browser and creates 'E2E_Analytics_BSME_Plan_State_GAS_Fuel' to save evidences
    And user has navigated to 'BUS' plans page
    And user initiates the call to capture analytics events
    When user have selected fuel as "GAS"
    Then user validates the data layer is updated for available plan for 'Business' plans page for 'Gas'
    When user selects 'Total Plan - Business'
    Then user validates the data layer is updated for selected plan as 'gas'
    When user closes the cart page
    And user enters the address "320 Crown Street, SURRY HILLS NSW 2010" on plans page
    And user selects 'Business Balance - Business'
    Then user validates the data layer for 'Business Balance - Business' plan selected by user for 'Gas'
    And user closes the spy on datalayer

  Scenario: Validate Analytics event for plan state on Offer campaign page when dual fuel is selected
    Given user has opened the 'offer' link in a browser and creates 'E2E_Analytics_Offer_Campaign_State_Dual_Fuel' to save evidences
    And user initiates the call to capture analytics events
    When user provides "2000" and clicks on show me plan link
    And user clicks on Add plan button
    Then user validates the data layer is updated for selected plan as 'both'
    And user closes the spy on datalayer

  Scenario: Validate Analytics event for plan state on Offer campaign page when electricity fuel is selected
    Given user has opened the 'offer' link in a browser and creates 'E2E_Analytics_Offer_Campaign_State_ELE_Fuel' to save evidences
    And user initiates the call to capture analytics events
    When user provides "2000" and clicks on show me plan link
    When user have selected fuel as "ELE"
    Then user validates the data layer is updated for available plan for 'Campaign' plans page for 'Electricity'
    When user clicks on Add plan button
    Then user validates the data layer is updated for selected plan as 'electricity'
    And user closes the spy on datalayer

  Scenario: Validate Analytics event for plan state on Offer campaign page when gas fuel is selected
    Given user has opened the 'offer' link in a browser and creates 'E2E_Analytics_Offer_Campaign_State_GAS_Fuel' to save evidences
    And user initiates the call to capture analytics events
    When user provides "2000" and clicks on show me plan link
    When user have selected fuel as "GAS"
    Then user validates the data layer is updated for available plan for 'Campaign' plans page for 'Gas'
    When user clicks on Add plan button
    Then user validates the data layer is updated for selected plan as 'gas'
    And user closes the spy on datalayer
