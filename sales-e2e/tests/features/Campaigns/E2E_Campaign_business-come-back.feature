@campaign

Feature:E2E scenario for business-come-back campaign

  Scenario Outline: Validate complete data for business-come-back campaign for NSW-Essential for new non-moving customer
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "2580" and clicks on show me plan link
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_chanceToWin|state|
      |ELE      |Y                 |N                       |Y                    |Y                                    |N                                |N                  |<state>|
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_chanceToWin|state|
      |GAS      |Y                 |N                       |Y                    |Y                                    |N                                |N                  |<state>|
    And user validates disclaimer on plans page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |chanceToWin|planName               |state  |signUpCredit|
      |Y                        |N          |Y              |N          |Total Plan - Business  |<state>|N           |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_chanceToWin|state|
      |ELE      |Y                 |N                       |Y                    |Y                                    |N                                |N                  |<state>|
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_chanceToWin|state|
      |GAS      |Y                 |N                       |Y                    |Y                                    |N                                |N                  |<state>|
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType |connectionAddress                       |movingType |propertyType |solarOption  |
      |BUS          |465 Sandy Point Road, LOWER BORO NSW 2580  |Non-Moving     |Renter       |No           |
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
      |ELE      |Y                 |N                       |Y                    |Y                                    |N                                |N                  |<state>|
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_chanceToWin|state|
      |GAS      |Y                 |N                       |Y                    |Y                                    |N                                |N                  |<state>|
    And user validates disclaimer on review page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |chanceToWin|planName              |state|signUpCredit|
      |Y                        |N          |Y              |N          |Total Plan - Business |<state>  |Y       |
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
      |New           |BOTH    |18         |19         |business-come-back  |E2E_Campaign_business-come-back_NSW-essential_new_nonmoving |Quote Tool  |Plan Switch|NSW    |BUS          |New            |No  |No  |

  Scenario Outline: Validate complete data for business-come-back campaign for NSW-Endeavour for new moving customer
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "2780" and clicks on show me plan link
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_chanceToWin|state|
      |ELE      |Y                 |N                       |Y                    |Y                                    |N                                |N                  |<state>|
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_chanceToWin|state|
      |GAS      |Y                 |N                       |Y                    |Y                                    |N                                |N                  |<state>|
    And user validates disclaimer on plans page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |chanceToWin|planName               |state|signUpCredit|
      |Y                        |N          |Y              |N          |Total Plan - Business  |<state>  |N       |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_chanceToWin|state|
      |ELE      |Y                 |N                       |Y                    |Y                                    |N                                |N                  |<state>|
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_chanceToWin|state|
      |GAS      |Y                 |N                       |Y                    |Y                                    |N                                |N                  |<state>|
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType |connectionAddress                       |movingType |propertyType |solarOption  |
      |BUS          |13 Station Street, WENTWORTH FALLS NSW 2782  |Moving     |Renter       |No           |
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
      |ELE      |Y                 |N                       |Y                    |Y                                    |N                                |N                  |<state>|
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_chanceToWin|state|
      |GAS      |Y                 |N                       |Y                    |Y                                    |N                                |N                  |<state>|
    And user validates disclaimer on review page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |chanceToWin|planName              |state|signUpCredit|
      |Y                        |N          |Y              |N          |Total Plan - Business |<state>  |Y       |
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
      |New           |BOTH    |13         |19         |business-come-back  |E2E_Campaign_business-come-back_NSW_Endeavour_new_moving |Quote Tool  |Move Home|NSW    |BUS          |New            |No  |No  |


  Scenario Outline: Validate complete data for business-come-back campaign for NSW-Ausgrid for new moving customer
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "2000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_chanceToWin|state|
      |ELE      |Y                 |N                       |Y                    |Y                                    |N                                |N                  |<state>|
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_chanceToWin|state|
      |GAS      |Y                 |N                       |Y                    |Y                                    |N                                |N                  |<state>|
    And user validates disclaimer on plans page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |chanceToWin|planName               |state|signUpCredit|
      |Y                        |N          |Y              |N          |Total Plan - Business  |<state>  |N       |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_chanceToWin|state|
      |ELE      |Y                 |N                       |Y                    |Y                                    |N                                |N                  |<state>|
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_chanceToWin|state|
      |GAS      |Y                 |N                       |Y                    |Y                                    |N                                |N                  |<state>|
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType |connectionAddress                       |movingType |propertyType |solarOption  |
      |BUS          |320 Crown Street, SURRY HILLS NSW 2010  |Moving     |Renter       |No           |
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
      |ELE      |Y                 |N                       |Y                    |Y                                    |N                                |N                  |<state>|
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_chanceToWin|state|
      |GAS      |Y                 |N                       |Y                    |Y                                    |N                                |N                  |<state>|
    And user validates disclaimer on review page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |chanceToWin|planName              |state|signUpCredit|
      |Y                        |N          |Y              |N          |Total Plan - Business |<state>  |Y       |
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
      |ELE     |VERBALLYACCEPTED|BUSINESS    |ENE      |TOPB-EN |NCCC005405|                              |                              |N                      |                   |EMAIL        |<customerStatus>  |<campaign>|
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode |MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|customerStatus    |campaign  |
      |GAS     |VERBALLYACCEPTED|BUSINESS    |ENE      |TOPB-GN  |5240554353|                              |                              |N                      |                |EMAIL        |<customerStatus>  |<campaign>|

    Examples:
      |customerStatus|fuelType|eleDiscount|gasDiscount|campaign         |folderName                       |sourceSystem|journey  |state  |customerType |newOrExisting  |AAH |DD  |
      |New           |BOTH    |21         |19         |business-come-back  |E2E_Campaign_business-come-back_NSW_new_moving |Quote Tool  |Move Home|NSW    |BUS          |New            |No  |No  |

  Scenario Outline: Validate complete data for business-come-back campaign for VIC for new moving customer
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "3000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_chanceToWin|state|
      |ELE      |Y                 |N                       |Y                    |Y                                    |N                                |N                  |<state>|
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_chanceToWin|state|
      |GAS      |Y                 |N                       |Y                    |Y                                    |N                                |N                  |<state>|
    And user validates disclaimer on plans page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |chanceToWin|planName        |state|signUpCredit|
      |Y                        |N          |Y              |N          |Total Plan - Business  |<state>  |Y|
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_chanceToWin|state|
      |ELE      |Y                 |N                       |Y                    |Y                                    |N                                |N                  |<state>|
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_chanceToWin|state|
      |GAS      |Y                 |N                       |Y                    |Y                                    |N                                |N                  |<state>|
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType |connectionAddress                           |movingType |propertyType |solarOption  |
      |BUS          |36 Gregory Street West, WENDOUREE VIC 3355  |Moving     |Renter       |No           |
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
      |ELE      |Y                 |N                       |Y                    |Y                                    |N                                |N                  |<state>|
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_chanceToWin|state|
      |GAS      |Y                 |N                       |Y                    |Y                                    |N                                |N                  |<state>|
    And user validates disclaimer on review page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |chanceToWin|planName       |state|signUpCredit|
      |Y                        |N          |Y              |N          |Total Plan - Business |<state>  |Y|
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
      |ELE     |VERBALLYACCEPTED|BUSINESS    |ENE      |TOPB-EV  |6203822385|                              |                              | N                     |                   |EMAIL        |<customerStatus>  |<campaign>|
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode |MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|customerStatus    |campaign  |
      |GAS     |VERBALLYACCEPTED|BUSINESS    |ENE      |TOPB-GV  |5330956738|                              |                              |    N                  |                |EMAIL        |<customerStatus>  |<campaign>|

    Examples:
      |customerStatus|fuelType|eleDiscount|gasDiscount|campaign         |folderName                       |sourceSystem|journey  |state  |customerType |newOrExisting  |AAH |DD  |
      |New           |BOTH    |5          |23         |business-come-back  |E2E_Campaign_business-come-back_VIC_new_moving |Quote Tool  |Move Home|VIC    |BUS          |New            |No  |No  |

