
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

Feature:E2E scenario for familyandfriends campaign

  Scenario Outline: Validate complete data for familyandfriends campaign for NSW
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "test111111" and "2010" and clicks on show me plan link
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_vipPriorityService|
      |ELE      |N                 |Y                       |Y                    |Y                                    |N                                |Y                         |
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_vipPriorityService|
      |GAS      |N                 |Y                       |Y                    |Y                                    |N                                |Y                          |
    And user validates disclaimer on plans page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName                   |state|
      |Y                        |Y          |Y              |Family and Friends         |NSW  |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit |Feature_vipPriorityService |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |
      |ELE      |N                |Y                          |Y                       |Y                    |Y                                    |
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit |Feature_vipPriorityService |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |
      |GAS      |N                |Y                         |Y                       |Y                    |Y                                    |
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType |connectionAddress                       |movingType |propertyType |solarOption  |
      |RES         |5 Wilkies Street, BULLI NSW 2516         |Moving     |Renter       |No           |
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|idType        |
      |RES         |RES        |New           | test     |test     |Driver License|
    And user validates details on checkout details page
      |sourceSystem   |journey    |fuelType   |
      |<sourceSystem> |<journey>  |<fuelType> |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices |GaslifeSupportDevices                             |
      |Yes              |BOTH    |Ele Other              |Medically Required Heating and/or Air Conditioning|
    And user verifies selected plan details for '<fuelType>'
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_vipPriorityService |
      |ELE      |N                 |Y                       |Y                    |Y                                    |N                                |Y                          |
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_vipPriorityService |
      |GAS      |N                 |Y                       |Y                    |Y                                    |N                                |Y                          |
    And user validates disclaimer on review page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName                   |state|
      |Y                        |Y          |Y              |Family and Friends         |NSW  |
    And user validates source code
      |fuelType|eleSourceCode     |gasSourceCode |
      |BOTH    |Total_20%GD       |Total_20%GD  |
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
      |fuelType|quoteStatus     |customerType   |offerType|planCode |NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL    |ENE      |FFPH-EN |4311150544|N                             |N                              |Y                      |OTHER                   |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType   |offerType|planCode |MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL    |ENE      |FFPH-GN  |5240924834|N                             |N                              |Y                      |GLSMRHAC                |EMAIL        |

    Examples:
    |customerStatus|fuelType|eleDiscount|gasDiscount|campaign     |folderName                   |sourceSystem|journey  |state  |customerType |newOrExisting  |AAH |DD  |
    |New           |BOTH    |20         |20         |familyandfriends  |E2E_Campaign_familyandfriends_NSW |Quote Tool  |Move Home|NSW    |RES          |New            |No  |No  |


Scenario Outline: Validate complete data for familyandfriends campaign for VIC
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "test111111" and "3031" and clicks on show me plan link
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_vipPriorityService|
      |ELE      |N                 |Y                       |Y                    |Y                                    |N                                |Y                         |
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_vipPriorityService|
      |GAS      |N                 |Y                       |Y                    |Y                                    |N                                |Y                          |
    And user validates disclaimer on plans page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName                   |state|
      |Y                        |Y          |Y              |Family and Friends         |VIC  |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit |Feature_vipPriorityService |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |
      |ELE      |N                |Y                          |Y                       |Y                    |Y                                    |
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit |Feature_vipPriorityService |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |
      |GAS      |N                |Y                         |Y                       |Y                    |Y                                    |
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType |connectionAddress                       |movingType |propertyType |solarOption  |
      |RES         |21 Eltham Street, FLEMINGTON VIC 3031         |Moving     |Renter       |No           |
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus|firstName|lastName|idType        |
      |RES         |RES        |New           |test     |test     |Driver License|
    And user validates details on checkout details page
      |sourceSystem   |journey    |fuelType   |
      |<sourceSystem> |<journey>  |<fuelType> |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices |GaslifeSupportDevices                             |
      |Yes              |BOTH    |Ele Other              |Medically Required Heating and/or Air Conditioning|
    And user verifies selected plan details for '<fuelType>'
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_vipPriorityService |
      |ELE      |N                 |Y                       |Y                    |Y                                    |N                                |Y                          |
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_vipPriorityService |
      |GAS      |N                 |Y                       |Y                    |Y                                    |N                                |Y                          |
    And user validates disclaimer on review page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName                   |state|
      |Y                        |Y          |Y              |Family and Friends         |VIC  |
    And user validates source code
      |fuelType|eleSourceCode     |gasSourceCode |
      |BOTH    |Total_14%GD      |Total_30%GD  |
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
      |fuelType|quoteStatus     |customerType   |offerType|planCode |NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL    |ENE      |FFPH-EV |6001456296|N                             |N                              |Y                      |OTHER                   |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType   |offerType|planCode |MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL    |ENE      |FFPH-GV |5330396438|N                             |N                              |Y                      |GLSMRHAC                |EMAIL        |

    Examples:
    |customerStatus|fuelType|eleDiscount|gasDiscount|campaign     |folderName                   |sourceSystem|journey  |state  |customerType |newOrExisting  |AAH |DD  |
    |New           |BOTH    |14         |30         |familyandfriends  |E2E_Campaign_familyandfriends_VIC |Quote Tool  |Move Home|VIC    |RES          |New            |No  |No  |


