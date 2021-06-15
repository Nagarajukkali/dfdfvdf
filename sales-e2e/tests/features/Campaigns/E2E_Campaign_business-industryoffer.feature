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

Feature:E2E scenario for business-industryoffer campaign
@campaign21.6.4 @demo2
    Scenario Outline: Validate complete data for business-industryoffer campaign for NSW
        Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
        When user provides "NSWCOCOFFER" and "2010" and clicks on show me plan link
        Then user is presented with the plans
        And user validates "ELE" discount to be "<eleDiscount>" percent
        And user validates "GAS" discount to be "<gasDiscount>" percent
        And user validates the data on plans page for "<campaign>"
            | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee |
            | ELE      | N                | N                     | Y                   | Y                                  | N                               |
        And user validates the data on plans page for "<campaign>"
            | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee |
            | GAS      | N                | N                     | Y                   | Y                                  | N                               |
        And user validates disclaimer on plans page for "<campaign>"
            | referencePriceComparison | goNeutral | solarBuyBack | planName       | state |
            | Y                        | N         | Y            | Total Plan - Business | NSW   |
        And user clicks on Add plan button
        And user validates plan details on cart page for "<campaign>"
            | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill |
            | ELE      | N                | N                     | Y                   | Y                                  |
        And user validates plan details on cart page for "<campaign>"
            | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill |
            | GAS      | N                | N                     | Y                   | Y                                  |
        And user selects '<customerStatus>' on qualifier
        And user provides all other details on qualifier page
            | customerType | connectionAddress                    | movingType | propertyType |
            | BUS          | 10 Hank Street, HEATHERBRAE NSW 2324 | Moving     | Renter       |
        And user provides all details on checkout details page
            | customerType | journey | firstName | lastName | businessType |
            | BUS          | BUS     | test      | test     | ABN          |
      And user selects mailing address option
        |addressType       |otherAddress                              |
        |Connection Address|                                          |
        And user validates details on checkout details page
            | sourceSystem   | journey   | fuelType   |
            | <sourceSystem> | <journey> | <fuelType> |
        And user selects answer for property renovation question for '<state>'
        And user clicks on 'Review your order' button and navigates to review page
        And user validates details on checkout review page
            | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
            | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
        And user provides life support details on review page
            | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices                              |
            | Yes               | BOTH     | Ele Other              | Medically Required Heating and/or Air Conditioning |
        And user verifies selected plan details for '<fuelType>'
        And user validates plan details on review page for "<campaign>"
            | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee |
            | ELE      | N                | N                     | Y                   | Y                                  | N                               |
        And user validates plan details on review page for "<campaign>"
            | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee |
            | GAS      | N                | N                     | Y                   | Y                                  | N                               |
        And user validates disclaimer on review page for "<campaign>"
            | referencePriceComparison | goNeutral | solarBuyBack | planName       | state |
            | Y                        | N         | Y            | Total Plan - Business | NSW   |
        And user validates source code
            | fuelType | eleSourceCode | gasSourceCode |
            | BOTH     | Total_22%GD   | Total_20%GD   |
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
            | fuelType | quoteStatus      | customerType | offerType | planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType |
            | ELE      | VERBALLYACCEPTED | BUSINESS     | ENE       | TOPB-EN  | 4102013997 |                                |                                | Y                       | OTHER                    | EMAIL         |
        And user validates all the details for 'GAS' submitted quote
        And user validates below mandatory fields
            | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType |
            | GAS      | VERBALLYACCEPTED | BUSINESS     | ENE       | TOPB-GN  | 5247067723 |                                |                                | Y                       | GLSMRHAC                 | EMAIL         |

        Examples:
            | customerStatus | fuelType | eleDiscount | gasDiscount | campaign               | folderName                              | sourceSystem | journey   | state | customerType | newOrExisting | AAH | DD |
            | New            | BOTH     | 22          | 20          | industryoffer | E2E_Campaign_business-industryoffer_NSW | Quote Tool   | Move Home | NSW   | BUS          | New           | No  | No |
