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

Feature:E2E scenario for business-balance-plan campaign

  @DR22.9.2.campaign
  Scenario Outline: Validate complete data for business-balance-plan campaign for NSW-Ausgrid for new non-moving customer
    Given user has opened the 'business-home-page' link in a browser and creates '<folderName>' to save evidences
    And user enters '2000' in 'POSTCODE' field
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent for "<planName>" plan
    And user validates the data on 'Business' plans page for "<campaign>" plan
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | Feature_variableRates | state   | planName   |
      | ELE      | N                | N                     | N                   | Y                                     | N                               | Y                     | <state> | <planName> |
    And user have selected fuel as "GAS"
    And user validates "GAS" discount to be "<gasDiscount>" percent for "<planName>" plan
    And user validates the data on 'Business' plans page for "<campaign>" plan
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | Feature_variableRates | state   | planName   |
      | GAS      | N                | N                     | N                   | Y                                     | N                               | Y                     | <state> | <planName> |
    And user validates disclaimer on plans page for "<campaign>" plan
      | referencePriceComparison | goNeutral | solarBuyBack | carbonNeutral | planName   | state   | signUpCredit |
      | Y                        | N         | Y            | N             | <planName> | <state> | N            |
    When user selects '<planName>'
    And user add "ELE" component on cart page for "<campaign>"
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | Feature_variableRates | state   |
      | ELE      | N                | N                     | N                   | Y                                     | N                               | Y                     | <state> |
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | Feature_variableRates | state   |
      | GAS      | N                | N                     | N                   | Y                                     | N                               | Y                     | <state> |
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                          | movingType | propertyType |
      | BUS          | Shop 1 73-75 Enmore Road, NEWTOWN NSW 2042 | Non-Moving | Renter       |
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
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user verifies selected plan details for '<fuelType>'
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | Feature_variableRates | state   |
      | ELE      | N                | N                     | N                   | Y                                     | N                               | Y                     | <state> |
    And user validates disclaimer on review page for "<campaign>" plan
      | referencePriceComparison | goNeutral | solarBuyBack | carbonNeutral | planName   | state   | signUpCredit |
      | Y                        | N         | Y            | N             | <planName> | <state> | N            |
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
      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI         | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | ELE      | VERBALLYACCEPTED | BUSINESS     | COR       | BSPB2-EN |             |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | BUSINESS     | COR       | BSPB2-GN |             |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |

    Examples:
      | customerStatus | fuelType | planName              | eleDiscount | gasDiscount | campaign              | folderName                                           | sourceSystem | journey | state | customerType | newOrExisting | AAH | DD |
      | New            | ELE      | Business Balance Plan | 5           | 5           | business-balance-plan | E2E_Campaign_business_balance_plan_NSW_new_nonMoving | Quote Tool   | New     | NSW   | BUS          | New           | No  | No |

  @DR22.9.2.campaign
  Scenario Outline: Validate complete data for business-balance-plan campaign for VIC for new non-moving customer
    Given user has opened the 'business-home-page' link in a browser and creates '<folderName>' to save evidences
    And user enters '3000' in 'POSTCODE' field
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent for "<planName>" plan
    And user validates the data on 'Business' plans page for "<campaign>" plan
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | Feature_variableRates | state   | planName   |
      | ELE      | N                | N                     | N                   | Y                                     | N                               | Y                     | <state> | <planName> |
    And user have selected fuel as "GAS"
    And user validates "GAS" discount to be "<gasDiscount>" percent for "<planName>" plan
    And user validates the data on 'Business' plans page for "<campaign>" plan
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | Feature_variableRates | state   | planName   |
      | GAS      | N                | N                     | N                   | Y                                     | N                               | Y                     | <state> | <planName> |
    And user validates disclaimer on plans page for "<campaign>" plan
      | referencePriceComparison | goNeutral | solarBuyBack | carbonNeutral | planName   | state   | signUpCredit |
      | Y                        | N         | Y            | N             | <planName> | <state> | N            |
    When user selects '<planName>'
    And user add "ELE" component on cart page for "<campaign>"
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | Feature_variableRates | state   |
      | ELE      | N                | N                     | N                   | Y                                     | N                               | Y                     | <state> |
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | Feature_variableRates | state   |
      | GAS      | N                | N                     | N                   | Y                                     | N                               | Y                     | <state> |
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                          | movingType | propertyType |
      | BUS          | 36 Gregory Street West, WENDOUREE VIC 3355 | Non-Moving | Renter       |
    And user provides all details on checkout details page
      | customerType | journey | firstName | lastName | businessType |
      | BUS          | BUS     | test      | test     | ABN          |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user validates details on checkout details page
      | sourceSystem   | journey   | fuelType   |
      | <sourceSystem> | <journey> | <fuelType> |
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user verifies selected plan details for '<fuelType>'
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | Feature_variableRates | state   |
      | ELE      | N                | N                     | N                   | Y                                     | N                               | Y                     | <state> |
    And user validates disclaimer on review page for "<campaign>" plan
      | referencePriceComparison | goNeutral | solarBuyBack | carbonNeutral | planName   | state   | signUpCredit |
      | Y                        | N         | Y            | N             | <planName> | <state> | N            |
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
      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | ELE      | VERBALLYACCEPTED | BUSINESS     | PS        | BSPB2-EV | 6203822385 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | BUSINESS     | PS        | BSPB2-GV |             |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |

    Examples:
      | customerStatus | fuelType | planName              | eleDiscount | gasDiscount | campaign              | folderName                                           | sourceSystem | journey | state | customerType | newOrExisting | AAH | DD |
      | New            | ELE      | Business Balance Plan | 2           | 2           | business-balance-plan | E2E_Campaign_business_balance_plan_VIC_new_nonMoving | Quote Tool   | New     | VIC   | BUS          | New           | No  | No |

  @DR22.9.2.campaign
  Scenario Outline: Validate complete data for business-balance-plan campaign for for SA for new moving customer
    Given user has opened the 'business-home-page' link in a browser and creates '<folderName>' to save evidences
    And user enters '5000' in 'POSTCODE' field
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent for "<planName>" plan
    And user validates the data on 'Business' plans page for "<campaign>" plan
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | Feature_variableRates | state   | planName   |
      | ELE      | N                | N                     | N                   | Y                                     | N                               | Y                     | <state> | <planName> |
    And user have selected fuel as "GAS"
    And user validates "GAS" discount to be "<gasDiscount>" percent for "<planName>" plan
    And user validates the data on 'Business' plans page for "<campaign>" plan
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | Feature_variableRates | state   | planName   |
      | GAS      | N                | N                     | N                   | Y                                     | N                               | Y                     | <state> | <planName> |
    And user validates disclaimer on plans page for "<campaign>" plan
      | referencePriceComparison | goNeutral | solarBuyBack | carbonNeutral | planName   | state   | signUpCredit |
      | Y                        | N         | Y            | N             | <planName> | <state> | N            |
    When user selects '<planName>'
    And user add "ELE" component on cart page for "<campaign>"
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | Feature_variableRates | state   |
      | ELE      | N                | N                     | N                   | Y                                     | N                               | Y                     | <state> |
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | Feature_variableRates | state   |
      | GAS      | N                | N                     | N                   | Y                                     | N                               | Y                     | <state> |
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                      | movingType | propertyType |
      | BUS          | 277 Glen Osmond Road, GLENUNGA SA 5064 | Moving     | Renter       |
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
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user verifies selected plan details for '<fuelType>'
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | Feature_variableRates | state   |
      | ELE      | N                | N                     | N                   | Y                                     | N                               | Y                     | <state> |
    And user validates disclaimer on review page for "<campaign>" plan
      | referencePriceComparison | goNeutral | solarBuyBack | carbonNeutral | planName   | state   | signUpCredit |
      | Y                        | N         | Y            | N             | <planName> | <state> | N            |
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
      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI         | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | ELE      | VERBALLYACCEPTED | BUSINESS     | ENE       | BSPB2-ES |             |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | BUSINESS     | ENE       | BSPB2-GS |             |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |

    Examples:
      | customerStatus | fuelType | planName              | eleDiscount | gasDiscount | campaign              | folderName                                       | sourceSystem | journey   | state | customerType | newOrExisting | AAH | DD |
      | New            | ELE      | Business Balance Plan | 2           | 2           | business-balance-plan | E2E_Campaign_business_balance_plan_SA_new_moving | Quote Tool   | Move Home | SA    | BUS          | New           | No  | No |

  @DR22.9.2.campaign
  Scenario Outline: Validate complete data for business-balance-plan campaign for for ACT for new moving customer
    Given user has opened the 'business-home-page' link in a browser and creates '<folderName>' to save evidences
    And user enters '2600' in 'POSTCODE' field
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent for "<planName>" plan
    And user validates the data on 'Business' plans page for "<campaign>" plan
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | Feature_variableRates | state   | planName   |
      | ELE      | N                | N                     | N                   | Y                                     | N                               | Y                     | <state> | <planName> |
    And user have selected fuel as "GAS"
    And user validates "GAS" discount to be "<gasDiscount>" percent for "<planName>" plan
    And user validates the data on 'Business' plans page for "<campaign>" plan
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | Feature_variableRates | state   | planName   |
      | GAS      | N                | N                     | N                   | Y                                     | N                               | Y                     | <state> | <planName> |
    And user validates disclaimer on plans page for "<campaign>" plan
      | referencePriceComparison | goNeutral | solarBuyBack | carbonNeutral | planName   | state   | signUpCredit |
      | Y                        | N         | Y            | N             | <planName> | <state> | N            |
    When user selects '<planName>'
    And user add "ELE" component on cart page for "<campaign>"
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | Feature_variableRates | state   |
      | ELE      | N                | N                     | N                   | Y                                     | N                               | Y                     | <state> |
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | Feature_variableRates | state   |
      | GAS      | N                | N                     | N                   | Y                                     | N                               | Y                     | <state> |
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                   | movingType | propertyType |
      | BUS          | 7 Sargood Street, O'CONNOR ACT 2602 | Moving     | Renter       |
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
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user verifies selected plan details for '<fuelType>'
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | Feature_variableRates | state   |
      | ELE      | N                | N                     | N                   | Y                                     | N                               | Y                     | <state> |
    And user validates disclaimer on review page for "<campaign>" plan
      | referencePriceComparison | goNeutral | solarBuyBack | carbonNeutral | planName   | state   | signUpCredit |
      | Y                        | N         | Y            | N             | <planName> | <state> | N            |
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
      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | ELE      | VERBALLYACCEPTED | BUSINESS     | ENE       | BSPB2-EA | 7001138899 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | BUSINESS     | ENE       | BSPB2-GA |             |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |

    Examples:
      | customerStatus | fuelType | planName              | eleDiscount | gasDiscount | campaign              | folderName                                        | sourceSystem | journey   | state | customerType | newOrExisting | AAH | DD |
      | New            | ELE      | Business Balance Plan | 5           | 5           | business-balance-plan | E2E_Campaign_business_balance_plan_ACT_new_moving | Quote Tool   | Move Home | ACT   | BUS          | New           | No  | No |

  @DR22.9.2.campaign
  Scenario Outline: Validate complete data for business-balance-plan campaign for for QLD for new moving customer
    Given user has opened the 'business-home-page' link in a browser and creates '<folderName>' to save evidences
    And user enters '4020' in 'POSTCODE' field
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent for "<planName>" plan
    And user validates the data on 'Business' plans page for "<campaign>" plan
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | Feature_variableRates | state   | planName   |
      | ELE      | N                | N                     | N                   | Y                                     | N                               | Y                     | <state> | <planName> |
    And user validates disclaimer on plans page for "<campaign>" plan
      | referencePriceComparison | goNeutral | solarBuyBack | carbonNeutral | planName   | state   | signUpCredit |
      | Y                        | N         | Y            | N             | <planName> | <state> | N            |
    When user selects '<planName>'
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | Feature_variableRates | state   |
      | ELE      | N                | N                     | N                   | Y                                     | N                               | Y                     | <state> |
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                    | movingType | propertyType |
      | BUS          | 437 Oxley Avenue, REDCLIFFE QLD 4020 | Moving     | Renter       |
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
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user verifies selected plan details for '<fuelType>'
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | Feature_variableRates | state   |
      | ELE      | N                | N                     | N                   | Y                                     | N                               | Y                     | <state> |
    And user validates disclaimer on review page for "<campaign>" plan
      | referencePriceComparison | goNeutral | solarBuyBack | carbonNeutral | planName   | state   | signUpCredit |
      | Y                        | N         | Y            | N             | <planName> | <state> | N            |
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
      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | ELE      | VERBALLYACCEPTED | BUSINESS     | ENE       | BSPB2-EQ | QB02256002 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |

    Examples:
      | customerStatus | fuelType | planName              | eleDiscount | gasDiscount | campaign              | folderName                                        | sourceSystem | journey   | state | customerType | newOrExisting | AAH | DD |
      | New            | ELE      | Business Balance Plan | 5           | 5           | business-balance-plan | E2E_Campaign_business_balance_plan_QLD_new_Moving | Quote Tool   | Move Home | QLD   | BUS          | New           | No  | No |

  @DR22.9.2.campaign
  Scenario Outline: Validate complete data for business-balance-plan campaign for for NSW-Ausgrid for existing non-moving customer
    Given user has opened the 'business-home-page' link in a browser and creates '<folderName>' to save evidences
    And user enters '2000' in 'POSTCODE' field
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent for "<planName>" plan
    And user validates the data on 'Business' plans page for "<campaign>" plan
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | Feature_variableRates | state   | planName   |
      | ELE      | N                | N                     | N                   | Y                                     | N                               | Y                     | <state> | <planName> |
    And user have selected fuel as "GAS"
    And user validates "GAS" discount to be "<gasDiscount>" percent for "<planName>" plan
    And user validates the data on 'Business' plans page for "<campaign>" plan
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | Feature_variableRates | state   | planName   |
      | GAS      | N                | N                     | N                   | Y                                     | N                               | Y                     | <state> | <planName> |
    And user validates disclaimer on plans page for "<campaign>" plan
      | referencePriceComparison | goNeutral | solarBuyBack | carbonNeutral | planName   | state   | signUpCredit |
      | Y                        | N         | Y            | N             | <planName> | <state> | N            |
    When user selects '<planName>'
    And user add "ELE" component on cart page for "<campaign>"
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | Feature_variableRates | state   |
      | ELE      | N                | N                     | N                   | Y                                     | N                               | Y                     | <state> |
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | Feature_variableRates | state   |
      | GAS      | N                | N                     | N                   | Y                                     | N                               | Y                     | <state> |
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      | customerStatus | accountNumber | accountIdentityType | postcodeOrABNACN | idType | idValue  |
      | Existing       | 7185109615    | ABN                 | 33499936800      | dob    | 01011980 |
    And user provides all other details on qualifier page for Existing customer
      | customerType | movingType |
      | BUS          | Non-Moving |
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
    And user verifies selected plan details for '<fuelType>'
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | Feature_variableRates | state   |
      | ELE      | N                | N                     | N                   | Y                                     | N                               | Y                     | <state> |
    And user validates disclaimer on review page for "<campaign>" plan
      | referencePriceComparison | goNeutral | solarBuyBack | carbonNeutral | planName   | state   | signUpCredit |
      | Y                        | N         | Y            | N             | <planName> | <state> | N            |
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
      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | ELE      | VERBALLYACCEPTED | BUSINESS     | PS        | BSPB2-EN | 4102947568 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | BUSINESS     | COR       | BSPB2-GN |             |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |

    Examples:
      | customerStatus | fuelType | planName              | eleDiscount | gasDiscount | campaign              | folderName                                           | sourceSystem | journey     | state | customerType | newOrExisting | AAH | DD |
      | Existing       | ELE      | Business Balance Plan | 5           | 5           | business-balance-plan | E2E_Campaign_business_balance_plan_NSW_new_nonMoving | Quote Tool   | Plan Switch | NSW   | BUS          | Existing      | No  | No |

