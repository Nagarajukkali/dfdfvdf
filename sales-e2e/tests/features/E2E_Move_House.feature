@E2E @existingcustomerQT @E2E-Resi
Feature:E2E scenario for existing residential moving customer through move house

  Scenario Outline: Submit a quote for existing residential customer through move house without AAH and DD
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    When user has navigated to move house page
    And user enters '<movingAddress>' in address field and selects any available moving date
    And user verifies account on qualifier
      | customerStatus | accountNumber | accountIdentityType | postcodeOrABNACN | idType | idValue  |
      | Existing       | 2381921174    | Postcode            | 3727             | dob    | 21021944 |
    And user provides all other details on qualifier page
      | customerType | movingType | connectionAddress                | propertyType |
      | RES          | NA         | 5 Wilkies Street, BULLI NSW 2516 | Renter       |
    And user selects plans on checkout details page
      | fuelType | planName   |
      | ELE      | <planName> |
    And user selects plans on checkout details page
      | fuelType | planName   |
      | GAS      | <planName> |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType         | carbonNeutral |
      | RES          | RES     | Existing       | test      | test     | Driver License | Y             |
    And user selects mailing address option
      | addressType   | otherAddress                             |
      | Other Address | 9 Charming Street, HAMPTON EAST VIC 3188 |
    And user opts for AAH and DD
      | optAAHOption | optDDOption | directDebitType |
      | <AAH>        | <DD>        | CC              |
    And user selects answer for property renovation question for '<state>'
    And user selects "Email" billing preference option
    And user sends welcome pack through 'Email'
#    And user chooses "<optDisconnection>" for disconnection
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
      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | state   | campaign   |
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | BP2H-EN  |     | N                              | N                              | Y                       | OTHER                    | EMAIL         | <state> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | state   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | BP2H-GN  | 5240924834 | N                              | N                              | Y                       | OTHER                    | EMAIL         | <state> | <campaign> |

    Examples:
      | folderName                     | fuelType | state | optDisconnection | movingAddress                    | sourceSystem | journey   | AAH | DD | customerType | newOrExisting | planName   | campaign |
      | E2E_Existing_Resi_MoveHouse_01 | BOTH     | NSW   | Yes              | 5 Wilkies Street, BULLI NSW 2516 | Quote Tool   | Move Home | No  | No | RES          | Existing      | Flexi Plan | flexi    |

  @deviceCheck @smoke
  Scenario Outline: Submit a quote for existing residential customer through move house with AAH and DD
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    When user has navigated to move house page
    And user enters '<movingAddress>' in address field and selects any available moving date
    And user verifies account on qualifier
      | customerStatus | accountNumber | accountIdentityType | postcodeOrABNACN | idType | idValue  |
      | Existing       | 0316864510    | Postcode            | 3630             | dob    | 01011980 |
    And user provides all other details on qualifier page
      | customerType | movingType | connectionAddress                | propertyType |
      | RES          | NA         | 5 Wilkies Street, BULLI NSW 2516 | Renter       |
    And user selects plans on checkout details page
      | fuelType | planName   |
      | ELE      | <planName> |
    And user selects plans on checkout details page
      | fuelType | planName   |
      | GAS      | <planName> |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType         | carbonNeutral |
      | RES          | RES     | Existing       | test      | test     | Driver License | Y             |
    And user opts for AAH and DD
      | optAAHOption | optDDOption | directDebitType |
      | <AAH>        | <DD>        | CC              |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user selects answer for property renovation question for '<state>'
    And user chooses "<optDisconnection>" for disconnection
    And user selects "Post" billing preference option
    And user sends welcome pack through 'Post'
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
      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | state   | campaign   |
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | BP2H-EN  |     | N                              | N                              | Y                       | OTHER                    | POSTMM        | <state> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | state   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | BP2H-GN  | 5240924834 | N                              | N                              | Y                       | OTHER                    | POSTMM        | <state> | <campaign> |

    Examples:
      | folderName                     | fuelType | state | optDisconnection | movingAddress                    | sourceSystem | journey   | AAH | DD  | customerType | newOrExisting | planName   | campaign |
      | E2E_Existing_Resi_MoveHouse_02 | BOTH     | NSW   | No               | 5 Wilkies Street, BULLI NSW 2516 | Quote Tool   | Move Home | Yes | Yes | RES          | Existing      | Flexi Plan | flexi    |

  @solar
  Scenario Outline: Verify the move house journey from move house page with retail solar scheme
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    When user has navigated to move house page
    And user enters '<movingAddress>' in address field and selects any available moving date
    And user verifies account on qualifier
      | customerStatus | accountNumber | accountIdentityType | postcodeOrABNACN | idType | idValue  |
      | Existing       | 0047102000    | Postcode            | 3028             | dob    | 01011980 |
    And user provides all other details on qualifier page
      | customerType | movingType | connectionAddress | propertyType |
      | RES          | NA         |                   | Renter       |
