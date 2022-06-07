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

Feature:E2E scenario for basichome-finder campaign

   @DR22.5.5.campaign
  Scenario Outline: Validate complete data for basichome-finder campaign for NSW
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "2144" and clicks on show me plan link
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | state | Feature_noStandardConnectionFee |Feature_moveHomeCredit|
      | ELE      | N                | Y                     | Y                    | NSW   | N                               |    Y                 |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | state | Feature_noStandardConnectionFee |Feature_moveHomeCredit|
      | GAS      | N                | Y                     | N                    | NSW   | N                               |    Y                 |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | Basic Home | NSW   | N            |    Y         |
    And user clicks on Add plan button
#    And user validates plan details on cart page for "<campaign>"
#      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | Feature_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
#      | ELE      | N                | Y                     | Y                    | N                                  | <state> |    Y                 |
#    And user validates plan details on cart page for "<campaign>"
#      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | Feature_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
#      | GAS      | N                | Y                     | N                    | N                                  | <state> |    Y                 |
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                   | movingType | propertyType |
      | RES          | 75 Yillowra Street, AUBURN NSW 2144 | Non-Moving | Renter       |
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
      | lifeSupportOption | fuelType | EleclifeSupportDevices                         | GaslifeSupportDevices |
      | Yes               | BOTH     | Crigler Najjar Syndrome Phototherapy Equipment | Gas Other             |
    And user verifies selected plan details for '<fuelType>'
#    And user selects carbon neutral option
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                |     N                 | Y                    | N                               | <state> |    Y                 |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | Feature_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
      | GAS      | N                | N                     | N                    | N                                  | <state> |    Y                 |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | Basic Home | NSW   | N            |    N         |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | COR       | RSOT-EN  | 4102681638 | N                              | N                              | Y                       | LSCNSPE                  | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | COR       | RSOT-GN  | 5240205554 | N                              | N                              | Y                       | OTHER                    | EMAIL         | <customerStatus> | <campaign> |

    Examples:
      | customerStatus | fuelType | eleDiscount | gasDiscount | campaign         | folderName                        | state | sourceSystem | journey | AAH | DD | customerType | newOrExisting |
      | New            | BOTH     | No          | No          | basichome-finder | E2E_Campaign_basichome-finder_NSW | NSW   | Quote Tool   | COR     | No  | No | RES          | New           |

   @DR22.5.5.campaign
  Scenario Outline: Validate complete data for basichome-finder campaign for ACT new moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "2615" for postcode and proceed to view the plans
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | state | Feature_noStandardConnectionFee |Feature_moveHomeCredit|
      | ELE      | N                | Y                     | Y                    | ACT   | N                               |    Y                 |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | state | Feature_noStandardConnectionFee |Feature_moveHomeCredit|
      | GAS      | N                | Y                     | N                    | ACT   | N                               |    Y                 |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | Basic Home | ACT   | N            |    Y         |
    And user clicks on Add plan button
#    And user validates plan details on cart page for "<campaign>"
#      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | Feature_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
#      | ELE      | N                | Y                     | Y                    | N                                  | <state> |    Y                 |
#    And user validates plan details on cart page for "<campaign>"
#      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | Feature_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
#      | GAS      | N                | Y                     | N                    | N                                  | <state> |    Y                 |
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
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user verifies selected plan details for '<fuelType>'
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | N                     | Y                    | N                                  | N                               | <state> |    Y                 |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | GAS      | N                | N                     | N                    | N                                  | N                               | <state> |    Y                 |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | Basic Home | ACT   | N            |    Y         |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | RSOT-EA  | 7001068488 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | RSOT-GA  | 5261512002 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |

    Examples:
      | customerStatus | fuelType | eleDiscount | gasDiscount | campaign         | folderName                                   | state | sourceSystem | journey   | AAH | DD | customerType | newOrExisting |
      | New            | BOTH     | No          | No          | basichome-finder | E2E_Campaign_basichome-finder_ACT_new_moving | ACT   | Quote Tool   | Move Home | No  | No | RES          | New           |

   @DR22.5.5.campaign
  Scenario Outline: Validate complete data for basichome-finder campaign for SA new non moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "5076" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | state | Feature_noStandardConnectionFee |Feature_moveHomeCredit|
      | ELE      | N                | Y                     | Y                    | SA    | N                               |    Y                 |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | state | Feature_noStandardConnectionFee |Feature_moveHomeCredit|
      | GAS      | N                | Y                     | N                    | SA    | N                               |    Y                 |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | Basic Home | SA    | N            |    Y         |
    And user clicks on Add plan button
#    And user validates plan details on cart page for "<campaign>"
#      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | Feature_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
#      | ELE      | N                | Y                     | Y                    | N                                  | <state> |    Y                 |
#    And user validates plan details on cart page for "<campaign>"
#      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | Feature_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
#      | GAS      | N                | Y                     | N                    | N                                  | <state> |    Y                 |
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
      | lifeSupportOption | fuelType | EleclifeSupportDevices                         | GaslifeSupportDevices |
      | Yes               | ELE      | Crigler Najjar Syndrome Phototherapy Equipment |                       |
    And user verifies selected plan details for '<fuelType>'
