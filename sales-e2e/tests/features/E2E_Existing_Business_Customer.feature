@E2E @existingcustomerQT @E2E-Bus
Feature:E2E scenario for existing business moving and non moving customer

  @deviceCheck @smoke @checking
  Scenario Outline: Submit a quote for existing business moving customer
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'BUS' plans page
    Then user validates details on plans page for 'BUS'
    When user selects '<planName>'
    And user selects gas '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      | customerStatus | accountNumber | accountIdentityType | postcodeOrABNACN | idType | idValue  |
      | Existing       | 7185109615    | ABN                 | 33499936800      | dob    | 01011980 |
    And user provides all other details on qualifier page for Existing customer
      | customerType | movingType | connectionAddress                      |
      | BUS          | Moving     | 490 King Street, NEWTOWN NSW 2042 |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | businessType |
      | BUS          | BUS     | Existing       | test      | test     | ABN          |
    And user validates details on checkout details page
      | sourceSystem   | journey   | fuelType   |
      | <sourceSystem> | <journey> | <fuelType> |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user selects answer for property renovation question for '<state>'
    And user opts for AAH and DD
      | optAAHOption | optDDOption | directDebitType |
      | Yes          | Yes         | CC              |
    And user selects "Email" billing preference option
    And user opts for special offer
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices      | GaslifeSupportDevices |
      | Yes               | BOTH     | Ventilator For Life Support | Gas Other             |
    And user verifies selected plan details for '<fuelType>'
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
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
      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType |customerStatus   |campaign  |
      | ELE      | VERBALLYACCEPTED | BUSINESS     | ENE       | BSPB2-EN  | 4103078477 | N                              | N                              | Y                       | LSVFLS                   | EMAIL        |<customerStatus> |<campaign>|
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType |customerStatus   |campaign  |
      | GAS      | VERBALLYACCEPTED | BUSINESS     | ENE       | BSPB2-GN  | 5240177461 | N                              | N                              | Y                       | OTHER                    | EMAIL        |<customerStatus> |<campaign>|

    Examples:
      | customerStatus | fuelType | planName              | folderName              | state | sourceSystem | journey   | AAH | DD  | customerType | newOrExisting |campaign              |
      | Existing       | BOTH     | Business Balance Plan | E2E_Existing_Bus_Moving | NSW   | Quote Tool   | Move Home | Yes | Yes | BUS          | Existing      |business-balance-plan |

  Scenario Outline: Submit a quote for existing business non moving customer with LS, select dual fuel and verify electricity account
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'BUS' plans page
    Then user validates details on plans page for 'BUS'
    When user selects '<planName>'
    And user selects gas '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      | customerStatus | accountNumber | accountIdentityType | postcodeOrABNACN | idType | idValue  |
      | Existing       | 2755714048    | ABN                 | 38598741900      | dob    | 01011980 |
    And user provides all other details on qualifier page for Existing customer
      | customerType | movingType |
      | BUS          | Non-Moving |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | businessType |
      | BUS          | BUS     | Existing       | test      | test     | ABN          |
    And user validates details on checkout details page
      | sourceSystem   | journey   | fuelType   |
      | <sourceSystem> | <journey> | <fuelType> |
    And user selects mailing address option
      | addressType   | otherAddress                               |
      | Other Address | 36 Gregory Street West, WENDOUREE VIC 3355 |
    And user selects "Post" billing preference option
    And user opts for special offer
    And user clicks on 'Review your order' button and navigates to review page
    Then Life support section is displayed on Review page as per selected "<fuelType>" and verified "<accountType>"
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                | GAS      |                        |                       |
    And user verifies selected plan details for '<fuelType>'
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
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
      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType |customerStatus   |campaign  |
      | ELE      | VERBALLYACCEPTED | BUSINESS     | PS        | BSPB2-EV | 6203787884 | N                              | N                              | Y                       | LSOC                     | POSTMM       |<customerStatus> |<campaign>|
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType |customerStatus   |campaign  |
      | GAS      | VERBALLYACCEPTED | BUSINESS     | COR       | BSPB2-GV |            | N                              | N                              | N                       |                          | POSTMM       |<customerStatus> |<campaign>|

    Examples:
      | customerStatus | planName              | folderName                 | fuelType | accountType | sourceSystem | journey     | AAH | DD | customerType | newOrExisting |campaign              |
      | Existing       | Business Balance Plan | E2E_Existing_Bus_NonMoving | BOTH     | ELE         | Quote Tool   | Plan Switch | No  | No | BUS          | Existing      |business-balance-plan |


