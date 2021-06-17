@pageNameValidation @analytics @21.6.4.analytics
Feature: Scenarios to cover the data layer updates and analytics events trigger on plan page

  Scenario: Validate the page name events for button on plans page
    Given user has opened the website link in a browser and creates 'E2E_Analytics_Residential_PageName' to save evidences
    When user has navigated to 'RES' plans page
    And user initiates the call to capture analytics events
    Then user validates the page name for 'residential' 'plans' page
    When user enters the address "271 Heatherhill Road, FRANKSTON VIC 3199" on plans page
    And user selects 'Total Plan'
    Then user validates the page name for 'residential' 'cart' page
    When user closes the cart page
    Then user validates the page name for 'residential' 'plans' page
    When user selects 'No Frills'
    And user moves on to fill the qualifier
    Then user validates the page name for 'residential' 'qualifier_are_you_new_to_ea' page
    When user selects 'New' on qualifier
    Then user validates the page name for 'residential' 'qualifier_moving' page
    When user selects 'Moving' for moving question on qualifier
    Then user validates the page name for 'residential' 'qualifier_address' page
    When user enters the address '3 River Drive, ATHELSTONE SA 5076' on qualifier
    Then user validates the page name for 'residential' 'qualifier_connectiondate' page
    When user selects connection date in qualifier
    Then user validates the page name for 'residential' 'qualifier_propertytype' page
    And user closes the spy on datalayer

  Scenario: Validate the page name events for button on plans page for existing customer
    Given user has opened the website link in a browser and creates 'E2E_Analytics_Residential_existing_PageName' to save evidences
    When user has navigated to 'RES' plans page
    And user initiates the call to capture analytics events
    Then user validates the page name for 'residential' 'plans' page
    When user enters the address "271 Heatherhill Road, FRANKSTON VIC 3199" on plans page
    And user selects 'Total Plan'
    Then user validates the page name for 'residential' 'cart' page
    And user moves on to fill the qualifier
    Then user validates the page name for 'residential' 'qualifier_are_you_new_to_ea' page
    When user selects 'Existing' on qualifier
    Then user validates the page name for 'residential' 'qualifier_accountdetails' page
    And user verifies account in c1 on qualifier
      | customerStatus | accountNumber | accountIdentityType | postcodeOrABNACN |
      | Existing       | 8372937428    | Postcode            | 3024             |
    Then user validates the page name for 'residential' 'qualifier_idtype' page
    And user verifies identity in c1 on qualifier
      | idType | idValue  |
      | dob    | 01011980 |
    When user selects 'Moving' for moving question on qualifier
    Then user validates the page name for 'residential' 'qualifier_address' page
    When user enters the address '3 River Drive, ATHELSTONE SA 5076' on qualifier
    Then user validates the page name for 'residential' 'qualifier_connectiondate' page
    When user selects connection date in qualifier
    Then user validates the page name for 'residential' 'qualifier_propertytype' page
    And user closes the spy on datalayer

  Scenario: Validate the page name events for button on business plans page
    Given user has opened the website link in a browser and creates 'E2E_Analytics_Business_PageName' to save evidences
    When user has navigated to 'BUS' plans page
    And user initiates the call to capture analytics events
    Then user validates the page name for 'business' 'plans' page
    When user selects 'Total Plan - Business'
    Then user validates the page name for 'business' 'cart' page
    When user moves on to fill the qualifier
    Then user validates the page name for 'business' 'qualifier_are_you_new_to_ea' page
    When user selects 'New' on qualifier
    Then user validates the page name for 'business' 'qualifier_moving' page
    When user selects 'Moving' for moving question on qualifier
    Then user validates the page name for 'business' 'qualifier_address' page
    When user enters the address '320 Crown Street, SURRY HILLS NSW 2010' on qualifier
    Then user validates the page name for 'business' 'qualifier_connectiondate' page
    When user selects connection date in qualifier
    And user closes the spy on datalayer

  Scenario: Validate the page name events for button on offer campaign plans page
    Given user has opened the 'offer' link in a browser and creates 'E2E_Analytics_Offer_Campaign' to save evidences
    And user initiates the call to capture analytics events
    When user provides "2000" and clicks on show me plan link
    Then user validates the page name for 'offer' 'plans' page
    When user clicks on Add plan button
    Then user validates the page name for 'offer' 'qualifier_are_you_new_to_ea' page
    When user selects 'New' on qualifier
    Then user validates the page name for 'offer' 'qualifier_moving' page
    When user selects 'Moving' for moving question on qualifier
    Then user validates the page name for 'offer' 'qualifier_address' page
    When user enters the address '3 River Drive, ATHELSTONE SA 5076' on qualifier
    Then user validates the page name for 'offer' 'qualifier_connectiondate' page
    When user selects connection date in qualifier
    Then user validates the page name for 'offer' 'qualifier_propertytype' page
    And user closes the spy on datalayer

  Scenario: Validate the page name events for button on bizreferral business campaign page
    Given user has opened the 'bizreferral' link in a browser and creates 'E2E_Analytics_Bizreferral_Campaign' to save evidences
    When user provides email "sarita.chakote@energyaustralia.com.au" and "2000" and clicks on show me plan link
    And user initiates the call to capture analytics events
    Then user is presented with the plans
    And user validates the page name for 'bizreferral' 'plans' page
    When user clicks on Add plan button
    Then user validates the page name for 'bizreferral' 'cart' page
    When user moves on to fill the qualifier
    Then user validates the page name for 'bizreferral' 'qualifier_are_you_new_to_ea' page
    When user selects 'New' on qualifier
    Then user validates the page name for 'bizreferral' 'qualifier_moving' page
    When user selects 'Moving' for moving question on qualifier
    Then user validates the page name for 'bizreferral' 'qualifier_address' page
    When user enters the address '320 Crown Street, SURRY HILLS NSW 2010' on qualifier
    Then user validates the page name for 'bizreferral' 'qualifier_connectiondate' page
    When user selects connection date in qualifier
    And user closes the spy on datalayer
