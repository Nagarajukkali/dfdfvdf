@E2E @existingcustomerQT @E2E-Bus
Feature: This feature is to test the verify account scenarios for existing business customers

  @deviceCheck @smoke
  Scenario Outline: Submit a quote for existing non moving business customer with life support for both accounts through verify account
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customer_type>' plans page
    Then user validates details on plans page for '<customer_type>'
    And user have selected fuel as "ELE"
    When user clicks on the verify modal window on '<customer_type>' page
    And user verifies the account through verify account journey for business customer
      | customer_type | modal_option   | elecAccountNumber | ABNOrACN    | idType | idNumber |
      | BUS           | verify account | 2755714048        | 38598741900 | dob    | 01011980 |
#      | BUS           | verify account | 2394508360        | 39642303200 | dob    | 01011980 |
    And user selects '<planName>'
    And user selects gas '<planName>'
    And user moves on to fill the qualifier
    And user provides all other details on qualifier page for Existing customer
      | customerType | movingType |
      | BUS          | Non-Moving |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | businessType |
      | BUS          | BUS     | Existing       | test      | test     | ABN          |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user validates details on checkout details page
      | sourceSystem   | journey   | fuelType   |
      | <sourceSystem> | <journey> | <fuelType> |
    And user opts for AAH and DD
      | optAAHOption | optDDOption | directDebitType |
      | Yes          | Yes         | CC              |
    And user selects "Post" billing preference option
    And user opts for special offer
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    Then Life support section is displayed on Review page as per selected "<fuelType>" and verified "<accountType>"
    And user provides life support details on review page
      | lifeSupportOption | fuelType | GaslifeSupportDevices |
      | Yes               | GAS      | Gas Other             |
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    And user lands on checkout complete page
    And user validates details on checkout complete page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | campaign   |
      | ELE      | VERBALLYACCEPTED | BUSINESS     | PS        | BSPB2-EV | 6203787884 | N                              | N                              | Y                       | LSVFLS                   | POSTMM        | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | campaign   |
      | GAS      | VERBALLYACCEPTED | BUSINESS     | COR       | BSPB2-GV |      | N                              | N                              | Y                       | OTHER                    | POSTMM        | <campaign> |

    Examples:
      | folderName                           | customer_type | fuelType | planName              | accountType | sourceSystem | journey     | AAH | DD  | customerType | newOrExisting | campaign              |
      | E2E_VerifyAccount_Business_NonMoving | BUS           | BOTH     | Business Balance Plan | ELE         | Quote Tool   | Plan Switch | Yes | Yes | BUS          | Existing      | business-balance-plan |

  Scenario Outline: Submit a quote for existing moving business customer through verify account
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customer_type>' plans page
    Then user validates details on plans page for '<customer_type>'
    And user have selected fuel as "GAS"
    When user clicks on the verify modal window on '<customer_type>' page
    And user verifies the account through verify account journey for business customer
      | customer_type | modal_option   | elecAccountNumber | gasAccountNumber | ABNOrACN    | idType | idNumber |
      | BUS           | verify account |                   | 8884398267       | 26857513900 | dob    | 01011980 |
    And user selects '<planName>'
    And user selects ele '<planName>'
    And user moves on to fill the qualifier
    And user provides all other details on qualifier page for Existing customer
      | customerType | movingType | connectionAddress                     | propertyType |
      | BUS          | Moving     | 42 Beauchamp Street, KYNETON VIC 3444 | Renter       |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | businessType |
      | BUS          | BUS     | Existing       | test      | test     | ABN          |
    And user validates details on checkout details page
      | sourceSystem   | journey   | fuelType   |
      | <sourceSystem> | <journey> | <fuelType> |
    And user selects mailing address option
      | addressType   | otherAddress                               |
      | Other Address | 36 Gregory Street West, WENDOUREE VIC 3355 |
    # And user selects answer for property renovation question for '<state>'
    And user selects "Email" billing preference option
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
      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | campaign   |
      | ELE      | VERBALLYACCEPTED | BUSINESS     | ENE       | BSPB2-EV | 6203004526 | N                              | N                              | Y                       | LSCPAPR                  | EMAIL         | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | campaign   |
      | GAS      | VERBALLYACCEPTED | BUSINESS     | ENE       | BSPB2-GV | 5330293713 | N                              | N                              | Y                       | GLSMRHW                  | EMAIL         | <campaign> |

    Examples:
      | folderName                        | customer_type | fuelType | planName              | state | sourceSystem | journey   | AAH | DD | customerType | newOrExisting | campaign              |
      | E2E_VerifyAccount_Business_Moving | BUS           | BOTH     | Business Balance Plan | VIC   | Quote Tool   | Move Home | No  | No | BUS          | Existing      | business-balance-plan |
