@campaign
  #For any campaign changes need to verify/update below steps:
  # 1. Update respective json file if require in this path sales-e2e/resources/campaignData/
  # 2. Provide Y/N for features as per the change in this step "And user validates the data on plans page for "<campaign>""
  # 3. Provide Y/N for disclaimers as per the change in this step "And user validates disclaimer on plans page for "<campaign>""
  # 4. Provide Y/N for features as per the change in this step "And user validates plan details on cart page for "<campaign>""
  # 5. Provide Y/N for features as per the change in this step "And user validates plan details on review page for "<campaign>""
  # 6. Provide Y/N for disclaimers as per the change in this step "And user validates disclaimer on review page for "<campaign>""
  # 7. Update Source Code if require in this step "And user validates source code"
  # 8. Update the Journey Moving/Non-Moving if require in this step "And user provides all other details on qualifier page"
  # 9. If journey change from Moving to Non-Moving then update offerType to COR/PS accordingly in this step "And user validates below mandatory fields"

Feature:E2E scenario for solarmax campaign

  @DR22.10.2.campaign
  Scenario Outline: Validate complete data for residential-SolarFlexi-plan for NSW-Ausgrid for new moving customer
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "2000" for postcode and proceed to view the plans
    # And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_highSolarFIT | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|planName |
      | BOTH     | N                | Y                     | Y                    | Y                    | Y                                     | N                               | <state> |    N                 |<planName>|
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | <planName> | <state> | N            |    N         |
    When user clicks on Select plans button
    # And user validates the data on carts page for "<campaign>" plan
    #   |fuelType |Feature_carbonNeutral | Feature_variableRates | Feature_highSolarFIT  |state  |Feature_50Credit|
    #   |ELE      |Y                     |Y                      | Y                     |<state>|    Y           |
    # And user validates the data on carts page for "<campaign>" plan
    #   |fuelType |Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill  |state  |Feature_50Credit|
    #   |GAS      |Y                     |Y                      | Y                                      |<state>|    Y           |
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                          | movingType | propertyType |
      | RES          | 21 Wimbledon Avenue, NORTH NARRABEEN NSW 2101 | Moving     | Renter    |
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
      |fuelType |Feature_carbonNeutral | Feature_variableRates | Feature_highSolarFIT  |state  |Feature_50Credit|
      |ELE      |N                       |Y                    |Y                      |<state>|    N           |
    And user validates plan details on review page for "<campaign>" plan
      |fuelType |Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill  |state  |Feature_50Credit|
      |GAS      |N                       |Y                    |Y                                       |<state>|    N           |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | SMAX-EN  | 4103382788 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |<state>|
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |state|
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | BP2H-GN  | 5240360179 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |<state>|

    Examples:
      |customerStatus|fuelType|planName               |eleDiscount |gasDiscount|campaign  | state |folderName                           |sourceSystem|journey  |state  |customerType |newOrExisting  |AAH |DD  |
      |New           |BOTH    |Solar Max & Flexi Plan |0           |8          |solarmax    | NSW   |E2E_Campaign_solarMax_NSW_new_moving   |Quote Tool  |Move Home|NSW    |RES          |New            |No  |No  |

  @DR22.10.2.campaign
  Scenario Outline: Validate complete data for residential-SolarFlexi-plan for QLD - new moving customer
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "4216" for postcode and proceed to view the plans
    # And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_highSolarFIT | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|planName |
      | ELE      | N                | Y                     | N                   | Y                    | Y                    | N                               | <state> |    N                 |<planName>|
    And user validates disclaimer on plans page for "<campaign>" plan
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | <planName> | <state> | N            |    N         |
    When user clicks on Select plan button
    And user validates the data on carts page for "<campaign>" plan
      |fuelType |Feature_carbonNeutral | Feature_variableRates | Feature_highSolarFIT  |state  |Feature_50Credit|
      |ELE      |Y                     |Y                      | Y                     |<state>|    N           |
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                        | movingType | propertyType |
      | RES          | 74 East Quay Drive, BIGGERA WATERS QLD 4216 | Moving     | Renter       |
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
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_highSolarFIT | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | N                     | N                   | Y                    | Y                    | N                               | <state> |    N                 |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | <planName> | <state> | N            |    N         |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | SMAX-EQ  | 3116459687 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |<state>|
    Examples:
      | customerStatus | fuelType |planName               | eleDiscount | campaign | folderName                    | state | sourceSystem | journey   | AAH | DD | customerType | newOrExisting |
      | New            | ELE      |Solar Max & Flexi Plan | 0           | solarmax | E2E_Campaign_solarMax_QLD_new_moving | QLD   | Quote Tool   | Move Home | No  | No | RES          | New           |

  @DR22.10.2.campaign
  Scenario Outline: Validate complete data for residential-SolarFlexi-plan for SA - new moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "5044" for postcode and proceed to view the plans
    # And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_highSolarFIT | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|planName |
      | BOTH     | N                | Y                     | N                   | Y                    | Y                    | N                               | <state> |    N                 |<planName>|
    And user validates disclaimer on plans page for "<campaign>" plan
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | <planName> | <state> | N            |    N         |
    When user clicks on Select plans button
    # And user validates the data on carts page for "<campaign>" plan
    #   |fuelType |Feature_carbonNeutral | Feature_variableRates | Feature_highSolarFIT  |state  |Feature_50Credit|
    #   |ELE      |Y                     |Y                      | Y                     |<state>|    Y           |
    # And user validates the data on carts page for "<campaign>" plan
    #   |fuelType |Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill  |state  |Feature_50Credit|
    #   |GAS      |Y                     |Y                      |Y                                       |<state>|    Y           |
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                         | movingType | propertyType |
      | RES          | 21 Wyndham Crescent, SURREY DOWNS SA 5126 | Non-Moving  | Renter      |
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
    And user validates plan details on review page for "<campaign>" plan
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates | Feature_highSolarFIT | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | N                     | N                   | Y                     | Y                    | N                               | <state> |    N                 |
    And user validates plan details on review page for "<campaign>" plan
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | GAS      | N                | N                     | N                   | Y                   | Y                                     | N                               | <state> |    N                 |
    And user validates disclaimer on review page for "<campaign>" plan
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | N            |            | <state> | N            |    N         |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | COR       | SMAX-ES  | 2001176189 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | COR       | BP2H-GS  | 5510157932 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType |planName               | eleDiscount | gasDiscount | campaign | folderName                          | state | sourceSystem | journey | AAH | DD | customerType | newOrExisting |
      | New            | BOTH     |Solar Max & Flexi Plan | 0           | 4           | solarmax | E2E_Campaign_solarMax_SA_new_nonmoving | SA    | Quote Tool   | COR     | No  | No | RES          | New           |

  @DR22.10.2.campaign
  Scenario Outline: Validate complete data for residential-SolarFlexi-plan for ACT - new moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "2600" for postcode and proceed to view the plans
    # And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|planName |
      | BOTH     | N                | Y                     | N                   | Y                    | Y                                     | N                               | <state> |    N                 |<planName>|
    And user validates disclaimer on plans page for "<campaign>" plan
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | <planName> | <state> | N            |    N         |
    When user clicks on Select plans button
    # And user validates the data on carts page for "<campaign>" plan
    #   |fuelType |Feature_carbonNeutral | Feature_variableRates | Feature_highSolarFIT  |state  |Feature_50Credit|
    #   |ELE      |Y                     |Y                      |Y                      |<state>|    Y           |
    # And user validates the data on carts page for "<campaign>" plan
    #   |fuelType |Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill  |state  |Feature_50Credit|
    #   |GAS      |Y                     |Y                      |Y                                       |<state>|    Y           |
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                    | movingType | propertyType |
      # | RES          | 21 Tarrant Crescent, DUNLOP ACT 2615 | Moving     | Renter       |
      | RES          | 21 Darmody Street, WEETANGERA ACT 2614 | Moving     | Renter       |
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
    And user validates plan details on review page for "<campaign>" plan
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_highSolarFIT | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | N                     | N                   | Y                    | Y                    | N                               | <state> |    N                 |
    And user validates plan details on review page for "<campaign>" plan
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | GAS      | N                | N                     | N                   | Y                    | Y                                     | N                               | <state> |    N                 |
    And user validates disclaimer on review page for "<campaign>" plan
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   |moveHomeCredit|signUpCredit |
      | Y                        | Y         | Y            |            | <state> |    N         |N            |
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
      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI           | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | SMAX-EA  | 7001052784    |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | BP2H-GA  |            |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType |planName              | eleDiscount | gasDiscount | campaign | folderName                        | state | sourceSystem | journey   | AAH | DD | customerType | newOrExisting |
      | New            | ELE      |Solar Max & Flexi Plan| 0           | 18           | solarmax    | E2E_Campaign_solarMax_ACT_new_moving | ACT   | Quote Tool   | Move Home | No  | No | RES          | New           |

  @DR22.10.2.campaign
  Scenario Outline: Validate complete data for residential-SolarFlexi-plan for ACT - new non-moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "2600" for postcode and proceed to view the plans
    # And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|planName |
      | BOTH     | N                | Y                     | N                   | Y                    | Y                                     | N                               | <state> |    N                 |<planName>|
    And user validates disclaimer on plans page for "<campaign>" plan
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | <planName> | <state> | N            |    N         |
    When user clicks on Select plans button
    # And user validates the data on carts page for "<campaign>" plan
    #   |fuelType |Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill  |state  |Feature_50Credit|
    #   |ELE      |Y                     |Y                      |N                                       |<state>|    Y           |
    # And user validates the data on carts page for "<campaign>" plan
    #   |fuelType |Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill  |state  |Feature_50Credit|
    #   |GAS      |Y                     |Y                      |Y                                       |<state>|    Y           |
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                    | movingType | propertyType |
      | RES          | 19 Tarrant Crescent, DUNLOP ACT 2615 | Non-Moving | Renter       |
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
    And user validates plan details on review page for "<campaign>" plan
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_highSolarFIT | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | N                     | N                   | Y                    | Y                    | N                               | <state> |    N                 |
    And user validates plan details on review page for "<campaign>" plan
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | GAS      | N                | N                     | N                   | Y                    | Y                                     | N                               | <state> |    N                 |
    And user validates disclaimer on review page for "<campaign>" plan
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   |moveHomeCredit|signUpCredit |
      | Y                        | Y         | Y            |            | <state> |    N         |N            |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | COR       | SMAX-EA  |     |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | COR       | BP2H-GA  |      |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType |planName              | eleDiscount | gasDiscount | campaign | folderName                             | state | sourceSystem | journey | AAH | DD | customerType | newOrExisting |
      | New            | ELE      |Solar Max & Flexi Plan| 0           | 18           | solarmax    | E2E_Campaign_solarMax_ACT_new_nonmove | ACT   | Quote Tool   | COR     | No  | No | RES          | New           |

  @DR22.10.2.campaign
  Scenario Outline: Validate complete data for residential-SolarFlexi-plan for ACT - existing non-moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "2600" for postcode and proceed to view the plans
    # And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|planName |
      | BOTH     | N                | Y                     | N                   | Y                    | Y                                     | N                               | <state> |    N                 |<planName>|
    And user validates disclaimer on plans page for "<campaign>" plan
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | <planName> | <state> | N            |    N         |
    When user clicks on Select plans button
    # And user validates the data on carts page for "<campaign>" plan
    #   |fuelType |Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill  |state  |Feature_50Credit|
    #   |ELE      |Y                     |Y                      |N                                       |<state>|    Y           |
    # And user validates the data on carts page for "<campaign>" plan
    #   |fuelType |Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill  |state  |Feature_50Credit|
    #   |GAS      |Y                     |Y                      |Y                                       |<state>|    Y           |
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
    And user validates plan details on review page for "<campaign>" plan
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_highSolarFIT | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | N                     | N                   | Y                    | Y                     | N                               | <state> |    N                 |
    And user validates plan details on review page for "<campaign>" plan
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | GAS      | N                | N                     | N                   | Y                   | Y                                     | N                               | <state> |    N                 |
    And user validates disclaimer on review page for "<campaign>" plan
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   |moveHomeCredit|signUpCredit |
      | Y                        | Y         | Y            |            | <state> |    N         |N            |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | PS        | SMAX-EA  | 7001111161 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | PS        | BP2H-GA  | 5260060181 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType |planName              | eleDiscount | gasDiscount | campaign | folderName                             | state | sourceSystem | journey     | AAH | DD | customerType | newOrExisting |
      | Existing       | ELE      |Solar Max & Flexi Plan|  0          | 18           | solarmax    | E2E_Campaign_solarMax_ACT_Exs_nonmove | ACT   | Quote Tool   | Plan Switch | No  | No | RES          | Existing  non-moving |

  @DR23.5.3.campaign
  Scenario Outline: Validate complete data for residential-SolarFlexi-plan for VIC - new moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "3000" for postcode and proceed to view the plans
    # And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|planName |Feature_regularPayOption|Feature_highSolarFIT|
      | BOTH     | N                | Y                     | N                   | N                    | Y                                     | N                               | <state> |    N                 |<planName>|Y                      |Y              |
    And user validates disclaimer on plans page for "<campaign>" plan
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | <planName> | <state> | N            |    N         |
    When user clicks on Select plans button
    # And user validates the data on carts page for "<campaign>" plan
    #   |fuelType |Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill  |state  |Feature_50Credit|
    #   |ELE      |Y                     |Y                      |Y                                       |<state>|    Y           |
    # And user validates the data on carts page for "<campaign>" plan
    #   |fuelType |Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill  |state  |Feature_50Credit|
    #   |GAS      |Y                     |Y                      |Y                                       |<state>|    Y           |
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress               | movingType | propertyType |
      | RES          | 7 Annandale Drive, MERNDA VIC 3754 | Moving     | Renter    |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType         | medicareType |
      | RES          | RES     | New            | test      | test     | Driver License |              |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user selects answer for property renovation question for '<state>'
