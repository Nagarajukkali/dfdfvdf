@E2E @existingcustomerQT @smoke @E2E-Resi
Feature:E2E scenario for existing residential moving and non moving customer

  Scenario Outline: Submit a quote for existing residential moving customer
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    Then user validates details on plans page for 'RES'
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      | customerStatus | accountNumber | accountIdentityType | postcodeOrABNACN | idType | idValue  |
      | Existing       | 9880032884    | Postcode            | 3030             | dl    | 841866770 |
    And user provides all other details on qualifier page for Existing customer
      | customerType | movingType | connectionAddress                        | propertyType |
      | RES          | Moving     | 271 Heatherhill Road, FRANKSTON VIC 3199 | Renter       |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType   |
      | RES          | RES     | Existing       | test      | test     | Medicare |
    And user validates details on checkout details page
      | sourceSystem   | journey   | fuelType   | carbonNeutral |
      | <sourceSystem> | <journey> | <fuelType> | Y             |
    And user selects mailing address option
      | addressType   | otherAddress                      |
      | Other Address | 3 River Drive, ATHELSTONE SA 5076 |
    And user selects carbon neutral option
    And user selects answer for property renovation question for '<state>'
    And user chooses "<optDisconnection>" for disconnection
    And user selects final bill option
      | option        | otherAddress                               |
      | Other Address | 271 Heatherhill Road, FRANKSTON  VIC  3199 |
    And user opts for AAH and DD
      | optAAHOption | optDDOption | directDebitType |
      | Yes          | No          |                 |
#    And user opts for concession card
    And user selects "Post" billing preference option
    And user opts for special offer
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | Yes               | BOTH     | Ele Other              | Gas Other             |
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
      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | state   | campaign   |
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | BP2H-EV  | 6407557087 | N                              | N                              | Y                       | OTHER                    | POSTMM        | <state> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | state   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | BP2H-GV  | 5321574765 | N                              | N                              | Y                       | OTHER                    | POSTMM        | <state> | <campaign> |

    Examples:
      | customerStatus | fuelType | planName   | folderName               | campaign | state | optDisconnection | sourceSystem | journey   | AAH | DD | customerType | newOrExisting |
      | Existing       | BOTH     | Flexi Plan | E2E_Existing_Resi_Moving | flexi    | VIC   | Yes              | Quote Tool   | Move Home | Yes | No | RES          | Existing      |

  @deviceCheck
  Scenario Outline: Submit a quote for existing residential non moving customer with LS, select dual fuel and verify gas account
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    Then user validates details on plans page for 'RES'
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      | customerStatus | accountNumber | accountIdentityType | postcodeOrABNACN | idType | idValue  |
      | Existing       | 1662196144    | Postcode            | 3355             | dob    | 01011980 |
    And user provides all other details on qualifier page for Existing customer
      | customerType | movingType | propertyType |
      | RES          | Non-Moving | Owner        |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType         |
      | RES          | RES     | Existing       | test      | test     | Driver License |
    And user validates details on checkout details page
      | sourceSystem   | journey   | fuelType   |
      | <sourceSystem> | <journey> | <fuelType> |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user opts for AAH and DD
      | optAAHOption | optDDOption | directDebitType |
      | No           | Yes         | Bank            |
#    And user opts for concession card
    And user selects "Post" billing preference option
    And user clicks on 'Review your order' button and navigates to review page
    Then Life support section is displayed on Review page as per selected "<fuelType>" and verified "<accountType>"
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices                   | GaslifeSupportDevices        |
      | Yes               | GAS      | Intermittent Peritoneal Dialysis Machine | Medically Required Hot Water |
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
      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | campaign   |
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | PS        | BP2H-EV  | 6203225514 | N                              | N                              | Y                       | LSIPDM                   | POSTMM        | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | PS        | BP2H-GV  | 5330299405 | N                              | N                              | Y                       | GLSMRHW                  | POSTMM        | <campaign> |

    Examples:
      | customerStatus | planName   | folderName                  | fuelType | accountType | sourceSystem | journey     | AAH | DD  | customerType | newOrExisting | campaign |
      | Existing       | Flexi Plan | E2E_Existing_Resi_NonMoving | BOTH     | ELE         | Quote Tool   | Plan Switch | No  | Yes | RES          | Existing      | flexi    |

    #concession card number is required

  Scenario Outline: Submit a quote for QLD existing residential non moving customer
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    Then user validates details on plans page for 'RES'
    When user have selected fuel as "<fuelType>"
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      | customerStatus | accountNumber | accountIdentityType | postcodeOrABNACN | idType | idValue   |
      | Existing       | 2380726412    | Postcode            | 4285             | dl     | 191872476 |
    And user provides all other details on qualifier page for Existing customer
      | customerType | movingType | propertyType |
      | RES          | Non-Moving | Owner        |
    # And user selects new plan from plan unavailable page
    #  |customerType|planName| propertyType |
    #  |RES   | Total Plan | Owner |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType   |
      | RES          | RES     | Existing       | test      | test     | Passport |
    And user validates details on checkout details page
      | sourceSystem   | journey   | fuelType   |
      | <sourceSystem> | <journey> | <fuelType> |
    And user selects mailing address option
      | addressType   | otherAddress                    |
      | Other Address | 1 Ford Close, MCDOWALL QLD 4053 |
    And user opts for AAH and DD
      | optAAHOption | optDDOption | directDebitType |
      | No           | Yes         | Bank            |
    And user opts for concession card
    And user selects "Post" billing preference option
    And user opts for special offer
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices                   | GaslifeSupportDevices |
      | Yes               | ELE      | Intermittent Peritoneal Dialysis Machine |                       |
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
      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | campaign   |
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | PS        | BP2H-EQ  | QB06882633 | N                              | N                              | Y                       | LSIPDM                   | POSTMM        | <campaign> |


    Examples:
      | customerStatus | planName   | folderName                      | fuelType | sourceSystem | journey     | AAH | DD  | customerType | newOrExisting | campaign |
      | Existing       | Flexi Plan | E2E_Existing_Resi_QLD_NonMoving | ELE      | Quote Tool   | Plan Switch | No  | Yes | RES          | Existing      | flexi    |


