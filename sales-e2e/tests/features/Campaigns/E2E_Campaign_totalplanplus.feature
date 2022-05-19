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
  # 9. If journey change to Moving to Non-Moving then update offerType to COR/PS accordingly in this step "And user validates below mandatory fields"

Feature:E2E scenario for total-plan-plus campaign

  @DR22.5.4.campaign
  Scenario Outline: Validate complete data for total-plan-plus campaign for VIC - existing non moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "3031" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
      | ELE      | N                | Y                     | Y                   | Y                                  | <state> |    Y                 |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
      | GAS      | N                | Y                     | Y                   | Y                                  | <state> |    Y                 |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName        | state   |moveHomeCredit|
      | Y                        | Y         | Y            | Total Plan Plus | <state> |    Y         |
    And user clicks on Add plan button
#    And user validates plan details on cart page for "<campaign>"
#      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
#      | ELE      | N                | Y                     | Y                   | Y                                  | <state> |    Y                 |
#    And user validates plan details on cart page for "<campaign>"
#      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
#      | GAS      | N                | Y                     | Y                   | Y                                  | <state> |    Y                 |
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      | customerStatus   | accountNumber | accountIdentityType | postcodeOrABNACN | idType | idValue   |
      | <customerStatus> | 7300591603    | Postcode            | 3074             | dob     | 01011980 |
    And user provides all other details on qualifier page for Existing customer
      | customerType | movingType | propertyType |
      | RES          | Non-Moving | Renter       |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus   | firstName | lastName | idType         |
      | RES          | RES     | <customerStatus> | test      | test     | Driver License |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | N                     | Y                   | Y                                  | N                               | <state> |    N                 |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | GAS      | N                | N                     | Y                   | Y                                  | N                               | <state> |    N                 |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName        | state   |moveHomeCredit|
      | Y                        | Y         | Y            | Total Plan Plus | <state> |    N         |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | PS        | SWSR1-EV | 6305223703 | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | PS        | SWSR1-GV | 5321264636 | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType | eleDiscount | gasDiscount | campaign        | folderName                                   | state | sourceSystem | journey     | AAH | DD | customerType | newOrExisting |
      | Existing       | BOTH     | 13          | 34          | total-plan-plus | E2E_Campaign_total-plan-plus_VIC_exis_nonmov | VIC   | Quote Tool   | Plan Switch | No  | No | RES          | Existing      |

  @DR22.3.3.campaign
  Scenario Outline: Validate complete data for total-plan-plus campaign for NSW-Endeavour - existing non moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "2529" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
      | ELE      | N                | Y                     | Y                   | Y                                  | <state> |    Y                 |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
      | GAS      | N                | Y                     | Y                   | Y                                  | <state> |    Y                 |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName        | state   |moveHomeCredit|
      | Y                        | Y         | Y            | Total Plan Plus | <state> |    Y         |
    And user clicks on Add plan button