@campaign21.6.4
Scenario Outline: Validate complete data for business-industryoffer campaign for NSW-Essential for new non-moving customer
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "2580" and clicks on show me plan link
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_chanceToWin|state|
      |ELE      |N                 |N                       |Y                    |Y                                    |N                                |N                  |<state>|
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_chanceToWin|state|
      |GAS      |N                 |N                       |Y                    |Y                                    |N                                |N                  |<state>|
    And user validates disclaimer on plans page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |chanceToWin|planName               |state  |signUpCredit|
      |Y                        |N          |Y              |N          |Total Plan - Business  |<state>|N           |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_chanceToWin|state|
      |ELE      |N                 |N                       |Y                    |Y                                    |N                                |N                  |<state>|
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_chanceToWin|state|
      |GAS      |N                 |N                       |Y                    |Y                                    |N                                |N                  |<state>|
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType |connectionAddress                       |movingType |propertyType |
      |BUS          |465 Sandy Point Road, LOWER BORO NSW 2580  |Non-Moving     |Renter |
    And user provides all details on checkout details page
      |customerType|journey    | firstName| lastName|businessType|
      |BUS         |BUS        | test     |test     |ABN         |
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user validates details on checkout details page
      |sourceSystem   |journey    |fuelType   |
      |<sourceSystem> |<journey>  |<fuelType> |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices |GaslifeSupportDevices |
      |No               |        |                       |                      |
    And user verifies selected plan details for '<fuelType>'
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_chanceToWin|state|
      |ELE      |N                 |N                       |Y                    |Y                                    |N                                |N                  |<state>|
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_chanceToWin|state|
      |GAS      |N                 |N                       |Y                    |Y                                    |N                                |N                  |<state>|
    And user validates disclaimer on review page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |chanceToWin|planName              |state|signUpCredit|
      |Y                        |N          |Y              |N          |Total Plan - Business |<state>  |N       |
    And user validates source code
        | fuelType | eleSourceCode | gasSourceCode |
        | BOTH     | Total_19%GD   | Total_20%GD   |
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
      |fuelType|quoteStatus     |customerType|offerType|planCode |NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|customerStatus    |campaign  |
      |ELE     |VERBALLYACCEPTED|BUSINESS    |COR      |TOPB-EN  |           |                              |                              |N                      |                   |EMAIL        |<customerStatus>  |<campaign>|
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode |MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|customerStatus    |campaign  |
      |GAS     |VERBALLYACCEPTED|BUSINESS    |COR      |TOPB-GN  |          |                              |                              |N                      |                |EMAIL        |<customerStatus>  |<campaign>|

    Examples:
      |customerStatus|fuelType|eleDiscount|gasDiscount|campaign         |folderName                       |sourceSystem|journey  |state  |customerType |newOrExisting  |AAH |DD  |
      |New           |BOTH    |18         |19         |industryoffer |E2E_Campaign_business-energy_NSW-essential_new_nonmoving |Quote Tool  |Plan Switch|NSW    |BUS          |New            |No  |No  |
