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

  Scenario: QTCRM010 - Submit a quote with AAH Access level 1
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

  Scenario: QTCRM011 - Submit a quote with AAH Access level 2
    Given user has opened the website link in a browser and creates 'E2E_CRM_QTCRM011' to save evidences
    And user has navigated to 'BUS' plans page
    And user have selected fuel as "DUAL"
    When user selects 'Basic Business'
    And user moves on to fill the qualifier
    And user selects 'New' on qualifier
    And user provides all other details on qualifier page
      |customerType|customerStatus |connectionAddress                         |movingType |propertyType|solarOption|
      |BUS         |New            |213-215 Angas Street, ADELAIDE SA 5000    |Non-Moving |            |No         |
    And user provides all details on checkout details page
      |customerType|journey    |firstName    |lastName  |businessType|
      |BUS         |BUS        |QTCRMEleven  |test      |ABN         |
    And user opts for AAH and DD
      |optAAHOption|aahAccessLevel|optDDOption|directDebitType|
      |Yes         |Level 2       |No         |               |
    And user selects answer for property renovation question for 'SA'
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

  Scenario: QTCRM012 - Submit a quote with AAH Access level 3
    Given user has opened the website link in a browser and creates 'E2E_CRM_QTCRM012' to save evidences
    And user has navigated to 'BUS' plans page
    When user have selected fuel as "ELE"
    And user clicks on the verify modal window on 'BUS' page
    And user verifies the account through verify account journey for business customer
      |customer_type|modal_option   |elecAccountNumber|ABNOrACN     |idType |idNumber  |
      |BUS          |verify account |1536689555       |803123232    |pin    |222222    |
    And user selects 'Total Business'
    And user moves on to fill the qualifier
    And user provides all other details on qualifier page for Existing customer
      |customerType|movingType |solarOption  |
      |BUS         |Non-Moving |No           |
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus|firstName    |lastName|businessType |
      |BUS         |BUS        |Existing      |QTCRMTwelve  |test    |ACN          |
    And user opts for AAH and DD
      |optAAHOption|aahAccessLevel|optDDOption|directDebitType|
      |Yes         |Level 3       |No         |               |
    And user selects billing preference option
      |option               |otherAddress                                 |
      |Connection address   |                                             |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType |EleclifeSupportDevices  |GaslifeSupportDevices |
      |No               |         |                        |                      |
    And user verifies selected plan details for 'ELE'
    And user submits the quote
    Then user lands on checkout complete page

  Scenario: QTCRM013 - Submit a quote with Disconnection and final bill to email
    Given user has opened the website link in a browser and creates 'E2E_CRM_QTCRM013' to save evidences
    And user has navigated to 'RES' plans page
    And user have selected fuel as "BOTH"
    When user clicks on the verify modal window on 'RES' page
    And user verifies the account through verify account journey for residential customer
      |customer_type  |modal_option   |elecAccountNumber  |gasAccountNumber |postcode |idType |idNumber   |
      |RES            |verify account |5792801518         |7741645136       |2577     |dl     |234376869  |
    And user selects 'Basic Home'
    And user moves on to fill the qualifier
    And user provides all other details on qualifier page for Existing customer
      |customerType |movingType |connectionAddress                          |propertyType |solarOption  |
      |RES          |Moving     |6 Reeyana Place, MOSS VALE NSW 2577        |Renter       |No           |
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus|firstName      |lastName |idType          |
      |RES          |RES        |Existing      |QTCRMThirteen  |test     |Driver License  |
    And user selects billing preference option
      |option  |otherAddress                                 |
      |Email   |                                             |
    And user selects final bill option
      |option  |otherAddress                                 |
      |Email   |                                             |
    And user selects answer for property renovation question for 'NSW'
    And user chooses "Yes" for disconnection
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType |EleclifeSupportDevices  |GaslifeSupportDevices |
      |No               |         |                        |                      |
    And user verifies selected plan details for 'BOTH'
    And user submits the quote
    Then user lands on checkout complete page

  Scenario: QTCRM014 - Submit a quote with Disconnection and final bill to email
    Given user has opened the website link in a browser and creates 'E2E_CRM_QTCRM014' to save evidences
    And user has navigated to 'RES' plans page
    And user have selected fuel as "ELE"
    When user clicks on the verify modal window on 'RES' page
    And user verifies the account through verify account journey for residential customer
      |customer_type  |modal_option   |elecAccountNumber  |postcode |idType |idNumber   |
      |RES            |verify account |8371207137         |2603     |dob    |01011980   |
    And user selects 'Total Plan Plus'
    And user moves on to fill the qualifier
    And user provides all other details on qualifier page for Existing customer
      |customerType |movingType |connectionAddress                          |propertyType |solarOption  |
      |RES          |Moving     |32 Dominion Circuit, FORREST ACT 2603      |Owner        |No           |
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus|firstName      |lastName |idType    |
      |RES          |RES        |Existing      |QTCRMFourteen  |test     |Medicare  |
    And user selects billing preference option
      |option         |otherAddress                                 |
      |Other address  |271 Heatherhill Road, FRANKSTON  VIC  3199   |
    And user selects final bill option
      |option               |otherAddress                                 |
      |Connection address   |                                             |
    And user selects answer for property renovation question for 'ACT'
    And user chooses "Yes" for disconnection
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType |EleclifeSupportDevices  |GaslifeSupportDevices |
      |No               |         |                        |                      |
    And user verifies selected plan details for 'ELE'
    And user submits the quote
    Then user lands on checkout complete page

  Scenario: QTCRM015 - Submit a quote with Concession Card
    Given user has opened the website link in a browser and creates 'E2E_CRM_QTCRM015' to save evidences
    And user has navigated to 'RES' plans page
    And user have selected fuel as "ELE"
    When user clicks on the verify modal window on 'RES' page
    And user verifies the account through verify account journey for residential customer
      |customer_type|modal_option   |elecAccountNumber |postcode |idType |idNumber   |
      |RES          |verify account |3205365714        |4069     |dl     |820386230  |
    When user selects 'No Frills'
    And user moves on to fill the qualifier
    And user provides all other details on qualifier page
      |customerType |connectionAddress                          |movingType  |propertyType   |solarOption  |
      |RES          |339 Pullenvale Road, PULLENVALE QLD 4069   |Non-Moving  |Renter         |No           |
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus  |firstName     |lastName |idType         |medicareType |
      |RES          |RES        |Existing        |QTCRMFifteen  |test     |Passport       |             |
    And user opts for concession card
    And user selects billing preference option
      |option             |otherAddress                                 |
      |Connection address |                                             |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType |EleclifeSupportDevices  |GaslifeSupportDevices |
      |No               |         |                        |                      |
    And user verifies selected plan details for 'ELE'
    And user submits the quote
    Then user lands on checkout complete page

  Scenario: QTCRM016 - Submit a quote with Life Support details
    Given user has opened the website link in a browser and creates 'E2E_CRM_QTCRM016' to save evidences
    And user has navigated to 'RES' plans page
    When user selects 'Basic Home'
    And user moves on to fill the qualifier
    And user selects 'New' on qualifier
    And user provides all other details on qualifier page
      |customerType |connectionAddress                        |movingType  |propertyType   |solarOption  |
      |RES          |16 Arthur Street, ADELAIDE SA 5000       |Moving      |Owner          |No           |
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus  |firstName     |lastName |idType         |medicareType |
      |RES          |RES        |New             |QTCRMSixteen  |test     |Driver License |             |
    And user selects answer for property renovation question for 'SA'
    And user selects billing preference option
      |option         |otherAddress                                 |
      |Other address  |271 Heatherhill Road, FRANKSTON  VIC  3199   |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                        |GaslifeSupportDevices        |
      |Yes              |BOTH    |Chronic Positive Airways Pressure Respirator  |Medically Required Hot Water |
    And user verifies selected plan details for 'BOTH'
    And user submits the quote
    Then user lands on checkout complete page

  Scenario: QTCRM017 - Submit a quote with existing Life Support details
    Given user has opened the website link in a browser and creates 'E2E_CRM_QTCRM017' to save evidences
    And user has navigated to 'RES' plans page
    And user have selected fuel as "GAS"
    When user clicks on the verify modal window on 'RES' page
    And user verifies the account through verify account journey for residential customer
      |customer_type|modal_option   |gasAccountNumber |postcode |idType |idNumber |
      |RES          |verify account |5134624952       |2516     |dob    |01011980 |
    When user selects 'Total Plan'
    And user moves on to fill the qualifier
    And user provides all other details on qualifier page
      |customerType |connectionAddress                          |movingType  |propertyType   |solarOption  |
      |RES          |5 Wilkies Street, BULLI NSW 2516           |Non-Moving  |Renter         |No           |
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus  |firstName       |lastName |idType         |medicareType |
      |RES          |RES        |Existing        |QTCRMSeventeen  |test     |Driver License |             |
    And user selects billing preference option
      |option             |otherAddress                                 |
      |Connection address |                                             |
    And user clicks on 'Review your order' button and navigates to review page
    And user verifies selected plan details for 'GAS'
    And user submits the quote
    Then user lands on checkout complete page

  Scenario: QTCRM018 - Submit a quote for a simple COR sale for NSW residential customer
    Given user has opened the website link in a browser and creates 'E2E_CRM_QTCRM018' to save evidences
    And user has navigated to 'RES' plans page
    And user have selected fuel as "ELE"
    When user selects 'No Frills'
    And user moves on to fill the qualifier
    And user selects 'New' on qualifier
    And user provides all other details on qualifier page
      |customerType |connectionAddress                          |movingType  |propertyType   |solarOption  |
      |RES          |50 Argyle Place, MILLERS POINT NSW 2000    |Non-Moving  |Renter         |No           |
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus  |firstName     |lastName |idType         |medicareType |
      |RES          |RES        |New             |QTCRMEighteen |test     |Driver License |             |
    And user selects billing preference option
      |option         |otherAddress                                 |
      |Email          |                                             |
    And user opts in for Carbon Neutral
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType |EleclifeSupportDevices  |GaslifeSupportDevices |
      |No               |         |                        |                      |
    And user verifies selected plan details for 'ELE'
    And user submits the quote
    Then user lands on checkout complete page

    
