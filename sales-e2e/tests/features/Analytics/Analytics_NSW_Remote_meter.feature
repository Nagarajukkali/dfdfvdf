@solaranalytics @analytics
Feature: Analytics Events for NSW remote meter validation on plans page

  Scenario: Validate Analytics event for NSW remote meter for Residential Address
    Given user has opened the website link in a browser and creates 'E2E_Analytics_Resi_NSW_Remote_Meter' to save evidences
    And user has navigated to 'RES' plans page
    And user initiates the call to capture analytics events
    When user enters the address "1 Amblecote Place, TAHMOOR NSW 2573" on plans page
    Then user validates the 'plans_page' 'NSW_Remote_Meter_Error' event for NSW remote meter
    And user closes the spy on datalayer

  Scenario: Validate Analytics event for NSW remote meter on Move home page
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    When user has navigated to move house page
    And user initiates the call to capture analytics events
    When user enters '<movingAddress>' in address field
    Then user validates the 'Movehouse_page' 'NSW_Remote_Meter_Movehouse_Error' event for NSW remote meter
    And user closes the spy on datalayer
    
    Examples:
      | folderName                 | movingAddress                           |
      | E2E_Analytics_NSW_Remote_Meter_Movehouse | 1 Amblecote Place, TAHMOOR NSW 2573 |

  Scenario: Validate Analytics event for NSW remote meter on qualifier for campaign user
    Given user has opened the 'offer' link in a browser and creates 'E2E_Analytics_NSW_Remote_Meter_Qualifier_Error' to save evidences
    When user provides "2000" and clicks on show me plan link
    And user initiates the call to capture analytics events
    And user clicks on Add plan button
    And user selects 'New' on qualifier
    And user provides all other details on qualifier page
      |customerType| connectionAddress                  | movingType|propertyType|
      |RES         | 1 Amblecote Place, TAHMOOR NSW 2573 |Moving |Renter      |
    Then user validates the 'qualifier_page' 'NSW_Remote_Meter_Qualifier_Error' event for NSW remote meter
    And user closes the spy on datalayer

  Scenario: Validate Analytics event for NSW remote meter on Campaign page
    Given user has opened the 'offer' link in a browser and creates 'E2E_Analytics_Offer_NSW_Remote_Meter' to save evidences
    When user provides "2000" and clicks on show me plan link
    And user initiates the call to capture analytics events
   When user enters the address "1 Amblecote Place, TAHMOOR NSW 2573" on plans page
    Then user validates the 'plans_page' 'NSW_Remote_Meter_Error' event for NSW remote meter
    And user closes the spy on datalayer