@campaign21.6.4
  Scenario Outline: Validate complete data for business-industryoffer campaign for NSW-Endeavour for new moving customer
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "2780" and clicks on show me plan link
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_chanceToWin|state|
      |ELE      |N                 |N                       |Y                    |Y                                    |N                                |N                  |<state>|
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_chanceToWin|state|
      |GAS      |N                 |N                       |Y                    |Y                                    |N                                |N                  |<state>|
    And user validates disclaimer on plans page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |chanceToWin|planName               |state|signUpCredit|
      |Y                        |N          |Y              |N          |Total Plan - Business  |<state>  |N       |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_chanceToWin|state|
      |ELE      |N                 |N                       |Y                    |Y                                    |N                                |N                  |<state>|
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_chanceToWin|state|
      |GAS      |N                 |N                       |Y                    |Y                                    |N                                |N                  |<state>|
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType |connectionAddress                       |movingType |propertyType |
      |BUS          |13 Station Street, WENTWORTH FALLS NSW 2782  |Moving     |Renter       |
    And user provides all details on checkout details page
      |customerType|journey    | firstName| lastName|businessType|
      |BUS         |BUS        | test     |test     |ABN         |
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user validates details on checkout details page
      |sourceSystem   |journey    |fuelType   |
      |<sourceSystem> |<journey>  |<fuelType> |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices |GaslifeSupportDevices |
      |No               |        |                       |                      |
    And user verifies selected plan details for '<fuelType>'
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_chanceToWin|state|
      |ELE      |N                 |N                       |Y                    |Y                                    |N                                |N                  |<state>|
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_chanceToWin|state|
      |GAS      |N                 |N                       |Y                    |Y                                    |N                                |N                  |<state>|
    And user validates disclaimer on review page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |chanceToWin|planName              |state|signUpCredit|
      |Y                        |N          |Y              |N          |Total Plan - Business |<state>  |N       |
    And user validates source code
        | fuelType | eleSourceCode | gasSourceCode |
        | BOTH     | Total_14%GD   | Total_20%GD   |
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
      |fuelType|quoteStatus     |customerType|offerType|planCode |NMI      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|customerStatus    |campaign  |
      |ELE     |VERBALLYACCEPTED|BUSINESS    |ENE      |TOPB-EN |4310504640|                              |                              |N                      |                        |EMAIL        |<customerStatus>  |<campaign>|
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode |MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|customerStatus    |campaign  |
      |GAS     |VERBALLYACCEPTED|BUSINESS    |ENE      |TOPB-GN  |           |                              |                              |N                      |                       |EMAIL        |<customerStatus>  |<campaign>|

    Examples:
      |customerStatus|fuelType|eleDiscount|gasDiscount|campaign         |folderName                                            |sourceSystem|journey  |state  |customerType |newOrExisting  |AAH |DD  |
      |New           |BOTH    |13         |19         |industryoffer  |E2E_Campaign_business-energy_NSW_Endeavour_new_moving |Quote Tool  |Move Home|NSW    |BUS          |New            |No  |No  |
 
 @campaign21.6.4
    Scenario Outline: Validate complete data for business-industryoffer campaign for VIC
        Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
        When user provides "NSWCOCOFFER" and "3020" and clicks on show me plan link
        Then user is presented with the plans
        And user validates "ELE" discount to be "<eleDiscount>" percent
        And user validates "GAS" discount to be "<gasDiscount>" percent
        And user validates the data on plans page for "<campaign>"
            | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee |
            | ELE      | N                | N                     | Y                   | Y                                  | N                               |
        And user validates the data on plans page for "<campaign>"
            | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee |
            | GAS      | N                | N                     | Y                   | Y                                  | N                               |
        And user validates disclaimer on plans page for "<campaign>"
            | referencePriceComparison | goNeutral | solarBuyBack | planName       | state |
            | Y                        | N         | Y            | Total Plan - Business | VIC   |
        And user clicks on Add plan button
        And user validates plan details on cart page for "<campaign>"
            | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill |
            | ELE      | N                | N                     | Y                   | Y                                  |
        And user validates plan details on cart page for "<campaign>"
            | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill |
            | GAS      | N                | N                     | Y                   | Y                                  |
        And user selects '<customerStatus>' on qualifier
        And user provides all other details on qualifier page
            | customerType | connectionAddress                      | movingType | propertyType |
            | BUS          | 1a Bell Street, SUNSHINE WEST VIC 3020 | Moving     | Renter       |
        And user provides all details on checkout details page
            | customerType | journey | firstName | lastName | businessType |
            | BUS          | BUS     | test      | test     | ABN          |
      And user selects mailing address option
        |addressType       |otherAddress                              |
        |Connection Address|                                          |
        And user validates details on checkout details page
            | sourceSystem   | journey   | fuelType   |
            | <sourceSystem> | <journey> | <fuelType> |
        And user selects answer for property renovation question for '<state>'
        And user clicks on 'Review your order' button and navigates to review page
        And user validates details on checkout review page
            | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
            | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
        And user provides life support details on review page
            | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices                              |
            | Yes               | BOTH     | Ele Other              | Medically Required Heating and/or Air Conditioning |
        And user verifies selected plan details for '<fuelType>'
        And user validates plan details on review page for "<campaign>"
            | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee |
            | ELE      | N                | N                     | Y                   | Y                                  | N                               |
        And user validates plan details on review page for "<campaign>"
            | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee |
            | GAS      | N                | N                     | Y                   | Y                                  | N                               |
        And user validates disclaimer on review page for "<campaign>"
            | referencePriceComparison | goNeutral | solarBuyBack | planName       | state |
            | Y                        | N         | Y            | Total Plan - Business | VIC   |
        And user validates source code
            | fuelType | eleSourceCode | gasSourceCode |
            | BOTH     | Total_6%GD    | Total_24%GD   |
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
            | fuelType | quoteStatus      | customerType | offerType | planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType |
            | ELE      | VERBALLYACCEPTED | BUSINESS     | ENE       | TOPB-EV  | 6203055100 |                                |                                | Y                       | OTHER                    | EMAIL         |
        And user validates all the details for 'GAS' submitted quote
        And user validates below mandatory fields
            | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType |
            | GAS      | VERBALLYACCEPTED | BUSINESS     | ENE       | TOPB-GV  | 5330460199 |                                |                                | Y                       | GLSMRHAC                 | EMAIL         |

        Examples:
            | customerStatus | fuelType | eleDiscount | gasDiscount | campaign               | folderName                              | sourceSystem | journey   | state | customerType | newOrExisting | AAH | DD |
            | New            | BOTH     | 6           | 24          | industryoffer | E2E_Campaign_business-industryoffer_VIC | Quote Tool   | Move Home | VIC   | BUS          | New           | No  | No |

    Scenario Outline: Validate complete data for business-industryoffer campaign for SA
        Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
        When user provides "NSWCOCOFFER" and "5072" and clicks on show me plan link
        Then user is presented with the plans
        And user validates "ELE" discount to be "<eleDiscount>" percent
        And user validates "GAS" discount to be "<gasDiscount>" percent
        And user validates the data on plans page for "<campaign>"
            | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee |
            | ELE      | N                | N                     | Y                   | Y                                  | N                               |
        And user validates the data on plans page for "<campaign>"
            | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee |
            | GAS      | N                | N                     | Y                   | Y                                  | N                               |
        And user validates disclaimer on plans page for "<campaign>"
            | referencePriceComparison | goNeutral | solarBuyBack | planName       | state |
            | Y                        | N         | Y            | Total Plan - Business | SA    |
        And user clicks on Add plan button
        And user validates plan details on cart page for "<campaign>"
            | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill |
            | ELE      | N                | N                     | Y                   | Y                                  |
        And user validates plan details on cart page for "<campaign>"
            | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill |
            | GAS      | N                | N                     | Y                   | Y                                  |
        And user selects '<customerStatus>' on qualifier
        And user provides all other details on qualifier page
            | customerType | connectionAddress                 | movingType | propertyType |
            | BUS          | 44 Windsor Avenue, MAGILL SA 5072 | Moving     | Renter       |
        And user provides all details on checkout details page
            | customerType | journey | firstName | lastName | businessType |
            | BUS          | BUS     | test      | test     | ABN          |
      And user selects mailing address option
        |addressType       |otherAddress                              |
        |Connection Address|                                          |
        And user validates details on checkout details page
            | sourceSystem   | journey   | fuelType   |
            | <sourceSystem> | <journey> | <fuelType> |
        And user selects answer for property renovation question for '<state>'
        And user clicks on 'Review your order' button and navigates to review page
        And user validates details on checkout review page
            | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
            | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
        And user provides life support details on review page
            | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices                              |
            | Yes               | BOTH     | Ele Other              | Medically Required Heating and/or Air Conditioning |
        And user verifies selected plan details for '<fuelType>'
        And user validates plan details on review page for "<campaign>"
            | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee |
            | ELE      | N                | N                     | Y                   | Y                                  | N                               |
        And user validates plan details on review page for "<campaign>"
            | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee |
            | GAS      | N                | N                     | Y                   | Y                                  | N                               |
        And user validates disclaimer on review page for "<campaign>"
            | referencePriceComparison | goNeutral | solarBuyBack | planName       | state |
            | Y                        | N         | Y            | Total Plan - Business | SA    |
        And user validates source code
            | fuelType | eleSourceCode | gasSourceCode |
            | BOTH     | Total_4%GD    | Total_4%GD    |
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
            | fuelType | quoteStatus      | customerType | offerType | planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType |
            | ELE      | VERBALLYACCEPTED | BUSINESS     | ENE       | TOPB-ES  | 2001077362 |                                |                                | Y                       | OTHER                    | EMAIL         |
        And user validates all the details for 'GAS' submitted quote
        And user validates below mandatory fields
            | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType |
            | GAS      | VERBALLYACCEPTED | BUSINESS     | ENE       | TOPB-GS  | 5510300477 |                                |                                | Y                       | GLSMRHAC                 | EMAIL         |

        Examples:
            | customerStatus | fuelType | eleDiscount | gasDiscount | campaign               | folderName                             | sourceSystem | journey   | state | customerType | newOrExisting | AAH | DD |
            | New            | BOTH     | 4           | 4           | industryoffer | E2E_Campaign_business-industryoffer_SA | Quote Tool   | Move Home | SA    | BUS          | New           | No  | No |
