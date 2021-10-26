
Feature:E2E scenario for residential-balance-canstarblue-plan
  @DR21.10.4.campaign
  Scenario Outline: Validate complete data for residential-balance-plan for NSW-Ausgrid for new moving customer
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "2000" and clicks on show me plan link
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | state   |
      | BOTH     | Y                     | Y                     | Y                                     | <state> |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName              | state   | signUpCredit |
      | Y                        | Y         | Y            | Business Balance Plan | <state> | N            |
     And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | state   |
      | ELE      | Y                     | Y                     | Y                                     | <state> |
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | state   |
      | GAS      | Y                     | Y                     | Y                                     | <state> |
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
      | fuelType | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | state   |
      | ELE      | N                     | Y                     | Y                                     | <state> |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | state   |
      | GAS      | N                     | Y                     | Y                                     | <state> |
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
      | New            | BOTH     | Balance Plan | 9           | 8           | balance-canstarblue | E2E_residential-balance-canstarblue_NSW_new_moving | Quote Tool   | Move Home | NSW   | RES          | New           | No  | No |
  @DR21.10.4.campaign
  Scenario Outline: Validate complete data for residential-balance-plan for VIC for new moving customer
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "3000" and clicks on show me plan link
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | state   |
      | BOTH     | Y                     | Y                     | Y                                     | <state> |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName              | state   | signUpCredit |
      | Y                        | Y         | Y            | Business Balance Plan | <state> | N            |
     And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | state   |
      | ELE      | Y                     | Y                     | Y                                     | <state> |
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | state   |
      | GAS      | Y                     | Y                     | Y                                     | <state> |
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
      | fuelType | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | state   |
      | ELE      | N                     | Y                     | Y                                     | <state> |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | state   |
      | GAS      | N                     | Y                     | Y                                     | <state> |
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
      | New            | BOTH     | Balance Plan | 6           | 13          | balance-canstarblue | E2E_residential-balance-canstarblue_VIC_new_moving | Quote Tool   | Move Home | VIC   | RES          | New           | No  | No |
  @DR21.10.4.campaign
  Scenario Outline: Validate complete data for residential-balance-plan for SA for new non-moving customer
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "5000" and clicks on show me plan link
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | state   |
      | BOTH     | Y                     | Y                     | Y                                     | <state> |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName              | state   | signUpCredit |
      | Y                        | Y         | Y            | Business Balance Plan | <state> | N            |
     And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | state   |
      | ELE      | Y                     | Y                     | Y                                     | <state> |
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | state   |
      | GAS      | Y                     | Y                     | Y                                     | <state> |
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
      | fuelType | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | state   |
      | ELE      | N                     | Y                     | Y                                     | <state> |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | state   |
      | GAS      | N                     | Y                     | Y                                     | <state> |
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
      | New            | BOTH     | Balance Plan | 3           | 7           | balance-canstarblue | E2E_residential-balance-canstarblue_SA_new_non_moving | Quote Tool   | COR     | SA    | RES          | New           | No  | No |
  @DR21.10.4.campaign
  Scenario Outline: Validate complete data for residential-balance-plan for ACT for new moving customer
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "2600" and clicks on show me plan link
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | state   |
      | BOTH     | Y                     | Y                     | Y                                     | <state> |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName              | state   | signUpCredit |
      | Y                        | Y         | Y            | Business Balance Plan | <state> | N            |
     And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | state   |
      | ELE      | Y                     | Y                     | Y                                     | <state> |
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | state   |
      | GAS      | Y                     | Y                     | Y                                     | <state> |
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
      | fuelType | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | state   |
      | ELE      | N                     | Y                     | Y                                     | <state> |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | state   |
      | GAS      | N                     | Y                     | Y                                     | <state> |
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
      | New            | BOTH     | Balance Plan | 5           | 7           | balance-canstarblue | E2E_residential-balance-canstarblue_ACT_new_moving | Quote Tool   | Move Home | ACT   | RES          | New           | No  | No |


