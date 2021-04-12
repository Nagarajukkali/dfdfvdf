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

Feature:E2E scenario for basic-home campaign

    Scenario Outline: Validate complete data for basic-home campaign for NSW new non moving
      Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
      When user provides "2144" and clicks on show me plan link
      And user validates the data on plans page for "<campaign>"
          | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | state | Feature_noStandardConnectionFee |
          | ELE      | N                | Y                     | Y                    | NSW   | N                               |
      And user validates the data on plans page for "<campaign>"
          | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | state | Feature_noStandardConnectionFee |
          | GAS      | N                | Y                     | N                    | NSW   | N                               |
      And user validates disclaimer on plans page for "<campaign>"
          | referencePriceComparison | goNeutral | solarBuyBack | planName   | state |signUpCredit|
          | Y                        | Y         | Y            | Basic Home | NSW   |N           |
      And user clicks on Add plan button
      And user validates plan details on cart page for "<campaign>"
          | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | Feature_discountOffTotalEnergyBill |state|
          | ELE      | N                | Y                     | Y                    | N                                  |<state>|
      And user validates plan details on cart page for "<campaign>"
          | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | Feature_discountOffTotalEnergyBill |state|
          | GAS      | N                | Y                     | N                    | N                                  |<state>|
      And user selects '<customerStatus>' on qualifier
      And user provides all other details on qualifier page
          | customerType | connectionAddress                   | movingType | propertyType | solarOption |
          | RES          | 74 Yillowra Street, AUBURN NSW 2144 | Non-Moving | Renter       | No          |
      And user provides all details on checkout details page
          | customerType | journey | customerStatus | firstName | lastName | idType         |
          | RES          | RES     | New            | test      | test     | Driver License |
      And user selects mailing address option
        |addressType       |otherAddress                              |
        |Connection Address|                                          |
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
      And user selects carbon neutral option
      And user validates plan details on review page for "<campaign>"
          | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | Feature_noStandardConnectionFee |state|
          | ELE      | N                | N                     | Y                    | N                               |<state>|
      And user validates plan details on review page for "<campaign>"
          | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | Feature_discountOffTotalEnergyBill |state|
          | GAS      | N                | N                     | N                    | N                                  |<state>|
      And user validates disclaimer on review page for "<campaign>"
          | referencePriceComparison | goNeutral | solarBuyBack | planName   | state |signUpCredit|
          | Y                        | Y         | Y            | Basic Home | NSW   |N           |
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
          | fuelType | quoteStatus      | customerType | offerType | planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType |customerStatus    |campaign  |
          | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | COR       | RSOT-EN  | 4102681649 | N                              | N                              | Y                       | LSCNSPE                  | EMAIL         |<customerStatus>  |<campaign>|
      And user validates all the details for 'GAS' submitted quote
      And user validates below mandatory fields
          | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType |customerStatus    |campaign  |
          | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | COR       | RSOT-GN  | 5240524910 | N                              | N                              | Y                       | OTHER                    | EMAIL         |<customerStatus>  |<campaign>|

      Examples:
          | customerStatus | fuelType | eleDiscount | gasDiscount | campaign   | folderName                               | state | sourceSystem | journey | AAH | DD | customerType | newOrExisting |
          | New            | BOTH     | No          | No          | basic-home | E2E_Campaign_basicHome_new_nonmoving_NSW | NSW   | Quote Tool   | COR     | No  | No | RES          | New           |

    Scenario Outline: Validate complete data for basic-home campaign for ACT for new moving
      Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
      When user provides "2615" for postcode and proceed to view the plans
      And user validates the data on plans page for "<campaign>"
          | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | state | Feature_noStandardConnectionFee |
          | ELE      | Y                | Y                     | Y                    | ACT   | N                               |
      And user validates the data on plans page for "<campaign>"
          | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | state | Feature_noStandardConnectionFee |
          | GAS      | Y                | Y                     | N                    | ACT   | N                               |
      And user validates disclaimer on plans page for "<campaign>"
          | referencePriceComparison | goNeutral | solarBuyBack | planName   | state |signUpCredit|
          | Y                        | Y         | Y            | Basic Home | ACT   |Y           |
      And user clicks on Add plan button
      And user validates plan details on cart page for "<campaign>"
          | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | Feature_discountOffTotalEnergyBill |state|
          | ELE      | Y                | Y                     | Y                    | N                                  |<state>|
      And user validates plan details on cart page for "<campaign>"
          | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | Feature_discountOffTotalEnergyBill |state|
          | GAS      | Y                | Y                     | N                    | N                                  |<state>|
      And user selects '<customerStatus>' on qualifier
      And user provides all other details on qualifier page
          | customerType | connectionAddress                         | movingType | propertyType | solarOption |
          | RES          | 126 Shakespeare Crescent, FRASER ACT 2615 | Moving     | Renter       | No          |
      And user provides all details on checkout details page
          | customerType | journey | customerStatus | firstName | lastName | idType         | medicareType |
          | RES          | RES     | New            | test      | test     | Driver License |              |
      And user selects mailing address option
        |addressType       |otherAddress                              |
        |Connection Address|                                          |
      And user selects answer for property renovation question for '<state>'
      And user clicks on 'Review your order' button and navigates to review page
      And user provides life support details on review page
          | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
          | No                |          |                        |                       |
      And user verifies selected plan details for '<fuelType>'
      And user validates plan details on review page for "<campaign>"
          | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee |state|
          | ELE      | Y                | N                     | Y                    | N                                  | N                               |<state>|
      And user validates plan details on review page for "<campaign>"
          | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee |state|
          | GAS      | Y                | N                     | N                    | N                                  | N                               |<state>|
      And user validates disclaimer on review page for "<campaign>"
          | referencePriceComparison | goNeutral | solarBuyBack | planName   | state |signUpCredit|
          | Y                        | Y         | Y            | Basic Home | ACT   |Y           |
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
          | fuelType | quoteStatus      | customerType | offerType | planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType |customerStatus    |campaign  |
          | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | RSOT-EA  | 7001068488 |                                |                                | N                       |                          | EMAIL         |<customerStatus>  |<campaign>|
      And user validates all the details for 'GAS' submitted quote
      And user validates below mandatory fields
          | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType |customerStatus    |campaign  |
          | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | RSOT-GA  | 5261512002 |                                |                                | N                       |                          | EMAIL         |<customerStatus>  |<campaign>|

      Examples:
          | customerStatus | fuelType | eleDiscount | gasDiscount | campaign   | folderName                            | state | sourceSystem | journey   | AAH | DD | customerType | newOrExisting |
          | New            | BOTH     | No          | No          | basic-home | E2E_Campaign_basicHome_new_moving_ACT | ACT   | Quote Tool   | Move Home | No  | No | RES          | New           |

    Scenario Outline: Validate complete data for basic-home campaign for SA for new moving
        Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
        When user provides "5076" for postcode and proceed to view the plans
        Then user is presented with the plans
        And user validates the data on plans page for "<campaign>"
            | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | state | Feature_noStandardConnectionFee |
            | ELE      | N                | Y                     | Y                    | SA    | N                               |
        And user validates the data on plans page for "<campaign>"
            | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | state | Feature_noStandardConnectionFee |
            | GAS      | N                | Y                     | N                    | SA    | N                               |
        And user validates disclaimer on plans page for "<campaign>"
            | referencePriceComparison | goNeutral | solarBuyBack | planName   | state |signUpCredit|
            | Y                        | Y         | Y            | Basic Home | SA    |N           |
        And user clicks on Add plan button
        And user validates plan details on cart page for "<campaign>"
            | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | Feature_discountOffTotalEnergyBill |state|
            | ELE      | N                | Y                     | Y                    | N                                  |<state>|
        And user validates plan details on cart page for "<campaign>"
            | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | Feature_discountOffTotalEnergyBill |state|
            | GAS      | N                | Y                     | N                    | N                                  |<state>|
        And user selects '<customerStatus>' on qualifier
        And user provides all other details on qualifier page
            | customerType | connectionAddress                 | movingType | propertyType | solarOption |
            | RES          | 3 River Drive, ATHELSTONE SA 5076 | Moving     | Renter       | No          |
        And user provides all details on checkout details page
            | customerType | journey | customerStatus | firstName | lastName | idType         | medicareType |
            | RES          | RES     | New            | test      | test     | Driver License |              |
      And user selects mailing address option
        |addressType       |otherAddress                              |
        |Connection Address|                                          |
        And user selects answer for property renovation question for '<state>'
        And user clicks on 'Review your order' button and navigates to review page
        And user provides life support details on review page
            | lifeSupportOption | fuelType | EleclifeSupportDevices                         | GaslifeSupportDevices |
            | Yes               | ELE      | Crigler Najjar Syndrome Phototherapy Equipment |                       |
        And user verifies selected plan details for '<fuelType>'
        And user opts in for Carbon Neutral
        And user validates plan details on review page for "<campaign>"
            | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee |state|
            | ELE      | N                | N                     | Y                    | N                                  | N                               |<state>|
        And user validates plan details on review page for "<campaign>"
            | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee |state|
            | GAS      | N                | N                     | N                    | N                                  | N                               |<state>|
        And user validates disclaimer on review page for "<campaign>"
            | referencePriceComparison | goNeutral | solarBuyBack | planName   | state |signUpCredit|
            | Y                        | Y         | Y            | Basic Home | SA    |N           |
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
            | fuelType | quoteStatus      | customerType | offerType | planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType |customerStatus    |campaign  |
            | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | RSOT-ES  | 2001245279 |                                |                                | Y                       | LSCNSPE                  | EMAIL         |<customerStatus>  |<campaign>|
        And user validates all the details for 'GAS' submitted quote
        And user validates below mandatory fields
            | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType |customerStatus    |campaign  |
            | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | RSOT-GS  | 5510149276 |                                |                                | N                       |                          | EMAIL         |<customerStatus>  |<campaign>|

        Examples:
            | customerStatus | fuelType | eleDiscount | gasDiscount | campaign   | folderName                           | state | sourceSystem | journey   | AAH | DD | customerType | newOrExisting |
            | New            | BOTH     | No          | No          | basic-home | E2E_Campaign_basicHome_new_moving_SA | SA    | Quote Tool   | Move Home | No  | No | RES          | New           |

    Scenario Outline: Validate complete data for basic-home campaign for QLD
      Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
      When user provides "4208" for postcode and proceed to view the plans
      Then user is presented with the plans
      And user validates the data on plans page for "<campaign>"
          | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | state | Feature_noStandardConnectionFee |
          | ELE      | N                | Y                     | Y                    | QLD   | N                               |
      And user validates disclaimer on plans page for "<campaign>"
          | referencePriceComparison | goNeutral | solarBuyBack | planName   | state |signUpCredit|
          | Y                        | Y         | Y            | Basic Home | QLD   |N           |
      And user clicks on Add plan button
      And user validates plan details on cart page for "<campaign>"
          | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | Feature_discountOffTotalEnergyBill |state|
          | ELE      | N                | Y                     | Y                    | N                                  |<state>|
      And user moves on to fill the qualifier
      And user selects '<customerStatus>' on qualifier
      And user provides all other details on qualifier page
          | customerType | connectionAddress                     | movingType | propertyType | solarOption |
          | RES          | 13 Jacobs Ridge Road, ORMEAU QLD 4208 | Moving     | Renter       | No          |
      And user provides all details on checkout details page
          | customerType | journey | customerStatus | firstName | lastName | idType         | medicareType |
          | RES          | RES     | New            | test      | test     | Driver License |              |
      And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
      And user selects answer for property renovation question for '<state>'
      And user clicks on 'Review your order' button and navigates to review page
      And user provides life support details on review page
          | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
          | No                |          |                        |                       |
      And user verifies selected plan details for '<fuelType>'
      And user validates plan details on review page for "<campaign>"
          | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee |state|
          | ELE      | N                | N                     | Y                    | N                                  | N                               |<state>|
      And user validates disclaimer on review page for "<campaign>"
          | referencePriceComparison | goNeutral | solarBuyBack | planName   | state |signUpCredit|
          | Y                        | Y         | Y            | Basic Home | QLD   |N           |
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
          | fuelType | quoteStatus      | customerType | offerType | planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType |customerStatus    |campaign  |
          | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | GRT-EQ   | 3115863522 |                                |                                | N                       |                          | EMAIL         |<customerStatus>  |<campaign>|

      Examples:
          | customerStatus | fuelType | eleDiscount | campaign   | folderName                 | state | sourceSystem | journey   | AAH | DD | customerType | newOrExisting |
          | New            | ELE      | No          | basic-home | E2E_Campaign_basicHome_QLD | QLD   | Quote Tool   | Move Home | No  | No | RES          | New           |

    Scenario Outline: Validate complete data for basic-home campaign for VIC
      Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
      When user provides "3188" for postcode and proceed to view the plans
      Then user is presented with the plans
      And user validates the data on plans page for "<campaign>"
          | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | state | Feature_noStandardConnectionFee |
          | ELE      | N                | Y                     | Y                    | VIC   | N                               |
      And user validates the data on plans page for "<campaign>"
          | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | state | Feature_noStandardConnectionFee |
          | GAS      | N                | Y                     | N                    | VIC   | N                               |
      And user validates disclaimer on plans page for "<campaign>"
          | referencePriceComparison | goNeutral | solarBuyBack | planName   | state |signUpCredit|
          | Y                        | Y         | Y            | Basic Home | VIC   |N           |
      And user clicks on Add plan button
      And user validates plan details on cart page for "<campaign>"
          | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_defaultOffer |state|
          | ELE      | N               | Y                     | N                   | Y                    |<state>|
      And user validates plan details on cart page for "<campaign>"
          | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_defaultOffer |state|
          | GAS      | N                | Y                     | N                   | N                    |<state>|
      And user selects '<customerStatus>' on qualifier
      And user provides all other details on qualifier page
          | customerType | connectionAddress                        | movingType | propertyType | solarOption |
          | RES          | 9 Charming Street, HAMPTON EAST VIC 3188 | Moving     | Renter       | No          |
      And user provides all details on checkout details page
          | customerType | journey | customerStatus | firstName | lastName | idType         | medicareType |
          | RES          | RES     | New            | test      | test     | Driver License |              |
      And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
      And user selects answer for property renovation question for '<state>'
      And user clicks on 'Review your order' button and navigates to review page
      And user provides life support details on review page
          | lifeSupportOption | fuelType | EleclifeSupportDevices                         | GaslifeSupportDevices |
          | Yes               | BOTH     | Crigler Najjar Syndrome Phototherapy Equipment | Gas Other             |
      And user verifies selected plan details for '<fuelType>'
      And user validates plan details on review page for "<campaign>"
          | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_defaultOffer | Feature_noStandardConnectionFee |state|
          | ELE      | N                | N                     | N                   | Y                    | N                               |<state>|
      And user validates plan details on review page for "<campaign>"
          | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_defaultOffer | Feature_noStandardConnectionFee |state|
          | GAS      | N                | N                     | N                   | N                    | N                               |<state>|
      And user validates disclaimer on review page for "<campaign>"
          | referencePriceComparison | goNeutral | solarBuyBack | planName   | state |signUpCredit|
          | Y                        | Y         | Y            | Basic Home | VIC   |N           |
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
          | fuelType | quoteStatus      | customerType | offerType | planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType |customerStatus    |campaign  |
          | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | RSOT-EV  | 6407220528 | N                              | N                              | Y                       | LSCNSPE                  | EMAIL         |<customerStatus>  |<campaign>|
      And user validates all the details for 'GAS' submitted quote
      And user validates below mandatory fields
          | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType |customerStatus    |campaign  |
          | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | RSOT-GV  | 5310571404 | N                              | N                              | Y                       | OTHER                    | EMAIL         |<customerStatus>  |<campaign>|

      Examples:
          | customerStatus | fuelType | eleDiscount | gasDiscount | campaign   | folderName                 | state | sourceSystem | journey   | AAH | DD | customerType | newOrExisting |
          | New            | BOTH     | No          | No          | basic-home | E2E_Campaign_basicHome_VIC | VIC   | Quote Tool   | Move Home | No  | No | RES          | New           |

  Scenario Outline: Validate complete data for basic-home campaign for VIC existing non moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "3000" and clicks on show me plan link
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | state | Feature_noStandardConnectionFee |
      | ELE      | N                | Y                     | Y                    | VIC   | N                               |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | state | Feature_noStandardConnectionFee |
      | GAS      | N                | Y                     | N                    | VIC   | N                               |
    And user validates disclaimer on plans page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName  |state|signUpCredit|
      |Y                        |Y          |Y              |Basic Home |<state>  |N           |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_defaultOffer |state|
      | ELE      | N               | Y                     | N                   | Y                    |<state>|
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_defaultOffer |state|
      | GAS      | N                | Y                     | N                   | N                    |<state>|
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      |customerStatus   |accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |<customerStatus> |5124968245   |Postcode           |3029            |dl   |390399008|
    And user provides all other details on qualifier page for Existing customer
      |customerType|movingType |propertyType |solarOption|
      |RES         |Non-Moving |Renter       |No         |
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus   | firstName| lastName|idType        |
      |RES         |RES        |<customerStatus> | test     |test     |Driver License|
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType |EleclifeSupportDevices    |GaslifeSupportDevices  |
      |No               |         |                          |                       |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_defaultOffer | Feature_noStandardConnectionFee |state|
      | ELE      | N                | N                     | N                   | Y                    | N                               |<state>|
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_defaultOffer | Feature_noStandardConnectionFee |state|
      | GAS      | N                | N                     | N                   | N                    | N                               |<state>|
    And user validates disclaimer on review page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName  |state|signUpCredit|
      |Y                        |Y          |Y              |Basic Home|<state>  |N       |
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|customerStatus    |campaign  |
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |PS       |RSOT-EV |6203817483|N                             |N                             |N                      |                 |EMAIL        |<customerStatus>  |<campaign>|
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|customerStatus    |campaign  |
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |PS       |RSOT-GV |5330790589|N                             |N                             |N                      |                   |EMAIL        |<customerStatus>  |<campaign>|
    Examples:
      |customerStatus|fuelType|campaign   |folderName                                     |state|sourceSystem  |journey    |AAH  |DD  |customerType |newOrExisting        |
      |Existing      |BOTH    |basic-home |E2E_Campaign_basicHome_VIC_existing_non-moving |VIC  |Quote Tool    |Plan Switch|No   |No  |RES          |Existing  non-moving |
