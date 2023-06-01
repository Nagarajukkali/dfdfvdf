@newcustomer
Feature:E2E scenario for new residential moving and non moving customer

  @E2E @E2E-Resi
  Scenario Outline: Submit a solar max quote for new residential moving customer
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    Then user validates details on plans page for 'RES'
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                        | movingType | propertyType |
      | RES          | 15 White Street, MOUNT WAVERLEY VIC 3149 | Moving     | Renter       |
    And user validates solar indicator on checkout details page
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType         | medicareType |
      | RES          | RES     | New            | test      | test     | Driver License |              |
    And user selects carbon neutral option
#    And user selects "time_of_use" solar tariff type for "VIC"
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user selects answer for property renovation question for '<state>'
    And user opts for AAH and DD
      | optAAHOption | optDDOption | directDebitType |
      | Yes          | Yes         | CC              |
    And user opts for concession card
    And user selects "Post" billing preference option
    And user sends welcome pack through 'Post'
    And user opts for special offer
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices                         | GaslifeSupportDevices |
      | Yes               | BOTH     | Crigler Najjar Syndrome Phototherapy Equipment | Gas Other             |
    And user verifies selected plan details for '<fuelType>'
#    And user validates "time_of_use" solar tariff type for "<state>" under electricity rates section
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
      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | campaign   | state   |
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | SMAX-EV  | 6407743654 | N                              | N                              | Y                       | LSCNSPE                  | POSTMM        | <campaign> | <state> |
    And user validates the solar details
      | fuelType | solarPowerIndicator | solarNetworkTariffCode | solarTimeOfUse |
      | ELE      | Y                   | FURTOU                 | N              |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | campaign   | state   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | BP2H-GV  | 5310746798 | N                              | N                              | Y                       | OTHER                    | POSTMM        | <campaign> | <state> |

    Examples:
      | customerStatus | fuelType | planName  | folderName                   | state | sourceSystem | journey   | AAH | DD | customerType | newOrExisting | campaign |
      | New            | BOTH     | Solar Max | E2E_New_Resi_SolarMax_Moving | VIC   | Quote Tool   | Move Home | Yes | No | RES          | New           | solarmax |

  Scenario Outline: Submit a solar max quote for new residential non moving customer
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    Then user validates details on plans page for 'RES'
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                    | movingType | propertyType |
      | RES          | 26 Pinehill Drive, PAKENHAM VIC 3810 | Non-Moving | Renter       |
    And user validates solar indicator on checkout details page
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType         | medicareType |
      | RES          | RES     | New            | test      | test     | Driver License |              |
    And user selects carbon neutral option
    And user selects "single_rate" solar tariff type for "VIC"
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user opts for AAH and DD
      | optAAHOption | optDDOption | directDebitType |
      | Yes          | Yes         | CC              |
    And user opts for concession card
    And user selects "Post" billing preference option
    And user sends welcome pack through 'Post'
    And user opts for special offer
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices                         | GaslifeSupportDevices |
      | Yes               | BOTH     | Crigler Najjar Syndrome Phototherapy Equipment | Gas Other             |
    And user verifies selected plan details for '<fuelType>'
    And user validates "single_rate" solar tariff type for "<state>" under electricity rates section
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
      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | campaign   | state   |
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | COR       | SMAX-EV  | 6305573545 | N                              | N                              | Y                       | LSCNSPE                  | POSTMM        | <campaign> | <state> |
    And user validates the solar details
      | fuelType | solarPowerIndicator | solarNetworkTariffCode | solarTimeOfUse |
      | ELE      | Y                   | NAST11S                | N              |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | campaign   | state   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | COR       | BP2H-GV  |      | N                              | N                              | Y                       | OTHER                    | POSTMM        | <campaign> | <state> |

    Examples:
      | customerStatus | fuelType | planName  | folderName                       | state | sourceSystem | journey | AAH | DD | customerType | newOrExisting | campaign |
      | New            | BOTH     | Solar Max | E2E_New_Resi_SolarMax_Non-Moving | VIC   | Quote Tool   | COR     | Yes | No | RES          | New           | solarmax |

  @deviceCheck @smoke @solar
  Scenario Outline: Submit a quote for new residential moving customer
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    Then user validates details on plans page for 'RES'
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                      | movingType | propertyType |
      | RES          | 42 Brownlow Drive, POINT COOK VIC 3030 | Moving     | Renter       |
    And user validates solar indicator on checkout details page
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType         | medicareType |
      | RES          | RES     | New            | test      | test     | Driver License |              |
    And user selects carbon neutral option
    And user selects "time_of_use" solar tariff type for "VIC"
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user selects answer for property renovation question for '<state>'
    And user opts for AAH and DD
      | optAAHOption | optDDOption | directDebitType |
      | Yes          | Yes         | CC              |
    And user opts for concession card
    And user selects "Post" billing preference option
    And user sends welcome pack through 'Post'
    And user opts for special offer
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices                         | GaslifeSupportDevices |
      | Yes               | BOTH     | Crigler Najjar Syndrome Phototherapy Equipment | Gas Other             |
    And user verifies selected plan details for '<fuelType>'
    And user validates "time_of_use" solar tariff type for "<state>" under electricity rates section
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | BP2H-EV  | 6203778288 | N                              | N                              | Y                       | LSCNSPE                  | POSTMM        | <state> | <campaign> |
    And user validates the solar details
      | fuelType | solarPowerIndicator | solarNetworkTariffCode | solarTimeOfUse |
      | ELE      | Y                   | GENR13                 | Y              |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | state   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | BP2H-GV  | 5330733757 | N                              | N                              | Y                       | OTHER                    | POSTMM        | <state> | <campaign> |

    Examples:
      | customerStatus | fuelType | planName   | campaign | folderName          | state | sourceSystem | journey   | AAH | DD | customerType | newOrExisting |
      | New            | BOTH     | Flexi Plan | flexi    | E2E_New_Resi_Moving | VIC   | Quote Tool   | Move Home | Yes | No | RES          | New           |

  @E2E @E2E-Resi
  Scenario Outline: Submit a quote for new residential non moving customer
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    Then user validates details on plans page for 'RES'
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                 | movingType | propertyType |
      | RES          | 3 River Drive, ATHELSTONE SA 5076 | Non-Moving | Renter       |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType   |
      | RES          | RES     | New            | test      | test     | Passport |
    And user selects carbon neutral option
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
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices                              |
      | Yes               | BOTH     | Ele Other              | Medically Required Heating and/or Air Conditioning |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | COR       | BP2H-ES  | 2001245279 | N                              | N                              | Y                       | OTHER                    | EMAIL         | <state> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | state   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | COR       | BP2H-GS  | 5510149276 | N                              | N                              | Y                       | GLSMRHAC                 | EMAIL         | <state> | <campaign> |

    Examples:
      | customerStatus | fuelType | planName   | campaign | folderName             | sourceSystem | journey     | AAH | DD  | customerType | newOrExisting | state |
      | New            | BOTH     | Flexi Plan | flexi    | E2E_New_Resi_NonMoving | Quote Tool   | Plan Switch | No  | Yes | RES          | New           | SA    |

