
Feature:E2E scenario for residential-balance-canstarblue-plan
  @DR22.3.3.campaign
  Scenario Outline: Validate complete data for residential-balance-plan for NSW-Ausgrid for new moving customer
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "2000" and clicks on show me plan link
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
      | BOTH     | Y                     | Y                     | Y                                     | <state> |    Y                 |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName     | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | <planName> | <state> | N            |    Y         |
     And user clicks on Add plan button
#    And user validates plan details on cart page for "<campaign>"
#      | fuelType | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
#      | ELE      | Y                     | Y                     | Y                                     | <state> |    Y                 |
#    And user validates plan details on cart page for "<campaign>"
#      | fuelType | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
#      | GAS      | Y                     | Y                     | Y                                     | <state> |    Y                 |
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                   | movingType | propertyType |
      | RES          | 74 Yillowra Street, AUBURN NSW 2144 | Moving     | Renter       |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType         |
      | RES          | RES     | New            | test      | test     | Driver License |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user validates details on checkout details page
      | sourceSystem   | journey   | fuelType   |
      | <sourceSystem> | <journey> | <fuelType> |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
      | ELE      | N                     | Y                     | Y                                     | <state> |    Y                 |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
      | GAS      | N                     | Y                     | Y                                     | <state> |    Y                 |
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
      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   | state   |
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | TAPR1-EN | 4102681649 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> | <state> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   | state   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | TAPR1-GN | 5240524910 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> | <state> |

    Examples:
      | customerStatus | fuelType | planName     | eleDiscount | gasDiscount | campaign            | folderName                                  | sourceSystem | journey   | state | customerType | newOrExisting | AAH | DD |
      | New            | BOTH     | Balance Plan | 10           | 8           | balance-canstarblue | E2E_residential-balance-canstarblue_NSW_new_moving | Quote Tool   | Move Home | NSW   | RES          | New           | No  | No |
  @DR22.3.3.campaign
  Scenario Outline: Validate complete data for residential-balance-plan for VIC for new moving customer
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "3000" and clicks on show me plan link
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
      | BOTH     | Y                     | Y                     | Y                                     | <state> |    Y                 |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | <planName> | <state> | N            |    Y         |
     And user clicks on Add plan button
#    And user validates plan details on cart page for "<campaign>"
#      | fuelType | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
#      | ELE      | Y                     | Y                     | Y                                     | <state> |    Y                 |
#    And user validates plan details on cart page for "<campaign>"
#      | fuelType | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
#      | GAS      | Y                     | Y                     | Y                                     | <state> |    Y                 |
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                   | movingType | propertyType |
      | RES          | 31 Balwyn Road, CANTERBURY VIC 3126 | Moving     | Renter       |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType         |
      | RES          | RES     | New            | test      | test     | Driver License |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user validates details on checkout details page
      | sourceSystem   | journey   | fuelType   |
      | <sourceSystem> | <journey> | <fuelType> |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
      | ELE      | N                     | Y                     | Y                                     | <state> |    Y                 |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
      | GAS      | N                     | Y                     | Y                                     | <state> |    Y                 |
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
      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   | state   |
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | TAPR1-EV | 6102221416 | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> | <state> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   | state   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | TAPR1-GV | 5310425534 | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> | <state> |

    Examples:
      | customerStatus | fuelType | planName     | eleDiscount | gasDiscount | campaign            | folderName                                  | sourceSystem | journey   | state | customerType | newOrExisting | AAH | DD |
      | New            | BOTH     | Balance Plan | 6           | 11          | balance-canstarblue | E2E_residential-balance-canstarblue_VIC_new_moving | Quote Tool   | Move Home | VIC   | RES          | New           | No  | No |
  @DR22.3.3.campaign
  Scenario Outline: Validate complete data for residential-balance-plan for SA for new non-moving customer
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "5000" and clicks on show me plan link
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
      | BOTH     | Y                     | Y                     | Y                                     | <state> |    Y                 |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | <planName> | <state> | N            |    Y         |
     And user clicks on Add plan button
#    And user validates plan details on cart page for "<campaign>"
#      | fuelType | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
#      | ELE      | Y                     | Y                     | Y                                     | <state> |    Y                 |
#    And user validates plan details on cart page for "<campaign>"
#      | fuelType | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
#      | GAS      | Y                     | Y                     | Y                                     | <state> |    Y                 |
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                 | movingType | propertyType |
      | RES          | 3 River Drive, ATHELSTONE SA 5076 | Non-Moving | Renter       |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType         |
      | RES          | RES     | New            | test      | test     | Driver License |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user validates details on checkout details page
      | sourceSystem   | journey   | fuelType   |
      | <sourceSystem> | <journey> | <fuelType> |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
      | ELE      | N                     | Y                     | Y                                     | <state> |    Y                 |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
      | GAS      | N                     | Y                     | Y                                     | <state> |    Y                 |
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
      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   | state   |
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | COR       | TAPR1-ES | 2001245279 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> | <state> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   | state   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | COR       | TAPR1-GS | 5510149276 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> | <state> |

    Examples:
      | customerStatus | fuelType | planName     | eleDiscount | gasDiscount | campaign            | folderName                                     | sourceSystem | journey | state | customerType | newOrExisting | AAH | DD |
      | New            | BOTH     | Balance Plan | 3           | 8           | balance-canstarblue | E2E_residential-balance-canstarblue_SA_new_non_moving | Quote Tool   | COR     | SA    | RES          | New           | No  | No |
  @DR22.3.3.campaign
  Scenario Outline: Validate complete data for residential-balance-plan for ACT for new moving customer
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "2600" and clicks on show me plan link
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
      | BOTH     | Y                     | Y                     | Y                                     | <state> |    Y                 |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | <planName> | <state> | N            |    Y         |
     And user clicks on Add plan button