#    And user selects "single_rate" solar tariff type for "<state>"
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates plan details on review page for "<campaign>" plan
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_highSolarFIT | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|Feature_regularPayOption|
      | ELE      | N                | N                     | N                   | N                    | Y                    | N                               | <state> |    N                 |Y                       |
    And user validates plan details on review page for "<campaign>" plan
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|Feature_regularPayOption|
      | GAS      | N                | N                     | N                   | N                    | Y                                     | N                               | <state> |    N                 |Y                       |
    And user validates disclaimer on review page for "<campaign>" plan
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            |            | <state> | N            |    N         |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | SMAX-EV  | 6305896343 | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | BP2H-GV  | 5320201310 | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType |planName              | eleDiscount | gasDiscount | campaign | folderName                            | state | tariffType | sourceSystem | journey   | AAH | DD | customerType | newOrExisting |
      | New            | BOTH     |Solar Max & Flexi Plan| 0           | 25           | solarmax | E2E_Campaign_solarMax_VIC_new_moving | VIC   | single_rate| Quote Tool   | Move Home | No  | No | RES          | New           |

  @DR23.5.3.campaign
  Scenario Outline: Validate complete data for residential-SolarFlexi-plan for VIC - new non-moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "3000" for postcode and proceed to view the plans
    # And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|planName |Feature_regularPayOption|Feature_highSolarFIT|
      | BOTH     | N                | Y                     | N                   | N                    | Y                                     | N                               | <state> |    N                 |<planName>|Y                      |Y              |
    And user validates disclaimer on plans page for "<campaign>" plan
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | <planName> | <state> | N            |    N         |
    When user clicks on Select plans button
    # And user validates the data on carts page for "<campaign>" plan
    #   |fuelType |Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill  |state  |Feature_50Credit|
    #   |ELE      |Y                     |Y                      |Y                                       |<state>|    Y           |
    # And user validates the data on carts page for "<campaign>" plan
    #   |fuelType |Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill  |state  |Feature_50Credit|
    #   |GAS      |Y                     |Y                      |Y                                       |<state>|    Y           |
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                | movingType | propertyType |
      | RES          | 7 Annandale Drive, MERNDA VIC 3754 | Non-Moving | Renter    |

    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType         | medicareType |
      | RES          | RES     | New            | test      | test     | Driver License |              |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
