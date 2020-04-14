@CRM
Feature: Sanity E2E scenarios for ST & ST+1 for 1View Project

  Scenario: Submit a quote for a simple energisation sale
    Given user has opened the website link in a browser and creates 'E2E_CRM_QTCRM0001' to save evidences
    And user has navigated to 'RES' plans page
    When user selects 'Basic Home'
    And user moves on to fill the qualifier
    And user selects 'New' on qualifier
    And user provides all other details on qualifier page
      |customerType |connectionAddress                        |movingType  |propertyType   |solarOption  |
      |RES          |42 Brownlow Drive, POINT COOK VIC 3030   |Moving      |Renter         |No           |
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus  |firstName  |lastName |idType         |medicareType |
      |RES          |RES        |New             |QTCRMOne   |test     |Driver License |             |
    And user selects answer for property renovation question for 'VIC'
    And user selects billing preference option
      |option         |otherAddress                                 |
      |Email          |                                             |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType |EleclifeSupportDevices  |GaslifeSupportDevices |
      |No               |         |                        |                      |
    And user verifies selected plan details for 'BOTH'
    And user submits the quote
    Then user lands on checkout complete page