Scenario Outline: Validate complete data for familyandfriends campaign for ACT
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "test111111" and "2911" and clicks on show me plan link
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_vipPriorityService|
      |ELE      |N                 |Y                       |Y                    |Y                                    |N                                |Y                         |
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_vipPriorityService|
      |GAS      |N                 |Y                       |Y                    |Y                                    |N                                |Y                          |
    And user validates disclaimer on plans page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName                   |state|
      |Y                        |Y          |Y              |Family and Friends         |ACT  |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit |Feature_vipPriorityService |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |
      |ELE      |N                |Y                          |Y                       |Y                    |Y                                    |
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit |Feature_vipPriorityService |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |
      |GAS      |N                |Y                         |Y                       |Y                    |Y                                    |
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType |connectionAddress                       |movingType |propertyType |solarOption  |
      |RES         |138 Narden Street, CRACE ACT 2911         |Moving     |Renter       |No           |
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus|firstName|lastName|idType        |
      |RES         |RES        |New           | test     |test     |Driver License|
    And user validates details on checkout details page
      |sourceSystem   |journey    |fuelType   |
      |<sourceSystem> |<journey>  |<fuelType> |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices |GaslifeSupportDevices                             |
      |Yes              |BOTH    |Ele Other              |Medically Required Heating and/or Air Conditioning|
    And user verifies selected plan details for '<fuelType>'
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_vipPriorityService |
      |ELE      |N                 |Y                       |Y                    |Y                                    |N                                |Y                          |
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_vipPriorityService |
      |GAS      |N                 |Y                       |Y                    |Y                                    |N                                |Y                          |
    And user validates disclaimer on review page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName                   |state|
      |Y                        |Y          |Y              |Family and Friends         |ACT  |
    And user validates source code
      |fuelType|eleSourceCode     |gasSourceCode |
      |BOTH    |Total_12%GD       |Total_12%GD  |
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
      |fuelType|quoteStatus     |customerType   |offerType|planCode |NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL    |ENE      |FFPH-EA |7001183574  |N                             |N                              |Y                      |OTHER                   |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType   |offerType|planCode |MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL    |ENE      |FFPH-GA  |5265774405|N                             |N                              |Y                      |GLSMRHAC                |EMAIL        |

    Examples:
    |customerStatus|fuelType|eleDiscount|gasDiscount|campaign     |folderName                   |sourceSystem|journey  |state  |customerType |newOrExisting  |AAH |DD  |
    |New           |BOTH    |12         |12         |familyandfriends  |E2E_Campaign_familyandfriends_ACT |Quote Tool  |Move Home|ACT    |RES          |New            |No  |No  |

 