#    And user selects "single_rate" solar tariff type for "<state>"
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates plan details on review page for "<campaign>" plan
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_highSolarFIT | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|Feature_regularPayOption|
      | ELE      | N                | N                     | N                   | N                    | Y                    | N                               | <state> |    N                 |Y                       |
    And user validates plan details on review page for "<campaign>" plan
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|Feature_regularPayOption|
      | GAS      | N                | N                     | N                   | N                    | Y                                     | N                               | <state> |    N                 |Y                       |
    And user validates disclaimer on review page for "<campaign>" plan
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            |            | <state> | N            |    N         |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | COR       | SMAX-EV  | 6305896343 | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | COR       | BP2H-GV  | 5320201310 | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType |planName              | eleDiscount | gasDiscount| campaign | folderName                        | state | sourceSystem | journey   | AAH | DD | customerType | newOrExisting |
      | New            | BOTH     |Solar Max & Flexi Plan| 0           | 25          | solarmax    | E2E_Campaign_solarMax_VIC_new_non_moving | VIC   | Quote Tool   | COR   | No  | No | RES          | New           |

  @DR22.10.2.campaign
  Scenario Outline: Validate complete data for residential-SolarFlexi-plan for NSW-Endeavour - new non moving customer
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "2516" for postcode and proceed to view the plans
    # And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|planName |
      | BOTH     | N                | Y                     | N                   | Y                    | Y                                     | N                               | <state> |    N                 |<planName>|
    And user validates disclaimer on plans page for "<campaign>" plan
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | <planName> | <state> | N            |    N         |
    When user clicks on Select plans button
    # And user validates the data on carts page for "<campaign>" plan
    #   |fuelType |Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill  |state  |Feature_50Credit|
    #   |ELE      |Y                     |Y                      |Y                                       |<state>|    Y           |
    # And user validates the data on carts page for "<campaign>" plan
    #   |fuelType |Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill  |state  |Feature_50Credit|
    #   |GAS      |Y                     |Y                      |Y                                       |<state>|    Y           |
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                             | movingType | propertyType |
      | RES          | 21 Wimbledon Avenue, NORTH NARRABEEN NSW 2101 | Non-Moving | Renter    |
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
    And user validates plan details on review page for "<campaign>" plan
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_highSolarFIT | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | N                     | N                   | Y                    | Y                    | N                               | <state> |    N                 |
    And user validates plan details on review page for "<campaign>" plan
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | GAS      | N                | N                     | N                   | Y                   | Y                                     | N                               | <state> |    N                 |
    And user validates disclaimer on review page for "<campaign>" plan
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            |            | <state> | N            |    N         |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | COR       | SMAX-EN  | 4103382788 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | COR       | BP2H-GN  |            |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType |planName              | eleDiscount | gasDiscount | campaign | folderName                           | state | sourceSystem | journey | AAH | DD | customerType | newOrExisting |
      | New            | BOTH     |Solar Max & Flexi Plan| 0           | 8           | solarmax | E2E_Campaign_solarMax_NSW_new_nonmoving | NSW   | Quote Tool   | COR     | No  | No | RES          | New           |

  @DR23.5.3.campaign
  Scenario Outline: Validate complete data for residential-SolarFlexi-plan for VIC existing non moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "3000" for postcode and proceed to view the plans
    # And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|planName |Feature_regularPayOption|Feature_highSolarFIT|
      | BOTH     | N                | Y                     | N                   | N                    | Y                                     | N                               | <state> |    N                 |<planName>|Y                      |Y              |
    And user validates disclaimer on plans page for "<campaign>" plan
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | <planName> | <state> | N            |    N         |
    When user clicks on Select plans button
    # And user validates the data on carts page for "<campaign>" plan
    #   |fuelType |Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill  |state  |Feature_50Credit|
    #   |ELE      |Y                     |Y                      |Y                                       |<state>|    Y           |
    # And user validates the data on carts page for "<campaign>" plan
    #   |fuelType |Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill  |state  |Feature_50Credit|
    #   |GAS      |Y                     |Y                      |Y                                       |<state>|    Y           |
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      | customerStatus   | accountNumber | accountIdentityType | postcodeOrABNACN | idType | idValue   |
      | <customerStatus> | 2396251000    | Postcode            | 3024             | dob    | 07071964 |
    And user provides all other details on qualifier page for Existing customer
      | customerType | movingType | propertyType |
      | RES          | Non-Moving | Renter       |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus   | firstName | lastName | idType         |
      | RES          | RES     | <customerStatus> | test      | test     | Driver License |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
