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

Feature:E2E scenario for fiftyupclub campaign

  Scenario Outline: Validate complete data for fiftyupclub campaign for NSW
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "2516" and clicks on show me plan link
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |ELE      |N                 |Y                       |Y                    |Y                                    |N                                |
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |GAS      |N                 |Y                       |Y                    |Y                                    |N                                |
    And user validates disclaimer on plans page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName  |state|
      |Y                        |Y          |Y              |Total Plan|NSW  |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |
      |ELE      |N                 |Y                       |Y                    |Y                                    |
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |
      |GAS      |N                 |Y                       |Y                    |Y                                    |
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType| connectionAddress               | movingType|propertyType|
      |RES         | 5 Wilkies Street, BULLI NSW 2516|Non-Moving |Renter      |
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
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                        |GaslifeSupportDevices|
      |Yes              |BOTH    |Crigler Najjar Syndrome Phototherapy Equipment|Gas Other            |
    And user verifies selected plan details for '<fuelType>'
    And user selects carbon neutral option
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |ELE      |N                 |Y                       |Y                    |Y                                    |N                                |
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |GAS      |N                 |Y                       |Y                    |Y                                    |N                                |
    And user validates disclaimer on review page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName  |state|
      |Y                        |Y          |Y              |Total Plan|NSW  |
    And user validates source code
      |fuelType|eleSourceCode|gasSourceCode|
      |BOTH    |Total_18%GD  |Total_18%GD  |
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
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |PS       |TOPH-EN |4311150544|N                             |N                             |Y                      |LSCNSPE                 |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |PS       |TOPH-GN |5240924834|N                             |N                             |Y                      |OTHER                   |EMAIL        |

    Examples:
      |customerStatus|fuelType|eleDiscount|gasDiscount|campaign  |folderName                     |state|sourceSystem  |journey    |AAH  |DD  |customerType |newOrExisting  |
      |New           |BOTH    |18         |18         |fiftyupclub|E2E_Campaign_FiftyUpClub_NSW  |NSW  |Quote Tool    |Plan Switch|No   |No  |RES          |New            |

  Scenario Outline: Validate complete data for fiftyupclub campaign for VIC
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "3031" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |ELE      |N                 |Y                       |Y                    |Y                                    |N                                |
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |GAS      |N                 |Y                       |Y                    |Y                                    |N                                |
    And user validates disclaimer on plans page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName  |state|
      |Y                        |Y          |Y              |Total Plan|VIC  |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |
      |ELE      |N                 |Y                       |Y                    |Y                                    |
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |
      |GAS      |N                 |Y                       |Y                    |Y                                    |
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType |connectionAddress                        |movingType |propertyType |
      |RES          |21 Eltham Street, FLEMINGTON VIC 3031    |Moving     |Renter       |
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus |firstName  |lastName |idType         |medicareType |
      |RES          |RES        |New            |test       |test     |Driver License |             |
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType |EleclifeSupportDevices                        |GaslifeSupportDevices  |
      |Yes              |BOTH     |Crigler Najjar Syndrome Phototherapy Equipment|Gas Other            |
    And user verifies selected plan details for '<fuelType>'
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |ELE      |N                 |N                       |Y                    |Y                                    |N                                |
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |GAS      |N                 |N                       |Y                    |Y                                    |N                                |
    And user validates disclaimer on review page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName  |state|
      |Y                        |Y          |Y              |Total Plan|VIC  |
    And user validates source code
      |fuelType|eleSourceCode|gasSourceCode|
      |BOTH    |Total_12%GD  |Total_28%GD  |
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
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |TOPH-EV |6001456296|N                             |N                             |Y                      |LSCNSPE                 |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |TOPH-GV |5330396438|N                             |N                             |Y                      |OTHER                   |EMAIL        |

    Examples:
      |customerStatus|fuelType|eleDiscount|gasDiscount|campaign  |folderName                    |state|sourceSystem  |journey  |AAH  |DD  |customerType |newOrExisting  |
      |New           |BOTH    |12         |28         |fiftyupclub|E2E_Campaign_FiftyUpClub_VIC |VIC  |Quote Tool    |Move Home|No   |No  |RES          |New            |

  Scenario Outline: Validate complete data for fiftyupclub campaign for QLD
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "4506" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |ELE      |N                 |Y                       |Y                    |Y                                    |N                                |
    And user validates disclaimer on plans page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName  |state|
      |Y                        |Y          |Y              |Total Plan|QLD  |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |
      |ELE      |N                 |Y                       |Y                    |Y                                    |
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType |connectionAddress                        |movingType |propertyType |
      |RES          |90 Coach Road West, MORAYFIELD QLD 4506  |Non-Moving |Renter       |
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
    And user verifies selected plan details for '<fuelType>'
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |ELE      |N                 |N                       |Y                    |Y                                    |N                                |
    And user validates disclaimer on review page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName  |state|
      |Y                        |Y          |Y              |Total Plan|QLD  |
    And user validates source code
      |fuelType|eleSourceCode|
      |ELE     |Total_14%GD  |
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
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |COR      |TOPH-EQ |QB11474971|                              |                             |N                      |                        |EMAIL        |

    Examples:
      |customerStatus|fuelType|eleDiscount|campaign |folderName                     |state|sourceSystem  |journey    |AAH  |DD  |customerType |newOrExisting  |
      |New           |ELE     |14         |fiftyupclub|E2E_Campaign_FiftyUpClub_QLD |QLD  |Quote Tool    |Plan Switch|No   |No  |RES          |New            |

  Scenario Outline: Validate complete data for fiftyupclub campaign for SA
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "5044" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |ELE      |N                 |Y                       |Y                    |Y                                    |N                                |
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |GAS      |N                 |Y                       |Y                    |Y                                    |N                                |
    And user validates disclaimer on plans page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName  |state|
      |Y                        |Y          |Y              |Total Plan|SA  |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |
      |ELE      |N                 |Y                       |Y                    |Y                                    |
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |
      |GAS      |N                 |Y                       |Y                    |Y                                    |
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType |connectionAddress                      |movingType |propertyType |
      |RES          |6 Kipling Avenue, GLENGOWRIE SA 5044   |Moving     |Renter       |
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus |firstName  |lastName |idType         |medicareType |
      |RES          |RES        |New            |test       |test     |Driver License |             |
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType |EleclifeSupportDevices                        |GaslifeSupportDevices  |
      |Yes              |ELE      |Crigler Najjar Syndrome Phototherapy Equipment|                       |
    And user verifies selected plan details for '<fuelType>'
    And user opts in for Carbon Neutral
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |ELE      |N                 |Y                       |Y                    |Y                                    |N                                |
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |GAS      |N                 |Y                       |Y                    |Y                                    |N                                |
    And user validates disclaimer on review page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName  |state|
      |Y                        |Y          |Y              |Total Plan|SA  |
    And user validates source code
      |fuelType|eleSourceCode|gasSourceCode|
      |BOTH    |Total_7%GD  |Total_16%GD  |
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
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |TOPH-ES |2002332288|                              |                             |Y                      |LSCNSPE                 |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |TOPH-GS |5510730594|                              |                             |N                      |                        |EMAIL        |

    Examples:
      |customerStatus|fuelType|eleDiscount|gasDiscount|campaign  |folderName                   |state|sourceSystem  |journey  |AAH  |DD  |customerType |newOrExisting  |
      |New           |BOTH    |7          |16         |fiftyupclub|E2E_Campaign_FiftyUpClub_SA |SA   |Quote Tool    |Move Home|No   |No  |RES          |New            |