Scenario Outline: Validate complete data for familyandfriends campaign for QLD
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "test111111" and "4506" and clicks on show me plan link
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_vipPriorityService|
      |ELE      |N                 |Y                       |Y                    |Y                                    |N                                |Y                         |
    And user validates disclaimer on plans page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName                   |state|
      |Y                        |Y          |Y              |Family and Friends         |QLD  |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit |Feature_vipPriorityService |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |
      |ELE      |N                |Y                          |Y                       |Y                    |Y                                    |
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType |connectionAddress                       |movingType |propertyType |solarOption  |
      |RES         |90 Coach Road West, MORAYFIELD QLD 4506        |Moving     |Renter       |No           |
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|idType        |
      |RES         |RES        |New           | test     |test     |Driver License|
    And user validates details on checkout details page
      |sourceSystem   |journey    |fuelType   |
      |<sourceSystem> |<journey>  |<fuelType> |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices |GaslifeSupportDevices                             |
      |Yes              |ELE   |Ele Other              |Medically Required Heating and/or Air Conditioning|
    And user verifies selected plan details for '<fuelType>'
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_vipPriorityService |
      |ELE      |N                 |Y                       |Y                    |Y                                    |N                                |Y                          |
    And user validates disclaimer on review page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName                   |state|
      |Y                        |Y          |Y              |Family and Friends         |QLD  |
    And user validates source code
      |fuelType|eleSourceCode     |
      |ELE    |Total_16%GD       |
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
      |fuelType|quoteStatus     |customerType   |offerType|planCode |NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL    |ENE      |FFPH-EQ |QB11474971|N                             |N                              |Y                      |OTHER                   |EMAIL        |
   
    Examples:
    |customerStatus|fuelType|eleDiscount|campaign     |folderName                   |sourceSystem|journey  |state  |customerType |newOrExisting  |AAH |DD  |
    |New           |ELE    |16         |familyandfriends  |E2E_Campaign_familyandfriends_QLD |Quote Tool  |Move Home|QLD    |RES          |New            |No  |No  |


Scenario Outline: Validate complete data for familyandfriends campaign for SA
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "test111111" and "5044" and clicks on show me plan link
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_vipPriorityService|
      |ELE      |N                 |Y                       |Y                    |Y                                    |N                                |Y                         |
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_vipPriorityService|
      |GAS      |N                 |Y                       |Y                    |Y                                    |N                                |Y                          |
    And user validates disclaimer on plans page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName                   |state|
      |Y                        |Y          |Y              |Family and Friends         |SA  |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit |Feature_vipPriorityService |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |
      |ELE      |N                |Y                          |Y                       |Y                    |Y                                    |
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit |Feature_vipPriorityService |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |
      |GAS      |N                |Y                         |Y                       |Y                    |Y                                    |
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType |connectionAddress                       |movingType |propertyType |solarOption  |
      |RES         |6 Kipling Avenue, GLENGOWRIE SA 5044          |Moving     |Renter       |No           |
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|idType        |
      |RES         |RES        |New           | test     |test     |Driver License|
    And user validates details on checkout details page
      |sourceSystem   |journey    |fuelType   |
      |<sourceSystem> |<journey>  |<fuelType> |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices |GaslifeSupportDevices                             |
      |Yes              |BOTH    |Ele Other              |Medically Required Heating and/or Air Conditioning|
    And user verifies selected plan details for '<fuelType>'
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_vipPriorityService |
      |ELE      |N                 |Y                       |Y                    |Y                                    |N                                |Y                          |
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_vipPriorityService |
      |GAS      |N                 |Y                       |Y                    |Y                                    |N                                |Y                          |
    And user validates disclaimer on review page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName                   |state|
      |Y                        |Y          |Y              |Family and Friends         |SA  |
    And user validates source code
      |fuelType|eleSourceCode     |gasSourceCode |
      |BOTH    |Total_9%GD       |Total_18%GD  |
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
      |fuelType|quoteStatus     |customerType   |offerType|planCode |NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL    |ENE      |FFPH-ES |2002332288|N                             |N                              |Y                      |OTHER                   |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType   |offerType|planCode |MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL    |ENE      |FFPH-GS  |5510730594|N                             |N                              |Y                      |GLSMRHAC                |EMAIL        |

    Examples:
    |customerStatus|fuelType|eleDiscount|gasDiscount|campaign     |folderName                   |sourceSystem|journey  |state  |customerType |newOrExisting  |AAH |DD  |
    |New           |BOTH    |9         |18         |familyandfriends  |E2E_Campaign_familyandfriends_SA |Quote Tool  |Move Home|NSW    |RES          |SA            |No  |No  |