#    And user validates plan details on cart page for "<campaign>"
#      | fuelType | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
#      | ELE      | Y                     | Y                     | Y                                     | <state> |    Y                 |
#    And user validates plan details on cart page for "<campaign>"
#      | fuelType | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
#      | GAS      | Y                     | Y                     | Y                                     | <state> |    Y                 |
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                    | movingType | propertyType |
      | RES          | 21 Tarrant Crescent, DUNLOP ACT 2615 | Moving     | Renter       |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType         |
      | RES          | RES     | New            | test      | test     | Driver License |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user validates details on checkout details page
      | sourceSystem   | journey   | fuelType   |
      | <sourceSystem> | <journey> | <fuelType> |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
      | ELE      | N                     | Y                     | Y                                     | <state> |    Y                 |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
      | GAS      | N                     | Y                     | Y                                     | <state> |    Y                 |
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
      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   | state   |
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | TAPR1-EA |     |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> | <state> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   | state   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | TAPR1-GA | 5260073228 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> | <state> |

    Examples:
      | customerStatus | fuelType | planName     | eleDiscount | gasDiscount | campaign            | folderName                                  | sourceSystem | journey   | state | customerType | newOrExisting | AAH | DD |
      | New            | BOTH     | Balance Plan | 5           | 8           | balance-canstarblue | E2E_residential-balance-canstarblue_ACT_new_moving | Quote Tool   | Move Home | ACT   | RES          | New           | No  | No |

  @DR22.3.3.campaign
  Scenario Outline: Validate complete data for residential-balance-plan campaign for QLD - new moving customer
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "4506" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
      | ELE     | Y                     | Y                     | Y                                     | <state> |    Y                 |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName     | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | <planName> | <state> | N            |    Y         |
    And user clicks on Select plan button
#    And user validates plan details on cart page for "<campaign>"
#      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
#      | ELE      | N                | Y                     | Y                   | Y                                     | <state> |    Y                 |
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                  | movingType | propertyType |
      | RES          | 36 Cypress Street, KULUIN QLD 4558 | Moving     | Renter       |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType         | medicareType |
      | RES          | RES     | New            | test      | test     | Driver License |              |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
      | ELE      | N                     | Y                     | Y                                     | <state> |    Y                 |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName        | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | Total Plan Plus | <state> | N            |    Y         |
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
      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | TAPR1-EQ  | QB08556016 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType | planName     |eleDiscount | campaign            | folderName                                 | state | sourceSystem | journey   | AAH | DD | customerType | newOrExisting |
      | New            | ELE      | Balance Plan |7          | balance-canstarblue | E2E_Campaign_balance-canstarblue_QLD_new_moving | QLD   | Quote Tool   | Move Home | No  | No | RES          | New           |

  @DR22.3.3.campaign
  Scenario Outline: Validate complete data for residential-balance-plan campaign for VIC - existing non moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "3031" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_variableRates | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
      | ELE      | Y                     | Y                     | N                   | Y                                  | <state> |    Y                 |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_variableRates | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
      | GAS      | Y                     | Y                     | N                   | Y                                  | <state> |    Y                 |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   |moveHomeCredit|
      | Y                        | Y         | Y            | <planName> | <state> |    Y         |
    And user clicks on Add plan button
