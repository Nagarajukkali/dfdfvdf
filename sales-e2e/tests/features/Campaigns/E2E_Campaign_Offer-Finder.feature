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

Feature:E2E scenario for offer-finder campaign
  @campaign21.4.3
  Scenario Outline: Validate complete data for offer-finder campaign for NSW - new moving customer
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "2516" and clicks on show me plan link
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_XX_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state  |
      |ELE      |N                 |Y                       |Y                    |Y                                    |N                                |<state>|
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_XX_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state  |
      |GAS      |N                 |Y                       |Y                    |Y                                    |N                                |<state>|
    And user validates disclaimer on plans page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName  |state|signUpCredit|
      |Y                        |Y          |Y              |Total Plan|<state>  |N           |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_XX_discountOffTotalEnergyBill   |state  |
      |ELE      |N                 |Y                       |Y                    |Y                                    |<state>|
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_XX_discountOffTotalEnergyBill   |state  |
      |GAS      |N                 |Y                       |Y                    |Y                                    |<state>|
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType| connectionAddress                          | movingType|propertyType|solarOption|
      |RES         | 74 Yillowra Street, AUBURN NSW 2144|Moving     |Renter      |No         |
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|idType        |
      |RES         |RES        |New           | test     |test     |Driver License|
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user validates details on checkout details page
      |sourceSystem   |journey    |fuelType   |
      |<sourceSystem> |<journey>  |<fuelType> |
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |<AAH>       |<DD>       |Bank           |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType |EleclifeSupportDevices    |GaslifeSupportDevices  |
      |No               |         |                          |                       |
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_XX_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state  |
      |ELE      |N                 |N                       |Y                    |Y                                    |N                                |<state>|
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_XX_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state  |
      |GAS      |N                 |N                       |Y                    |Y                                    |N                                |<state>|
    And user validates disclaimer on review page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName  |state|signUpCredit|
      |Y                        |Y          |Y              |Total Plan|<state>  |N           |
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
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |TOPH-EN |4102681649|                             |                             |N                      |                        |EMAIL        |<customerStatus>  |<campaign>|
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|customerStatus    |campaign  |
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |TOPH-GN |5240524910|                             |                             |N                      |                        |EMAIL        |<customerStatus>  |<campaign>|
    Examples:
      |customerStatus|fuelType|eleDiscount|gasDiscount|campaign        |folderName                               |state|sourceSystem  |journey  |AAH  |DD  |customerType |newOrExisting  |
      |New           |BOTH    |24         |21         |offer-finder     |E2E_Campaign_offer-finder_NSW_new_moving  |NSW  |Quote Tool    |Move Home|No   |No  |RES          |New            |

  Scenario Outline: Validate complete data for offer-finder campaign for QLD - new moving customer
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "4506" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_XX_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state  |
      |ELE      |Y                 |Y                       |Y                    |Y                                    |N                                |<state>|
    And user validates disclaimer on plans page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName  |state|signUpCredit|
      |Y                        |Y          |Y              |Total Plan|<state>  |Y           |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_XX_discountOffTotalEnergyBill   |state  |
      |ELE      |Y                 |Y                       |Y                    |Y                                    |<state>|
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType |connectionAddress                   |movingType |propertyType |solarOption  |
      |RES          |36 Cypress Street, KULUIN QLD 4558  |Moving     |Renter       |No           |
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus |firstName  |lastName |idType         |medicareType |
      |RES          |RES        |New            |test       |test     |Driver License |             |
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType |EleclifeSupportDevices    |GaslifeSupportDevices  |
      |No               |         |                          |                       |
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_XX_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state  |
      |ELE      |Y                 |N                       |Y                    |Y                                    |N                                |<state>|
    And user validates disclaimer on review page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName  |state|signUpCredit|
      |Y                        |Y          |Y              |Total Plan|<state>  |Y           |
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
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |TOPH-EQ |QB08556016|                              |                              |N                      |                        |EMAIL        |<customerStatus>  |<campaign>|
    Examples:
      |customerStatus|fuelType|eleDiscount|campaign     |folderName                              |state|sourceSystem  |journey  |AAH  |DD  |customerType |newOrExisting  |
      |New           |ELE     |16         |offer-finder  |E2E_Campaign_offer-finder_QLD_new_moving |QLD  |Quote Tool    |Move Home|No   |No  |RES          |New            |

  Scenario Outline: Validate complete data for offer-finder campaign for SA - new moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "5044" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_XX_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state  |
      |ELE      |N                 |Y                       |Y                    |Y                                    |N                                |<state>|
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_XX_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state  |
      |GAS      |N                 |Y                       |Y                    |Y                                    |N                                |<state>|
    And user validates disclaimer on plans page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName  |state|signUpCredit|
      |Y                        |Y          |Y              |Total Plan|<state>  |N           |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_XX_discountOffTotalEnergyBill   |state  |
      |ELE      |N                 |Y                       |Y                    |Y                                    |<state>|
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_XX_discountOffTotalEnergyBill   |state  |
      |GAS      |N                 |Y                       |Y                    |Y                                    |<state>|
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType |connectionAddress                        |movingType |propertyType |solarOption  |
      |RES          |3 Newhaven Avenue, GLENELG NORTH SA 5045 |Moving     |Renter       |No           |
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus |firstName  |lastName |idType         |medicareType |
      |RES          |RES        |New            |test       |test     |Driver License |             |
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType |EleclifeSupportDevices    |GaslifeSupportDevices  |
      |No               |         |                          |                       |
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral  |Feature_peaceOfMind  |Feature_XX_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state  |
      |ELE      |N                 |N                      |Y                    |Y                                    |N                                |<state>|
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_XX_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state  |
      |GAS      |N                 |N                       |Y                    |Y                                    |N                                |<state>|
    And user validates disclaimer on review page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName  |state|signUpCredit|
      |Y                        |Y          |Y              |Total Plan|<state>   |N           |
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
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |TOPH-ES |2001649095|                              |                             |N                       |                  |EMAIL        |<customerStatus>  |<campaign>|
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|customerStatus    |campaign  |
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |TOPH-GS |5510183967|                              |                             |N                      |                        |EMAIL        |<customerStatus>  |<campaign>|
    Examples:
      |customerStatus|fuelType|eleDiscount|gasDiscount|campaign   |folderName                                 |state|sourceSystem  |journey    |AAH  |DD  |customerType |newOrExisting  |
      |New           |BOTH    |13         |13         |offer-finder|E2E_Campaign_offer-finder_SA_new_moving |SA   |Quote Tool    |Move Home  |No   |No  |RES          |New            |

  Scenario Outline: Validate complete data for offer-finder campaign for ACT - new moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "2600" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_XX_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state  |
      |ELE      |Y                 |Y                       |Y                    |Y                                    |N                                |<state>|
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_XX_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state  |
      |GAS      |Y                 |Y                       |Y                    |Y                                    |N                                |<state>|
    And user validates disclaimer on plans page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName  |state    |
      |Y                        |Y          |Y              |Total Plan|<state>  |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_XX_discountOffTotalEnergyBill   |state  |
      |ELE      |Y                 |Y                       |Y                    |Y                                    |<state>|
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_XX_discountOffTotalEnergyBill   |state  |
      |GAS      |Y                 |Y                       |Y                    |Y                                    |<state>|
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType |connectionAddress                    |movingType |propertyType |solarOption  |
      |RES          |21 Tarrant Crescent, DUNLOP ACT 2615 |Moving     |Renter       |No           |
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus |firstName  |lastName |idType         |medicareType |
      |RES          |RES        |New            |test       |test     |Driver License |             |
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType |EleclifeSupportDevices    |GaslifeSupportDevices  |
      |No               |         |                          |                       |
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral  |Feature_peaceOfMind  |Feature_XX_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state  |
      |ELE      |Y                 |N                      |Y                    |Y                                    |N                                |<state>|
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_XX_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state  |
      |GAS      |Y                 |N                       |Y                    |Y                                    |N                                |<state>|
    And user validates disclaimer on review page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName  |state|
      |Y                        |Y          |Y              |Total Plan|<state>   |
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
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |TOPH-EA |          |                              |                             |N                       |                        |EMAIL        |<customerStatus>  |<campaign>|
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|customerStatus    |campaign  |
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |TOPH-GA |5260073228|                              |                             |N                      |                         |EMAIL        |<customerStatus>  |<campaign>|
    Examples:
      |customerStatus|fuelType|eleDiscount|gasDiscount|campaign   |folderName                              |state |sourceSystem  |journey    |AAH  |DD  |customerType |newOrExisting  |
      |New           |BOTH    |12         |16         |offer-finder|E2E_Campaign_offer-finder_ACT_new_moving |ACT   |Quote Tool    |Move Home  |No   |No  |RES          |New            |

  Scenario Outline: Validate complete data for offer-finder campaign for VIC - new non moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "3000" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_XX_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state  |
      |ELE      |Y                 |Y                       |Y                    |Y                                    |N                                |<state>|
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_XX_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state  |
      |GAS      |Y                 |Y                       |Y                    |Y                                    |N                                |<state>|
    And user validates disclaimer on plans page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName  |state    |signUpCredit|
      |Y                        |Y          |Y              |Total Plan|<state>  |Y           |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_XX_discountOffTotalEnergyBill   |state  |
      |ELE      |Y                 |Y                       |Y                    |Y                                    |<state>|
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_XX_discountOffTotalEnergyBill   |state  |
      |GAS      |Y                 |Y                       |Y                    |Y                                    |<state>|
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType |connectionAddress                   |movingType |propertyType |solarOption  |
      |RES          |31 Balwyn Road, CANTERBURY VIC 3126 |Non-Moving |Renter       |No           |
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus |firstName  |lastName |idType         |medicareType |
      |RES          |RES        |New            |test       |test     |Driver License |             |
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType |EleclifeSupportDevices    |GaslifeSupportDevices  |
      |No               |         |                          |                       |
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral  |Feature_peaceOfMind  |Feature_XX_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state  |
      |ELE      |Y                 |N                      |Y                    |Y                                    |N                                |<state>|
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_XX_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state  |
      |GAS      |Y                 |N                       |Y                    |Y                                    |N                                |<state>|
    And user validates disclaimer on review page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName  |state |signUpCredit|
      |Y                        |Y          |Y              |Total Plan|<state>   |Y           |
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
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |COR      |TOPH-EV |6102221416|     N                         |     N                        |N                       |                        |EMAIL        |<customerStatus>  |<campaign>|
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|customerStatus    |campaign  |
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |COR      |TOPH-GV |5310425534|    N                          |    N                         |N                      |                         |EMAIL        |<customerStatus>  |<campaign>|
    Examples:
      |customerStatus|fuelType|eleDiscount|gasDiscount|campaign   |folderName                                   |state |sourceSystem  |journey    |AAH  |DD  |customerType |newOrExisting  |
      |New           |BOTH    |10         |27         |offer-finder|E2E_Campaign_offer-finder_VIC_new_nonmoving |VIC   |Quote Tool    |COR        |No   |No  |RES          |New            |

  Scenario Outline: Validate complete data for offer-finder campaign for VIC existing non moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "3000" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_XX_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state  |
      |ELE      |Y                 |Y                       |Y                    |Y                                    |N                                |<state>|
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_XX_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state  |
      |GAS      |Y                 |Y                       |Y                    |Y                                    |N                                |<state>|
    And user validates disclaimer on plans page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName  |state    |signUpCredit|
      |Y                        |Y          |Y              |Total Plan|<state>  |Y           |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_XX_discountOffTotalEnergyBill   |state  |
      |ELE      |Y                 |Y                       |Y                    |Y                                    |<state>|
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_XX_discountOffTotalEnergyBill   |state  |
      |GAS      |Y                 |Y                       |Y                    |Y                                    |<state>|
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
      |lifeSupportOption|fuelType |EleclifeSupportDevices |GaslifeSupportDevices|
      |No               |         |                       |               |
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_XX_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state  |
      |ELE      |N                 |N                       |Y                    |Y                                    |N                                |<state>|
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_XX_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state  |
      |GAS      |N                 |N                       |Y                    |Y                                    |N                                |<state>|
    And user validates disclaimer on review page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName  |state|signUpCredit|
      |Y                        |Y          |Y              |Total Plan|VIC  |Y           |
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
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |PS       |TOPH-EV |6203817483|N                             |N                             |N                      |                 |EMAIL        |<customerStatus>  |<campaign>|
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|customerStatus    |campaign  |
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |PS       |TOPH-GV |5330790589|N                             |N                             |N                      |                   |EMAIL        |<customerStatus>  |<campaign>|
    Examples:
      |customerStatus|fuelType|eleDiscount|gasDiscount|campaign    |folderName                                       |state|sourceSystem  |journey    |AAH  |DD  |customerType |newOrExisting        |
      |Existing      |BOTH    |10        |27         |offer-finder |E2E_Campaign_offer-finder_VIC_existing_non-moving |VIC  |Quote Tool    |Plan Switch|No   |No  |RES          |Existing  non-moving |
  @campaign21.4.3
  Scenario Outline: Validate complete data for offer-finder campaign for NSW existing non moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "2000" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_XX_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state  |
      |ELE      |N                 |Y                       |Y                    |Y                                    |N                                |<state>|
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_XX_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state  |
      |GAS      |N                 |Y                       |Y                    |Y                                    |N                                |<state>|
    And user validates disclaimer on plans page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName  |state    |signUpCredit|
      |Y                        |Y          |Y              |Total Plan|<state>  |N           |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_XX_discountOffTotalEnergyBill   |state  |
      |ELE      |N                 |Y                       |Y                    |Y                                    |<state>|
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_XX_discountOffTotalEnergyBill   |state  |
      |GAS      |N                 |Y                       |Y                    |Y                                    |<state>|
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      |customerStatus   |accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |<customerStatus> |6437229177   |Postcode           |2447            |dob   |01011980|
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
      |lifeSupportOption|fuelType |EleclifeSupportDevices |GaslifeSupportDevices|
      |No               |         |                       |               |
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_XX_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state  |
      |ELE      |N                 |N                       |Y                    |Y                                    |N                                |<state>|
    And user validates disclaimer on review page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName  |state|signUpCredit|
      |Y                        |Y          |Y              |Total Plan|NSW  |N           |
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |ELE |<AAH>|<DD> |<customerType> |<newOrExisting>|
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|customerStatus    |campaign  |
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |PS       |TOPH-EN |4407376910|                             |                             |N                      |                 |EMAIL        |<customerStatus>  |<campaign>|
    Examples:
      |customerStatus|fuelType|eleDiscount|gasDiscount|campaign    |folderName                                       |state|sourceSystem  |journey    |AAH  |DD  |customerType |newOrExisting        |
      |Existing      |BOTH    |24         |21         |offer-finder |E2E_Campaign_offer-finder_NSW_existing_non-moving |NSW  |Quote Tool    |Plan Switch|No   |No  |RES          |Existing  non-moving |

  Scenario Outline: Validate complete data for offer-finder campaign for SA existing non moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "5000" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_XX_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state  |
      |ELE      |N                 |Y                       |Y                    |Y                                    |N                                |<state>|
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_XX_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state  |
      |GAS      |N                 |Y                       |Y                    |Y                                    |N                                |<state>|
    And user validates disclaimer on plans page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName  |state    |signUpCredit|
      |Y                        |Y          |Y              |Total Plan|<state>  |N           |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_XX_discountOffTotalEnergyBill   |state  |
      |ELE      |N                 |Y                       |Y                    |Y                                    |<state>|
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_XX_discountOffTotalEnergyBill   |state  |
      |GAS      |N                 |Y                       |Y                    |Y                                    |<state>|
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      |customerStatus   |accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |<customerStatus> |9459589902   |Postcode           |5109            |dl   |100694552|
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
      |lifeSupportOption|fuelType |EleclifeSupportDevices |GaslifeSupportDevices|
      |No               |         |                       |               |
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_XX_discountOffTotalEnergyBill|Feature_noStandardConnectionFee  |state  |
      |ELE      |N                 |N                       |Y                    |Y                                    |N                                |<state>|
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_XX_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state  |
      |GAS      |N                 |N                       |Y                    |Y                                    |N                                |<state>|
    And user validates disclaimer on review page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName  |state|signUpCredit|
      |Y                        |Y          |Y              |Total Plan|SA  |N           |
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
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |PS       |TOPH-ES |2001473900|                             |                             |N                      |                 |EMAIL        |<customerStatus>  |<campaign>|
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|customerStatus    |campaign  |
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |PS       |TOPH-GS |5510120493|                             |                             |N                      |                   |EMAIL        |<customerStatus>  |<campaign>|
    Examples:
      |customerStatus|fuelType|eleDiscount|gasDiscount|campaign    |folderName                                       |state|sourceSystem  |journey    |AAH  |DD  |customerType |newOrExisting        |
      |Existing      |BOTH    |13         |13         |offer-finder |E2E_Campaign_offer-finder_SA_existing_non-moving |SA  |Quote Tool    |Plan Switch|No   |No  |RES          |Existing  non-moving |

  Scenario Outline: Validate complete data for offer-finder campaign for QLD existing non moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "4500" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_XX_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state  |
      |ELE      |Y                 |Y                       |Y                    |Y                                    |N                                |<state>|
    And user validates disclaimer on plans page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName  |state    |signUpCredit|
      |Y                        |Y          |Y              |Total Plan|<state>  |Y           |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_XX_discountOffTotalEnergyBill   |state  |
      |ELE      |Y                 |Y                       |Y                    |Y                                    |<state>|
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      |customerStatus   |accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |<customerStatus> |9485951606   |Postcode           |4215            |dl    |139955532|
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
      |lifeSupportOption|fuelType |EleclifeSupportDevices |GaslifeSupportDevices|
      |No               |         |                       |               |
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_XX_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state  |
      |ELE      |N                 |N                       |Y                    |Y                                    |N                                |<state>|
    And user validates disclaimer on review page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName  |state|signUpCredit|
      |Y                        |Y          |Y              |Total Plan|QLD  |Y           |
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
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |PS       |TOPH-EQ |QB01405934|                             |                             |N                      |                 |EMAIL        |<customerStatus>  |<campaign>|
    Examples:
      |customerStatus|fuelType|eleDiscount|campaign    |folderName                                       |state|sourceSystem  |journey    |AAH  |DD  |customerType |newOrExisting        |
      |Existing      |ELE    |16         |offer-finder |E2E_Campaign_offer-finder_QLD_existing_non-moving |QLD  |Quote Tool    |Plan Switch|No   |No  |RES          |Existing  non-moving |

