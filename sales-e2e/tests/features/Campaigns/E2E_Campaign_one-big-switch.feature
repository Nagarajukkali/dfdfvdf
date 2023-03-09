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

Feature:E2E scenario for one-big-switch campaign

  @DR23.3.3.campaign
  Scenario Outline: Validate complete data for One Big Switch campaign for NSW-Ausgrid - new moving customer
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "2144" and clicks on show me plan link
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit |
      | ELE      | Y                | Y                     | N                   | Y                     | Y                                     | N                               | <state> | N                      |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit |
      | GAS      | Y                | Y                     | N                   | Y                     | Y                                     | N                               | <state> | N                      |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit | moveHomeCredit |
      | Y                        | Y         | Y            | Flexi Plan | <state> | Y            | N              |
    And user clicks on Add plan button
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
    And user opts for AAH and DD
      | optAAHOption | optDDOption | directDebitType |
      | <AAH>        | <DD>        | Bank            |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit |
      | ELE      | Y                | N                     | N                   | Y                     | Y                                     | N                               | <state> | N                      |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit |
      | GAS      | Y                | N                     | N                   | Y                     | Y                                     | N                               | <state> | N                      |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit | moveHomeCredit |
      | Y                        | Y         | Y            | Flexi Plan | <state> | Y            | N              |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | BP2H-EN  | 4102681649 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | BP2H-GN  | 5240524910 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType | eleDiscount | gasDiscount | campaign       | folderName                      | state | sourceSystem | journey   | AAH | DD | customerType | newOrExisting |
      | New            | ELE      | 5           | 8           | one-big-switch | E2E_Campaign_OBS_NSW_new_moving | NSW   | Quote Tool   | Move Home | No  | No | RES          | New           |

  @DR23.3.3.campaign
  Scenario Outline: Validate complete data for One Big Switch campaign for VIC - new moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "3000" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit | Feature_variableRates |
      | ELE      | Y                | Y                     | N                   | Y                                     | N                               | <state> | N                      | Y                     |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit | Feature_variableRates |
      | GAS      | Y                | Y                     | N                   | Y                                     | N                               | <state> | N                      | Y                     |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit | moveHomeCredit |
      | Y                        | Y         | Y            | Flexi Plan | <state> | Y            | N              |
    And user clicks on Add plan button
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
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit | Feature_variableRates |
      | ELE      | Y                | N                     | N                   | Y                                     | N                               | <state> | N                      | Y                     |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit | Feature_variableRates |
      | GAS      | Y                | N                     | N                   | Y                                     | N                               | <state> | N                      | Y                     |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit | moveHomeCredit |
      | Y                        | Y         | Y            | Flexi Plan | <state> | Y            | N              |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | BP2H-EV  | 6102221416 | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | BP2H-GV  | 5310425534 | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType | eleDiscount | gasDiscount | campaign       | folderName                      | state | sourceSystem | journey   | AAH | DD | customerType | newOrExisting |
      | New            | BOTH     | 5           | 12          | one-big-switch | E2E_Campaign_OBS_VIC_new_moving | VIC   | Quote Tool   | Move Home | No  | No | RES          | New           |

  @DR23.3.3.campaign
  Scenario Outline: Validate complete data for One Big Switch campaign for VIC - new non-moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "3000" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit | Feature_variableRates |
      | ELE      | Y                | Y                     | N                   | Y                                     | N                               | <state> | N                      | Y                     |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit | Feature_variableRates |
      | GAS      | Y                | Y                     | N                   | Y                                     | N                               | <state> | N                      | Y                     |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit | moveHomeCredit |
      | Y                        | Y         | Y            | Flexi Plan | <state> | N            | N              |
    And user clicks on Add plan button
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                   | movingType | propertyType |
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
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit | Feature_variableRates |
      | ELE      | Y                | N                     | N                   | Y                                     | N                               | <state> | N                      | Y                     |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit | Feature_variableRates |
      | GAS      | Y                | N                     | N                   | Y                                     | N                               | <state> | N                      | Y                     |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit | moveHomeCredit |
      | Y                        | Y         | Y            | Flexi Plan | <state> | Y            | N              |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | COR       | BP2H-EV  | 6102221416 | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | COR       | BP2H-GV  | 5310425534 | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType | eleDiscount | gasDiscount | campaign       | folderName                          | state | sourceSystem | journey | AAH | DD | customerType | newOrExisting |
      | New            | BOTH     | 5           | 12          | one-big-switch | E2E_Campaign_OBS_VIC_new_non_moving | VIC   | Quote Tool   | COR     | No  | No | RES          | New           |

  @DR23.3.3.campaign
  Scenario Outline: Validate complete data for One Big Switch campaign for NSW-Endeavour - new non moving customer
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "2516" and clicks on show me plan link
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit |
      | ELE      | Y                | Y                     | N                   | Y                     | Y                                     | N                               | <state> | N                      |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit |
      | GAS      | Y                | Y                     | N                   | Y                     | Y                                     | N                               | <state> | N                      |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit | moveHomeCredit |
      | Y                        | Y         | Y            | Flexi Plan | <state> | Y            | N              |
    And user clicks on Add plan button
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                 | movingType | propertyType |
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
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit |
      | ELE      | Y                | N                     | N                   | Y                     | Y                                     | N                               | <state> | N                      |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit |
      | GAS      | Y                | N                     | N                   | Y                     | Y                                     | N                               | <state> | N                      |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit | moveHomeCredit |
      | Y                        | Y         | Y            | Flexi Plan | <state> | Y            | N              |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | COR       | BP2H-EN  | 4311150021 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | COR       | BP2H-GN  |      |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType | eleDiscount | gasDiscount | campaign       | folderName                         | state | sourceSystem | journey | AAH | DD | customerType | newOrExisting |
      | New            | BOTH     | 5           | 8           | one-big-switch | E2E_Campaign_OBS_NSW_new_nonmoving | NSW   | Quote Tool   | COR     | No  | No | RES          | New           |

  @DR23.3.3.campaign
  Scenario Outline: Validate complete data for One Big Switch campaign for VIC existing moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "3000" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit | Feature_variableRates |
      | ELE      | Y                | Y                     | N                   | Y                                     | N                               | <state> | N                      | Y                     |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit | Feature_variableRates |
      | GAS      | Y                | Y                     | N                   | Y                                     | N                               | <state> | N                      | Y                     |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit | moveHomeCredit |
      | Y                        | Y         | Y            | Flexi Plan | <state> | Y            | N              |
    And user clicks on Add plan button
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      | customerStatus   | accountNumber | accountIdentityType | postcodeOrABNACN | idType | idValue  |
      | <customerStatus> | 7300591603    | Postcode            | 3074             | dob    | 01011980 |
    And user provides all other details on qualifier page for Existing customer
      | customerType | connectionAddress                     | movingType | propertyType |
      | RES          | 107 Cedar Street, THOMASTOWN VIC 3074 | Moving     | Renter       |
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
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit | Feature_variableRates |
      | ELE      | Y                | N                     | N                   | Y                                     | N                               | <state> | N                      | Y                     |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit | Feature_variableRates |
      | GAS      | Y                | N                     | N                   | Y                                     | N                               | <state> | N                      | Y                     |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit | moveHomeCredit |
      | Y                        | Y         | Y            | Flexi Plan | <state> | Y            | N              |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | BP2H-EV  | 6305223703 | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | BP2H-GV  | 5321264636 | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType | eleDiscount | gasDiscount | campaign       | folderName                           | state | sourceSystem | journey   | AAH | DD | customerType | newOrExisting        |
      | Existing       | BOTH     | 5           | 12          | one-big-switch | E2E_Campaign_OBS_VIC_existing_moving | VIC   | Quote Tool   | Move Home | No  | No | RES          | Existing  non-moving |

  @DR23.3.3.campaign
  Scenario Outline: Validate complete data for One Big Switch campaign for NSW-Endeavour existing non moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "2761" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit | Feature_variableRates |
      | ELE      | Y                | Y                     | N                   | Y                                     | N                               | <state> | N                      | Y                     |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit | Feature_variableRates |
      | GAS      | Y                | Y                     | N                   | Y                                     | N                               | <state> | N                      | Y                     |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit | moveHomeCredit |
      | Y                        | Y         | Y            | Flexi Plan | <state> | Y            | N              |
    And user clicks on Add plan button
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      | customerStatus   | accountNumber | accountIdentityType | postcodeOrABNACN | idType | idValue  |
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
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit | Feature_variableRates |
      | ELE      | N                | N                     | N                   | Y                                     | N                               | <state> | N                      | Y                     |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit | Feature_variableRates |
      | GAS      | N                | N                     | N                   | Y                                     | N                               | <state> | N                      | Y                     |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit | moveHomeCredit |
      | Y                        | Y         | Y            | Flexi Plan | <state> | Y            | N              |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | PS        | BP2H-EN  | 4310205783 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | PS        | BP2H-GN  | 5240151444 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |

    Examples:
      | customerStatus | fuelType | eleDiscount | gasDiscount | campaign       | folderName                               | state | sourceSystem | journey     | AAH | DD | customerType | newOrExisting        |
      | Existing       | BOTH     | 5           | 8           | one-big-switch | E2E_Campaign_OBS_NSW_existing_non-moving | NSW   | Quote Tool   | Plan Switch | No  | No | RES          | Existing  non-moving |