#    And user opts in for Carbon Neutral
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | N                     | Y                    | N                                  | N                               | <state> |    Y                 |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | GAS      | N                | N                     | N                    | N                                  | N                               | <state> |    Y                 |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | Basic Home | SA    | N            |    N         |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | COR       | RSOT-ES  | 2001245279 |                                |                                | Y                       | LSCNSPE                  | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | COR       | RSOT-GS  | 5510149276 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |

    Examples:
      | customerStatus | fuelType | eleDiscount | gasDiscount | campaign         | folderName                                     | state | sourceSystem | journey | AAH | DD | customerType | newOrExisting |
      | New            | BOTH     | No          | No          | basichome-finder | E2E_Campaign_basichome-finder_SA_new_nonmoving | SA    | Quote Tool   | COR     | No  | No | RES          | New           |

   @DR22.5.5.campaign
  Scenario Outline: Validate complete data for basichome-finder campaign for QLD
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "4208" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | state | Feature_noStandardConnectionFee |Feature_moveHomeCredit|
      | ELE      | N                | Y                     | Y                    | QLD   | N                               |    Y                 |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | Basic Home | QLD   | N            |    Y         |
    And user clicks on Select plan button
#    And user validates plan details on cart page for "<campaign>"
#      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | Feature_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
#      | ELE      | N                | Y                     | Y                    | N                                  | <state> |    Y                 |
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
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user verifies selected plan details for '<fuelType>'
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | N                     | Y                    | N                                  | N                               | <state> |    Y                 |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | Basic Home | QLD   | N            |    Y         |
    And user validates source code
      | fuelType | eleSourceCode |
      | ELE      | Basic         |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | GRT-EQ   | 3115863522 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |

    Examples:
      | customerStatus | fuelType | eleDiscount | campaign         | folderName                        | state | sourceSystem | journey   | AAH | DD | customerType | newOrExisting |
      | New            | ELE      | No          | basichome-finder | E2E_Campaign_basichome-finder_QLD | QLD   | Quote Tool   | Move Home | No  | No | RES          | New           |

   @DR22.5.5.campaign
  Scenario Outline: Validate complete data for basichome-finder campaign for VIC
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "3188" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | state | Feature_noStandardConnectionFee |Feature_moveHomeCredit|
      | ELE      | N                | Y                     | Y                    | VIC   | N                               |    Y                 |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | state | Feature_noStandardConnectionFee |Feature_moveHomeCredit|
      | GAS      | N                | Y                     | N                    | VIC   | N                               |    Y                 |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | Basic Home | VIC   | N            |    Y         |
    And user clicks on Add plan button
#    And user validates plan details on cart page for "<campaign>"
#      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_defaultOffer | state   |Feature_moveHomeCredit|
#      | ELE      | N                | Y                     | N                   | Y                    | <state> |    Y                 |
#    And user validates plan details on cart page for "<campaign>"
#      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_defaultOffer | state   |Feature_moveHomeCredit|
#      | GAS      | N                | Y                     | N                   | N                    | <state> |    Y                 |
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                        | movingType | propertyType |
      | RES          | 8 Charming Street, HAMPTON EAST VIC 3188 | Moving     | Renter       |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType         | medicareType |
      | RES          | RES     | New            | test      | test     | Driver License |              |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices                         | GaslifeSupportDevices |
      | Yes               | BOTH     | Crigler Najjar Syndrome Phototherapy Equipment | Gas Other             |
    And user verifies selected plan details for '<fuelType>'
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_defaultOffer | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | N                     | N                   | Y                    | N                               | <state> |    Y                 |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_defaultOffer | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | GAS      | N                | N                     | N                   | N                    | N                               | <state> |    Y                 |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | Basic Home | VIC   | N            |    Y         |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | RSOT-EV  | 6407220527 | N                              | N                              | Y                       | LSCNSPE                  | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | RSOT-GV  | 5310571403 | N                              | N                              | Y                       | OTHER                    | EMAIL         | <customerStatus> | <campaign> |

    Examples:
      | customerStatus | fuelType | eleDiscount | gasDiscount | campaign         | folderName                        | state | sourceSystem | journey   | AAH | DD | customerType | newOrExisting |
      | New            | BOTH     | No          | No          | basichome-finder | E2E_Campaign_basichome-finder_VIC | VIC   | Quote Tool   | Move Home | No  | No | RES          | New           |

   @DR22.5.5.campaign
  Scenario Outline: Validate complete data for basichome-finder campaign for QLD existing non moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "4500" and clicks on show me plan link
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | state | Feature_noStandardConnectionFee |Feature_moveHomeCredit|
      | ELE      | N                | Y                     | Y                    | QLD   | N                               |    Y                 |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | Basic Home | <state> | N            |    Y         |
    And user clicks on Select plan button
#    And user validates plan details on cart page for "<campaign>"
#      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_defaultOffer | state   |Feature_moveHomeCredit|
#      | ELE      | N                | Y                     | N                   | Y                    | <state> |    Y                 |
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      | customerStatus   | accountNumber | accountIdentityType | postcodeOrABNACN | idType | idValue   |
#      | <customerStatus> | 9485951606    | Postcode            | 4215             | dl     | 139955532 |
      | <customerStatus> | 8401947303    | Postcode            | 4504             | dl     | 233698026 |
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
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_defaultOffer | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | N                     | N                   | Y                    | N                               | <state> |    N                 |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | Basic Home | <state> | N            |    N         |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | PS        | GRT-EQ   | 3114744490 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType | campaign         | folderName                                            | state | sourceSystem | journey     | AAH | DD | customerType | newOrExisting        |
      | Existing       | ELE      | basichome-finder | E2E_Campaign_basichome-finder_QLD_existing_non-moving | QLD   | Quote Tool   | Plan Switch | No  | No | RES          | Existing  non-moving |