#    Then user validates solar indicator on checkout details page
    And user validates solar government scheme disclaimer under solar buy back rates section
    When user selects plans on checkout details page
      | fuelType | planName   |
      | ELE      | <planName> |
    And user selects plans on checkout details page
      | fuelType | planName   |
      | GAS      | <planName> |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType         |
      | RES          | RES     | Existing       | test      | test     | Driver License |
    And user selects mailing address option
      | addressType   | otherAddress                             |
      | Other Address | 9 Charming Street, HAMPTON EAST VIC 3188 |
    And user selects answer for property renovation question for '<state>'
    And user selects "time_of_use" solar tariff type for "VIC"
    And user chooses "<optDisconnection>" for disconnection
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | Yes               | BOTH     | Ele Other              | Gas Other             |
    And user verifies selected plan details for '<fuelType>'
    And user validates "time_of_use" solar tariff type for "<state>" under electricity rates section
    And user submits the quote
    Then user lands on checkout complete page
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | state   | campaign   |
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | BP2H-EV  | 6203778288 | N                              | N                              | Y                       | OTHER                    | EMAIL         | <state> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | state   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | BP2H-GV  | 5330733757 | N                              | N                              | Y                       | OTHER                    | EMAIL         | <state> | <campaign> |

    Examples:
      | folderName                         | fuelType | state | optDisconnection | movingAddress                          | sourceSystem | journey   | planName   | campaign |
      | E2E_Existing_MoveHouse_RetailSolar | BOTH     | VIC   | No               | 42 Brownlow Drive, POINT COOK VIC 3030 | Quote Tool   | Move Home | Flexi Plan | flexi    |

  @solar
  Scenario Outline: Verify error message displays on address field for moving journey through move house page when solar tariff is missing in MSATS
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    When user has navigated to move house page
    And user enters '<movingAddress>' in address field
    Then error message is displayed for missing solar tariff in MSATS

    Examples:
      | folderName                 | movingAddress                           |
      | E2E_MoveHouseSolar_Unknown | 19 Willington Street, TURRELLA NSW 2205 |

  @solar
  Scenario Outline: Verify solar undetected component displays on address field and checkout details page for moving journey through move house page when MSATS is unable to detect the NMI
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    When user has navigated to move house page
    And user enters '<movingAddress>' in address field
    Then error message is displayed for undetected NMI in MSATS
    When user selects moving date
    And user verifies account on qualifier
      | customerStatus | accountNumber | accountIdentityType | postcodeOrABNACN | idType | idValue  |
      | Existing       | 0047102000    | Postcode            | 3028             | dob    | 01011980 |
    And user provides all other details on qualifier page
      | customerType | movingType | connectionAddress | propertyType |
      | RES          | NA         |                   | Renter       |
    Then user validates solar government scheme disclaimer under solar buy back rates section
    When user selects plans on checkout details page
      | fuelType | planName   |
      | ELE      | <planName> |
    And user selects plans on checkout details page
      | fuelType | planName   |
      | GAS      | <planName> |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType         |
      | RES          | RES     | Existing       | test      | test     | Driver License |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user selects answer for property renovation question for '<state>'
    And user chooses "<optDisconnection>" for disconnection
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
      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | state   | campaign   |
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | BP2H-EV  |     | N                              | N                              | Y                       | OTHER                    | EMAIL         | <state> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | state   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | BP2H-GV  | 5310459101 | N                              | N                              | Y                       | OTHER                    | EMAIL         | <state> | <campaign> |

    Examples:
      | folderName                              | fuelType | state | optDisconnection | movingAddress                            | sourceSystem | journey   | AAH | DD | customerType | newOrExisting | planName   | campaign |
      | E2E_Existing_MoveHouse_SolarUnDetermine | BOTH     | NSW   | No               | Unit 1 297 Dorset Road, CROYDON VIC 3136 | Quote Tool   | Move Home | No  | No | RES          | Existing      | Flexi Plan | flexi    |

