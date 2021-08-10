@DR21.6.1.repricetest @DR21.7.1.campaign

Feature:E2E scenario for Reprice Prepositioning changes on residential plans page

  Scenario: Validate reprice data for basic-home plan on residential page
    Given user has opened the website link in a browser and creates 'BasicHome_Residential_PlansPage' to save evidences
    And user has navigated to 'RES' plans page
    And user enters '2000' in 'POSTCODE' field
    Then user validates the reprice pre-positioning disclaimer for 'Basic Home' on 'Residential' plans page
    When user selects 'Basic Home'
    And user moves on to fill the qualifier
    And user selects 'New' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                 | movingType | propertyType |
      | RES          | 5 Wilkies Street, BULLI NSW 2516 | Non-Moving | Renter       |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType   |
      | RES          | RES     | New            | test      | test     | Passport |
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType |EleclifeSupportDevices    |GaslifeSupportDevices  |
      |No               |         |                          |                       |
    Then user validates the reprice pre-positioning disclaimer for 'Basic Home' on 'Residential' review page
    And user submits the quote
    Then user lands on checkout complete page

  Scenario: Validate reprice data for no-frills plan on residential page
    Given user has opened the website link in a browser and creates 'NoFrills_Residential_PlansPage' to save evidences
    And user has navigated to 'RES' plans page
    And user enters '5000' in 'POSTCODE' field
    Then user validates the reprice pre-positioning disclaimer for 'No Frills' on 'Residential' plans page
    When user selects 'No Frills'
    And user moves on to fill the qualifier
    And user selects 'New' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                 | movingType | propertyType |
      | RES          | 3 River Drive, ATHELSTONE SA 5076 | Non-Moving | Renter       |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType   |
      | RES          | RES     | New            | test      | test     | Passport |
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType |EleclifeSupportDevices    |GaslifeSupportDevices  |
      |No               |         |                          |                       |
    Then user validates the reprice pre-positioning disclaimer for 'No Frills' on 'Residential' review page
    And user submits the quote
    Then user lands on checkout complete page

  Scenario: Validate reprice data for total plan on residential page
    Given user has opened the website link in a browser and creates 'TotalPlan_Residential_PlansPage' to save evidences
    And user has navigated to 'RES' plans page
    And user enters '2600' in 'POSTCODE' field
    Then user validates the reprice pre-positioning disclaimer for 'Total Plan' on 'Residential' plans page
    When user selects 'Total Plan'
    And user moves on to fill the qualifier
    And user selects 'New' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                 | movingType | propertyType |
      | RES          | 21 Tarrant Crescent, DUNLOP ACT 2615 | Non-Moving | Renter       |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType   |
      | RES          | RES     | New            | test      | test     | Passport |
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType |EleclifeSupportDevices    |GaslifeSupportDevices  |
      |No               |         |                          |                       |
    Then user validates the reprice pre-positioning disclaimer for 'Total Plan' on 'Residential' review page
    And user submits the quote
    Then user lands on checkout complete page

@DR21.8.1.campaign
    Scenario: Validate reprice data for basic-home plan on residential page
    Given user has opened the website link in a browser and creates 'BasicHome_Residential_PlansPage' to save evidences
    And user has navigated to 'RES' plans page
    And user enters '3000' in 'POSTCODE' field
    Then user validates the reprice pre-positioning disclaimer for 'Basic Home' on 'Residential' plans page
    When user selects 'Basic Home'
    And user moves on to fill the qualifier
    And user selects 'New' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                              | movingType | propertyType |
      | RES          | Unit 5 6 Rosedale Avenue, GLEN HUNTLY VIC 3163 | Non-Moving | Renter       |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType   |
      | RES          | RES     | New            | test      | test     | Passport |
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType |EleclifeSupportDevices    |GaslifeSupportDevices  |
      |No               |         |                          |                       |
    Then user validates the reprice pre-positioning disclaimer for 'Basic Home' on 'Residential' review page
    And user submits the quote
    Then user lands on checkout complete page