#    And user validates plan details on cart page for "<campaign>"
#      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
#      | ELE      | N                | Y                     | Y                   | Y                                  | <state> |    Y                 |
#    And user validates plan details on cart page for "<campaign>"
#      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
#      | GAS      | N                | Y                     | Y                   | Y                                  | <state> |    Y                 |
#    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      | customerStatus   | accountNumber | accountIdentityType | postcodeOrABNACN | idType | idValue  |
      | <customerStatus> | 6942134043    | Postcode            | 2529             | dob    | 01011980 |
    And user provides all other details on qualifier page for Existing customer
      | customerType | movingType | propertyType |
      | RES          | Non-Moving | Renter       |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus   | firstName | lastName | idType         |
      | RES          | RES     | <customerStatus> | test      | test     | Driver License |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | N                     | Y                   | Y                                  | N                               | <state> |    N                 |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName        | state |moveHomeCredit|
      | Y                        | Y         | Y            | Total Plan Plus | NSW   |    Y         |
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      | sourceSystem   | journey   | fuelType | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | ELE      | <AAH> | <DD> | <customerType> | <newOrExisting> |
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | PS        | SWSR1-EN | 4310882164 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | PS       | SWSR1-GN  | 5240869476 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |

    Examples:
      | customerStatus | fuelType | eleDiscount | gasDiscount | campaign        | folderName                                   | state | sourceSystem | journey     | AAH | DD | customerType | newOrExisting |
      | Existing       | ELE      | 17          | 17          | total-plan-plus | E2E_Campaign_total-plan-plus_NSW_exis_nonmov | NSW   | Quote Tool   | Plan Switch | No  | No | RES          | Existing      |

  @DR22.1.2.campaign
  Scenario Outline: Validate complete data for total-plan-plus campaign for SA - existing non moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "5000" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
      | ELE      | Y                | Y                     | Y                   | Y                                  | <state> |    N                 |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
      | GAS      | Y                | Y                     | Y                   | Y                                  | <state> |    N                 |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName        | state   |moveHomeCredit|
      | Y                        | Y         | Y            | Total Plan Plus | <state> |   N          |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
      | ELE      | Y                | Y                     | Y                   | Y                                  | <state> |    N                 |
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
      | GAS      | Y                | Y                     | Y                   | Y                                  | <state> |    N                 |
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      | customerStatus   | accountNumber | accountIdentityType | postcodeOrABNACN | idType | idValue   |
      | <customerStatus> | 7296521692    | Postcode            | 5163             | dl     | 107164445 |
    And user provides all other details on qualifier page for Existing customer
      | customerType | movingType | propertyType |
      | RES          | Non-Moving | Renter       |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus   | firstName | lastName | idType         |
      | RES          | RES     | <customerStatus> | test      | test     | Driver License |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | N                     | Y                   | Y                                  | N                               | <state> |    N                 |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | GAS      | N                | N                     | Y                   | Y                                  | N                               | <state> |    N                 |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName        | state   |moveHomeCredit|
      | Y                        | Y         | Y            | Total Plan Plus | <state> |    N         |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | PS        | SWSR1-ES | 2001374637 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | PS        | SWSR1-GS | 5510368960 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType | eleDiscount | gasDiscount | campaign        | folderName                                  | state | sourceSystem | journey     | AAH | DD | customerType | newOrExisting |
      | Existing       | ELE      | 7           | 16          | total-plan-plus | E2E_Campaign_total-plan-plus_SA_exis_nonmov | SA    | Quote Tool   | Plan Switch | No  | No | RES          | Existing      |

  @DR22.1.2.campaign
  Scenario Outline: Validate complete data for total-plan-plus campaign for ACT - existing non moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "2600" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
      | ELE      | Y                | Y                     | Y                   | Y                                  | <state> |    N                 |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
      | GAS      | Y                | Y                     | Y                   | Y                                  | <state> |    N                 |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName        | state   |moveHomeCredit|
      | Y                        | Y         | Y            | Total Plan Plus | <state> |    N         |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
      | ELE      | Y                | Y                     | Y                   | Y                                  | <state> |    N                 |
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
      | GAS      | Y                | Y                     | Y                   | Y                                  | <state> |    N                 |
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      | customerStatus   | accountNumber | accountIdentityType | postcodeOrABNACN | idType | idValue  |
      | <customerStatus> | 5196758830    | Postcode            | 2906             | dl    | 409944380 |
    And user provides all other details on qualifier page for Existing customer
      | customerType | movingType | propertyType |
      | RES          | Non-Moving | Renter       |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus   | firstName | lastName | idType         |
      | RES          | RES     | <customerStatus> | test      | test     | Driver License |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | N                     | Y                   | Y                                  | N                               | <state> |    N                 |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | GAS      | N                | N                     | Y                   | Y                                  | N                               | <state> |   N                  |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName        | state   |moveHomeCredit|
      | Y                        | Y         | Y            | Total Plan Plus | <state> |    N         |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | PS        | SWSR1-EA | 7001004708 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | PS        | SWSR1-GA | 5260040095 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType | eleDiscount | gasDiscount | campaign        | folderName                                   | state | sourceSystem | journey     | AAH | DD | customerType | newOrExisting |
      | Existing       | ELE      | 11          | 16          | total-plan-plus | E2E_Campaign_total-plan-plus_ACT_exis_nonmov | ACT   | Quote Tool   | Plan Switch | No  | No | RES          | Existing      |

  @DR22.3.3.campaign
  Scenario Outline: Validate complete data for total-plan-plus campaign for NSW-Ausgrid - new moving customer
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "2144" and clicks on show me plan link
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | Y                     | Y                   | Y                                  | N                               | <state> |    Y                 |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | GAS      | N                | Y                     | Y                   | Y                                  | N                               | <state> |    Y                 |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName        | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | Total Plan Plus | <state> | Y            |    Y         |
    And user clicks on Add plan button
