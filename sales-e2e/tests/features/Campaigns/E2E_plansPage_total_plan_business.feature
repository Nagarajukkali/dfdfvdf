
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

Feature:E2E scenario for total plan business campaign

  @DR22.2.1.campaign
  Scenario Outline: Validate complete data for Total Plan - Business campaign for NSW-Ausgrid for new non-moving customer
    Given user has opened the 'business-home-page' link in a browser and creates '<folderName>' to save evidences
    And user enters '2000' in 'POSTCODE' field
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent for "<planName>" plan
    And user validates the data on 'Business' plans page for "<campaign>" plan
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | Feature_chanceToWin | state   |
      | ELE      | Y                | N                     | Y                   | Y                                  | N                               | N                   | <state> |
    And user validates disclaimer on plans page for "<campaign>" plan
      | referencePriceComparison | goNeutral | solarBuyBack | carbonNeutral | planName   | state   | signUpCredit |
      | Y                        | N         | Y            | N             | <planName> | <state> | Y            |
    When user selects '<planName>'
    And user selects gas '<planName>'
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | Feature_chanceToWin | state   |
      | ELE      | Y                | N                     | Y                   | Y                                  | N                               | N                   | <state> |
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_XX_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_chanceToWin|state|
      |GAS      |Y                 |N                       |Y                    |Y                                    |N                                |N                  |<state>|
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                   | movingType | propertyType |
      | BUS          | 73-75 Enmore Road, NEWTOWN NSW 2042 | Non-Moving | Renter       |
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
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | Feature_chanceToWin | state   |
      | ELE      | N                | N                     | Y                   | Y                                  | N                               | N                   | <state> |
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_XX_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_chanceToWin|state|
      |GAS      |N                 |N                       |Y                    |Y                                    |N                                |N                  |<state>|

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
      | ELE      | VERBALLYACCEPTED | BUSINESS     | PS        | TOPB-EN  | 4102017007 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode |MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|customerStatus    |campaign  |
      |GAS     |VERBALLYACCEPTED|BUSINESS    |PS      |TOPB-GN  |           |                              |                              |N                      |                       |EMAIL        |<customerStatus>  |<campaign>|


    Examples:
      | customerStatus | fuelType | planName              | eleDiscount | gasDiscount | campaign            | folderName                                         | sourceSystem | journey | state | customerType | newOrExisting | AAH | DD |
      | New            | ELE      | Total Plan - Business | 19          | 20          | business-total-plan | E2E_Campaign_business_total_plan_NSW_new_nonMoving | Quote Tool   | New     | NSW   | BUS          | New           | No  | No |

  @DR22.2.1.campaign
  Scenario Outline: Validate complete data for Total Plan - Business campaign for VIC for new non-moving customer
    Given user has opened the 'business-home-page' link in a browser and creates '<folderName>' to save evidences
    And user enters '3000' in 'POSTCODE' field
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent for "<planName>" plan
    And user validates the data on 'Business' plans page for "<campaign>" plan
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | Feature_chanceToWin | state   |
      | ELE      | Y                | N                     | Y                   | Y                                  | N                               | N                   | <state> |
    And user validates disclaimer on plans page for "<campaign>" plan
      | referencePriceComparison | goNeutral | solarBuyBack | carbonNeutral | planName   | state   | signUpCredit |
      | Y                        | N         | Y            | N             | <planName> | <state> | Y            |
    When user selects '<planName>'
    And user selects gas '<planName>'
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | Feature_chanceToWin | state   |
      | ELE      | Y                | N                     | Y                   | Y                                  | N                               | N                   | <state> |
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_XX_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_chanceToWin|state|
      |GAS      |Y                 |N                       |Y                    |Y                                    |N                                |N                  |<state>|
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                   | movingType | propertyType |
      | BUS          | 70 Austrak Drive, SOMERTON VIC 3062 | Non-Moving | Renter       |
    And user provides all details on checkout details page
      | customerType | journey | firstName | lastName | businessType |
      | BUS          | BUS     | test      | test     | ABN          |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user validates details on checkout details page
      | sourceSystem   | journey   | fuelType   |
      | <sourceSystem> | <journey> | <fuelType> |
