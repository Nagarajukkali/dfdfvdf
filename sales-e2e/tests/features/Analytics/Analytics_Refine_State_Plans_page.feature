@refinestateanalytics @analytics @test

Feature: Analytics Events for Refine State validation on plans page

  Scenario: Validate Analytics event for refine state on Residential plans page
    Given user has opened the website link in a browser and creates 'E2E_Analytics_Resi_Refine_State' to save evidences
    And user has navigated to 'RES' plans page
    And user initiates the call to capture analytics events
    When user selects 'Postcode' location type
    Then user validates the data layer is updated for location type as 'postcode'
    Then user have selected fuel as "ELE"
    When user selects the 'Yearly' usage period
    Then user validates the data layer is updated for usage period as 'yearly'
    And user selects 'High - 20 kWh' 'Electricity' usage per day
    Then user validates the usage and usage value of data layer is updated
      | usage    |  usageValue    | fuelType |
      | high     |  20            | ELE      |
    And user selects '20%' green energy
    Then user validates the green energy percentage value of data layer is updated as '20'
    Then user have selected fuel as "GAS"
    And user selects 'High - 100 MJ' 'Gas' usage per day
    Then user validates the usage and usage value of data layer is updated
      | usage    | usageValue    | fuelType |
      | high     | 100           | GAS      |
    And user closes the spy on datalayer
  @failed
  Scenario: Validate Analytics event for refine state when Residential plans page is loaded(default values)
    Given user has opened the website link in a browser and creates 'E2E_Analytics_Resi_Refine_State' to save evidences
    And user has navigated to 'RES' plans page
    And user initiates the call to capture analytics events
    Then user validates the data layer is updated for location type as 'address'
    Then user validates the data layer is updated for usage period as 'monthly'
    Then user validates the usage and usage value of data layer is updated
      | usage    |  usageValue    | fuelType |
      | low      |  5             | ELE      |
    Then user validates the green energy percentage value of data layer is updated as '0'
    Then user validates the usage and usage value of data layer is updated
      | usage    | usageValue    | fuelType |
      | low      | 24            | GAS      |
    And user closes the spy on datalayer

  Scenario: Validate Analytics event for refine state on Business plans page
    Given user has opened the website link in a browser and creates 'E2E_Analytics_BSME_Refine_State' to save evidences
    And user has navigated to 'BUS' plans page
    And user initiates the call to capture analytics events
    When user selects 'Postcode' location type
    Then user validates the data layer is updated for location type as 'postcode'
    When user selects the 'Bi-monthly' usage period
    Then user validates the data layer is updated for usage period as 'bi-monthly'
    And user selects 'Medium - 17 kWh' 'Electricity' usage per day
    Then user validates the usage and usage value of data layer is updated
      | usage    |  usageValue    | fuelType |
      | medium   |  17            | ELE      |
    And user selects '25%' green energy
    Then user validates the green energy percentage value of data layer is updated as '25'
    And user have selected fuel as "GAS"
    And user selects 'Medium - 345 MJ' 'Gas' usage per day
    Then user validates the usage and usage value of data layer is updated
      | usage    | usageValue    | fuelType |
      | medium   | 345           | GAS      |
    And user closes the spy on datalayer

  Scenario: Validate Analytics event for refine state on offer campaign page
    Given user has opened the 'offer' link in a browser and creates 'E2E_Analytics_Resi_Refine_State' to save evidences
    When user provides "2000" and clicks on show me plan link
    And user initiates the call to capture analytics events
    When user selects 'Address' location type
    Then user validates the data layer is updated for location type as 'address'
    When user have selected fuel as "ELE"
    When user have selected fuel as "BOTH"
    When user selects the 'Quarterly' usage period
    Then user validates the data layer is updated for usage period as 'quarterly'
    And user selects 'Custom' 'Electricity' usage per day
    Then user validates the usage and usage value of data layer is updated
      | usage    |  usageValue    | fuelType |
      | custom   |                | ELE      |
    And user selects '100%' green energy
    Then user validates the green energy percentage value of data layer is updated as '100'
    And user selects 'Custom' 'Gas' usage per day
    Then user validates the usage and usage value of data layer is updated
      | usage    | usageValue    | fuelType |
      | custom   |               | GAS      |
    And user closes the spy on datalayer

  Scenario: Validate Analytics event for customer usage in the refine state on Residential plans page
    Given user has opened the website link in a browser and creates 'E2E_Analytics_Resi_Refine_State_Customer_Usage' to save evidences
    And user has navigated to 'RES' plans page
    And user initiates the call to capture analytics events
    When user clicks on the verify modal window on 'RES' page
    And user verifies the account through verify account journey for residential customer
      |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |postcode |idType |idNumber |
      |RES          |verify account |7618022000       |8715522000       |2785     |dob    |05111933 |
    Then user validates the usage and usage value of data layer is updated
      | usage    |  usageValue    | fuelType |
      | customer |                | ELE      |
    Then user validates the usage and usage value of data layer is updated
      | usage    | usageValue    | fuelType |
      | customer |               | GAS      |
    And user closes the spy on datalayer

