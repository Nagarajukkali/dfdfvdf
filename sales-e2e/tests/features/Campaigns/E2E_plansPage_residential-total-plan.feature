@resi-total
Feature:E2E scenario for residential-total-plan
  @DR22.5.5.campaign
  Scenario Outline: Validate complete data for residential-Total-plan for NSW-Ausgrid for new moving customer
    Given user has opened the 'residential-home-page' link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    And user enters '2000' in 'POSTCODE' field
    And user validates "ELE" discount to be "<eleDiscount>" percent for "<planName>" plan
    And user validates "GAS" discount to be "<gasDiscount>" percent for "<planName>" plan
    And user validates the data on 'Residential' plans page for "<campaign>" plan
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|planName |
      | BOTH     | Y                | Y                     | Y                   | N                    | Y                                     | N                               | <state> |    N                 |<planName>|
    And user validates disclaimer on plans page for "<campaign>" plan
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | <planName> | <state> | Y            |    N         |
    When user selects '<planName>'
    And user validates the data on carts page for "<campaign>" plan
      |fuelType |Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill  |state  |Feature_50Credit|
      |ELE      |Y                     |Y                      |Y                                       |<state>|    Y           |
    And user validates the data on carts page for "<campaign>" plan
      |fuelType |Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill  |state  |Feature_50Credit|
      |GAS      |Y                     |Y                      |Y                                       |<state>|    Y           |
    And user moves on to fill the qualifier
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
    And user validates plan details on review page for "<campaign>" plan
      |fuelType |Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill  |state  |Feature_50Credit|
      |ELE      |N                       |Y                    |Y                                       |<state>|    Y           |
    And user validates plan details on review page for "<campaign>" plan
      |fuelType |Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill  |state  |Feature_50Credit|
      |GAS      |N                       |Y                    |Y                                       |<state>|    Y           |
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
      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |state|
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | TOPH-EN  | 4102681649 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |<state>|
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |state|
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | TOPH-GN  | 5240524910 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |<state>|

    Examples:
      |customerStatus|fuelType|planName   |eleDiscount |gasDiscount|campaign  | state |folderName                           |sourceSystem|journey  |state  |customerType |newOrExisting  |AAH |DD  |
      |New           |BOTH    |Total Plan |6          |3         |resi-total   | NSW   |E2E_resi-total-plan_NSW_new_moving   |Quote Tool  |Move Home|NSW    |RES          |New            |No  |No  |


  @DR22.5.5.campaign
  Scenario Outline: Validate complete data for residential-Total-plan for QLD - new moving customer
    Given user has opened the 'residential-home-page' link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    And user enters '4506' in 'POSTCODE' field
    And user validates the data on 'Residential' plans page for "<campaign>" plan
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|planName |
      | ELE     | Y                | Y                     | Y                   | N                    | Y                                     | N                               | <state> |    N                 |<planName>|
    And user validates disclaimer on plans page for "<campaign>" plan
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | <planName> | <state> | Y            |    N         |
    When user selects '<planName>'
    And user validates the data on carts page for "<campaign>" plan
      |fuelType |Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill  |state  |Feature_50Credit|
      |ELE      |Y                     |Y                      |Y                                       |<state>|    Y           |
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
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | Y                | N                     | Y                   | N                   | Y                                     | N                               | <state> |    N                 |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | <planName> | <state> | Y            |    N         |
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
      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |state|
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | TOPH-EQ  | QB08556016 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |<state>|
    Examples:
      | customerStatus | fuelType |planName  | eleDiscount | campaign | folderName                        | state | sourceSystem | journey   | AAH | DD | customerType | newOrExisting |
      | New            | ELE      |Total Plan| 1          | resi-total   | E2E_resi-total-plan_QLD_new_moving | QLD   | Quote Tool   | Move Home | No  | No | RES          | New           |

  @DR22.5.5.campaign
  Scenario Outline: Validate complete data for residential-Total-plan for SA - new non moving
    Given user has opened the 'residential-home-page' link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    And user enters '5044' in 'POSTCODE' field
    And user validates "ELE" discount to be "<eleDiscount>" percent for "<planName>" plan
    And user validates "GAS" discount to be "<gasDiscount>" percent for "<planName>" plan
    And user validates the data on 'Residential' plans page for "<campaign>" plan
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|planName |
      | BOTH     | Y                | Y                     | Y                   | N                    | Y                                     | N                               | <state> |    N                 |<planName>|
    And user validates disclaimer on plans page for "<campaign>" plan
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | <planName> | <state> | Y            |    N         |
    When user selects '<planName>'
    And user validates the data on carts page for "<campaign>" plan
      |fuelType |Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill  |state  |Feature_50Credit|
      |ELE      |Y                     |Y                      |Y                                       |<state>|    Y           |
    And user validates the data on carts page for "<campaign>" plan
      |fuelType |Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill  |state  |Feature_50Credit|
      |GAS      |Y                     |Y                      |Y                                       |<state>|    Y           |
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                 | movingType | propertyType |
      | RES          | 3 River Drive, ATHELSTONE SA 5076 | Non-Moving | Renter       |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType         | medicareType |
      | RES          | RES     | New            | test      | test     | Driver License |              |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | Y                | N                     | Y                   | N                   | Y                                     | N                               | <state> |    N                 |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | GAS      | Y                | N                     | Y                   | N                   | Y                                     | N                               | <state> |    N                 |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | N            | Total Plan | <state> | Y            |    N         |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | COR       | TOPH-ES  | 2001245279 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | COR       | TOPH-GS  | 5510149276 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType |planName  | eleDiscount | gasDiscount | campaign | folderName                          | state | sourceSystem | journey | AAH | DD | customerType | newOrExisting |
      | New            | BOTH     |Total Plan| 1           | 1           | resi-total   | E2E_resi-total-plan_SA_new_nonmoving | SA    | Quote Tool   | COR     | No  | No | RES          | New           |

  @DR22.5.5.campaign
  Scenario Outline: Validate complete data for residential-Total-plan for ACT - new moving
    Given user has opened the 'residential-home-page' link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    And user enters '2600' in 'POSTCODE' field
    And user validates "ELE" discount to be "<eleDiscount>" percent for "<planName>" plan
    And user validates "GAS" discount to be "<gasDiscount>" percent for "<planName>" plan
    And user validates the data on 'Residential' plans page for "<campaign>" plan
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|planName |
      | BOTH     | Y                | Y                     | Y                   | N                    | Y                                     | N                               | <state> |    N                 |<planName>|
    And user validates disclaimer on plans page for "<campaign>" plan
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | <planName> | <state> | Y            |    N         |
    When user selects '<planName>'
    And user validates the data on carts page for "<campaign>" plan
      |fuelType |Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill  |state  |Feature_50Credit|
      |ELE      |Y                     |Y                      |Y                                       |<state>|    Y           |
    And user validates the data on carts page for "<campaign>" plan
      |fuelType |Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill  |state  |Feature_50Credit|
      |GAS      |Y                     |Y                      |Y                                       |<state>|    Y           |
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                    | movingType | propertyType |
      | RES          | 21 Tarrant Crescent, DUNLOP ACT 2615 | Moving     | Renter       |
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
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | Y                | N                     | Y                   | N                   | Y                                     | N                               | <state> |    N                 |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | GAS      | Y                | N                     | Y                   | N                   | Y                                     | N                               | <state> |    N                 |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   |moveHomeCredit|signUpCredit |
      | Y                        | Y         | Y            | Total Plan | <state> |    N         |Y            |
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
      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | TOPH-EA  |     |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | TOPH-GA  | 5260073228 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType |planName  | eleDiscount | gasDiscount | campaign | folderName                        | state | sourceSystem | journey   | AAH | DD | customerType | newOrExisting |
      | New            | ELE      |Total Plan| 3           | 3           | resi-total   | E2E_resi-total-plan_ACT_new_moving | ACT   | Quote Tool   | Move Home | No  | No | RES          | New           |
  @DR22.5.5.campaign
  Scenario Outline: Validate complete data for residential-Total-plan for ACT - new non-moving
    Given user has opened the 'residential-home-page' link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    And user enters '2600' in 'POSTCODE' field
    And user validates "ELE" discount to be "<eleDiscount>" percent for "<planName>" plan
    And user validates "GAS" discount to be "<gasDiscount>" percent for "<planName>" plan
    And user validates the data on 'Residential' plans page for "<campaign>" plan
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|planName |
      | BOTH     | Y                | Y                     | Y                   | N                    | Y                                     | N                               | <state> |    N                 |<planName>|
    And user validates disclaimer on plans page for "<campaign>" plan
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | <planName> | <state> | Y            |    N         |
    When user selects '<planName>'
    And user validates the data on carts page for "<campaign>" plan
      |fuelType |Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill  |state  |Feature_50Credit|
      |ELE      |Y                     |Y                      |Y                                       |<state>|    Y           |
    And user validates the data on carts page for "<campaign>" plan
      |fuelType |Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill  |state  |Feature_50Credit|
      |GAS      |Y                     |Y                      |Y                                       |<state>|    Y           |
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                    | movingType | propertyType |
      | RES          | 21 Tarrant Crescent, DUNLOP ACT 2615 | Non-Moving | Renter       |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType         | medicareType |
      | RES          | RES     | New            | test      | test     | Driver License |              |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