#    And user validates plan details on cart page for "<campaign>"
#      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
#      | ELE      | N                | Y                     | Y                   | Y                                  | <state> |    Y                 |
#    And user validates plan details on cart page for "<campaign>"
#      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
#      | GAS      | N                | Y                     | Y                   | Y                                  | <state> |    Y                 |
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                   | movingType | propertyType |
      | RES          | 74 Yillowra Street, AUBURN NSW 2144 | Moving     | Renter       |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType         |
      | RES          | RES     | New            | test      | test     | Driver License |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user validates details on checkout details page
      | sourceSystem   | journey   | fuelType   |
      | <sourceSystem> | <journey> | <fuelType> |
    And user opts for AAH and DD
      | optAAHOption | optDDOption | directDebitType |
      | <AAH>        | <DD>        | Bank            |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | N                     | Y                   | Y                                  | N                               | <state> |    Y                 |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | GAS      | N                | N                     | Y                   | Y                                  | N                               | <state> |    Y                 |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName        | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | Total Plan Plus | <state> | Y            |    Y         |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | SWSR1-EN | 4102681649 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | SWSR1-GN | 5240524910 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType | eleDiscount | gasDiscount | campaign        | folderName                                  | state | sourceSystem | journey   | AAH | DD | customerType | newOrExisting |
      | New            | BOTH     | 21          | 17          | total-plan-plus | E2E_Campaign_total-plan-plus_NSW_new_moving | NSW   | Quote Tool   | Move Home | No  | No | RES          | New           |

  @DR22.5.4.campaign
  Scenario Outline: Validate complete data for total-plan-plus campaign for VIC - new moving customer
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "3163" and clicks on show me plan link
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | Y                     | Y                   | Y                                  | N                               | <state> |    Y                 |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | GAS      | N                | Y                     | Y                   | Y                                  | N                               | <state> |    Y                 |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName        | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | Total Plan Plus | <state> | N            |    Y         |
    And user clicks on Add plan button
#    And user validates plan details on cart page for "<campaign>"
#      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
#      | ELE      | N                | Y                     | Y                   | Y                                  | <state> |    Y                 |
#    And user validates plan details on cart page for "<campaign>"
#      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
#      | GAS      | N                | Y                     | Y                   | Y                                  | <state> |    Y                 |
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                            | movingType | propertyType |
      | RES          | Unit 2 195 Grange Road, GLEN HUNTLY VIC 3163 | Moving     | Renter       |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType         |
      | RES          | RES     | New            | test      | test     | Driver License |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user validates details on checkout details page
      | sourceSystem   | journey   | fuelType   |
      | <sourceSystem> | <journey> | <fuelType> |
    And user opts for AAH and DD
      | optAAHOption | optDDOption | directDebitType |
      | <AAH>        | <DD>        | Bank            |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | N                     | Y                   | Y                                  | N                               | <state> |    Y                 |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | GAS      | N                | N                     | Y                   | Y                                  | N                               | <state> |    Y                 |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName        | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | Total Plan Plus | <state> | N            |    Y         |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | SWSR1-EV | 6407345045 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | SWSR1-GV | 5310508418 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType | eleDiscount | gasDiscount | campaign        | folderName                                  | state | sourceSystem | journey   | AAH | DD | customerType | newOrExisting |
      | New            | BOTH     | 13          | 34          | total-plan-plus | E2E_Campaign_total-plan-plus_VIC_new_moving | VIC   | Quote Tool   | Move Home | No  | No | RES          | New           |

  @DR22.3.3.campaign
  Scenario Outline: Validate complete data for total-plan-plus campaign for QLD - new moving customer
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "4506" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | Y                     | Y                   | Y                                     | N                               | <state> |    Y                 |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName        | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | Total Plan Plus | <state> | N            |    Y         |
    And user clicks on Select plan button
#    And user validates plan details on cart page for "<campaign>"
#      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_XX_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
#      | ELE      | N                | Y                     | Y                   | Y                                     | <state> |    Y                 |
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                  | movingType | propertyType |
      | RES          | 36 Cypress Street, KULUIN QLD 4558 | Moving     | Renter       |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType         | medicareType |
      | RES          | RES     | New            | test      | test     | Driver License |              |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | N                     | Y                   | Y                                     | N                               | <state> |    Y                 |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName        | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | Total Plan Plus | <state> | N            |    Y         |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | SWSR1-EQ  | QB08556016 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType | eleDiscount | campaign        | folderName                                 | state | sourceSystem | journey   | AAH | DD | customerType | newOrExisting |
      | New            | ELE      | 15          | total-plan-plus | E2E_Campaign_total-plan-plus_QLD_new_moving | QLD   | Quote Tool   | Move Home | No  | No | RES          | New           |