@campaign21.6.4
    Scenario Outline: Validate complete data for business-industryoffer campaign for ACT
        Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
        When user provides "NSWCOCOFFER" and "2605" and clicks on show me plan link
        Then user is presented with the plans
        And user validates "ELE" discount to be "<eleDiscount>" percent
        And user validates "GAS" discount to be "<gasDiscount>" percent
        And user validates the data on plans page for "<campaign>"
            | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee |
            | ELE      | N                | N                     | Y                   | Y                                  | N                               |
        And user validates the data on plans page for "<campaign>"
            | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee |
            | GAS      | N                | N                     | Y                   | Y                                  | N                               |
        And user validates disclaimer on plans page for "<campaign>"
            | referencePriceComparison | goNeutral | solarBuyBack | planName       | state |
            | Y                        | N         | Y            | Total Plan - Business | ACT   |
        And user clicks on Add plan button
        And user validates plan details on cart page for "<campaign>"
            | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill |
            | ELE      | N                | N                     | Y                   | Y                                  |
        And user validates plan details on cart page for "<campaign>"
            | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill |
            | GAS      | N                | N                     | Y                   | Y                                  |
        And user selects '<customerStatus>' on qualifier
        And user provides all other details on qualifier page
            | customerType | connectionAddress                      | movingType | propertyType |
            | BUS          | 134 Carruthers Street, CURTIN ACT 2605 | Moving     | Renter       |
        And user provides all details on checkout details page
            | customerType | journey | firstName | lastName | businessType |
            | BUS          | BUS     | test      | test     | ABN          |
      And user selects mailing address option
        |addressType       |otherAddress                              |
        |Connection Address|                                          |
        And user validates details on checkout details page
            | sourceSystem   | journey   | fuelType   |
            | <sourceSystem> | <journey> | <fuelType> |
        And user selects answer for property renovation question for '<state>'
        And user clicks on 'Review your order' button and navigates to review page
        And user validates details on checkout review page
            | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
            | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
        And user provides life support details on review page
            | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices                              |
            | Yes               | BOTH     | Ele Other              | Medically Required Heating and/or Air Conditioning |
        And user verifies selected plan details for '<fuelType>'
        And user validates plan details on review page for "<campaign>"
            | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee |
            | ELE      | N                | N                     | Y                   | Y                                  | N                               |
        And user validates plan details on review page for "<campaign>"
            | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee |
            | GAS      | N                | N                     | Y                   | Y                                  | N                               |
        And user validates disclaimer on review page for "<campaign>"
            | referencePriceComparison | goNeutral | solarBuyBack | planName       | state |
            | Y                        | N         | Y            | Total Plan - Business | ACT   |
        And user validates source code
            | fuelType | eleSourceCode | gasSourceCode |
            | BOTH     | Total_11%GD   | Total_19%GD   |
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
            | fuelType | quoteStatus      | customerType | offerType | planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType |
            | ELE      | VERBALLYACCEPTED | BUSINESS     | ENE       | TOPB-EA  | 7001026074 |                                |                                | Y                       | OTHER                    | EMAIL         |
        And user validates all the details for 'GAS' submitted quote
        And user validates below mandatory fields
            | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType |
            | GAS      | VERBALLYACCEPTED | BUSINESS     | ENE       | TOPB-GA  | 5260024970 |                                |                                | Y                       | GLSMRHAC                 | EMAIL         |

        Examples:
            | customerStatus | fuelType | eleDiscount | gasDiscount | campaign               | folderName                              | sourceSystem | journey   | state | customerType | newOrExisting | AAH | DD |
            | New            | BOTH     | 11          | 20          | industryoffer | E2E_Campaign_business-industryoffer_ACT | Quote Tool   | Move Home | ACT   | BUS          | New           | No  | No |