#    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | Y                | N                     | Y                   | N                   | Y                                     | N                               | <state> |    N                 |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | GAS      | Y                | N                     | Y                   | N                   | Y                                     | N                               | <state> |    N                 |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   |moveHomeCredit|signUpCredit |
      | Y                        | Y         | Y            | Total Plan | <state> |    N         |Y            |
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
      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | COR       | TOPH-EA  |     |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | COR       | TOPH-GA  | 5260073228 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType |planName  | eleDiscount | gasDiscount | campaign | folderName                             | state | sourceSystem | journey | AAH | DD | customerType | newOrExisting |
      | New            | ELE      |Total Plan| 3           | 3           | resi-total   | E2E_resi-total-plan_ACT_new_nonmove | ACT   | Quote Tool   | COR     | No  | No | RES          | New           |

  @DR22.5.5.campaign
  Scenario Outline: Validate complete data for residential-Total-plan for ACT - existing non-moving
    Given user has opened the 'residential-home-page' link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    And user enters '2600' in 'POSTCODE' field
    And user validates "ELE" discount to be "<eleDiscount>" percent for "<planName>" plan
    And user validates "GAS" discount to be "<gasDiscount>" percent for "<planName>" plan
    And user validates the data on 'Residential' plans page for "<campaign>" plan
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|planName |
      | BOTH     | Y                | Y                     | Y                   | N                    | Y                                     | N                               | <state> |    N                 |<planName>|
    And user validates disclaimer on plans page for "<campaign>" plan
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | <planName> | <state> | Y            |    N         |
    When user selects '<planName>'
    And user validates the data on carts page for "<campaign>" plan
      |fuelType |Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill  |state  |Feature_50Credit|
      |ELE      |Y                     |Y                      |Y                                       |<state>|    Y           |
    And user validates the data on carts page for "<campaign>" plan
      |fuelType |Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill  |state  |Feature_50Credit|
      |GAS      |Y                     |Y                      |Y                                       |<state>|    Y           |
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      | customerStatus   | accountNumber | accountIdentityType | postcodeOrABNACN | idType | idValue   |
      | <customerStatus> | 8511248943    | Postcode            | 2906             | dob     | 01011980 |
    And user provides all other details on qualifier page for Existing customer
      | customerType | movingType | propertyType |
      | RES          | Non-Moving | Renter       |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType         | medicareType |
      | RES          | RES     | <customerStatus> | test      | test     | Driver License |              |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | N                     | Y                   | N                   | Y                                     | N                               | <state> |    N                 |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | GAS      | N                | N                     | Y                   | N                   | Y                                     | N                               | <state> |    N                 |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   |moveHomeCredit|signUpCredit |
      | Y                        | Y         | Y            | Total Plan | <state> |    N         |N            |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | PS        | TOPH-EA  | 7001111161 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | PS        | TOPH-GA  | 5260060181 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType |planName  | eleDiscount | gasDiscount | campaign | folderName                             | state | sourceSystem | journey | AAH | DD | customerType | newOrExisting |
      | Existing       | ELE      |Total Plan| 3           | 3           | resi-total   | E2E_resi-total-plan_ACT_Exs_nonmove | ACT   | Quote Tool   | Plan Switch | No  | No | RES          | Existing  non-moving |

  @DR22.5.5.campaign
  Scenario Outline: Validate complete data for residential-Total-plan for VIC - new moving
    Given user has opened the 'residential-home-page' link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    And user enters '3000' in 'POSTCODE' field
    And user validates "ELE" discount to be "<eleDiscount>" percent for "<planName>" plan
    And user validates "GAS" discount to be "<gasDiscount>" percent for "<planName>" plan
    And user validates the data on 'Residential' plans page for "<campaign>" plan
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|planName |
      | BOTH     | Y                | Y                     | Y                   | N                    | Y                                     | N                               | <state> |    N                 |<planName>|
    And user validates disclaimer on plans page for "<campaign>" plan
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | <planName> | <state> | Y            |    N         |
    When user selects '<planName>'
    And user validates the data on carts page for "<campaign>" plan
      |fuelType |Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill  |state  |Feature_50Credit|
      |ELE      |Y                     |Y                      |Y                                       |<state>|    Y           |
    And user validates the data on carts page for "<campaign>" plan
      |fuelType |Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill  |state  |Feature_50Credit|
      |GAS      |Y                     |Y                      |Y                                       |<state>|    Y           |
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                   | movingType | propertyType |
      | RES          | 31 Balwyn Road, CANTERBURY VIC 3126 | Moving     | Renter       |
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
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | Y                | N                     | Y                   | N                    | Y                                     | N                               | <state> |    N                 |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | GAS      | Y                | N                     | Y                   | N                    | Y                                     | N                               | <state> |    N                 |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | Total Plan | <state> | Y            |    N         |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | TOPH-EV  | 6102221416 | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | TOPH-GV  | 5310425534 | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType |planName  | eleDiscount | gasDiscount | campaign | folderName                        | state | sourceSystem | journey   | AAH | DD | customerType | newOrExisting |
      | New            | BOTH     |Total Plan| 12           | 33          | resi-total   | E2E_resi-total-plan_VIC_new_moving | VIC   | Quote Tool   | Move Home | No  | No | RES          | New           |

  @DR22.5.5.campaign
  Scenario Outline: Validate complete data for residential-Total-plan for VIC - new non-moving
    Given user has opened the 'residential-home-page' link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    And user enters '3000' in 'POSTCODE' field
    And user validates "ELE" discount to be "<eleDiscount>" percent for "<planName>" plan
    And user validates "GAS" discount to be "<gasDiscount>" percent for "<planName>" plan
    And user validates the data on 'Residential' plans page for "<campaign>" plan
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|planName |
      | BOTH     | Y                | Y                     | Y                   | N                    | Y                                     | N                               | <state> |    N                 |<planName>|
    And user validates disclaimer on plans page for "<campaign>" plan
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | <planName> | <state> | Y            |    N         |
    When user selects '<planName>'
    And user validates the data on carts page for "<campaign>" plan
      |fuelType |Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill  |state  |Feature_50Credit|
      |ELE      |Y                     |Y                      |Y                                       |<state>|    Y           |
    And user validates the data on carts page for "<campaign>" plan
      |fuelType |Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill  |state  |Feature_50Credit|
      |GAS      |Y                     |Y                      |Y                                       |<state>|    Y           |
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                | movingType | propertyType |
      | RES          | 31 Balwyn Road, CANTERBURY VIC 3126 | Non-Moving | Renter       |

    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType         | medicareType |
      | RES          | RES     | New            | test      | test     | Driver License |              |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | Y                | N                     | Y                   | N                    | Y                                     | N                               | <state> |    N                 |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | GAS      | Y                | N                     | Y                   | N                    | Y                                     | N                               | <state> |    N                 |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | Total Plan | <state> | Y            |    N         |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | COR       | TOPH-EV  | 6102221416 | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | COR       | TOPH-GV  | 5310425534 | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType |planName  | eleDiscount | gasDiscount | campaign | folderName                        | state | sourceSystem | journey   | AAH | DD | customerType | newOrExisting |
      | New            | BOTH     |Total Plan| 12           | 33          | resi-total   | E2E_resi-total-plan_VIC_new_non_moving | VIC   | Quote Tool   | COR   | No  | No | RES          | New           |

  @DR22.5.5.campaign
  Scenario Outline: Validate complete data for residential-Total-plan for NSW-Endeavour - new non moving customer
    Given user has opened the 'residential-home-page' link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    And user enters '2516' in 'POSTCODE' field
    And user validates "ELE" discount to be "<eleDiscount>" percent for "<planName>" plan
    And user validates "GAS" discount to be "<gasDiscount>" percent for "<planName>" plan
    And user validates the data on 'Residential' plans page for "<campaign>" plan
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|planName |
      | BOTH     | Y                | Y                     | Y                   | N                    | Y                                     | N                               | <state> |    N                 |<planName>|
    And user validates disclaimer on plans page for "<campaign>" plan
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | <planName> | <state> | Y            |    N         |
    When user selects '<planName>'
    And user validates the data on carts page for "<campaign>" plan
      |fuelType |Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill  |state  |Feature_50Credit|
      |ELE      |Y                     |Y                      |Y                                       |<state>|    Y           |
    And user validates the data on carts page for "<campaign>" plan
      |fuelType |Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill  |state  |Feature_50Credit|
      |GAS      |Y                     |Y                      |Y                                       |<state>|    Y           |
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                | movingType | propertyType |
      | RES          | 15 Wilkies Street, BULLI NSW 2516 | Non-Moving | Renter       |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType         |
      | RES          | RES     | New            | test      | test     | Driver License |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user validates details on checkout details page
      | sourceSystem   | journey   | fuelType   |
      | <sourceSystem> | <journey> | <fuelType> |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | Y                | N                     | Y                   | N                   | Y                                     | N                               | <state> |    N                 |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | GAS      | Y                | N                     | Y                   | N                   | Y                                     | N                               | <state> |    N                 |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | Total Plan | <state> | Y            |    N         |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | COR       | TOPH-EN  | 4311150021 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | COR       | TOPH-GN  |            |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType |planName  | eleDiscount | gasDiscount | campaign | folderName                           | state | sourceSystem | journey | AAH | DD | customerType | newOrExisting |
      | New            | BOTH     |Total Plan| 3           | 3           | resi-total   | E2E_resi-total-plan_NSW_new_nonmoving | NSW   | Quote Tool   | COR     | No  | No | RES          | New           |

  @DR22.5.5.campaign
  Scenario Outline: Validate complete data for residential-Total-plan for VIC existing non moving
    Given user has opened the 'residential-home-page' link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    And user enters '3000' in 'POSTCODE' field
    And user validates "ELE" discount to be "<eleDiscount>" percent for "<planName>" plan
    And user validates "GAS" discount to be "<gasDiscount>" percent for "<planName>" plan
    And user validates the data on 'Residential' plans page for "<campaign>" plan
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|planName |
      | BOTH     | Y                | Y                     | Y                   | N                    | Y                                     | N                               | <state> |    N                 |<planName>|
    And user validates disclaimer on plans page for "<campaign>" plan
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | <planName> | <state> | Y            |    N         |
    When user selects '<planName>'
    And user validates the data on carts page for "<campaign>" plan
      |fuelType |Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill  |state  |Feature_50Credit|
      |ELE      |Y                     |Y                      |Y                                       |<state>|    Y           |
    And user validates the data on carts page for "<campaign>" plan
      |fuelType |Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill  |state  |Feature_50Credit|
      |GAS      |Y                     |Y                      |Y                                       |<state>|    Y           |
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      | customerStatus   | accountNumber | accountIdentityType | postcodeOrABNACN | idType | idValue   |
      | <customerStatus> | 2460862370    | Postcode            | 3806             | dl     | 170599842 |
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
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | N                     | Y                   | N                    | Y                                     | N                               | <state> |    N                 |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | GAS      | N                | N                     | Y                   | N                    | Y                                     | N                               | <state> |    N                 |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | Total Plan | VIC   | N            |    N         |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | PS        | TOPH-EV  | 6305182017 | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | PS        | TOPH-GV  | 5321873049 | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType |planName  | eleDiscount | gasDiscount | campaign | folderName                                 | state | sourceSystem | journey     | AAH | DD | customerType | newOrExisting        |
      | Existing       | BOTH     |Total Plan| 12           | 33          | resi-total   | E2E_resi-total-plan_VIC_existing_non-moving | VIC   | Quote Tool   | Plan Switch | No  | No | RES          | Existing  non-moving |

  @DR22.5.5.campaign
  Scenario Outline: Validate complete data for residential-Total-plan for VIC existing moving
    Given user has opened the 'residential-home-page' link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    And user enters '3000' in 'POSTCODE' field
    And user validates "ELE" discount to be "<eleDiscount>" percent for "<planName>" plan
    And user validates "GAS" discount to be "<gasDiscount>" percent for "<planName>" plan
    And user validates the data on 'Residential' plans page for "<campaign>" plan
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|planName |
      | BOTH     | Y                | Y                     | Y                   | N                    | Y                                     | N                               | <state> |    N                 |<planName>|
    And user validates disclaimer on plans page for "<campaign>" plan
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | <planName> | <state> | Y            |    N         |
    When user selects '<planName>'
    And user validates the data on carts page for "<campaign>" plan
      |fuelType |Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill  |state  |Feature_50Credit|
      |ELE      |Y                     |Y                      |Y                                       |<state>|    Y           |
    And user validates the data on carts page for "<campaign>" plan
      |fuelType |Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill  |state  |Feature_50Credit|
      |GAS      |Y                     |Y                      |Y                                       |<state>|    Y           |
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      | customerStatus   | accountNumber | accountIdentityType | postcodeOrABNACN | idType | idValue   |
      | <customerStatus> | 7300591603    | Postcode            | 3074             | dob     | 01011980 |
    And user provides all other details on qualifier page for Existing customer
      | customerType | connectionAddress                   | movingType | propertyType |
      | RES          |107 Cedar Street, THOMASTOWN VIC 3074| Moving     | Renter       |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus   | firstName | lastName | idType         |
      | RES          | RES     | <customerStatus> | test      | test     | Driver License |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | N                     | Y                   | N                    | Y                                     | N                               | <state> |    Y                 |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | GAS      | N                | N                     | Y                   | N                    | Y                                     | N                               | <state> |    Y                 |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | Total Plan | VIC   | N            |    Y         |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE        | TOPH-EV  | 6305223703 | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | ENE        | TOPH-GV  | 5321264636 | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType |planName  | eleDiscount | gasDiscount | campaign | folderName                             | state | sourceSystem | journey   | AAH | DD | customerType | newOrExisting        |
      | Existing       | BOTH     |Total Plan| 12           | 33          | resi-total   | E2E_resi-total-plan_VIC_existing_moving | VIC   | Quote Tool   | Move Home | No  | No | RES          | Existing  non-moving |

  @DR22.5.5.campaign
  Scenario Outline: Validate complete data for residential-Total-plan for NSW-Endeavour existing non moving
    Given user has opened the 'residential-home-page' link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    And user enters '2761' in 'POSTCODE' field
    And user validates "ELE" discount to be "<eleDiscount>" percent for "<planName>" plan
    And user validates "GAS" discount to be "<gasDiscount>" percent for "<planName>" plan
    And user validates the data on 'Residential' plans page for "<campaign>" plan
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|planName |
      | BOTH     | Y                | Y                     | Y                   | N                    | Y                                     | N                               | <state> |    N                 |<planName>|
    And user validates disclaimer on plans page for "<campaign>" plan
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | <planName> | <state> | Y            |    N         |
    When user selects '<planName>'
    And user validates the data on carts page for "<campaign>" plan
      |fuelType |Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill  |state  |Feature_50Credit|
      |ELE      |Y                     |Y                      |Y                                       |<state>|    Y           |
    And user validates the data on carts page for "<campaign>" plan
      |fuelType |Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill  |state  |Feature_50Credit|
      |GAS      |Y                     |Y                      |Y                                       |<state>|    Y           |
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      | customerStatus   | accountNumber | accountIdentityType | postcodeOrABNACN | idType | idValue  |
#      | <customerStatus> | 6942134043    | Postcode            | 2529             | dob    | 01011980 |
#      | <customerStatus> | 2407416072    | Postcode            | 2529             | dob    | 01011980 |
      | <customerStatus> | 8777791000    | Postcode            | 2761             | dob    | 01011980 |
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
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | N                     | Y                   | N                   | Y                                     | N                               | <state> |    N                 |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | Total Plan | NSW   | N            |    N         |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | PS        | TOPH-EN  | 4310205783 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | PS       | TOPH-GN  | 5240151444 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |

    Examples:
      | customerStatus | fuelType |planName  | eleDiscount | gasDiscount | campaign | folderName                                 | state | sourceSystem | journey     | AAH | DD | customerType | newOrExisting        |
      | Existing       | BOTH     |Total Plan| 3           | 3           | resi-total   | E2E_resi-total-plan_NSW_existing_non-moving | NSW   | Quote Tool   | Plan Switch | No  | No | RES          | Existing  non-moving |

  @DR22.5.5.campaign
  Scenario Outline: Validate complete data for residential-Total-plan for SA existing non moving
    Given user has opened the 'residential-home-page' link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    And user enters '5000' in 'POSTCODE' field
    And user validates "ELE" discount to be "<eleDiscount>" percent for "<planName>" plan
    And user validates "GAS" discount to be "<gasDiscount>" percent for "<planName>" plan
    And user validates the data on 'Residential' plans page for "<campaign>" plan
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|planName |
      | BOTH     | Y                | Y                     | Y                   | N                    | Y                                     | N                               | <state> |    N                 |<planName>|
    And user validates disclaimer on plans page for "<campaign>" plan
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | <planName> | <state> | Y            |    N         |
    When user selects '<planName>'
    And user validates the data on carts page for "<campaign>" plan
      |fuelType |Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill  |state  |Feature_50Credit|
      |ELE      |Y                     |Y                      |Y                                       |<state>|    Y           |
    And user validates the data on carts page for "<campaign>" plan
      |fuelType |Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill  |state  |Feature_50Credit|
      |GAS      |Y                     |Y                      |Y                                       |<state>|    Y           |
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      | customerStatus   | accountNumber | accountIdentityType | postcodeOrABNACN | idType | idValue   |
#      | <customerStatus> | 7296521692    | Postcode            | 5163             | dl     | 107164445 |
      | <customerStatus> | 4726816108    | Postcode            | 5023             | dl     | 394195693 |
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
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | N                     | Y                   | N                   | Y                                     | N                               | <state> |    N                 |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | GAS      | N                | N                     | Y                   | N                   | Y                                     | N                               | <state> |    N                 |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | Total Plan | SA    | N            |    N         |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | PS        | TOPH-ES  | 2001219800 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | PS        | TOPH-GS  | 5510177350 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType |planName  | eleDiscount | gasDiscount | campaign | folderName                                | state | sourceSystem | journey     | AAH | DD | customerType | newOrExisting        |
      | Existing       | BOTH     |Total Plan| 1           | 1           | resi-total   | E2E_resi-total-plan_SA_existing_non-moving | SA    | Quote Tool   | Plan Switch | No  | No | RES          | Existing  non-moving |

  @DR22.5.5.campaign
  Scenario Outline: Validate complete data for residential-Total-plan for QLD existing non moving
    Given user has opened the 'residential-home-page' link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    And user enters '4053' in 'POSTCODE' field
    And user validates the data on 'Residential' plans page for "<campaign>" plan
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|planName |
      | ELE      | Y                | Y                     | Y                   | N                    | Y                                     | N                               | <state> |    N                 |<planName>|
    And user validates disclaimer on plans page for "<campaign>" plan
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | <planName> | <state> | Y            |    N         |
    When user selects '<planName>'
    And user validates the data on carts page for "<campaign>" plan
      |fuelType |Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill  |state  |Feature_50Credit|
      |ELE      |Y                     |Y                    |Y                                       |<state>|    Y           |
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      | customerStatus   | accountNumber | accountIdentityType | postcodeOrABNACN | idType | idValue   |
    #  | <customerStatus> | 4968819589    | Postcode            | 4077             | dob     | 01011980 |
#      | <customerStatus> | 8401947303    | Postcode            | 4504             | dl     | 233698026 |
      | <customerStatus> | 4959453636    | Postcode            | 4115             | dl     | 340201187 |
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
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | N                     | Y                   | N                   | Y                                     | N                               | <state> |    N                 |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | Total Plan | QLD   | N            |    N         |
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
#      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | PS        | TOPH-EQ  | 3114744490 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | PS        | TOPH-EQ  | QB06811396 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType |planName  | eleDiscount | campaign | folderName                                 | state | sourceSystem | journey     | AAH | DD | customerType | newOrExisting        |
      | Existing       | ELE      |Total Plan| 1           | resi-total   | E2E_resi-total-plan_QLD_existing_non-moving | QLD   | Quote Tool   | Plan Switch | No  | No | RES          | Existing  non-moving |