#    And user selects "single_rate" solar tariff type for "<state>"
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates plan details on review page for "<campaign>" plan
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_highSolarFIT | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|Feature_regularPayOption|
      | ELE      | N                | N                     | N                   | N                    | Y                    | N                               | <state> |    N                 |Y                       |
    And user validates plan details on review page for "<campaign>" plan
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|Feature_regularPayOption|
      | GAS      | N                | N                     | N                   | N                    | Y                                     | N                               | <state> |    N                 |Y                       |
    And user validates disclaimer on review page for "<campaign>" plan
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            |            | VIC   | N            |    N         |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | PS        | SMAX-EV  | 6203336956 | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | PS        | BP2H-GV  | 5330480434 | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType |planName              | eleDiscount | gasDiscount | campaign | folderName                                 | state | sourceSystem | journey     | AAH | DD | customerType | newOrExisting        |
      | Existing       | BOTH     |Solar Max & Flexi Plan| 0           | 25           | solarmax | E2E_Campaign_solarMax_VIC_existing_non-moving | VIC   | Quote Tool   | Plan Switch | No  | No | RES          | Existing  non-moving |

  @DR23.5.3.campaign
  Scenario Outline: Validate complete data for residential-SolarFlexi-plan for VIC existing moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "3000" for postcode and proceed to view the plans
    # And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|planName |Feature_regularPayOption|Feature_highSolarFIT|
      | BOTH     | N                | Y                     | N                   | N                    | Y                                     | N                               | <state> |    N                 |<planName>|Y                      |Y              |
    And user validates disclaimer on plans page for "<campaign>" plan
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | <planName> | <state> | N            |    N         |
    When user clicks on Select plans button
    # And user validates the data on carts page for "<campaign>" plan
    #   |fuelType |Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill  |state  |Feature_50Credit|
    #   |ELE      |Y                     |Y                      |Y                                       |<state>|    Y           |
    # And user validates the data on carts page for "<campaign>" plan
    #   |fuelType |Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill  |state  |Feature_50Credit|
    #   |GAS      |Y                     |Y                      |Y                                       |<state>|    Y           |
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      | customerStatus   | accountNumber | accountIdentityType | postcodeOrABNACN | idType | idValue   |
      | <customerStatus> | 7300591603    | Postcode            | 3074             | dob     | 01011980 |
    And user provides all other details on qualifier page for Existing customer
      | customerType | connectionAddress                   | movingType | propertyType |
      | RES          | 7 Annandale Drive, MERNDA VIC 3754  | Moving     | Renter       |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus   | firstName | lastName | idType         |
      | RES          | RES     | <customerStatus> | test      | test     | Driver License |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user selects answer for property renovation question for '<state>'
