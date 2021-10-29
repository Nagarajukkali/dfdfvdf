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
    Given user has opened the website link in a browser and creates 'E2E_Analytics_NSW_Remote_Meter_Movehouse' to save evidences
    When user has navigated to move house page
    And user initiates the call to capture analytics events
    When user enters '1 Amblecote Place, TAHMOOR NSW 2573' in address field
    And user waits for few seconds
    Then user validates the 'Movehouse_page' 'NSW_Remote_Meter_Movehouse_Error' event for NSW remote meter
    And user closes the spy on datalayer

    Examples:
      | folderName                 | movingAddress                           |
      |  |  |

  Scenario: Validate Analytics event for NSW remote meter on qualifier for campaign user
    Given user has opened the 'offer' link in a browser and creates 'E2E_Analytics_NSW_Remote_Meter_Qualifier_Error' to save evidences
    When user provides "2000" and clicks on show me plan link
    And user initiates the call to capture analytics events
    And user clicks on Add plan button
    When user selects 'New' on qualifier
    When user selects 'Moving' for moving question on qualifier
    When user enters the address '1 Amblecote Place, TAHMOOR NSW 2573' on qualifier for NSW
    Then user validates the 'qualifier_page' 'NSW_Remote_Meter_Qualifier_Error' event for NSW remote meter
    When user clicks on continue button after providing address
    And user selects connection date in qualifier
    And user selects property type as 'Renter'
    And user closes the spy on datalayer


  Scenario: Validate Analytics event for NSW remote meter on Campaign page
    Given user has opened the 'offer' link in a browser and creates 'E2E_Analytics_Offer_NSW_Remote_Meter' to save evidences
    When user provides "2000" and clicks on show me plan link
    And user initiates the call to capture analytics events
    When user enters the address "1 Amblecote Place, TAHMOOR NSW 2573" on plans page
    Then user validates the 'plans_page' 'NSW_Remote_Meter_Error_Campaign' event for NSW remote meter
    And user closes the spy on datalayer