@campaign21.6.4
    Scenario Outline: Validate complete data for business-industryoffer campaign for QLD
        Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
        When user provides "NSWCOCOFFER" and "4013" and clicks on show me plan link
        Then user is presented with the plans
        And user validates "ELE" discount to be "<eleDiscount>" percent
        And user validates the data on plans page for "<campaign>"
            | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee |
            | ELE      | N                | N                     | Y                   | Y                                  | N                               |
        And user validates disclaimer on plans page for "<campaign>"
            | referencePriceComparison | goNeutral | solarBuyBack | planName       | state |
            | Y                        | N         | Y            | Total Plan - Business | QLD   |
        And user clicks on Add plan button
        And user validates plan details on cart page for "<campaign>"
            | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill |
            | ELE      | N                | N                     | Y                   | Y                                  |
        And user moves on to fill the qualifier
        And user selects '<customerStatus>' on qualifier
        And user provides all other details on qualifier page
            | customerType | connectionAddress                     | movingType | propertyType |
            | BUS          | 9 Hamilton Street, NORTHGATE QLD 4013 | Moving     | Renter       |
        And user provides all details on checkout details page
            | customerType | journey | firstName | lastName | businessType |
            | BUS          | BUS     | test      | test     | ABN          |
      And user selects mailing address option
        |addressType       |otherAddress                              |
        |Connection Address|                                          |
        And user validates details on checkout details page
            | sourceSystem   | journey   | fuelType   |
            | <sourceSystem> | <journey> | <fuelType> |
        And user selects answer for property renovation question for '<state>'
        And user clicks on 'Review your order' button and navigates to review page
        And user validates details on checkout review page
            | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
            | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
        And user provides life support details on review page
            | lifeSupportOption | fuelType | EleclifeSupportDevices |
            | Yes               | ELE      | Ele Other              |
        And user verifies selected plan details for '<fuelType>'
        And user validates plan details on review page for "<campaign>"
            | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee |
            | ELE      | N                | N                     | Y                   | Y                                  | N                               |
        And user validates disclaimer on review page for "<campaign>"
            | referencePriceComparison | goNeutral | solarBuyBack | planName       | state |
            | Y                        | N         | Y            | Total Plan - Business | QLD   |
        And user validates source code
            | fuelType | eleSourceCode |
            | ELE      | Total_14%GD   |
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
            | fuelType | quoteStatus      | customerType | offerType | planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType |
            | ELE      | VERBALLYACCEPTED | BUSINESS     | ENE       | TOPB-EQ  | QB03807622 |                                |                                | Y                       | OTHER                    | EMAIL         |
        And user validates all the details for 'GAS' submitted quote

        Examples:
            | customerStatus | fuelType | eleDiscount | campaign               | folderName                              | sourceSystem | journey   | state | customerType | newOrExisting | AAH | DD |
            | New            | ELE      | 14          | industryoffer | E2E_Campaign_business-industryoffer_QLD | Quote Tool   | Move Home | QLD   | BUS          | New           | No  | No |