#    And user selects "single_rate" solar tariff type for "<state>"
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates plan details on review page for "<campaign>" plan
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_highSolarFIT | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|Feature_regularPayOption|
      | ELE      | N                | N                     | N                   | N                    | Y                    | N                               | <state> |    N                 |Y                       |
    And user validates plan details on review page for "<campaign>" plan
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|Feature_regularPayOption|
      | GAS      | N                | N                     | N                   | N                    | Y                                     | N                               | <state> |    N                 |Y                       |
    And user validates disclaimer on review page for "<campaign>" plan
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            |            | VIC   | N            |    N         |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | SMAX-EV  | 6305896343 | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | BP2H-GV  | 5320201310 | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType |planName              | eleDiscount | gasDiscount | campaign | folderName                             | state | sourceSystem | journey   | AAH | DD | customerType | newOrExisting        |
      | Existing       | BOTH     |Solar Max & Flexi Plan| 0           | 25           | solarmax    | E2E_Campaign_solarMax_VIC_existing_moving | VIC   | Quote Tool   | Move Home | No  | No | RES          | Existing  non-moving |

  @DR22.10.2.campaign
  Scenario Outline: Validate complete data for residential-SolarFlexi-plan for NSW-Endeavour existing non moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "2761" for postcode and proceed to view the plans
    # And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|planName |
      | BOTH     | N                | Y                     | N                   | Y                    | Y                                     | N                               | <state> |    N                 |<planName>|
    And user validates disclaimer on plans page for "<campaign>" plan
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | <planName> | <state> | N            |    N         |
    When user clicks on Select plans button
    # And user validates the data on carts page for "<campaign>" plan
    #   |fuelType |Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill  |state  |Feature_50Credit|
    #   |ELE      |Y                     |Y                      |Y                                       |<state>|    Y           |
    # And user validates the data on carts page for "<campaign>" plan
    #   |fuelType |Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill  |state  |Feature_50Credit|
    #   |GAS      |Y                     |Y                      |Y                                       |<state>|    Y           |
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      | customerStatus   | accountNumber | accountIdentityType | postcodeOrABNACN | idType | idValue  |
      | <customerStatus> | 0102240000    | Postcode            | 2529             | dob    | 01011980 |
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
    And user validates plan details on review page for "<campaign>" plan
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_highSolarFIT | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | N                     | N                   | Y                    | Y                    | N                               | <state> |    N                 |
    And user validates disclaimer on review page for "<campaign>" plan
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            |            | NSW   | N            |    N         |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | PS        | SMAX-EN  | 4310711271 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | PS        | BP2H-GN  |      |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |

    Examples:
      | customerStatus | fuelType |planName              | eleDiscount | gasDiscount | campaign | folderName                                 | state | sourceSystem | journey     | AAH | DD | customerType | newOrExisting        |
      | Existing       | BOTH     |Solar Max & Flexi Plan| 5           | 8           | solarmax | E2E_Campaign_solarMax_NSW_existing_non-moving | NSW   | Quote Tool   | Plan Switch | No  | No | RES          | Existing  non-moving |

  @DR22.10.2.campaign
  Scenario Outline: Validate complete data for residential-SolarFlexi-plan for SA existing non moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "5000" for postcode and proceed to view the plans
    # And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|planName |
      | BOTH     | N                | Y                     | N                   | Y                    | Y                                     | N                               | <state> |    N                 |<planName>|
    And user validates disclaimer on plans page for "<campaign>" plan
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | <planName> | <state> | N            |    N         |
    When user clicks on Select plans button
    # And user validates the data on carts page for "<campaign>" plan
    #   |fuelType |Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill  |state  |Feature_50Credit|
    #   |ELE      |Y                     |Y                      |N                                       |<state>|    Y           |
    # And user validates the data on carts page for "<campaign>" plan
    #   |fuelType |Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill  |state  |Feature_50Credit|
    #   |GAS      |Y                     |Y                      |Y                                       |<state>|    Y           |
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      | customerStatus   | accountNumber | accountIdentityType | postcodeOrABNACN | idType | idValue   |
      | <customerStatus> | 2387844000    | Postcode            | 5162             | dob    | 01011980 |
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
    And user validates plan details on review page for "<campaign>" plan
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_highSolarFIT | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | N                     | N                   | Y                    | Y                    | N                               | <state> |    N                 |
    And user validates plan details on review page for "<campaign>" plan
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | GAS      | N                | N                     | N                   | Y                    | Y                                     | N                               | <state> |    N                 |
    And user validates disclaimer on review page for "<campaign>" plan
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            |            | SA    | N            |    N         |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | PS        | SMAX-ES  | 2001316786 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | PS        | BP2H-GS  | 5510366597 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType |planName              | eleDiscount | gasDiscount | campaign | folderName                                | state | sourceSystem | journey     | AAH | DD | customerType | newOrExisting        |
      | Existing       | BOTH     |Solar Max & Flexi Plan| 0           | 4           | solarmax | E2E_Campaign_solarMax_SA_existing_non-moving | SA    | Quote Tool   | Plan Switch | No  | No | RES          | Existing  non-moving |

  @DR22.10.2.campaign
  Scenario Outline: Validate complete data for residential-SolarFlexi-plan for QLD existing non moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "4053" for postcode and proceed to view the plans
    # And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_highSolarFIT | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|planName |
      | ELE      | N                | Y                     | N                   | Y                    | Y                    | N                               | <state> |    N                 |<planName>|
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | <planName> | <state> | N            |    N         |
    When user clicks on Select plan button
    And user validates the data on carts page for "<campaign>" plan
      |fuelType |Feature_carbonNeutral | Feature_variableRates | Feature_highSolarFIT  |state  |Feature_50Credit|
      |ELE      |Y                     |Y                      |Y                      |<state>|    N           |
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      | customerStatus   | accountNumber | accountIdentityType | postcodeOrABNACN | idType | idValue   |
    #  | <customerStatus> | 4968819589    | Postcode            | 4077             | dob     | 01011980 |
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
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates| Feature_highSolarFIT | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | N                     | N                   | Y                    | Y                    | N                               | <state> |    N                 |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | Solar Max | QLD   | N            |    N         |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | PS        | SMAX-EQ  | QB06811396 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType |planName              | eleDiscount | campaign | folderName                             | state | sourceSystem | journey     | AAH | DD | customerType | newOrExisting        |
      | Existing       | ELE      |Solar Max & Flexi Plan| 0           | solarmax | E2E_Campaign_solarMax_QLD_existing_non-moving | QLD   | Quote Tool   | Plan Switch | No  | No | RES          | Existing  non-moving |
