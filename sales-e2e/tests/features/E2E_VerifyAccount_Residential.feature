@E2E @existingcustomerQT
Feature: This feature is to test the verify account scenarios for existing residential customers

  Scenario Outline: Submit a quote for existing non moving residential customer through verify account
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customer_type>' plans page
    Then user validates details on plans page for '<customer_type>'
    And user have selected fuel as "<fuelType>"
    When user clicks on the verify modal window on '<customer_type>' page
    And user verifies the account through verify account journey for residential customer
      | customer_type | modal_option   | elecAccountNumber | gasAccountNumber | postcode | idType | idNumber |
      | RES           | verify account | 8146713614        | 4931329359       | 3218     | dob    | 01011980 |
    And user selects '<planName>'
    And user moves on to fill the qualifier
    And user provides all other details on qualifier page for Existing customer
      | customerType | movingType | propertyType |
      | RES          | Non-Moving | Owner        |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType   |
      | RES          | RES     | Existing       | test      | test     | Medicare |
    And user validates details on checkout details page
      | sourceSystem   | journey   | fuelType   |
      | <sourceSystem> | <journey> | <fuelType> |
    And user selects mailing address option
      | addressType   | otherAddress                             |
      | Other Address | 271 Heatherhill Road, FRANKSTON VIC 3199 |
    And user opts for AAH and DD
      | optAAHOption | optDDOption | directDebitType |
      | Yes          | Yes         | CC              |
    And user opts for concession card
    And user selects "Post" billing preference option
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices                   | GaslifeSupportDevices |
      | Yes               | BOTH     | Intermittent Peritoneal Dialysis Machine | Gas Other             |
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType |
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | PS        | SWSR1-EV | 6203138450 | N                              | N                              | Y                       | LSIPDM                   | POSTMM        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | PS        | SWSR1-GV | 5330236561 | N                              | N                              | Y                       | OTHER                    | POSTMM        |

    Examples:
      | folderName                              | customer_type | fuelType | planName        | sourceSystem | journey     | AAH | DD  | customerType | newOrExisting |
      | E2E_VerifyAccount_Residential_NonMoving | RES           | BOTH     | Total Plan Plus | Quote Tool   | Plan Switch | Yes | Yes | RES          | Existing      |

  @deviceCheck @smoke
  Scenario Outline: Submit a quote for existing moving residential customer through verify account
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customer_type>' plans page
    Then user validates details on plans page for '<customer_type>'
    And user have selected fuel as "<fuelType>"
    When user clicks on the verify modal window on '<customer_type>' page
    And user verifies the account through verify account journey for residential customer
      | customer_type | modal_option   | elecAccountNumber | gasAccountNumber | postcode | idType | idNumber |
      | RES           | verify account | 2397627252        | 1531774526       | 3029     | dob    | 17121980 |
    And user selects '<planName>'
    And user moves on to fill the qualifier
    And user provides all other details on qualifier page for Existing customer
      | customerType | movingType | connectionAddress                        | propertyType |
      | RES          | Moving     | 271 Heatherhill Road, FRANKSTON VIC 3199 | Renter       |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType   |
      | RES          | RES     | Existing       | test      | test     | Passport |
    And user selects answer for property renovation question for '<state>'
    And user validates details on checkout details page
      | sourceSystem   | journey   | fuelType   |
      | <sourceSystem> | <journey> | <fuelType> |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user opts for AAH and DD
      | optAAHOption | optDDOption | directDebitType |
      | No           | Yes         | Bank            |
    And user opts for concession card
    And user chooses "<optDisconnection>" for disconnection
    And user selects final bill option
      | option             | otherAddress |
      | Connection Address |              |
    And user selects "Email" billing preference option
    And user opts for special offer
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices                       | GaslifeSupportDevices        |
      | Yes               | BOTH     | Chronic Positive Airways Pressure Respirator | Medically Required Hot Water |
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType |
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | RCPP-EV  | 6407557087 | N                              | N                              | Y                       | LSCPAPR                  | EMAIL         |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | RCPP-GV  | 5321574765 | N                              | N                              | Y                       | GLSMRHW                  | EMAIL         |

    Examples:
      | folderName                           | customer_type | fuelType | planName  | optDisconnection | state | sourceSystem | journey   | AAH | DD  | customerType | newOrExisting |
      | E2E_VerifyAccount_Residential_Moving | RES           | BOTH     | No Frills | Yes              | VIC   | Quote Tool   | Move Home | No  | Yes | RES          | Existing      |

  Scenario Outline: Submit a quote for QLD existing moving residential customer through verify account
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customer_type>' plans page
    Then user validates details on plans page for '<customer_type>'
    And user have selected fuel as "<fuelType>"
    When user clicks on the verify modal window on '<customer_type>' page
    And user verifies the account through verify account journey for residential customer
      | customer_type | modal_option   | elecAccountNumber | postcode | idType | idNumber  |
      | RES           | verify account | 2397370000        | 4123     | dob     | 30051972 |
    And user selects '<planName>'
    And user moves on to fill the qualifier
    And user provides all other details on qualifier page for Existing customer
      | customerType | movingType | connectionAddress                  | propertyType | state |
      | RES          | Moving     | 36 Cypress Street, KULUIN QLD 4558 | Renter       | QLD   |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType         |
      | RES          | RES     | Existing       | test      | test     | Driver License |
    And user selects answer for property renovation question for '<state>'
    And user chooses "<optDisconnection>" for disconnection
    And user selects final bill option
      | option             | otherAddress |
      | Connection Address |              |
    And user validates details on checkout details page
      | sourceSystem   | journey   | fuelType   |
      | <sourceSystem> | <journey> | <fuelType> |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user opts for AAH and DD
      | optAAHOption | optDDOption | directDebitType |
      | Yes          | Yes         | CC              |
    And user opts for concession card
    And user selects "Email" billing preference option
    And user opts for special offer
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices                       |
      | Yes               | ELE      | Chronic Positive Airways Pressure Respirator |
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType |
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | SWSR1-EQ | QB08556016 | N                              | N                              | Y                       | LSCPAPR                  | EMAIL         |

    Examples:
      | folderName                               | customer_type | fuelType | planName        | optDisconnection | state | sourceSystem | journey   | AAH | DD  | customerType | newOrExisting |
      | E2E_VerifyAccount_QLD_Residential_Moving | RES           | ELE      | Total Plan Plus | Yes              | QLD   | Quote Tool   | Move Home | Yes | Yes | RES          | Existing      |
