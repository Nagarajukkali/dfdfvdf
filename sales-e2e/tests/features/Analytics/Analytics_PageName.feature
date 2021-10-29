@pageNameValidation @quotestart @analytics @21.10.4.analytics
Feature: Scenarios to cover the data layer updates and analytics events trigger on plan page for pagename and quote start page events

  Scenario: Validate the page name and quote start page events on plans page
    Given user has opened the website link in a browser and creates 'E2E_Analytics_Residential_PageName' to save evidences
    And user initiates the call to capture analytics events
    When user has navigated to 'RES' plans page
    Then user validates the page name for 'residential' 'plans' page
    And user validates the quote start page for "Residential Page"
    When user selects 'Total Plan'
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
    When user selects property type as 'Renter'
    And user validates details on checkout details page
      | sourceSystem | journey    | fuelType |
      | Quote Tool   | Plan Switch| BOTH     |
    Then user validates the page name for 'residential' 'checkout_details' checkout page
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType   |
      | RES          | RES     | New            | test      | test     | Passport |
    And user selects mailing address option
      | addressType   | otherAddress                           |
      | Other Address | 42 Brownlow Drive, POINT COOK VIC 3030 |
    And user opts for AAH and DD
      | optAAHOption | optDDOption | directDebitType |
      | No           | Yes         | Bank            |
    And user selects "Email" billing preference option
    And user sends welcome pack through 'Email'
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    Then user validates the page name for 'residential' 'checkout_review' checkout page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices                              |
      | No               |      |              |  |
    And user selects carbon neutral option
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    Then user validates the page name for 'residential' 'checkout_complete' checkout page
    And user validates the quote status for "in complete"
    And user closes the spy on datalayer

  Scenario: Validate the page name events plans page for existing customer
    Given user has opened the website link in a browser and creates 'E2E_Analytics_Residential_existing_PageName' to save evidences
    And user initiates the call to capture analytics events
    When user has navigated to 'RES' plans page
    Then user validates the page name for 'residential' 'plans' page
    When user selects 'Total Plan'
    And user validates the quote start page for "Residential Page"
    Then user validates the page name for 'residential' 'cart' page
    And user moves on to fill the qualifier
    Then user validates the page name for 'residential' 'qualifier_are_you_new_to_ea' page
    When user selects 'Existing' on qualifier
    Then user validates the page name for 'residential' 'qualifier_accountdetails' page
    And user verifies account in c1 on qualifier
      | customerStatus | accountNumber | accountIdentityType | postcodeOrABNACN |
      | Existing       | 8372937428    | Postcode            | 3024             |
    Then user validates the page name for 'residential' 'qualifier_idtype' page
    And user verifies identity in c1 on qualifier for resi
      | idType | idValue  |
      | dob    | 01011980 |
    When user selects 'Moving' for moving question on qualifier
    Then user validates the page name for 'residential' 'qualifier_address' page
    When user enters the address '3 River Drive, ATHELSTONE SA 5076' on qualifier
    Then user validates the page name for 'residential' 'qualifier_connectiondate' page
    When user selects connection date in qualifier
    Then user validates the page name for 'residential' 'qualifier_propertytype' page
    When user selects property type as 'Renter'
    And user validates details on checkout details page
      | sourceSystem | journey    | fuelType |
      | Quote Tool   | Plan Switch| BOTH     |
    Then user validates the page name for 'residential' 'checkout_details' checkout page
    And user closes the spy on datalayer

  Scenario: Validate the page name and quote start page events on business plans page
    Given user has opened the website link in a browser and creates 'E2E_Analytics_Business_PageName' to save evidences
    And user initiates the call to capture analytics events
    When user has navigated to 'BUS' plans page
    Then user validates the page name for 'business' 'plans' page
    And user validates the quote start page for "Business Page"
    When user selects 'Total Plan - Business'
    Then user validates the page name for 'business' 'cart' page
    When user moves on to fill the qualifier
    Then user validates the page name for 'business' 'qualifier_are_you_new_to_ea' page
    When user selects 'New' on qualifier
    Then user validates the page name for 'business' 'qualifier_moving' page
    When user selects 'Moving' for moving question on qualifier
    Then user validates the page name for 'business' 'qualifier_address' page
    When user enters the address '68 Mercer Street, GEELONG VIC 3220' on qualifier
    Then user validates the page name for 'business' 'qualifier_connectiondate' page
    When user selects connection date in qualifier
    And user validates details on checkout details page
      | sourceSystem | journey    | fuelType |
      | Quote Tool   | Plan Switch| BOTH     |
    Then user validates the page name for 'business' 'business-checkout_details' checkout page
    And user provides all details on checkout details page
      | customerType | journey | firstName | lastName | businessType |
      | BUS          | BUS     | test      | test     | ABN          |
    And user validates the quote status for "in checkout"
    And user selects mailing address option
      | addressType   | otherAddress                       |
      | Other Address | 68 Mercer Street, GEELONG VIC 3220 |
    And user opts for AAH and DD
      | optAAHOption | optDDOption | directDebitType |
      | No           | Yes         | Bank            |
    And user selects answer for property renovation question for 'VIC'
    And user selects "Post" billing preference option
    And user sends welcome pack through 'Email'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices  | GaslifeSupportDevices                              |
      | No               |      |  |  |
    And user validates the quote status for "in review"
    Then user validates the page name for 'residential' 'business-checkout_review' checkout page
    And user verifies selected plan details for 'ELE'
    And user submits the quote
    Then user lands on checkout complete page
    And user validates the quote status for "in complete"
    Then user validates the page name for 'residential' 'business-checkout_complete' checkout page
    And user closes the spy on datalayer

  Scenario: Validate the page name and quote start page events on offer campaign plans page
    Given user has opened the 'offer' link in a browser and creates 'E2E_Analytics_Offer_Campaign' to save evidences
    And user initiates the call to capture analytics events
    When user provides "2000" and clicks on show me plan link
    Then user validates the page name for 'offer' 'plans' page
    And user validates the quote start page for "Offer Page"
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
    When user selects property type as 'Renter'
    And user validates details on checkout details page
      | sourceSystem | journey    | fuelType |
      | Quote Tool   | Plan Switch| BOTH     |
    Then user validates the page name for 'residential' 'checkout_details' checkout page
    And user closes the spy on datalayer

  Scenario: Validate the page name events on bizreferral business campaign page
    Given user has opened the 'bizreferral' link in a browser and creates 'E2E_Analytics_Bizreferral_Campaign' to save evidences
    When user provides email "avilash.parida@energyaustralia.com.au" and "2000" and clicks on show me plan link
    And user initiates the call to capture analytics events
    Then user is presented with the plans
    And user validates the page name for 'bizreferral' 'plans' page
    When user clicks on Add plan button
    Then user validates the page name for 'bizreferral' 'qualifier_are_you_new_to_ea' page
    When user selects 'New' on qualifier
    Then user validates the page name for 'bizreferral' 'qualifier_moving' page
    When user selects 'Moving' for moving question on qualifier
    Then user validates the page name for 'bizreferral' 'qualifier_address' page
    When user enters the address '320 Crown Street, SURRY HILLS NSW 2010' on qualifier
    Then user validates the page name for 'bizreferral' 'qualifier_connectiondate' page
    When user selects connection date in qualifier
    And user validates details on checkout details page
      | sourceSystem | journey    | fuelType |
      | Quote Tool   | Move Home| BOTH     |
    Then user validates the page name for 'business' 'business-checkout_details' checkout page
    And user closes the spy on datalayer

  Scenario: Validate the page name and quote start page events on moving home page
    Given user has opened the website link in a browser and creates 'E2E_Analytics_Movehouse_pagename' to save evidences
    And user initiates the call to capture analytics events
    When user has navigated to move house page
    Then user validates the page name for 'movinghome' 'movinghomepage' page
    And user validates the quote start page for "movingHome Page"
    And user enters '5 Wilkies Street, BULLI NSW 2516' in address field and selects any available moving date
    And user verifies account on qualifier
      | customerStatus | accountNumber | accountIdentityType | postcodeOrABNACN | idType | idValue  |
      | Existing       | 7810021000    | Postcode            | 3672             | dob    | 01011980 |
    When user selects property type as 'Renter'
    And user selects plans on checkout details page
      | fuelType | planName        |
      | ELE      | Total Plan Plus |
    And user selects plans on checkout details page
      | fuelType | planName   |
      | GAS      | Total Plan |
    Then user validates the page name for 'residential' 'checkout_details' checkout page
    And user closes the spy on datalayer
@failed
  Scenario Outline: Validate the page name and quote start page events on myaccount page
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user navigates to my account login page
    When user logs in to my account using '<username>' and '<password>'
    And user clicks on move home link for 'ELE'
    And user enters service address as '<address>'
    And user selects connection date
    And user initiates the call to capture analytics events
    And user clicks on lets get moving button
    And user validates details on checkout details page
      | sourceSystem | journey   | fuelType |
      | My Account   | Move Home | BOTH     |
    Then user validates the page name for 'myaccount' 'ma_move_checkout_details' checkout page
    And user closes the spy on datalayer
    Examples:
      |folderName                      |address                           |username          |password                                     |
      |MyAccount_Resi_NSW_FDV_movehome |5 Wilkies Street, BULLI NSW 2516  |nsw_rm_fv@test.com |U2FsdGVkX1+3MyLorZu94Wagym+aqL+FRXYs4GSvHB0= |

