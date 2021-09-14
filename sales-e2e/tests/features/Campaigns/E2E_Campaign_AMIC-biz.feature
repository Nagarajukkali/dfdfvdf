#@E2E
@campaign
Feature:E2E scenario for AMIC-BIZ campaign

  @DR21.9.3.campaign
  Scenario Outline: Validate complete data for amic-biz campaign for NSW Ausgrid for new customer
    Given user has opened the '<campaign>' link in a browser and creates 'E2E_Campaign_AMIC_NSW_Ausgrid' to save evidences
    When user provides "2010" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_VariableRates | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state |
      | ELE      | N                | N                     | N                   | Y                     | Y                                  | N                               | NSW   |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_VariableRates | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state |
      | GAS      | N                | N                     | N                   | Y                     | Y                                  | N                               | NSW   |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName         | state | signUpCredit |
      | N                        | N         | N            | Business Balance | NSW   | N            |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_VariableRates | Feature_discountOffTotalEnergyBill | state |
      | ELE      | N                | N                     | N                   | Y                     | Y                                  | NSW   |
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_VariableRates | Feature_discountOffTotalEnergyBill | state |
      | GAS      | N                | N                     | N                   | Y                     | Y                                  | NSW   |
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                   | movingType | propertyType | solarOption |
      | BUS          | 73-75 Enmore Road, NEWTOWN NSW 2042 | Moving     | Renter       | No          |
    And user provides all details on checkout details page
      | customerType | journey | firstName | lastName | businessType |
      | BUS          | BUS     | test      | test     | ABN          |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user selects answer for property renovation question for '<state>'
    #And user opts in for Carbon Neutral
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_VariableRates | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state |
      | ELE      | N                | N                     | N                   | Y                     | Y                                  | N                               | NSW   |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_VariableRates | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state |
      | GAS      | N                | N                     | N                   | Y                     | Y                                  | N                               | NSW   |
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | ELE      | VERBALLYACCEPTED | BUSINESS     | ENE       | BSPB1-EN | 4102017007 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | BUSINESS     | ENE       | BSPB1-GN | 5247073457 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |

    Examples:
      | customerStatus | fuelType | campaign | state | eleDiscount | gasDiscount |
      | New            | BOTH     | amic-biz | NSW   | 28          | 26          |

  @DR21.9.3.campaign
  Scenario Outline: Validate complete data for amic-biz campaign for NSW Essential
    Given user has opened the '<campaign>' link in a browser and creates 'E2E_Campaign_AMIC_NSW_Essential' to save evidences
    When user provides "2580" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_VariableRates | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state |
      | ELE      | N                | N                     | N                   | Y                     | Y                                  | N                               | NSW   |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_VariableRates | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state |
      | GAS      | N                | N                     | N                   | Y                     | Y                                  | N                               | NSW   |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName         | state | signUpCredit |
      | N                        | N         | N            | Business Balance | NSW   | N            |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_VariableRates | Feature_discountOffTotalEnergyBill | state |
      | ELE      | N                | N                     | N                   | Y                     | Y                                  | NSW   |
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_VariableRates | Feature_discountOffTotalEnergyBill | state |
      | GAS      | N                | N                     | N                   | Y                     | Y                                  | NSW   |
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                         | movingType | propertyType | solarOption |
      | BUS          | 465 Sandy Point Road, LOWER BORO NSW 2580 | Moving     | Renter       | No          |
    And user provides all details on checkout details page
      | customerType | journey | firstName | lastName | businessType |
      | BUS          | BUS     | test      | test     | ABN          |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_VariableRates | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state |
      | ELE      | N                | N                     | N                   | Y                     | Y                                  | N                               | NSW   |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_VariableRates | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state |
      | GAS      | N                | N                     | N                   | Y                     | Y                                  | N                               | NSW   |
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | ELE      | VERBALLYACCEPTED | BUSINESS     | ENE       | BSPB1-EN |     |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | BUSINESS     | ENE       | BSPB1-GN |      |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |

    Examples:
      | customerStatus | fuelType | campaign | state | eleDiscount | gasDiscount |
      | New            | BOTH     | amic-biz | NSW   | 21          | 26          |

  @DR21.9.3.campaign
  Scenario Outline: Validate complete data for amic-biz campaign for NSW Endeavour for customer
    Given user has opened the '<campaign>' link in a browser and creates 'E2E_Campaign_AMIC_NSW_Endeavour' to save evidences
    When user provides "2163" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_VariableRates | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state |
      | ELE      | N                | N                     | N                   | Y                     | Y                                  | N                               | NSW   |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_VariableRates | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state |
      | GAS      | N                | N                     | N                   | Y                     | Y                                  | N                               | NSW   |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName         | state | signUpCredit |
      | N                        | N         | N            | Business Balance | NSW   | N            |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_VariableRates | Feature_discountOffTotalEnergyBill | state |
      | ELE      | N                | N                     | N                   | Y                     | Y                                  | NSW   |
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_VariableRates | Feature_discountOffTotalEnergyBill | state |
      | GAS      | N                | N                     | N                   | Y                     | Y                                  | NSW   |
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                           | movingType | propertyType | solarOption |
      | BUS          | 13 Station Street, WENTWORTH FALLS NSW 2782 | Moving     | Renter       | No          |
    And user provides all details on checkout details page
      | customerType | journey | firstName | lastName | businessType |
      | BUS          | BUS     | test      | test     | ABN          |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_VariableRates | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state |
      | ELE      | N                | N                     | N                   | Y                     | Y                                  | N                               | NSW   |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_VariableRates | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state |
      | GAS      | N                | N                     | N                   | Y                     | Y                                  | N                               | NSW   |
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | ELE      | VERBALLYACCEPTED | BUSINESS     | ENE       | BSPB1-EN | 4310504640 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | BUSINESS     | ENE       | BSPB1-GN |      |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |

    Examples:
      | customerStatus | fuelType | campaign | state | eleDiscount | gasDiscount |
      | New            | BOTH     | amic-biz | NSW   | 19          | 26          |

  @DR21.9.3.campaign
  Scenario Outline: Validate complete data for amic-biz campaign for VIC for new customer
    Given user has opened the '<campaign>' link in a browser and creates 'E2E_Campaign_AMIC_biz_VIC' to save evidences
    When user provides "3031" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_VariableRates | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state |
      | ELE      | N                | N                     | N                   | Y                     | Y                                  | N                               | VIC   |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_VariableRates | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state |
      | GAS      | N                | N                     | N                   | Y                     | Y                                  | N                               | VIC   |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName         | state | signUpCredit |
      | N                        | N         | N            | Business Balance | VIC   | N            |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_VariableRates | Feature_discountOffTotalEnergyBill | state |
      | ELE      | N                | N                     | N                   | Y                     | Y                                  | VIC   |
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_VariableRates | Feature_discountOffTotalEnergyBill | state |
      | GAS      | N                | N                     | N                   | Y                     | Y                                  | VIC   |
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                          | movingType | propertyType | solarOption |
      | BUS          | 36 Gregory Street West, WENDOUREE VIC 3355 | Moving     | Renter       | No          |
    And user provides all details on checkout details page
      | customerType | journey | firstName | lastName | businessType |
      | BUS          | BUS     | test      | test     | ABN          |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user validates details on checkout details page
      | sourceSystem   | journey   | fuelType   |
      | <sourceSystem> | <journey> | <fuelType> |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_VariableRates | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state |
      | ELE      | N                | N                     | N                   | Y                     | Y                                  | N                               | VIC   |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_VariableRates | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state |
      | GAS      | N                | N                     | N                   | Y                     | Y                                  | N                               | VIC   |
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | ELE      | VERBALLYACCEPTED | BUSINESS     | ENE       | BSPB1-EV | 6203822385 | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | BUSINESS     | ENE       | BSPB1-GV | 5330956738 | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> |

    Examples:
      | customerStatus | fuelType | campaign | state | eleDiscount | gasDiscount |
      | New            | BOTH     | amic-biz | VIC   | 6           | 26          |

  @DR21.9.3.campaign
  Scenario Outline: Validate complete data for amic-biz campaign for SA
    Given user has opened the '<campaign>' link in a browser and creates 'E2E_Campaign_AMIC_SA' to save evidences
    When user provides "5044" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_VariableRates | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state |
      | ELE      | N                | N                     | N                   | Y                     | Y                                  | N                               | SA    |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_VariableRates | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state |
      | GAS      | N                | N                     | N                   | Y                     | Y                                  | N                               | SA    |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_VariableRates | Feature_discountOffTotalEnergyBill | state |
      | ELE      | N                | N                     | N                   | Y                     | Y                                  | SA    |
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_VariableRates | Feature_discountOffTotalEnergyBill | state |
      | GAS      | N                | N                     | N                   | Y                     | Y                                  | SA    |
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                 | movingType | propertyType | solarOption |
      | BUS          | 277 Glen Osmond Road, GLENUNGA SA 5064 | Moving     | Renter       | No          |
    And user provides all details on checkout details page
      | customerType | journey | firstName | lastName | businessType |
      | BUS          | BUS     | test      | test     | ABN          |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_VariableRates | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state |
      | ELE      | N                | N                     | N                   | Y                     | Y                                  | N                               | SA    |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_VariableRates | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state |
      | GAS      | N                | N                     | N                   | Y                     | Y                                  | N                               | SA    |
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | ELE      | VERBALLYACCEPTED | BUSINESS     | ENE       | BSPB1-ES |     |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | BUSINESS     | ENE       | BSPB1-GS |      |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |

    Examples:
      | customerStatus | fuelType | campaign | state | eleDiscount | gasDiscount |
      | New            | BOTH     | amic-biz | SA    | 15          | 5           |

  @DR21.9.3.campaign
  Scenario Outline: Validate complete data for AMIC campaign for QLD
    Given user has opened the '<campaign>' link in a browser and creates 'E2E_Campaign_AMIC_QLD' to save evidences
    When user provides "4506" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_VariableRates | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state |
      | ELE      | N                | N                     | N                   | Y                     | Y                                  | N                               | QLD   |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName         | state | signUpCredit |
      | N                        | N         | N            | Business Balance | QLD   | N            |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_VariableRates | Feature_discountOffTotalEnergyBill | state |
      | ELE      | N                | N                     | N                   | Y                     | Y                                  | QLD   |
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                    | movingType | propertyType | solarOption |
      | BUS          | 437 Oxley Avenue, REDCLIFFE QLD 4020 | Moving     | Renter       | No          |
    And user provides all details on checkout details page
      | customerType | journey | firstName | lastName | businessType |
      | BUS          | BUS     | test      | test     | ABN          |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_VariableRates | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state |
      | ELE      | N                | N                     | N                   | Y                     | Y                                  | N                               | QLD   |
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | ELE      | VERBALLYACCEPTED | BUSINESS     | ENE       | BSPB1-EQ | QB02256002 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |

    Examples:
      | customerStatus | fuelType | campaign | state | eleDiscount | gasDiscount |
      | New            | ELE      | amic-biz | QLD   | 20          | 15          |

  @DR21.9.3.campaign
  Scenario Outline: Validate complete data for AMIC campaign for ACT
    Given user has opened the '<campaign>' link in a browser and creates 'E2E_Campaign_AMIC_ACT' to save evidences
    When user provides "2914" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_VariableRates | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state |
      | ELE      | N                | N                     | N                   | Y                     | Y                                  | N                               | ACT   |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_VariableRates | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state |
      | GAS      | N                | N                     | N                   | Y                     | Y                                  | N                               | ACT   |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_VariableRates | Feature_discountOffTotalEnergyBill | state |
      | ELE      | N                | N                     | N                   | Y                     | Y                                  | ACT   |
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_VariableRates | Feature_discountOffTotalEnergyBill | state |
      | GAS      | N                | N                     | N                   | Y                     | Y                                  | ACT   |
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                   | movingType | propertyType | solarOption |
      | BUS          | 7 Sargood Street, O'CONNOR ACT 2602 | Moving     | Renter       | No          |
    And user provides all details on checkout details page
      | customerType | journey | firstName | lastName | businessType |
      | BUS          | BUS     | test      | test     | ABN          |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_VariableRates | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state |
      | ELE      | N                | N                     | N                   | Y                     | Y                                  | N                               | ACT   |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_VariableRates | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state |
      | GAS      | N                | N                     | N                   | Y                     | Y                                  | N                               | ACT   |
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | ELE      | VERBALLYACCEPTED | BUSINESS     | ENE       | BSPB1-EA | 7001138899 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | BUSINESS     | ENE       | BSPB1-GA | 5260077864 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |

    Examples:
      | customerStatus | fuelType | campaign | state | eleDiscount | gasDiscount |
      | New            | GAS      | amic-biz | ACT   | 13          | 20          |