#    And user validates plan details on cart page for "<campaign>"
#      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
#      | ELE      | N                | Y                     | Y                   | Y                                  | <state> |    Y                 |
#    And user validates plan details on cart page for "<campaign>"
#      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
#      | GAS      | N                | Y                     | Y                   | Y                                  | <state> |    Y                 |
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      | customerStatus   | accountNumber | accountIdentityType | postcodeOrABNACN | idType | idValue   |
      | <customerStatus> | 7300591603    | Postcode            | 3074             | dob     | 01011980 |
    And user provides all other details on qualifier page for Existing customer
      | customerType | movingType | propertyType |
      | RES          | Non-Moving | Renter       |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus   | firstName | lastName | idType         |
      | RES          | RES     | <customerStatus> | test      | test     | Driver License |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_variableRates | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | Y                     | N                     | N                   | Y                                  | N                               | <state> |    N                 |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_variableRates | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | GAS      | Y                     | N                     | N                   | Y                                  | N                               | <state> |    N                 |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   |moveHomeCredit|
      | Y                        | Y         | Y            | <planName> | <state> |    N         |
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
      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | PS        | TAPR1-EV | 6305223703 | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | PS        | TAPR1-GV | 5321264636 | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType | planName     |eleDiscount | gasDiscount | campaign            | folderName                                   | state | sourceSystem | journey     | AAH | DD | customerType | newOrExisting |
      | Existing       | BOTH     | Balance Plan |6          | 11          | balance-canstarblue | E2E_Campaign_balance-canstarblue_VIC_exis_nonmov | VIC   | Quote Tool   | Plan Switch | No  | No | RES          | Existing      |

  @DR22.3.3.campaign
  Scenario Outline: Validate complete data for residential-balance-plan campaign for NSW-Endeavour - existing non moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "2529" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_variableRates | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
      | ELE      | Y                     | Y                     | N                   | Y                                  | <state> |    Y                 |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_variableRates | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
      | GAS      | Y                     | Y                     | N                   | Y                                  | <state> |    Y                 |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   |moveHomeCredit|
      | Y                        | Y         | Y            | <planName> | <state> |    Y         |
    And user clicks on Add plan button
#    And user validates plan details on cart page for "<campaign>"
#      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
#      | ELE      | N                | Y                     | Y                   | Y                                  | <state> |    Y                 |
#    And user validates plan details on cart page for "<campaign>"
#      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
#      | GAS      | N                | Y                     | Y                   | Y                                  | <state> |    Y                 |
#    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      | customerStatus   | accountNumber | accountIdentityType | postcodeOrABNACN | idType | idValue  |
      | <customerStatus> | 6942134043    | Postcode            | 2529             | dob    | 01011980 |
    And user provides all other details on qualifier page for Existing customer
      | customerType | movingType | propertyType |
      | RES          | Non-Moving | Renter       |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus   | firstName | lastName | idType         |
      | RES          | RES     | <customerStatus> | test      | test     | Driver License |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_variableRates | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | Y                     | N                     | N                   | Y                                  | N                               | <state> |    N                 |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state |moveHomeCredit|
      | Y                        | Y         | Y            | <planName> | NSW   |    Y         |
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      | sourceSystem   | journey   | fuelType | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | ELE      | <AAH> | <DD> | <customerType> | <newOrExisting> |
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | PS        | TAPR1-EN | 4310882164 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | PS       | TAPR1-GN  | 5240869476 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |

    Examples:
      | customerStatus | fuelType | planName     |eleDiscount | gasDiscount | campaign            | folderName                                   | state | sourceSystem | journey     | AAH | DD | customerType | newOrExisting |
      | Existing       | ELE      | Balance Plan |8          | 8          | balance-canstarblue | E2E_Campaign_balance-canstarblue_NSW_exis_nonmov | NSW   | Quote Tool   | Plan Switch | No  | No | RES          | Existing      |

  @DR22.3.3.campaign
  Scenario Outline: Validate complete data for residential-balance-plan campaign for SA - existing non moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "5000" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_variableRates | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
      | ELE      | Y                     | Y                     | N                   | Y                                  | <state> |    Y                 |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_variableRates | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
      | GAS      | Y                     | Y                     | N                   | Y                                  | <state> |    Y                 |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   |moveHomeCredit|
      | Y                        | Y         | Y            | <planName> | <state> |   Y          |
    And user clicks on Add plan button
#    And user validates plan details on cart page for "<campaign>"
#      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
#      | ELE      | Y                | Y                     | Y                   | Y                                  | <state> |    N                 |
#    And user validates plan details on cart page for "<campaign>"
#      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
#      | GAS      | Y                | Y                     | Y                   | Y                                  | <state> |    N                 |
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      | customerStatus   | accountNumber | accountIdentityType | postcodeOrABNACN | idType | idValue   |
      | <customerStatus> | 7296521692    | Postcode            | 5163             | dl     | 107164445 |
    And user provides all other details on qualifier page for Existing customer
      | customerType | movingType | propertyType |
      | RES          | Non-Moving | Renter       |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus   | firstName | lastName | idType         |
      | RES          | RES     | <customerStatus> | test      | test     | Driver License |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_variableRates | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | Y                     | N                     | N                   | Y                                  | N                               | <state> |    N                 |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_variableRates | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | GAS      | Y                     | N                     | N                   | Y                                  | N                               | <state> |    N                 |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   |moveHomeCredit|
      | Y                        | Y         | Y            | <planName> | <state> |    N         |
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
      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | PS        | TAPR1-ES | 2001374637 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | PS        | TAPR1-GS | 5510368960 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType | planName     |eleDiscount | gasDiscount | campaign            | folderName                                  | state | sourceSystem | journey     | AAH | DD | customerType | newOrExisting |
      | Existing       | ELE      | Balance Plan |3           | 8          | balance-canstarblue | E2E_Campaign_balance-canstarblue_SA_exis_nonmov | SA    | Quote Tool   | Plan Switch | No  | No | RES          | Existing      |