#    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user verifies selected plan details for '<fuelType>'
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | Feature_chanceToWin | state   |
      | ELE      | Y                | N                     | Y                   | Y                                  | N                               | N                   | <state> |
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_XX_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_chanceToWin|state|
      |GAS      |Y                 |N                       |Y                    |Y                                    |N                                |N                  |<state>|

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
      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | ELE      | VERBALLYACCEPTED | BUSINESS     | COR        | TOPB-EV  |     |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode |MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|customerStatus    |campaign  |
      |GAS     |VERBALLYACCEPTED|BUSINESS    |COR      |TOPB-GV  |           |                              |                              |N                      |                       |EMAIL        |<customerStatus>  |<campaign>|

    Examples:
      | customerStatus | fuelType | planName              | eleDiscount | gasDiscount | campaign            | folderName                                         | sourceSystem | journey | state | customerType | newOrExisting | AAH | DD |
      | New            | ELE      | Total Plan - Business | 3           | 1           | business-total-plan | E2E_Campaign_business_total_plan_VIC_new_nonMoving | Quote Tool   | New     | VIC   | BUS          | New           | No  | No |

  @DR21.10.2.campaign
  Scenario Outline: Validate complete data for Total Plan - Business campaign for SA for new moving customer
    Given user has opened the 'business-home-page' link in a browser and creates '<folderName>' to save evidences
    And user enters '5088' in 'POSTCODE' field
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent for "<planName>" plan
    And user validates the data on 'Business' plans page for "<campaign>" plan
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | Feature_chanceToWin | state   |
      | ELE      | N                | N                     | Y                   | Y                                  | N                               | N                   | <state> |
    And user validates disclaimer on plans page for "<campaign>" plan
      | referencePriceComparison | goNeutral | solarBuyBack | carbonNeutral | planName   | state   | signUpCredit |
      | Y                        | N         | Y            | N             | <planName> | <state> | N            |
    When user selects '<planName>'
    And user selects gas '<planName>'
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | Feature_chanceToWin | state   |
      | ELE      | Y                | N                     | Y                   | Y                                  | N                               | N                   | <state> |
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_XX_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_chanceToWin|state|
      |GAS      |Y                 |N                       |Y                    |Y                                    |N                                |N                  |<state>|
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
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | Feature_chanceToWin | state   |
      | ELE      | N                | N                     | Y                   | Y                                  | N                               | N                   | <state> |
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_XX_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_chanceToWin|state|
      |GAS      |N                 |N                       |Y                    |Y                                    |N                                |N                  |<state>|

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
      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | ELE      | VERBALLYACCEPTED | BUSINESS     | ENE       | TOPB-ES  |     |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode |MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|customerStatus    |campaign  |
      |GAS     |VERBALLYACCEPTED|BUSINESS    |ENE      |TOPB-GS  |           |                              |                              |N                      |                       |EMAIL        |<customerStatus>  |<campaign>|

    Examples:
      | customerStatus | fuelType | planName              | eleDiscount | gasDiscount | campaign            | folderName                                     | sourceSystem | journey   | state | customerType | newOrExisting | AAH | DD |
      | New            | ELE      | Total Plan - Business | 3           | 1           | business-total-plan | E2E_Campaign_business_total_plan_SA_new_moving | Quote Tool   | Move Home | SA    | BUS          | New           | No  | No |

  @DR22.2.1.campaign
  Scenario Outline: Validate complete data for Total Plan - Business campaign for ACT for new moving customer
    Given user has opened the 'business-home-page' link in a browser and creates '<folderName>' to save evidences
    And user enters '2612' in 'POSTCODE' field
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent for "<planName>" plan
    And user validates the data on 'Business' plans page for "<campaign>" plan
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | Feature_chanceToWin | state   |
      | ELE      | N                | N                     | Y                   | Y                                  | N                               | N                   | <state> |
    And user validates disclaimer on plans page for "<campaign>" plan
      | referencePriceComparison | goNeutral | solarBuyBack | carbonNeutral | planName   | state   | signUpCredit |
      | Y                        | N         | Y            | N             | <planName> | <state> | N            |
    When user selects '<planName>'
    And user selects gas '<planName>'
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | Feature_chanceToWin | state   |
      | ELE      | N                | N                     | Y                   | Y                                  | N                               | N                   | <state> |
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_XX_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_chanceToWin|state|
      |GAS      |N                 |N                       |Y                    |Y                                    |N                                |N                  |<state>|
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
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | Feature_chanceToWin | state   |
      | ELE      | N                | N                     | Y                   | Y                                  | N                               | N                   | <state> |
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_XX_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |Feature_chanceToWin|state|
      |GAS      |N                 |N                       |Y                    |Y                                    |N                                |N                  |<state>|

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
      | ELE      | VERBALLYACCEPTED | BUSINESS     | ENE       | TOPB-EA  | 7001138899 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode |MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|customerStatus    |campaign  |
      |GAS     |VERBALLYACCEPTED|BUSINESS    |ENE      |TOPB-GA  |           |                              |                              |N                      |                       |EMAIL        |<customerStatus>  |<campaign>|

    Examples:
      | customerStatus | fuelType | planName              | eleDiscount | gasDiscount | campaign            | folderName                                      | sourceSystem | journey   | state | customerType | newOrExisting | AAH | DD |
      | New            | ELE      | Total Plan - Business | 10          | 1           | business-total-plan | E2E_Campaign_business_total_plan_ACT_new_moving | Quote Tool   | Move Home | ACT   | BUS          | New           | No  | No |

  @DR22.2.1.campaign
  Scenario Outline: Validate complete data for Total Plan - Business campaign for QLD for new moving customer
    Given user has opened the 'business-home-page' link in a browser and creates '<folderName>' to save evidences
    And user enters '4020' in 'POSTCODE' field
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent for "<planName>" plan
    And user validates the data on 'Business' plans page for "<campaign>" plan
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | Feature_chanceToWin | state   |
      | ELE      | Y                | N                     | Y                   | Y                                  | N                               | N                   | <state> |
    And user validates disclaimer on plans page for "<campaign>" plan
      | referencePriceComparison | goNeutral | solarBuyBack | carbonNeutral | planName   | state   | signUpCredit |
      | Y                        | N         | Y            | N             | <planName> | <state> | N            |
    When user selects '<planName>'
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | Feature_chanceToWin | state   |
      | ELE      | Y                | N                     | Y                   | Y                                  | N                               | N                   | <state> |
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
      | Yes               | ELE      | Ele Other              |                       |
    And user verifies selected plan details for '<fuelType>'
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | Feature_chanceToWin | state   |
      | ELE      | Y                | N                     | Y                   | Y                                  | N                               | N                   | <state> |
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
      | ELE      | VERBALLYACCEPTED | BUSINESS     | ENE       | TOPB-EQ  | QB02256002 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |

    Examples:
      | customerStatus | fuelType | planName              | eleDiscount | gasDiscount | campaign            | folderName                                      | sourceSystem | journey   | state | customerType | newOrExisting | AAH | DD |
      | New            | ELE      | Total Plan - Business | 13          | 1           | business-total-plan | E2E_Campaign_business_total_plan_QLD_new_moving | Quote Tool   | Move Home | QLD   | BUS          | New           | No  | No |
