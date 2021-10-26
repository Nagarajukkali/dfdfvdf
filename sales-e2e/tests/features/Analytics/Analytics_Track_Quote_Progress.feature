@quotetrackprogress @analytics @DR21.10.4
Feature: Scenarios to cover the data layer updates and analytics events trigger on checkout complete page

  Scenario Outline: Validate the quote track progress and generic events for checkout pages for residential plans page
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user initiates the call to capture analytics events
    And user has navigated to 'RES' plans page
    And user validates the quote status for "Plan View"
    When user selects '<planName>'
    And user validates the quote status for "Plan selected"
    And user moves on to fill the qualifier
    And user validates the quote status for "in qualifier"
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                 | movingType | propertyType |
      | RES          | 42 Brownlow Drive, POINT COOK VIC 3030 | Non-Moving | Renter       |
    And user validates details on checkout details page
      | sourceSystem   | journey   | fuelType   |
      | <sourceSystem> | <journey> | <fuelType> |
    And user validates the quote status for "in checkout"
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType   |
      | RES          | RES     | New            | test      | test     | Passport |
    And user selects mailing address option
      | addressType   | otherAddress                           |
      | Other Address | 42 Brownlow Drive, POINT COOK VIC 3030 |
    And user selects "time_of_use" solar tariff type for "VIC"
    And user opts for AAH and DD
      | optAAHOption | optDDOption | directDebitType |
      | Yes           | Yes         | Bank            |
    And user opts for concession card
    Then user validates the data layer is updated for Bill Delivery Preference as 'email'
    When user selects "Post" billing preference option
    Then user validates the data layer is updated for Bill Delivery Preference as 'post'
    Then user validates the data layer is updated for Contact Preference as 'email'
    When user sends welcome pack through 'Post'
    Then user validates the data layer is updated for Contact Preference as 'post'
    When user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user validates the quote status for "in review"
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices                              |
      | No               |      |              |  |
    Then user validates the data layer is updated for Carbon neutral as 'false'
    When user selects carbon neutral option
    Then user validates the data layer is updated for Carbon neutral as 'true'
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user validates the quote status for "in complete"
    And user closes the spy on datalayer
    Examples:
      | customerStatus | fuelType | planName   | folderName                   | sourceSystem | journey         | AAH | DD  | customerType | newOrExisting |
      | New            | BOTH     | Total Plan | Analystics_quotestatus_resi  | Quote Tool   | Plan Switch     | Yes  | Yes | RES          | New           |
  @genericeventscheckout
    Scenario Outline: Validate quote track status for business customer
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user initiates the call to capture analytics events
    And user has navigated to 'BUS' plans page
    Then user validates details on plans page for 'BUS'
    And user validates the quote status for "Plan View"
    When user selects '<planName>'
    And user selects gas '<planName>'
    And user validates the quote status for "Plan selected"
    And user moves on to fill the qualifier
    And user validates the quote status for "in qualifier"
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | customerStatus | connectionAddress                      | movingType | propertyType |
      | BUS          | New            | 73-75 Enmore Road, NEWTOWN NSW 2042    | Moving     |              |
    And user provides all details on checkout details page
      | customerType | journey | firstName | lastName | businessType |
      | BUS          | BUS     | test      | test     | ABN          |
    And user validates the quote status for "in checkout"
    And user validates details on checkout details page
      | sourceSystem   | journey   | fuelType   |
      | <sourceSystem> | <journey> | <fuelType> |
    And user selects mailing address option
      | addressType   | otherAddress                       |
      | Other Address | 68 Mercer Street, GEELONG VIC 3220 |
    And user selects answer for property renovation question for '<state>'
    And user opts for AAH and DD
      | optAAHOption | optDDOption | directDebitType |
      | Yes           | Yes         | Bank            |
    Then user validates the data layer is updated for Bill Delivery Preference as 'email'
    Then user validates the data layer is updated for Contact Preference as 'email'
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user validates the quote status for "in review"
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices  | GaslifeSupportDevices                              |
      | Yes               | BOTH     | Kidney Dialysis Machine | Medically Required Heating and/or Air Conditioning |
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user validates the quote status for "in complete"
    And user closes the spy on datalayer

    Examples:
      | customerStatus | fuelType | planName       | folderName         | state | sourceSystem | journey   | AAH | DD  | customerType | newOrExisting |
      | New            | BOTH     | Total Plan - Business | Analystics_quotestatus_bsme | NSW   | Quote Tool   | Move Home | Yes  | Yes | BUS          | New           |

  Scenario Outline: Validate the quote track status events on offer campaign plans page
    Given user has opened the 'offer' link in a browser and creates 'E2E_Analytics_Offer_Campaign_quotestatus' to save evidences
    And user initiates the call to capture analytics events
    When user provides "2000" and clicks on show me plan link
    Then user validates the page name for 'offer' 'plans' page
    And user validates the quote start page for "Offer Page"
    And user validates the quote status for "Plan View"
    When user clicks on Add plan button
    And user validates the quote status for "in qualifier"
    Then user validates the page name for 'offer' 'qualifier_are_you_new_to_ea' page
    When user selects 'New' on qualifier
    Then user validates the page name for 'offer' 'qualifier_moving' page
    When user selects 'Non-Moving' for moving question on qualifier
    Then user validates the page name for 'offer' 'qualifier_address' page
    When user enters the address '3 River Drive, ATHELSTONE SA 5076' on qualifier
    Then user validates the page name for 'offer' 'qualifier_propertytype' page
    When user selects property type as 'Renter'
    And user validates details on checkout details page
      | sourceSystem   | journey   | fuelType   |
      | <sourceSystem> | <journey> | <fuelType> |
    And user validates the quote status for "in checkout"
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType   |
      | RES          | RES     | New            | test      | test     | Passport |
    And user selects mailing address option
      | addressType   | otherAddress                           |
      | Other Address | 42 Brownlow Drive, POINT COOK VIC 3030 |
    And user opts for AAH and DD
      | optAAHOption | optDDOption | directDebitType |
      | Yes           | Yes         | Bank            |
    Then user validates the data layer is updated for Bill Delivery Preference as 'email'
    When user selects "Post" billing preference option
    Then user validates the data layer is updated for Bill Delivery Preference as 'post'
    Then user validates the data layer is updated for Contact Preference as 'email'
    When user sends welcome pack through 'Post'
    Then user validates the data layer is updated for Contact Preference as 'post'
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user validates the quote status for "in review"
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices                              |
      | No               |      |              |  |
    Then user validates the data layer is updated for Carbon neutral as 'false'
    When user selects carbon neutral option
    Then user validates the data layer is updated for Carbon neutral as 'true'
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user validates the quote status for "in complete"
    And user closes the spy on datalayer
    Examples:
      | customerStatus | fuelType | planName   | folderName                                    | sourceSystem | journey     | AAH | DD  | customerType | newOrExisting |
      | New            | BOTH     | Total Plan | E2E_Analytics_Resi_Checkout_Complete_QuoteID  | Quote Tool   | Plan Switch | Yes  | Yes | RES          | New           |

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
    Then user validates the quote status for "in checkout"
    And user selects plans on checkout details page
      | fuelType | planName   |
      | ELE      | Total Plan |
    And user selects plans on checkout details page
      | fuelType | planName   |
      | GAS      | Total Plan |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user chooses "No" for disconnection
    And user clicks on 'Review your order' button and navigates to review page
    Then user validates the quote status for "in review"
    And user closes the spy on datalayer
    Examples:
      |folderName                      |address                           |username          |password                                     |
      |MyAccount_Resi_quote_status|5 Wilkies Street, BULLI NSW 2516  |nsw_rm_fv@test.com |U2FsdGVkX1+3MyLorZu94Wagym+aqL+FRXYs4GSvHB0= |

  Scenario Outline: Validate the quote track progress for declined quote for residential customer
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user initiates the call to capture analytics events
    And user has navigated to 'RES' plans page
    And user validates the quote status for "Plan View"
    When user selects '<planName>'
    #run after defect fix
    #And user validates the quote status for "Plan selected"
    And user moves on to fill the qualifier
    And user validates the quote status for "in qualifier"
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                 | movingType | propertyType |
      | RES          | 3 River Drive, ATHELSTONE SA 5076 | Non-Moving | Renter       |
    And user validates details on checkout details page
      | sourceSystem   | journey   | fuelType   |
      | <sourceSystem> | <journey> | <fuelType> |
    And user validates the quote status for "in checkout"
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType   |
      | RES          | RES     | New            | decline      | test     | Passport |
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
    And user validates the quote status for "in review"
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices                              |
      | No               |      |              |  |
    And user selects carbon neutral option
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then Your application has been declined is displayed
    And user validates the quote status for "quote decline"
    And user closes the spy on datalayer
    Examples:
      | customerStatus | fuelType | planName   | folderName                                    | sourceSystem | journey     | AAH | DD  | customerType | newOrExisting |
      | New            | BOTH     | Total Plan | Analystics_quotestatus_declined_resi  | Quote Tool   | Plan Switch | No  | Yes | RES          | New           |

