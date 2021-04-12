#@E2E
@campaign
Feature:E2E scenario for AMIC-BIZ campaign
  @campaign21.4.3
  Scenario Outline: Validate complete data for amic-biz campaign for NSW Ausgrid for new customer
    Given user has opened the '<campaign>' link in a browser and creates 'E2E_Campaign_AMIC_NSW_Ausgrid' to save evidences
    When user provides "EABIZ009" and "2010" and clicks on show me plan link
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state|
      |ELE      |Y                 |N                       |Y                    |Y                                    |N                                |NSW  |
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state|
      |GAS      |Y                 |N                       |Y                    |Y                                    |N                                |NSW  |
    And user validates disclaimer on plans page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName           |state|signUpCredit|
      |Y                        |N          |Y              |Total Plan - Business|NSW  |Y           |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |state|
      |ELE      |Y                 |N                       |Y                    |Y                                    |NSW|
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |state|
      |GAS      |Y                 |N                       |Y                    |Y                                    |NSW|
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType |connectionAddress                      |movingType |propertyType |solarOption  |
      |BUS          |320 Crown Street, SURRY HILLS NSW 2010 |Moving     |Renter       |No           |
    And user provides all details on checkout details page
      |customerType|journey    | firstName| lastName|businessType|
      |BUS         |BUS        | test     |test     |ABN         |
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user selects answer for property renovation question for '<state>'
    #And user opts in for Carbon Neutral
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType |EleclifeSupportDevices    |GaslifeSupportDevices  |
      |No               |         |                          |                       |
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state|
      |ELE      |Y                 |N                       |Y                    |Y                                    |N                                |NSW     |
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state|
      |GAS      |Y                 |N                       |Y                    |Y                                    |N                                |NSW|
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|customerStatus    |campaign  |
      |ELE     |VERBALLYACCEPTED|BUSINESS    |ENE      |TOPB-EN |NCCC005405|                              |                              |N                      |                        |EMAIL        |<customerStatus>  |<campaign>|
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|customerStatus    |campaign  |
      |GAS     |VERBALLYACCEPTED|BUSINESS    |ENE      |TOPB-GN |5240554353|                              |                              |N                      |                        |EMAIL        |<customerStatus>  |<campaign>|

    Examples:
      |customerStatus |fuelType |campaign  |state  |eleDiscount |gasDiscount  |
      |New            |BOTH     |amic-biz     |NSW    |22          |20           |
  @campaign21.4.3
  Scenario Outline: Validate complete data for amic-biz campaign for NSW Essential
    Given user has opened the '<campaign>' link in a browser and creates 'E2E_Campaign_AMIC_NSW_Essential' to save evidences
    When user provides "EABIZ009" and "2580" and clicks on show me plan link
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state|
      |ELE      |Y                 |N                       |Y                    |Y                                    |N                                |NSW  |
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state|
      |GAS      |Y                 |N                       |Y                    |Y                                    |N                                |NSW  |
    And user validates disclaimer on plans page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName           |state|signUpCredit|
      |Y                        |N          |Y              |Total Plan - Business|NSW  |Y           |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |state|
      |ELE      |Y                 |N                       |Y                    |Y                                    |NSW|
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |state|
      |GAS      |Y                 |N                       |Y                    |Y                                    |NSW|
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType |connectionAddress                      |movingType |propertyType |solarOption  |
      |BUS          |465 Sandy Point Road, LOWER BORO NSW 2580  |Moving     |Renter       |No           |
    And user provides all details on checkout details page
      |customerType|journey    | firstName| lastName|businessType|
      |BUS         |BUS        | test     |test     |ABN         |
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType |EleclifeSupportDevices    |GaslifeSupportDevices  |
      |No               |         |                          |                       |
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state|
      |ELE      |Y                 |N                       |Y                    |Y                                    |N                                |NSW|
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state|
      |GAS      |Y                 |N                       |Y                    |Y                                    |N                                |NSW|
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|customerStatus    |campaign  |
      |ELE     |VERBALLYACCEPTED|BUSINESS    |ENE      |TOPB-EN |           |                              |                              |N                      |                        |EMAIL        |<customerStatus>  |<campaign>|
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|customerStatus    |campaign  |
      |GAS     |VERBALLYACCEPTED|BUSINESS    |ENE      |TOPB-GN |           |                              |                              |N                      |                        |EMAIL        |<customerStatus>  |<campaign>|

    Examples:
      |customerStatus |fuelType |campaign  |state  |eleDiscount |gasDiscount  |
      |New            |BOTH     |amic-biz      |NSW    |19          |20           |
  @campaign21.4.3
  Scenario Outline: Validate complete data for amic-biz campaign for NSW Endeavour for customer
    Given user has opened the '<campaign>' link in a browser and creates 'E2E_Campaign_AMIC_NSW_Endeavour' to save evidences
    When user provides "EABIZ009" and "2163" and clicks on show me plan link
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state|
      |ELE      |Y                 |N                       |Y                    |Y                                    |N                                |NSW  |
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state|
      |GAS      |Y                 |N                       |Y                    |Y                                    |N                                |NSW  |
    And user validates disclaimer on plans page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName           |state|signUpCredit|
      |Y                        |N          |Y              |Total Plan - Business|NSW  |Y           |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |state|
      |ELE      |Y                 |N                       |Y                    |Y                                    |NSW|
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |state|
      |GAS      |Y                 |N                       |Y                    |Y                                    |NSW|
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType |connectionAddress                              |movingType |propertyType |solarOption  |
      |BUS          |13 Station Street, WENTWORTH FALLS NSW 2782 |Moving     |Renter       |No           |
    And user provides all details on checkout details page
      |customerType|journey    | firstName| lastName|businessType|
      |BUS         |BUS        | test     |test     |ABN         |
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType |EleclifeSupportDevices    |GaslifeSupportDevices  |
      |No               |         |                          |                       |
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state|
      |ELE      |Y                 |N                       |Y                    |Y                                    |N                                |NSW|
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state|
      |GAS      |Y                 |N                       |Y                    |Y                                    |N                                |NSW|
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|customerStatus    |campaign  |
      |ELE     |VERBALLYACCEPTED|BUSINESS    |ENE      |TOPB-EN |4310504640|                              |                              |N                      |                        |EMAIL        |<customerStatus>  |<campaign>|
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|customerStatus    |campaign  |
      |GAS     |VERBALLYACCEPTED|BUSINESS    |ENE      |TOPB-GN |          |                              |                              |N                      |                        |EMAIL        |<customerStatus>  |<campaign>|

    Examples:
      |customerStatus |fuelType |campaign  |state  |eleDiscount |gasDiscount  |
      |New            |BOTH     |amic-biz      |NSW    |14          |20           |
  @campaign21.4.3
  Scenario Outline: Validate complete data for amic-biz campaign for VIC for new customer
    Given user has opened the '<campaign>' link in a browser and creates 'E2E_Campaign_AMIC_biz_VIC' to save evidences
    When user provides "EABIZ009" and "3031" and clicks on show me plan link
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state|
      |ELE      |Y                 |N                       |Y                    |Y                                    |N                                |VIC  |
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state|
      |GAS      |Y                 |N                       |Y                    |Y                                    |N                                |VIC  |
    And user validates disclaimer on plans page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName           |state|signUpCredit|
      |Y                        |N          |Y              |Total Plan - Business|VIC  |Y           |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |state|
      |ELE      |Y                 |N                       |Y                    |Y                                    |VIC|
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |state|
      |GAS      |Y                 |N                       |Y                    |Y                                    |VIC|
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType |connectionAddress                              |movingType |propertyType |solarOption  |
      |BUS          |36 Gregory Street West, WENDOUREE VIC 3355          |Moving     |Renter       |No           |
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
    And user provides life support details on review page
      |lifeSupportOption|fuelType |EleclifeSupportDevices    |GaslifeSupportDevices  |
      |No               |         |                          |                       |
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state|
      |ELE      |Y                 |N                       |Y                    |Y                                    |N                                |VIC|
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state|
      |GAS      |Y                 |N                       |Y                    |Y                                    |N                                |VIC|
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|customerStatus    |campaign  |
      |ELE     |VERBALLYACCEPTED|BUSINESS    |ENE      |TOPB-EV |6203822385|N                             |N                             |N                      |                        |EMAIL        |<customerStatus>  |<campaign>|
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|customerStatus    |campaign  |
      |GAS     |VERBALLYACCEPTED|BUSINESS    |ENE      |TOPB-GV |5330956738|N                             |N                             |N                      |                        |EMAIL        |<customerStatus>  |<campaign>|

    Examples:
      |customerStatus |fuelType |campaign  |state  |eleDiscount |gasDiscount  |
      |New            |BOTH     |amic-biz  |VIC    |6           |24           |

  Scenario Outline: Validate complete data for amic-biz campaign for SA
    Given user has opened the '<campaign>' link in a browser and creates 'E2E_Campaign_AMIC_SA' to save evidences
    When user provides "EABIZ009" and "5044" and clicks on show me plan link
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state|
      |ELE      |N                 |N                       |Y                    |Y                                    |N                                |SA|
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state|
      |GAS      |N                 |N                       |Y                    |Y                                    |N                                |SA|
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |state|
      |ELE      |N                 |N                       |Y                    |Y                                    |SA|
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |state|
      |GAS      |N                 |N                       |Y                    |Y                                    |SA|
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType |connectionAddress                     |movingType |propertyType |solarOption  |
      |BUS          |44 Windsor Avenue, MAGILL SA 5072        |Moving     |Renter       |No           |
    And user provides all details on checkout details page
      |customerType|journey    | firstName| lastName|businessType|
      |BUS         |BUS        | test     |test     |ABN         |
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType |EleclifeSupportDevices    |GaslifeSupportDevices  |
      |No               |         |                          |                       |
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state|
      |ELE      |N                 |N                       |Y                    |Y                                    |N                                |SA|
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state|
      |GAS      |N                 |N                       |Y                    |Y                                    |N                                |SA|
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|customerStatus    |campaign  |
      |ELE     |VERBALLYACCEPTED|BUSINESS    |ENE      |TOPB-ES |          |                              |                              |N                      |                        |EMAIL        |<customerStatus>  |<campaign>|
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|customerStatus    |campaign  |
      |GAS     |VERBALLYACCEPTED|BUSINESS    |ENE      |TOPB-GS |         |                              |                              |N                      |                        |EMAIL        |<customerStatus>  |<campaign>|

    Examples:
      |customerStatus |fuelType |campaign  |state  |eleDiscount |gasDiscount  |
      |New            |BOTH     |amic-biz    |SA     |4           |4           |
  @campaign21.4.3
  Scenario Outline: Validate complete data for AMIC campaign for QLD
    Given user has opened the '<campaign>' link in a browser and creates 'E2E_Campaign_AMIC_QLD' to save evidences
    When user provides "EABIZ009" and "4506" and clicks on show me plan link
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state|
      |ELE      |Y                 |N                       |Y                    |Y                                    |N                                |QLD|
    And user validates disclaimer on plans page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName           |state|signUpCredit|
      |Y                        |N          |Y              |Total Plan - Business|QLD  |Y           |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |state|
      |ELE      |Y                 |N                       |Y                    |Y                                    |QLD|
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType |connectionAddress                              |movingType |propertyType |solarOption  |
      |BUS          |437 Oxley Avenue, REDCLIFFE QLD 4020        |Moving     |Renter       |No           |
    And user provides all details on checkout details page
      |customerType|journey    | firstName| lastName|businessType|
      |BUS         |BUS        | test     |test     |ABN         |
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType |EleclifeSupportDevices    |GaslifeSupportDevices  |
      |No               |         |                          |                       |
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state|
      |ELE      |Y                 |N                       |Y                    |Y                                    |N                                |QLD|
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|customerStatus    |campaign  |
      |ELE     |VERBALLYACCEPTED|BUSINESS    |ENE      |TOPB-EQ |QB02256002|                              |                              |N                      |                        |EMAIL        |<customerStatus>  |<campaign>|

    Examples:
      |customerStatus |fuelType |campaign  |state  |eleDiscount |gasDiscount  |
      |New            |ELE      |amic-biz      |QLD    |14          |15           |

  Scenario Outline: Validate complete data for AMIC campaign for ACT
    Given user has opened the '<campaign>' link in a browser and creates 'E2E_Campaign_AMIC_ACT' to save evidences
    When user provides "EABIZ009" and "2914" and clicks on show me plan link
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state|
      |ELE      |N                 |N                       |Y                    |Y                                    |N                                |ACT|
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state|
      |GAS      |N                 |N                       |Y                    |Y                                    |N                                |ACT|
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |state|
      |ELE      |N                 |N                       |Y                    |Y                                    |ACT|
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |state|
      |GAS      |N                 |N                       |Y                    |Y                                    |ACT|
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType |connectionAddress                              |movingType |propertyType |solarOption  |
      |BUS          |216 Northbourne Avenue, BRADDON ACT 2612           |Moving     |Renter       |No           |
    And user provides all details on checkout details page
      |customerType|journey    | firstName| lastName|businessType|
      |BUS         |BUS        | test     |test     |ABN         |
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType |EleclifeSupportDevices    |GaslifeSupportDevices  |
      |No               |         |                          |                       |
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state|
      |ELE      |N                 |N                       |Y                    |Y                                    |N                                |ACT|
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state|
      |GAS      |N                 |N                       |Y                    |Y                                    |N                                |ACT|
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|customerStatus    |campaign  |
      |ELE     |VERBALLYACCEPTED|BUSINESS    |ENE      |TOPB-EA |7001114516|                              |                              |N                      |                        |EMAIL        |<customerStatus>  |<campaign>|
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|customerStatus    |campaign  |
      |GAS     |VERBALLYACCEPTED|BUSINESS    |ENE      |TOPB-GA |5260021184|                              |                              |N                      |                        |EMAIL        |<customerStatus>  |<campaign>|

    Examples:
      |customerStatus |fuelType |campaign  |state  |eleDiscount |gasDiscount  |
      |New            |BOTH     |amic-biz      |ACT    |11          |20           |
