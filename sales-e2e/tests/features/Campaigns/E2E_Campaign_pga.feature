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

Feature:E2E scenario for pga campaign

  Scenario Outline: Validate complete data for pga campaign for NSW
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "PGOFFER" and "2010" and clicks on show me plan link
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |ELE      |N                 |N                       |Y                    |Y                                    |N                                |
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |GAS      |N                 |N                       |Y                    |Y                                    |N                                |
    And user validates disclaimer on plans page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName                |state|
      |Y                        |N          |Y              |Total Plan Plus Business|NSW  |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |
      |ELE      |N                 |N                       |Y                    |Y                                    |
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |
      |GAS      |N                 |N                       |Y                    |Y                                    |
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType |connectionAddress                       |movingType |propertyType |
      |BUS          |320 Crown Street, SURRY HILLS NSW 2010  |Moving     |Renter       |
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
      |lifeSupportOption|fuelType|EleclifeSupportDevices |GaslifeSupportDevices                             |
      |Yes              |BOTH    |Ele Other              |Medically Required Heating and/or Air Conditioning|
    And user verifies selected plan details for '<fuelType>'
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |ELE      |N                 |N                       |Y                    |Y                                    |N                                |
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |GAS      |N                 |N                       |Y                    |Y                                    |N                                |
    And user validates disclaimer on review page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName                |state|
      |Y                        |N          |Y              |Total Plan Plus Business|NSW  |
    And user validates source code
      |fuelType|eleSourceCode     |gasSourceCode     |
      |BOTH    |Total_Plus_22%GD  |Total_Plus_20%GD  |
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
      |fuelType|quoteStatus     |customerType|offerType|planCode |NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|BUSINESS    |ENE      |SWSRB-EN |NCCC005405|                              |                              |Y                      |OTHER                   |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode |MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|BUSINESS    |ENE      |SWSRB-GN |5240554353|                              |                              |Y                      |GLSMRHAC                |EMAIL        |

    Examples:
      |customerStatus|fuelType|eleDiscount|gasDiscount|campaign   |folderName           |sourceSystem|journey  |state  |customerType |newOrExisting  |AAH |DD  |
      |New           |BOTH    |22         |20         |pga        |E2E_Campaign_pga_NSW |Quote Tool  |Move Home|NSW    |BUS          |New            |No  |No  |


  Scenario Outline: Validate complete data for pga campaign for VIC
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "PGOFFER" and "3355" and clicks on show me plan link
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |ELE      |N                 |N                       |Y                    |Y                                    |N                                |
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |GAS      |N                 |N                       |Y                    |Y                                    |N                                |
    And user validates disclaimer on plans page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName                |state|
      |Y                        |N          |Y              |Total Plan Plus Business|VIC  |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |
      |ELE      |N                 |N                       |Y                    |Y                                    |
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |
      |GAS      |N                 |N                       |Y                    |Y                                    |
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType |connectionAddress                           |movingType |propertyType |
      |BUS          |36 Gregory Street West, WENDOUREE VIC 3355  |Moving     |Renter       |
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
      |lifeSupportOption|fuelType|EleclifeSupportDevices |GaslifeSupportDevices                             |
      |Yes              |BOTH    |Ele Other              |Medically Required Heating and/or Air Conditioning|
    And user verifies selected plan details for '<fuelType>'
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |ELE      |N                 |N                       |Y                    |Y                                    |N                                |
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |GAS      |N                 |N                       |Y                    |Y                                    |N                                |
    And user validates disclaimer on review page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName                |state|
      |Y                        |N          |Y              |Total Plan Plus Business|VIC  |
    And user validates source code
      |fuelType|eleSourceCode     |gasSourceCode     |
      |BOTH    |Total_Plus_6%GD   |Total_Plus_24%GD  |
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
      |fuelType|quoteStatus     |customerType|offerType|planCode |NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|BUSINESS    |ENE      |SWSRB-EV |6203822385|                              |                              |Y                      |OTHER                   |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode |MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|BUSINESS    |ENE      |SWSRB-GV |5330956738|                              |                              |Y                      |GLSMRHAC                |EMAIL        |

    Examples:
      |customerStatus|fuelType|eleDiscount|gasDiscount|campaign |folderName           |sourceSystem|journey  |state  |customerType |newOrExisting  |AAH |DD  |
      |New           |BOTH    |6          |24         |pga      |E2E_Campaign_pga_VIC |Quote Tool  |Move Home|VIC    |BUS          |New            |No  |No  |

  Scenario Outline: Validate complete data for pga campaign for SA
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "PGOFFER" and "5088" and clicks on show me plan link
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |ELE      |N                 |N                       |Y                    |Y                                    |N                                |
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |GAS      |N                 |N                       |Y                    |Y                                    |N                                |
    And user validates disclaimer on plans page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName                |state|
      |Y                        |N          |Y              |Total Plan Plus Business|SA   |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |
      |ELE      |N                 |N                       |Y                    |Y                                    |
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |
      |GAS      |N                 |N                       |Y                    |Y                                    |
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType |connectionAddress                    |movingType |propertyType |
      |BUS          |6 Peat Avenue, HOLDEN HILL SA 5088   |Moving     |Renter       |
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
      |lifeSupportOption|fuelType|EleclifeSupportDevices |GaslifeSupportDevices                             |
      |Yes              |BOTH    |Ele Other              |Medically Required Heating and/or Air Conditioning|
    And user verifies selected plan details for '<fuelType>'
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |ELE      |N                 |N                       |Y                    |Y                                    |N                                |
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |GAS      |N                 |N                       |Y                    |Y                                    |N                                |
    And user validates disclaimer on review page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName                |state|
      |Y                        |N          |Y              |Total Plan Plus Business|SA   |
    And user validates source code
      |fuelType|eleSourceCode     |gasSourceCode     |
      |BOTH    |Total_Plus_4%GD   |Total_Plus_4%GD   |
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
      |fuelType|quoteStatus     |customerType|offerType|planCode |NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|BUSINESS    |ENE      |SWSRB-ES |2001114983|                              |                              |Y                      |OTHER                   |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode |MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|BUSINESS    |ENE      |SWSRB-GS |5510116718|                              |                              |Y                      |GLSMRHAC                |EMAIL        |

    Examples:
      |customerStatus|fuelType|eleDiscount|gasDiscount|campaign |folderName           |sourceSystem|journey  |state  |customerType |newOrExisting  |AAH |DD  |
      |New           |BOTH    |4          |4          |pga      |E2E_Campaign_pga_SA  |Quote Tool  |Move Home|SA     |BUS          |New            |No  |No  |

  Scenario Outline: Validate complete data for pga campaign for ACT
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "PGOFFER" and "2612" and clicks on show me plan link
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |ELE      |N                 |N                       |Y                    |Y                                    |N                                |
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |GAS      |N                 |N                       |Y                    |Y                                    |N                                |
    And user validates disclaimer on plans page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName                |state|
      |Y                        |N          |Y              |Total Plan Plus Business|ACT  |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |
      |ELE      |N                 |N                       |Y                    |Y                                    |
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |
      |GAS      |N                 |N                       |Y                    |Y                                    |
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType |connectionAddress                          |movingType |propertyType |
      |BUS          |216 Northbourne Avenue, BRADDON ACT 2612   |Moving     |Renter       |
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
      |lifeSupportOption|fuelType|EleclifeSupportDevices |GaslifeSupportDevices                             |
      |Yes              |BOTH    |Ele Other              |Medically Required Heating and/or Air Conditioning|
    And user verifies selected plan details for '<fuelType>'
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |ELE      |N                 |N                       |Y                    |Y                                    |N                                |
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |GAS      |N                 |N                       |Y                    |Y                                    |N                                |
    And user validates disclaimer on review page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName                |state|
      |Y                        |N          |Y              |Total Plan Plus Business|ACT  |
    And user validates source code
      |fuelType|eleSourceCode     |gasSourceCode     |
      |BOTH    |Total_Plus_11%GD  |Total_Plus_20%GD  |
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
      |fuelType|quoteStatus     |customerType|offerType|planCode |NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|BUSINESS    |ENE      |SWSRB-EA |7001114516|                              |                              |Y                      |OTHER                   |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode  |MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|BUSINESS    |ENE      |SWSRB-GA  |5260021184|                              |                              |Y                      |GLSMRHAC                |EMAIL        |

    Examples:
      |customerStatus|fuelType|eleDiscount|gasDiscount|campaign |folderName           |sourceSystem|journey  |state  |customerType |newOrExisting  |AAH |DD  |
      |New           |BOTH    |11         |20         |pga      |E2E_Campaign_pga_ACT |Quote Tool  |Move Home|ACT    |BUS          |New            |No  |No  |


  Scenario Outline: Validate complete data for pga campaign for QLD
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "PGOFFER" and "4020" and clicks on show me plan link
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |ELE      |N                 |N                       |Y                    |Y                                    |N                                |
    And user validates disclaimer on plans page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName                   |state|
      |Y                        |N          |Y              |Total Plan Plus Business|QLD  |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |
      |ELE      |N                 |N                       |Y                    |Y                                    |
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType |connectionAddress                      |movingType |propertyType |
      |BUS          |437 Oxley Avenue, REDCLIFFE QLD 4020   |Moving     |Renter       |
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
      |lifeSupportOption|fuelType|EleclifeSupportDevices |
      |Yes              |ELE     |Ele Other              |
    And user verifies selected plan details for '<fuelType>'
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |ELE      |N                 |N                       |Y                    |Y                                    |N                                |
    And user validates disclaimer on review page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName                |state|
      |Y                        |N          |Y              |Total Plan Plus Business|QLD  |
    And user validates source code
      |fuelType|eleSourceCode     |
      |ELE     |Total_Plus_14%GD  |
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
      |fuelType|quoteStatus     |customerType|offerType|planCode |NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|BUSINESS    |ENE      |SWSRB-EQ |QB02256002|                              |                              |Y                      |OTHER                   |EMAIL        |
    And user validates all the details for 'GAS' submitted quote

    Examples:
      |customerStatus|fuelType|eleDiscount|campaign  |folderName           |sourceSystem|journey  |state  |customerType |newOrExisting  |AAH |DD  |
      |New           |ELE     |14         |pga       |E2E_Campaign_pga_QLD |Quote Tool  |Move Home|QLD    |BUS          |New            |No  |No  |

