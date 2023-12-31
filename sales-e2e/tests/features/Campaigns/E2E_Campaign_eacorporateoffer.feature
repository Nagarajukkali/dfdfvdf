@campaign10.2
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


Feature:E2E scenario for eacorporateoffer

  Scenario Outline: Validate complete data for EACorporateOffer campaign for NSW for new moving customer
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "reward" and "2000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee |state  |
      | ELE      | Y                | Y                     | Y                   | Y                                  | N                               |<state> |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee |state  |
      | GAS      | Y                | Y                     | Y                   | Y                                  | N                               |<state>|
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state |signUpCredit|
      | Y                        | Y         | Y            | Total Plan | <state>   |Y           |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill |state  |
      | ELE      | Y                | Y                     | Y                   | Y                                  |<state> |
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill |state  |
      | GAS      | Y                | Y                     | Y                   | Y                                  |<state> |
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                   | movingType | propertyType |
      | RES          | 74 Yillowra Street, AUBURN NSW 2144 | Moving     | Renter       |
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
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user provides life support details on review page
      |lifeSupportOption|fuelType |EleclifeSupportDevices    |GaslifeSupportDevices  |
      |No               |         |                          |                       |
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state  |
      |ELE      |Y                 |N                       |Y                    |Y                                    |N                                |<state>|
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state  |
      |GAS      |Y                 |N                       |Y                    |Y                                    |N                                |<state>|
    And user validates disclaimer on review page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName  |state|signUpCredit|
      |Y                        |Y          |Y              |Total Plan|<state>  |Y           |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | TOPH-EN  | 4102681649 |                               |                               | N                       |                   | EMAIL         |<customerStatus>  |<campaign>|
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType |customerStatus    |campaign  |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | TOPH-GN  | 5240524910 |                               |                               | N                       |                     | EMAIL         |<customerStatus>  |<campaign>|

    Examples:
      | customerStatus | fuelType | eleDiscount | gasDiscount | campaign         | folderName                       | state | sourceSystem | journey   | AAH | DD | customerType | newOrExisting |
      | New            | BOTH     | 17          | 17          | EACorporateOffer | E2E_Campaign_EACoporateOffer_NSW | NSW   | Quote Tool   | Move Home | No  | No | RES          | New           |

  Scenario Outline: Validate complete data for EACorporateOffer campaign for VIC for new moving customer
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "reward" and "3188" and clicks on show me plan link
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee |state|
      | ELE      | Y                | Y                     | Y                   | Y                                  | N                               |<state> |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee |state|
      | GAS      | Y                | Y                     | Y                   | Y                                  | N                               |<state> |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state |signUpCredit|
      | Y                        | Y         | Y            | Total Plan | <state>   |Y           |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill |state|
      | ELE      | Y                | Y                     | Y                   | Y                                  |<state> |
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill |state|
      | GAS      | Y                | Y                     | Y                   | Y                                  |<state> |
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                        | movingType | propertyType |
      | RES          | 9 Charming Street, HAMPTON EAST VIC 3188 | Moving     | Renter       |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType         | medicareType |
      | RES          | RES     | New            | test      | test     | Driver License |              |
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType |EleclifeSupportDevices    |GaslifeSupportDevices  |
      |No               |         |                          |                       |
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state  |
      |ELE      |Y                 |N                       |Y                    |Y                                    |N                                |<state>|
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state  |
      |GAS      |Y                 |N                       |Y                    |Y                                    |N                                |<state>|
    And user validates disclaimer on review page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName  |state|signUpCredit|
      |Y                        |Y          |Y              |Total Plan|<state>  |Y           |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | TOPH-EV  | 6407220528 | N                              | N                              | N                       |                   | EMAIL         |<customerStatus>  |<campaign>|
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType |customerStatus    |campaign  |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | TOPH-GV  | 5310571404 | N                              | N                              | N                       |                     | EMAIL         |<customerStatus>  |<campaign>|

    Examples:
      | customerStatus | fuelType | eleDiscount | gasDiscount | campaign         | folderName                        | state | sourceSystem | journey   | AAH | DD | customerType | newOrExisting |
      | New            | BOTH     | 12          | 29          | EACorporateOffer | E2E_Campaign_EACorporateOffer_VIC | VIC   | Quote Tool   | Move Home | No  | No | RES          | New           |

  Scenario Outline: Validate complete data for EACorporateOffer campaign for SA for new moving customer
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "reward" and "5076" and clicks on show me plan link
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee |state|
      | ELE      | Y                | Y                     | Y                   | Y                                  | N                               |<state> |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee |state|
      | GAS      | Y                | Y                     | Y                   | Y                                  | N                               |<state> |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state |signUpCredit|
      | Y                        | Y         | Y            | Total Plan | <state>   |Y           |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill |state|
      | ELE      | Y                | Y                     | Y                   | Y                                  |<state> |
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill |state|
      | GAS      | Y                | Y                     | Y                   | Y                                  |<state> |
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                 | movingType | propertyType |
      | RES          | 3 River Drive, ATHELSTONE SA 5076 | Moving     | Renter       |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType         | medicareType |
      | RES          | RES     | New            | test      | test     | Driver License |              |
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType |EleclifeSupportDevices    |GaslifeSupportDevices  |
      |No               |         |                          |                       |
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state  |
      |ELE      |Y                 |N                       |Y                    |Y                                    |N                                |<state>|
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state  |
      |GAS      |Y                 |N                       |Y                    |Y                                    |N                                |<state>|
    And user validates disclaimer on review page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName  |state|signUpCredit|
      |Y                        |Y          |Y              |Total Plan|<state>  |Y           |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | TOPH-ES  | 2001245279 |                                |                                | N                       |                   | EMAIL         |<customerStatus>  |<campaign>|
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType |customerStatus    |campaign  |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | TOPH-GS  | 5510149276 |                                |                                | N                       |                          | EMAIL         |<customerStatus>  |<campaign>|

    Examples:
      | customerStatus | fuelType | eleDiscount | gasDiscount | campaign         | folderName                       | state | sourceSystem | journey   | AAH | DD | customerType | newOrExisting |
      | New            | BOTH     | 14           | 14          | EACorporateOffer | E2E_Campaign_EACorporateOffer_SA | SA    | Quote Tool   | Move Home | No  | No | RES          | New           |

  Scenario Outline: Validate complete data for EACorporateOffer campaign for ACT for new moving customer
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "reward" and "2615" and clicks on show me plan link
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee |state|
      | ELE      | N                | Y                     | Y                   | Y                                  | N                               |<state> |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee |state|
      | GAS      | N                | Y                     | Y                   | Y                                  | N                               |<state> |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state |
      | Y                        | Y         | Y            | Total Plan | <state>   |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill |state|
      | ELE      | N                | Y                     | Y                   | Y                                  |<state> |
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill |state|
      | GAS      | N                | Y                     | Y                   | Y                                  |<state> |
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                         | movingType | propertyType |
      | RES          | 126 Shakespeare Crescent, FRASER ACT 2615 | Moving     | Renter       |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType         | medicareType |
      | RES          | RES     | New            | test      | test     | Driver License |              |
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType |EleclifeSupportDevices    |GaslifeSupportDevices  |
      |No               |         |                          |                       |
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state  |
      |ELE      |N                 |N                       |Y                    |Y                                    |N                                |<state>|
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state  |
      |GAS      |N                 |N                       |Y                    |Y                                    |N                                |<state>|
    And user validates disclaimer on review page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName  |state|
      |Y                        |Y          |Y              |Total Plan|<state>  |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | TOPH-EA  | 7001068488 |                                |                                | N                       |                          | EMAIL         |<customerStatus>  |<campaign>|
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType |customerStatus    |campaign  |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | TOPH-GA  | 5261512002 |                                |                                | N                       |                          | EMAIL         |<customerStatus>  |<campaign>|

    Examples:
      | customerStatus | fuelType | eleDiscount | gasDiscount | campaign         | folderName                        | state | sourceSystem | journey   | AAH | DD | customerType | newOrExisting |
      | New            | BOTH     | 14          | 18          | EACorporateOffer | E2E_Campaign_EACorporateOffer_ACT | ACT   | Quote Tool   | Move Home | No  | No | RES          | New           |

  Scenario Outline: Validate complete data for EACorporateOffer campaign for QLD for new moving customer
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "reward" and "4208" and clicks on show me plan link
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee |state|
      | ELE      | Y                | Y                     | Y                   | Y                                  | N                               |<state> |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state |signUpCredit|
      | Y                        | Y         | Y            | Total Plan | <state>   |Y           |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill |state|
      | ELE      | Y                | Y                     | Y                   | Y                                  |<state> |
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                     | movingType | propertyType |
      | RES          | 13 Jacobs Ridge Road, ORMEAU QLD 4208 | Moving     | Renter       |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType         | medicareType |
      | RES          | RES     | New            | test      | test     | Driver License |              |
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_discountOffTotalEnergyBill | Feature_peaceOfMind | Feature_noStandardConnectionFee |state|
      | ELE      | Y                | N                     | Y                                  | Y                   | N                               |<state> |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state |signUpCredit|
      | Y                        | Y         | Y            | Total Plan | QLD   |Y           |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | TOPH-EQ  | 3115863522 |                                |                                | N                       |                          | EMAIL         |<customerStatus>  |<campaign>|

    Examples:
      | customerStatus | fuelType | eleDiscount | campaign         | folderName                        | state | sourceSystem | journey   | AAH | DD | customerType | newOrExisting |
      | New            | ELE      | 15          | EACorporateOffer | E2E_Campaign_EACorporateOffer_QLD | QLD   | Quote Tool   | Move Home | No  | No | RES          | New           |
