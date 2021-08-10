@DR21.6.1.repricetest @DR21.7.1.campaign

Feature:E2E scenario for Reprice Prepositioning changes on business plans page

  Scenario: Validate reprice data for basic-business plan on business page for NSW
    Given user has opened the website link in a browser and creates 'BasicBusiness_Business_PlansPage' to save evidences
    And user has navigated to 'BUS' plans page
    And user enters '2000' in 'POSTCODE' field
    Then user validates the reprice pre-positioning disclaimer for 'Basic Business' on 'Business' plans page
    When user selects 'Basic Business'
    And user selects gas 'Basic Business'
    And user moves on to fill the qualifier
    And user selects 'New' on qualifier
    And user provides all other details on qualifier page
      | customerType | customerStatus | connectionAddress                      | movingType | propertyType |
      | BUS          | New            | 73-75 Enmore Road, NEWTOWN NSW 2042    | Moving     |              |
    And user provides all details on checkout details page
      | customerType | journey | firstName | lastName | businessType |
      | BUS          | BUS     | test      | test     | ABN          |
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType |EleclifeSupportDevices    |GaslifeSupportDevices  |
      |No               |         |                          |                       |
    Then user validates the reprice pre-positioning disclaimer for 'Basic Business' on 'Business' review page
    And user submits the quote
    Then user lands on checkout complete page

Scenario: Validate reprice data for basic-business plan on business page for VIC
    Given user has opened the website link in a browser and creates 'BasicBusiness_Business_PlansPage' to save evidences
    And user has navigated to 'BUS' plans page
    And user enters '3000' in 'POSTCODE' field
    Then user validates the reprice pre-positioning disclaimer for 'Basic Business' on 'Business' plans page
    When user selects 'Basic Business'
    And user selects gas 'Basic Business'
    And user moves on to fill the qualifier
    And user selects 'New' on qualifier
    And user provides all other details on qualifier page
      | customerType | customerStatus | connectionAddress                      | movingType | propertyType |
      | BUS          | New            | 73-75 Enmore Road, NEWTOWN NSW 2042    | Moving     |              |
    And user provides all details on checkout details page
      | customerType | journey | firstName | lastName | businessType |
      | BUS          | BUS     | test      | test     | ABN          |
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType |EleclifeSupportDevices    |GaslifeSupportDevices  |
      |No               |         |                          |                       |
    Then user validates the reprice pre-positioning disclaimer for 'Basic Business' on 'Business' review page
    And user submits the quote
    Then user lands on checkout complete page