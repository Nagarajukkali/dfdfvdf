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
# 9. If journey change to Moving to Non-Moving then update offerType to COR/PS accordingly in this step "And user validates below mandatory fields"

Feature:E2E scenario for mcdonalds

  @DR22.5.5.campaign
  Scenario Outline: Validate complete data for mcdonalds campaign for NSW-Ausgrid for new moving customer
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "PPMAC01" and "2144" and clicks on show me plan link
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit|
      | ELE      | N                | Y                     | Y                   | Y                                  | N                               | <state> | Y                     |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit|
      | GAS      | N                | Y                     | Y                   | Y                                  | N                               | <state> | Y                     |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |
      | Y                        | Y         | Y            | Total Plan | <state> | Y            |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   | moveHomeCredit|
      | ELE      | N                | Y                     | Y                   | Y                                  | <state> | Y             |
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   | moveHomeCredit|
      | GAS      | N                | Y                     | Y                   | Y                                  | <state> | Y             |
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
    And user opts for AAH and DD
      | optAAHOption | optDDOption | directDebitType |
      | <AAH>        | <DD>        | Bank            |
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit|
      | ELE      | N                | N                     | Y                   | Y                                  | N                               | <state> | Y                     |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit|
      | GAS      | N                | N                     | Y                   | Y                                  | N                               | <state> | Y                     |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |
      | Y                        | Y         | Y            | Total Plan | <state> | Y            |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | TOPH-EN  | 4102681649 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | TOPH-GN  | 5240524910 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |

    Examples:
      | customerStatus | fuelType | eleDiscount | gasDiscount | campaign  | folderName                 | state | sourceSystem | journey   | AAH | DD | customerType | newOrExisting |
      | New            | BOTH     | 22          | 18          | mcdonalds | E2E_Campaign_mcdonalds_NSW | NSW   | Quote Tool   | Move Home | No  | No | RES          | New           |
  @DR22.5.5.campaign 
  Scenario Outline: Validate complete data for mcdonalds campaign for VIC for new moving customer
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "PPMAC01" and "3199" and clicks on show me plan link
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit|
      | ELE      | N                | Y                     | Y                   | Y                                  | N                               | <state> | Y                     |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit|
      | GAS      | N                | Y                     | Y                   | Y                                  | N                               | <state> | Y                     |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |
      | Y                        | Y         | Y            | Total Plan | <state> | Y            |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   | moveHomeCredit|
      | ELE      | N                | Y                     | Y                   | Y                                  | <state> | Y             |
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   | moveHomeCredit|
      | GAS      | N                | Y                     | Y                   | Y                                  | <state> | Y             |
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
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit|
      | ELE      | N                | N                     | Y                   | Y                                  | N                               | <state> | Y                     |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit|
      | GAS      | N                | N                     | Y                   | Y                                  | N                               | <state> | Y                     |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |
      | Y                        | Y         | Y            | Total Plan | <state> | Y            |
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
      | customerStatus | fuelType | eleDiscount | gasDiscount | campaign  | folderName                 | state | sourceSystem | journey   | AAH | DD | customerType | newOrExisting |
      | New            | BOTH     | 14          | 35          | mcdonalds | E2E_Campaign_mcdonalds_VIC | VIC   | Quote Tool   | Move Home | No  | No | RES          | New           |

  @DR22.5.5.campaign 
  Scenario Outline: Validate complete data for mcdonalds campaign for SA for new non moving customer
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "PPMAC01" and "5076" and clicks on show me plan link
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |
      | ELE      | Y                | Y                     | Y                   | Y                                  | N                               | <state> |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |
      | GAS      | Y                | Y                     | Y                   | Y                                  | N                               | <state> |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |
      | Y                        | Y         | Y            | Total Plan | <state> | Y            |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   |
      | ELE      | Y                | Y                     | Y                   | Y                                  | <state> |
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   |
      | GAS      | Y                | Y                     | Y                   | Y                                  | <state> |
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
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |
      | ELE      | Y                | N                     | Y                   | Y                                  | N                               | <state> |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |
      | GAS      | Y                | N                     | Y                   | Y                                  | N                               | <state> |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |
      | Y                        | Y         | Y            | Total Plan | <state> | Y            |
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
      | customerStatus | fuelType | eleDiscount | gasDiscount | campaign  | folderName                          | state | sourceSystem | journey | AAH | DD | customerType | newOrExisting |
      | New            | BOTH     | 8           | 17         | mcdonalds | E2E_Campaign_mcdonalds_nonmoving_SA | SA    | Quote Tool   | COR     | No  | No | RES          | New           |
  @DR22.5.5.campaign 
  Scenario Outline: Validate complete data for mcdonalds campaign for ACT for new moving customer
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "PPMAC01" and "2615" and clicks on show me plan link
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
  And user validates the data on plans page for "<campaign>"
    | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |
    | ELE      | Y                | Y                     | Y                   | Y                                  | N                               | <state> |
  And user validates the data on plans page for "<campaign>"
    | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |
    | GAS      | Y                | Y                     | Y                   | Y                                  | N                               | <state> |
  And user validates disclaimer on plans page for "<campaign>"
    | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   |signUpCredit |
    | Y                        | Y         | Y            | Total Plan | <state> |Y            |
  And user clicks on Add plan button
  And user validates plan details on cart page for "<campaign>"
    | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   |
    | ELE      | Y                | Y                     | Y                   | Y                                  | <state> |
  And user validates plan details on cart page for "<campaign>"
    | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   |
    | GAS      | Y                | Y                     | Y                   | Y                                  | <state> |
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                         | movingType | propertyType |
      | RES          | 126 Shakespeare Crescent, FRASER ACT 2615 | Moving     | Renter       |
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
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |
      | ELE      | Y                | N                     | Y                   | Y                                  | N                               | <state> |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |
      | GAS      | Y                | N                     | Y                   | Y                                  | N                               | <state> |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   |signUpCredit |
      | Y                        | Y         | Y            | Total Plan | <state> |Y            |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | TOPH-EA  | 7001068488 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | TOPH-GA  | 5261512002 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |

    Examples:
      | customerStatus | fuelType | eleDiscount | gasDiscount | campaign  | folderName                 | state | sourceSystem | journey   | AAH | DD | customerType | newOrExisting |
      | New            | ELE      | 12          | 17          | mcdonalds | E2E_Campaign_mcdonalds_ACT | ACT   | Quote Tool   | Move Home | No  | No | RES          | New           |

  @DR22.5.5.campaign 
  Scenario Outline: Validate complete data for mcdonalds campaign for QLD for new moving customer
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "PPMAC01" and "4208" and clicks on show me plan link
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit|
      | ELE      | N                | Y                     | Y                   | Y                                  | N                               | <state> | Y                     |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |
      | Y                        | Y         | Y            | Total Plan | <state> | Y            |
    And user clicks on Select plan button
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   | moveHomeCredit|
      | ELE      | N                | Y                     | Y                   | Y                                  | <state> | Y             |
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                     | movingType | propertyType |
      | RES          | 13 Jacobs Ridge Road, ORMEAU QLD 4208 | Moving     | Renter       |
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
    And user verifies selected plan details for '<fuelType>'
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_discountOffTotalEnergyBill | Feature_peaceOfMind | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit|
      | ELE      | N                | N                     | Y                                  | Y                   | N                               | <state> | Y                     |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state | signUpCredit |
      | Y                        | N         | Y            | Total Plan | QLD   | Y            |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | TOPH-EQ  | 3115863522 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |

    Examples:
      | customerStatus | fuelType | eleDiscount | campaign  | folderName                 | state | sourceSystem | journey   | AAH | DD | customerType | newOrExisting |
      | New            | ELE      | 14          | mcdonalds | E2E_Campaign_mcdonalds_QLD | QLD   | Quote Tool   | Move Home | No  | No | RES          | New           |
  @DR22.5.5.campaign 
  Scenario Outline: Validate complete data for mcdonalds campaign for VIC existing non moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "PPMAC01" and "3000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit|
      | ELE      | N                | Y                     | Y                   | Y                                  | N                               | <state> | Y                     |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit|
      | GAS      | N                | Y                     | Y                   | Y                                  | N                               | <state> | Y                     |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |
      | Y                        | Y         | Y            | Total Plan | <state> | Y            |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   | moveHomeCredit|
      | ELE      | N                | Y                     | Y                   | Y                                  | <state> | Y             |
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   | moveHomeCredit|
      | GAS      | N                | Y                     | Y                   | Y                                  | <state> | Y             |
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      | customerStatus   | accountNumber | accountIdentityType | postcodeOrABNACN | idType | idValue   |
    #  | <customerStatus> | 5124968245    | Postcode            | 3029             | dl     | 390399008 |
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
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit|
      | ELE      | N                | N                     | Y                   | Y                                  | N                               | <state> | N                     |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit|
      | GAS      | N                | N                     | Y                   | Y                                  | N                               | <state> | N                     |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state | signUpCredit |
      | Y                        | Y         | Y            | Total Plan | VIC   | Y            |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | PS        | TOPH-EV  | 6305223703 | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | PS        | TOPH-GV  | 5321264636 | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType | eleDiscount | gasDiscount | campaign  | folderName                                     | state | sourceSystem | journey     | AAH | DD | customerType | newOrExisting        |
      | Existing       | BOTH     | 14          | 26          | mcdonalds | E2E_Campaign_mcdonalds_VIC_existing_non-moving | VIC   | Quote Tool   | Plan Switch | No  | No | RES          | Existing  non-moving |
