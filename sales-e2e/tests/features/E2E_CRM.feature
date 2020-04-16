@CRM
Feature: Sanity E2E scenarios for ST & ST+1 for 1View Project

  Scenario: QTCRM001 - Submit a quote for a simple energisation sale for victorian residential customer
    Given user has opened the website link in a browser and creates 'E2E_CRM_QTCRM001' to save evidences
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

  Scenario: QTCRM002 - Submit a quote for a simple COR sale for NSW residential customer
    Given user has opened the website link in a browser and creates 'E2E_CRM_QTCRM002' to save evidences
    And user has navigated to 'RES' plans page
    And user have selected fuel as "ELE"
    When user selects 'Total Plan'
    And user moves on to fill the qualifier
    And user selects 'New' on qualifier
    And user provides all other details on qualifier page
      |customerType |connectionAddress                          |movingType  |propertyType   |solarOption  |
      |RES          |50 Argyle Place, MILLERS POINT NSW 2000    |Non-Moving  |Owner          |No           |
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus  |firstName  |lastName |idType         |medicareType |
      |RES          |RES        |New             |QTCRMTwo   |test     |Medicare       |Green        |
    And user selects billing preference option
      |option         |otherAddress                                 |
      |Other address  |271 Heatherhill Road, FRANKSTON  VIC  3199   |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType |EleclifeSupportDevices  |GaslifeSupportDevices |
      |No               |         |                        |                      |
    And user verifies selected plan details for 'ELE'
    And user submits the quote
    Then user lands on checkout complete page


  Scenario: QTCRM003 - Submit a quote for a simple PS sale for ACT residential customer having Passport ID
    Given user has opened the website link in a browser and creates 'E2E_CRM_QTCRM003' to save evidences
    And user has navigated to 'RES' plans page
    And user have selected fuel as "GAS"
    When user clicks on the verify modal window on 'RES' page
    And user verifies the account through verify account journey for residential customer
      |customer_type|modal_option   |gasAccountNumber |postcode |idType |idNumber |
      |RES          |verify account |6010360000       |2913     |dob    |12011974 |
    When user selects 'Basic Home'
    And user moves on to fill the qualifier
    And user provides all other details on qualifier page
      |customerType |connectionAddress                          |movingType  |propertyType   |solarOption  |
      |RES          |44 Noongale Court, NGUNNAWAL ACT 2913      |Non-Moving  |Renter         |Yes          |
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus  |firstName  |lastName |idType         |medicareType |
      |RES          |RES        |Existing        |QTCRMThree |test     |Passport       |             |
    And user selects billing preference option
      |option             |otherAddress                                 |
      |Connection address |                                             |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType |EleclifeSupportDevices  |GaslifeSupportDevices |
      |No               |         |                        |                      |
    And user verifies selected plan details for 'GAS'
    And user submits the quote
    Then user lands on checkout complete page

  Scenario: QTCRM004 - Submit a quote for a simple energisation sale for QLD business customer
    Given user has opened the website link in a browser and creates 'E2E_CRM_QTCRM004' to save evidences
    And user has navigated to 'BUS' plans page
    And user have selected fuel as "BOTH"
    When user selects 'Basic Business'
    And user moves on to fill the qualifier
    And user selects 'New' on qualifier
    And user provides all other details on qualifier page
      |customerType|customerStatus |connectionAddress                         |movingType|propertyType|solarOption|
      |BUS         |New            |12 Atherton Road, OAKLEIGH VIC 3166       |Moving    |            |No         |
    And user provides all details on checkout details page
      |customerType|journey    |firstName    |lastName  |businessType|
      |BUS         |BUS        |QTCRMFour    |test      |ABN         |
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

  Scenario: QTCRM005 - Submit a quote for a simple COR sale for an SA business customer
    Given user has opened the website link in a browser and creates 'E2E_CRM_QTCRM005' to save evidences
    And user has navigated to 'BUS' plans page
    And user have selected fuel as "BOTH"
    When user selects 'Total Business'
    And user moves on to fill the qualifier
    And user selects 'New' on qualifier
    And user provides all other details on qualifier page
      |customerType|customerStatus |connectionAddress                         |movingType     |propertyType|solarOption|
      |BUS         |New            |213-215 Angas Street, ADELAIDE SA 5000    |Non-Moving     |            |No         |
    And user provides all details on checkout details page
      |customerType|journey    |firstName    |lastName  |businessType|
      |BUS         |BUS        |QTCRMFive    |test      |ACN         |
    And user selects billing preference option
      |option         |otherAddress                                 |
      |Other address  |271 Heatherhill Road, FRANKSTON  VIC  3199   |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType |EleclifeSupportDevices  |GaslifeSupportDevices |
      |No               |         |                        |                      |
    And user verifies selected plan details for 'BOTH'
    And user submits the quote
    Then user lands on checkout complete page

  Scenario: QTCRM006 - Submit a quote for a simple PS sale for an existing victorian business customer
    Given user has opened the website link in a browser and creates 'E2E_CRM_QTCRM006' to save evidences
    And user has navigated to 'BUS' plans page
    And user have selected fuel as "GAS"
    When user selects 'Basic Business'
    And user moves on to fill the qualifier
    And user selects 'Existing' on qualifier
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |6835622061   |ACN                |770273327       |pin   |111111  |
    And user provides all other details on qualifier page for Existing customer
      |customerType|movingType      |solarOption|
      |BUS         |Non-Moving      |No         |
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus|firstName    |lastName |businessType|
      |BUS         |BUS        |Existing      |QTCRMSix     |test     |ACN         |
    And user selects billing preference option
      |option               |otherAddress                                 |
      |Connection address   |                                             |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices     |GaslifeSupportDevices|
      |No               |        |                           |                     |
    And user verifies selected plan details for 'GAS'
    And user submits the quote
    Then user lands on checkout complete page

  Scenario: QTCRM007 - Submit a quote for a simple energisation sale for a new victorian business customer
    Given user has opened the website link in a browser and creates 'E2E_CRM_QTCRM007' to save evidences
    And user has navigated to 'BUS' plans page
    And user have selected fuel as "GAS"
    When user selects 'Total Business'
    And user moves on to fill the qualifier
    And user selects 'New' on qualifier
    And user provides all other details on qualifier page
      |customerType|customerStatus |connectionAddress                         |movingType|propertyType|solarOption|
      |BUS         |New            |12 Atherton Road, OAKLEIGH VIC 3166       |Moving    |            |No         |
    And user provides all details on checkout details page
      |customerType|journey    |firstName    |lastName  |businessType|
      |BUS         |BUS        |QTCRMSeven   |test      |ABN         |
    And user selects answer for property renovation question for 'VIC'
    And user selects billing preference option
      |option         |otherAddress                                 |
      |Email          |                                             |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType |EleclifeSupportDevices  |GaslifeSupportDevices |
      |No               |         |                        |                      |
    And user verifies selected plan details for 'GAS'
    And user submits the quote
    Then user lands on checkout complete page

  Scenario: QTCRM008 - Submit a quote with CC as direct debit payment method
    Given user has opened the website link in a browser and creates 'E2E_CRM_QTCRM008' to save evidences
    And user has navigated to 'RES' plans page
    And user have selected fuel as "BOTH"
    When user selects 'Basic Home'
    And user moves on to fill the qualifier
    And user selects 'New' on qualifier
    And user provides all other details on qualifier page
      |customerType |connectionAddress                          |movingType  |propertyType   |solarOption  |
      |RES          |50 Argyle Place, MILLERS POINT NSW 2000    |Non-Moving  |Owner          |No           |
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus  |firstName  |lastName |idType         |medicareType |
      |RES          |RES        |New             |QTCRMEight |test     |Driver License |             |
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |No          |Yes        |CC             |
    And user selects billing preference option
      |option               |otherAddress                                 |
      |Connection address   |                                             |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType |EleclifeSupportDevices  |GaslifeSupportDevices |
      |No               |         |                        |                      |
    And user verifies selected plan details for 'BOTH'
    And user submits the quote
    Then user lands on checkout complete page

  Scenario: QTCRM009 - Submit a quote with Bank as direct debit payment method
    Given user has opened the website link in a browser and creates 'E2E_CRM_QTCRM009' to save evidences
    And user has navigated to 'RES' plans page
    And user have selected fuel as "GAS"
    When user clicks on the verify modal window on 'RES' page
    And user verifies the account through verify account journey for residential customer
      |customer_type|modal_option   |gasAccountNumber |postcode |idType |idNumber |
      |RES          |verify account |6010360000       |2913     |dob    |12011974 |
    When user selects 'No Frills'
    And user moves on to fill the qualifier
    And user provides all other details on qualifier page
      |customerType |connectionAddress                          |movingType  |propertyType   |solarOption  |
      |RES          |44 Noongale Court, NGUNNAWAL ACT 2913      |Non-Moving  |Renter         |No           |
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus  |firstName  |lastName |idType         |medicareType |
      |RES          |RES        |Existing        |QTCRMNine  |test     |Medicare       |Blue         |
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |No          |Yes        |Bank           |
    And user selects billing preference option
      |option         |otherAddress                                 |
      |Other address  |271 Heatherhill Road, FRANKSTON  VIC  3199   |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType |EleclifeSupportDevices  |GaslifeSupportDevices |
      |No               |         |                        |                      |
    And user verifies selected plan details for 'GAS'
    And user submits the quote
    Then user lands on checkout complete page

  @test
  Scenario: QTCRM010 - Submit a quote with Bank as direct debit payment method
    Given user has opened the website link in a browser and creates 'E2E_CRM_QTCRM010' to save evidences
    And user has navigated to 'RES' plans page
    And user have selected fuel as "ELE"
    When user clicks on the verify modal window on 'RES' page
    And user verifies the account through verify account journey for residential customer
      |customer_type|modal_option   |elecAccountNumber|postcode |idType |idNumber |
      |RES          |verify account |5793270244       |4580     |dob    |01011980 |
    When user selects 'Total Plan Plus'
    And user moves on to fill the qualifier
    And user provides all other details on qualifier page
      |customerType |connectionAddress                          |movingType  |propertyType   |solarOption  |
      |RES          |74 Nautilus Drive, COOLOOLA COVE QLD 4580  |Moving      |Owner          |No           |
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus  |firstName  |lastName |idType         |medicareType |
      |RES          |RES        |Existing        |QTCRMTen   |test     |Passport       |             |
    And user opts for AAH and DD
      |optAAHOption|aahAccessLevel|optDDOption|directDebitType|
      |Yes         |Level 1       |No         |               |
    And user selects billing preference option
      |option         |otherAddress                                 |
      |Email          |                                             |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType |EleclifeSupportDevices  |GaslifeSupportDevices |
      |No               |         |                        |                      |
    And user verifies selected plan details for 'ELE'
    And user submits the quote
    Then user lands on checkout complete page

