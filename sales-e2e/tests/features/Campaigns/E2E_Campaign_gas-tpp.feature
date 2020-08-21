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

Feature:E2E scenario for gas-tpp campaign

  Scenario Outline: Validate complete data for gas-tpp campaign for NSW
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "2516" and clicks on show me plan link
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |GAS      |N                 |Y                       |Y                    |Y                                       |N                                |
    And user validates disclaimer on plans page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName       |state|
      |Y                        |Y          |Y              |Total Plan Plus|NSW  |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |
      |GAS      |N                 |Y                       |Y                    |Y                                       |
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType| connectionAddress               | movingType|propertyType|solarOption|
      |RES         | 5 Wilkies Street, BULLI NSW 2516|Moving     |Renter      |NA         |
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|idType        |
      |RES         |RES        |New           | test     |test     |Driver License|
    And user validates details on checkout details page
      |sourceSystem   |journey    |fuelType   |
      |<sourceSystem> |<journey>  |<fuelType> |
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |<AAH>       |<DD>       |Bank           |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    And user provides life support details on review page
      |lifeSupportOption|fuelType |GaslifeSupportDevices  |
      |Yes              |GAS      |Gas Other              |
    And user verifies selected plan details for '<fuelType>'
    And user selects carbon neutral option
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |GAS      |N                 |Y                       |Y                    |Y                                       |N                                |
    And user validates disclaimer on review page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName       |state|
      |Y                        |Y          |Y              |Total Plan Plus|NSW  |
    And user validates source code
      |fuelType|gasSourceCode     |
      |GAS     |Total_Plus_18%GD  |
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode  |MIRN       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |SWSR1-GN |5240924834 |N                             |N                             |Y                      |OTHER                   |EMAIL        |

    Examples:
      |customerStatus|fuelType|gasDiscount|campaign  |folderName                |state|sourceSystem  |journey  |AAH  |DD  |customerType |newOrExisting  |
      |New           |GAS     |18          |gas-tpp  |E2E_Campaign_gas-tpp_NSW  |NSW  |Quote Tool    |Move Home|No   |No  |RES          |New            |


  Scenario Outline: Validate complete data for gas-tpp campaign for SA
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "5000" and clicks on show me plan link
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |GAS      |N                 |Y                       |Y                    |Y                                       |N                                |
    And user validates disclaimer on plans page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName       |state|
      |Y                        |Y          |Y              |Total Plan Plus|SA  |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |
      |GAS      |N                 |Y                       |Y                    |Y                                       |
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType| connectionAddress                   | movingType|propertyType|solarOption|
      |RES         | 6 Kipling Avenue, GLENGOWRIE SA 5044|Moving     |Renter      |NA         |
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|idType        |
      |RES         |RES        |New           | test     |test     |Driver License|
    And user validates details on checkout details page
      |sourceSystem   |journey    |fuelType   |
      |<sourceSystem> |<journey>  |<fuelType> |
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |<AAH>       |<DD>       |Bank           |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    And user provides life support details on review page
      |lifeSupportOption|fuelType |GaslifeSupportDevices  |
      |Yes              |GAS     |Gas Other            |
    And user verifies selected plan details for '<fuelType>'
    And user selects carbon neutral option
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |GAS      |N                 |Y                       |Y                    |Y                                       |N                                |
    And user validates disclaimer on review page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName  |state|
      |Y                        |Y          |Y              |Total Plan Plus|SA  |
    And user validates source code
      |fuelType|gasSourceCode|
      |GAS    |Total_Plus_17%GD  |
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |SWSR1-GS |5510730594|N                             |N                             |Y                      |OTHER                 |EMAIL        |

    Examples:
      |customerStatus|fuelType|gasDiscount|campaign  |folderName                 |state|sourceSystem  |journey  |AAH  |DD  |customerType |newOrExisting  |
      |New           |GAS     |17          |gas-tpp  |E2E_Campaign_gas-tpp_SA    |SA   |Quote Tool    |Move Home|No   |No  |RES          |New            |

  Scenario Outline: Validate complete data for gas-tpp campaign for VIC
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "3000" and clicks on show me plan link
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |GAS      |Y                 |Y                       |Y                    |Y                                       |N                                |
    And user validates disclaimer on plans page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName       |signUpCredit|state|
      |Y                        |Y          |Y              |Total Plan Plus|Y           |    VIC  |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |
      |GAS      |Y                 |Y                       |Y                    |N                                    |
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType| connectionAddress                   | movingType|propertyType|solarOption|
      |RES         | 21 Eltham Street, FLEMINGTON VIC 3031|Moving     |Renter      |NA         |
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|idType        |
      |RES         |RES        |New           | test     |test     |Driver License|
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
      |lifeSupportOption|fuelType |GaslifeSupportDevices  |
      |Yes              |GAS      |Gas Other              |
    And user verifies selected plan details for '<fuelType>'
    And user selects carbon neutral option
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |GAS      |Y                 |Y                       |Y                    |N                                       |N                                |
    And user validates disclaimer on review page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |signUpCredit|planName       |state|
      |Y                        |Y          |Y              |Y           |Total Plan Plus|VIC  |
    And user validates source code
      |fuelType|gasSourceCode|
      |GAS    |Total_Plus_28%GD_50  |
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode |MIRN       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |SWSR1-GV |5330396438 |N                             |N                             |Y                      |OTHER                   |EMAIL        |

    Examples:
      |customerStatus|fuelType|gasDiscount|campaign  |folderName                 |sourceSystem  |journey  |AAH  |DD  |customerType |newOrExisting  |
      |New           |GAS     |28         |gas-tpp  |E2E_Campaign_gas-tpp_VIC    |Quote Tool    |Move Home|No   |No  |RES          |New            |

