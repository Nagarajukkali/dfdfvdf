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

  @DR23.6.14.campaign
  Scenario Outline: Validate complete data for familyandfriends campaign for NSW-Ausgrid - new moving customer
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides email "nagaraj.ukkali@energyaustralia.com.au" and "2144" and clicks on show me plan link
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
     And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit|
      | ELE      | Y                | Y                     | N                   | Y                                  | N                               | <state> | N                     |
     And user validates the data on plans page for "<campaign>"
       | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit|
       | GAS      | Y                | Y                     | N                   | Y                                  | N                               | <state> | N                     |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName           | state   | signUpCredit |
      | Y                        | Y         | Y            | Family and Friends | <state> | Y            |
    And user clicks on Add plan button
    # And user validates plan details on cart page for "<campaign>"
    #   | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   | Feature_moveHomeCredit|
    #   | ELE      | N                | Y                     | Y                   | Y                                  | <state> | Y                     |
    # And user validates plan details on cart page for "<campaign>"
    #    | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   | Feature_moveHomeCredit|
    #    | GAS      | N                | Y                     | Y                   | Y                                  | <state> | Y                     |
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
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit|
      | ELE      | Y                | Y                     | N                   | Y                                  | N                               | <state> | N                     |
     And user validates plan details on review page for "<campaign>"
       | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit|
       | GAS      | Y                | Y                     | N                   | Y                                  | N                               | <state> | N                     |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName           | state   | signUpCredit |
      | Y                        | N         | Y            | Family and Friends | <state> | N            |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | FFPH-EN  | 4102681649 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
     And user validates below mandatory fields
       | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
       | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | FFPH-GN  | 5240524910 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType | eleDiscount | gasDiscount | campaign         | folderName                                   | state | sourceSystem | journey   | AAH | DD | customerType | newOrExisting |
      | New            | ELE      | 13          | 11          | familyandfriends | E2E_Campaign_familyandfriends_NSW_new_moving | NSW   | Quote Tool   | Move Home | No  | No | RES          | New           |


  @DR23.6.14.campaign
  Scenario Outline: Validate complete data for familyandfriends campaign for NSW-Endeavour existing non moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides email "nagaraj.ukkali@energyaustralia.com.au" and "2529" and clicks on show me plan link
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit|
      | ELE      | Y                | Y                     | N                   | Y                                  | N                               | <state> | N                     |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit|
      | GAS      | Y                | Y                     | N                   | Y                                  | N                               | <state> | N                     |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName           | state   | signUpCredit |
      | Y                        | N         | Y            | Family and Friends | <state> | Y            |
    And user clicks on Add plan button
    # And user validates plan details on cart page for "<campaign>"
    #   | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   | Feature_moveHomeCredit|
    #   | ELE      | N                | Y                     | Y                   | Y                                  | <state> | Y                     |
    # And user validates plan details on cart page for "<campaign>"
    #   | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   | Feature_moveHomeCredit|
    #   | GAS      | N                | Y                     | Y                   | Y                                  | <state> | Y                     |
    #And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      | customerStatus   | accountNumber | accountIdentityType | postcodeOrABNACN | idType | idValue  |
      #| <customerStatus> | 6942134043    | Postcode            | 2529             | dob    | 01011980 |
      | <customerStatus> | 2407416072    | Postcode            | 2529             | dob    | 01011980 |
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
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit|
      | ELE      | N                | Y                     | N                   | Y                                  | N                               | <state> | N                     |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName           | state   | signUpCredit |
      | Y                        | N         | Y            | Family and Friends | <state> | Y            |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | PS        | FFPH-EN  | 4311259340 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | PS       | FFPH-GN   | 5248190368 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |

    Examples:
      | customerStatus | fuelType | eleDiscount | gasDiscount | campaign         | folderName                                            | state | sourceSystem | journey     | AAH | DD | customerType | newOrExisting        |
      | Existing       | ELE      | 9          | 11          | familyandfriends | E2E_Campaign_familyandfriends_NSW_existing_non-moving | NSW   | Quote Tool   | Plan Switch | No  | No | RES          | Existing  non-moving |


  @DR22.10.2.campaign
  Scenario Outline: Validate complete data for familyandfriends campaign for QLD - new moving customer
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides email "geom.george@energyaustralia.com.au" and "4500" and clicks on show me plan link
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit|
      | ELE      | N                | Y                     | N                   | Y                                  | N                               | <state> | N                     |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName           | state   | signUpCredit |
      | Y                        | N         | Y            | Family and Friends | <state> | N            |
    And user clicks on Select plan button
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   | Feature_moveHomeCredit|
      | ELE      | N                | Y                     | N                   | Y                                  | <state> | N                     |
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
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit|
      | ELE      | N                | Y                     | N                   | Y                                  | N                               | <state> | N                     |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName           | state   | signUpCredit |
      | Y                        | N         | Y            | Family and Friends | <state> | N            |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | FFPH-EQ  | QB08556016 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType | eleDiscount | campaign         | folderName                                   | state | sourceSystem | journey   | AAH | DD | customerType | newOrExisting |
      | New            | ELE      | 3          | familyandfriends | E2E_Campaign_familyandfriends_QLD_new_moving | QLD   | Quote Tool   | Move Home | No  | No | RES          | New           |

  @DR22.10.2.campaign
  Scenario Outline: Validate complete data for familyandfriends campaign for SA - new moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides email "geom.george@energyaustralia.com.au" and "5000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | Y                     | N                   | Y                                  | N                               | <state> |N                     |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | GAS      | N                | Y                     | N                   | Y                                  | N                               | <state> |N                     |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName           | state   | signUpCredit |
      | Y                        | N         | Y            | Family and Friends | <state> | N            |
    And user clicks on Add plan button
    # And user validates plan details on cart page for "<campaign>"
    #   | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   | Feature_moveHomeCredit|
    #   | ELE      | Y                | Y                     | Y                   | Y                                  | <state> | N                     |
    # And user validates plan details on cart page for "<campaign>"
    #   | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   | Feature_moveHomeCredit|
    #   | GAS      | Y                | Y                     | Y                   | Y                                  | <state> | N                     |
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                 | movingType | propertyType |
      | RES          | 3 River Drive, ATHELSTONE SA 5076 | Moving     | Renter       |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType         | medicareType |
      | RES          | RES     | New            | test      | test     | Driver License |              |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit|
      | ELE      | N                | Y                     | N                   | Y                                  | N                               | <state> | N                     |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit|
      | GAS      | N                | Y                     | N                   | Y                                  | N                               | <state> | N                     |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName           | state   | signUpCredit |
      | Y                        | N         | Y            | Family and Friends | <state> | N            |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | FFPH-ES  | 2001245279 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | FFPH-GS  | 5510149276 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType | eleDiscount | gasDiscount | campaign         | folderName                                  | state | sourceSystem | journey   | AAH | DD | customerType | newOrExisting |
      | New            | ELE      | 3           | 7          | familyandfriends | E2E_Campaign_familyandfriends_SA_new_moving  | SA    | Quote Tool   | Move Home | No  | No | RES          | New           |

  @DR22.10.2.campaign
  Scenario Outline: Validate complete data for familyandfriends campaign for ACT - new non moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides email "geom.george@energyaustralia.com.au" and "2600" and clicks on show me plan link
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit|
      | ELE      | N                | Y                     | N                   | Y                                  | N                               | <state> | N                     |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit|
      | GAS      | N                | Y                     | N                   | Y                                  | N                               | <state> | N                     |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName           | state   | signUpCredit |
      | Y                        | N         | Y            | Family and Friends | <state> | N            |
    And user clicks on Add plan button
    # And user validates plan details on cart page for "<campaign>"
    #   | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   | Feature_moveHomeCredit|
    #   | ELE      | N                | Y                     | Y                   | Y                                  | <state> | Y                     |
    # And user validates plan details on cart page for "<campaign>"
    #   | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   | Feature_moveHomeCredit|
    #   | GAS      | N                | Y                     | Y                   | Y                                  | <state> | Y                     |
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                    | movingType | propertyType |
      | RES          | 21 Tarrant Crescent, DUNLOP ACT 2615 | Non-Moving | Renter       |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType         | medicareType |
      | RES          | RES     | New            | test      | test     | Driver License |              |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit|
      | ELE      | N                | Y                     | N                   | Y                                  | N                               | <state> | N                     |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit|
      | GAS      | N                | Y                     | N                   | Y                                  | N                               | <state> | N                     |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName           | state   | signUpCredit |
      | Y                        | N         | Y            | Family and Friends | <state> | N            |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | COR       | FFPH-EA  |     |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | COR       | FFPH-GA  | 5260073228 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType | eleDiscount | gasDiscount | campaign         | folderName                                      | state | sourceSystem | journey | AAH | DD | customerType | newOrExisting |
      | New            | ELE      | 14           | 21          | familyandfriends | E2E_Campaign_familyandfriends_ACT_new_nonmoving | ACT   | Quote Tool   | COR     | No  | No | RES          | New           |

  @DR23.5.3.campaign
  Scenario Outline: Validate complete data for familyandfriends campaign for VIC - new moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides email "geom.george@energyaustralia.com.au" and "3000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit|
      | ELE      | N                | Y                     | N                   | Y                                  | N                               | <state> |  N                    |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit|
      | GAS      | N                | Y                     | N                   | Y                                  | N                               | <state> |  N                    |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName           | state   | signUpCredit | Feature_moveHomeCredit|
      | Y                        | Y         | Y            | Family and Friends | <state> | N            | N                     |
    And user clicks on Add plan button
    # And user validates plan details on cart page for "<campaign>"
    #   | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   |
    #   | ELE      | N                | Y                     | Y                   | Y                                  | <state> |
    # And user validates plan details on cart page for "<campaign>"
    #   | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   |
    #   | GAS      | N                | Y                     | Y                   | Y                                  | <state> |
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                   | movingType | propertyType |
      | RES          | 31 Balwyn Road, CANTERBURY VIC 3126 | Moving     | Renter       |
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
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit|
      | ELE      | N                | N                     | N                   | Y                                  | N                               | <state> | N                     |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit|
      | GAS      | N                | N                     | N                   | Y                                  | N                               | <state> |  N                    |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName           | state   | signUpCredit |
      | Y                        | N         | Y            | Family and Friends | <state> | N            |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | FFPH-EV  | 6102221416 | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | FFPH-GV  | 5310425534 | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType | eleDiscount | gasDiscount | campaign         | folderName                                   | state | sourceSystem | journey   | AAH | DD | customerType | newOrExisting |
      | New            | BOTH     | 14           | 28          | familyandfriends | E2E_Campaign_familyandfriends_VIC_new_moving | VIC   | Quote Tool   | Move Home | No  | No | RES          | New           |

  @DR23.5.3.campaign
  Scenario Outline: Validate complete data for familyandfriends campaign for VIC existing non moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides email "geom.george@energyaustralia.com.au" and "3000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit|
      | ELE      | N                | Y                     | N                   | Y                                  | N                               | <state> | N                     |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit|
      | GAS      | N                | Y                     | N                   | Y                                  | N                               | <state> | N                     |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName           | state   | signUpCredit | moveHomeCredit|
      | Y                        | N         | Y            | Family and Friends | <state> | N            | N             |
    And user clicks on Add plan button
    # And user validates plan details on cart page for "<campaign>"
    #   | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   |
    #   | ELE      | N                | Y                     | Y                   | Y                                  | <state> |
    # And user validates plan details on cart page for "<campaign>"
    #   | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   |
    #   | GAS      | N                | Y                     | Y                   | Y                                  | <state> |
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
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit|
      | ELE      | N                | N                     | N                   | Y                                  | N                               | <state> | N                     |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit|
      | GAS      | N                | N                     | N                   | Y                                  | N                               | <state> |  N                    |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName           | state | signUpCredit |moveHomeCredit |
      | Y                        | N         | Y            | Family and Friends | VIC   | N            | N             |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | PS        | FFPH-EV  | 6305223703 | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | COR        | FFPH-GV  | 5321264636 | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType | eleDiscount | gasDiscount | campaign         | folderName                                  | state | sourceSystem | journey     | AAH | DD | customerType | newOrExisting        |
      | Existing       | BOTH     | 14           | 28          | familyandfriends | E2E_Campaign_familyandfriends_VIC_existing  | VIC   | Quote Tool   | Plan Switch | No  | No | RES          | Existing  non-moving |

  @DR23.5.3.campaign
  Scenario Outline: Validate complete data for familyandfriends campaign for VIC - new non moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides email "geom.george@energyaustralia.com.au" and "3000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit|
      | ELE      | N                | Y                     | N                   | Y                                  | N                               | <state> |  N                    |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit|
      | GAS      | N                | Y                     | N                   | Y                                  | N                               | <state> |  N                    |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName           | state   | signUpCredit | Feature_moveHomeCredit|
      | Y                        | N         | Y            | Family and Friends | <state> | N            | N                     |
    And user clicks on Add plan button
    # And user validates plan details on cart page for "<campaign>"
    #   | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   |
    #   | ELE      | N                | Y                     | Y                   | Y                                  | <state> |
    # And user validates plan details on cart page for "<campaign>"
    #   | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   |
    #   | GAS      | N                | Y                     | Y                   | Y                                  | <state> |
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                   | movingType | propertyType |
      | RES          | 31 Balwyn Road, CANTERBURY VIC 3126 | Non-Moving | Renter       |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType         | medicareType |
      | RES          | RES     | New            | test      | test     | Driver License |              |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit|
      | ELE      | N                | N                     | N                   | Y                                  | N                               | <state> | N                     |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit|
      | GAS      | N                | N                     | N                   | Y                                  | N                               | <state> |  N                    |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName           | state   | signUpCredit | moveHomeCredit |
      | Y                        | N         | Y            | Family and Friends | <state> | N            | N              |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | COR       | FFPH-EV  | 6102221416 | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | COR       | FFPH-GV  | 5310425534 | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType | eleDiscount | gasDiscount | campaign         | folderName                                       | state | sourceSystem | journey   | AAH | DD | customerType | newOrExisting |
      | New            | BOTH     |  14           | 28          | familyandfriends | E2E_Campaign_familyandfriends_VIC_new_non_moving | VIC   | Quote Tool   | COR       | No  | No | RES          | New           |

  @DR23.5.3.campaign
  Scenario Outline: Validate complete data for familyandfriends campaign for VIC existing moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides email "geom.george@energyaustralia.com.au" and "3000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit|
      | ELE      | N                | Y                     | N                   | Y                                  | N                               | <state> | N                     |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit|
      | GAS      | N                | Y                     | N                   | Y                                  | N                               | <state> | N                     |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName           | state   | signUpCredit | moveHomeCredit|
      | Y                        | N         | Y            | Family and Friends | <state> | N            | N             |
    And user clicks on Add plan button
    # And user validates plan details on cart page for "<campaign>"
    #   | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   |
    #   | ELE      | N                | Y                     | Y                   | Y                                  | <state> |
    # And user validates plan details on cart page for "<campaign>"
    #   | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   |
    #   | GAS      | N                | Y                     | Y                   | Y                                  | <state> |
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      | customerStatus   | accountNumber | accountIdentityType | postcodeOrABNACN | idType | idValue   |
      | <customerStatus> | 7300591603    | Postcode            | 3074             | dob     | 01011980 |
    And user provides all other details on qualifier page
      | customerType | connectionAddress                   | movingType | propertyType |
      | RES          | 31 Balwyn Road, CANTERBURY VIC 3126 | Moving     | Renter       |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus   | firstName | lastName | idType         |
      | RES          | RES     | <customerStatus> | test      | test     | Driver License |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit|
      | ELE      | N                | N                     | N                   | Y                                  | N                               | <state> | N                     |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit|
      | GAS      | N                | N                     | N                   | Y                                  | N                               | <state> |  N                    |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName           | state | signUpCredit |moveHomeCredit |
      | Y                        | N         | Y            | Family and Friends | VIC   | N            | N             |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | FFPH-EV  | 6102221416 | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | FFPH-GV  | 5310425534 | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType | eleDiscount | gasDiscount | campaign         | folderName                                            | state | sourceSystem | journey     | AAH | DD | customerType | newOrExisting    |
      | Existing       | BOTH     | 14           | 28          | familyandfriends | E2E_Campaign_familyandfriends_VIC_existing_non-moving | VIC   | Quote Tool   | Move Home   | No  | No | RES          | Existing  moving |


  @DR22.10.2.campaign
  Scenario Outline: Validate complete data for familyandfriends campaign for SA existing non moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides email "geom.george@energyaustralia.com.au" and "5000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit|
      | ELE      | N                | Y                     | N                   | Y                                  | N                               | <state> | N                     |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit|
      | GAS      | N                | Y                     | N                   | Y                                  | N                               | <state> | N                     |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName           | state   | signUpCredit |
      | Y                        | N         | Y            | Family and Friends | <state> | N            |
    And user clicks on Add plan button
    # And user validates plan details on cart page for "<campaign>"
    #   | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   | Feature_moveHomeCredit|
    #   | ELE      | N                | Y                     | Y                   | Y                                  | <state> | Y                     |
    # And user validates plan details on cart page for "<campaign>"
    #   | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   | Feature_moveHomeCredit|
    #   | GAS      | N                | Y                     | Y                   | Y                                  | <state> | Y                     |
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
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit|
      | ELE      | N                | Y                     | N                   | Y                                  | N                               | <state> | N                     |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit|
      | GAS      | N                | Y                     | N                   | Y                                  | N                               | <state> | N                     |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName           | state | signUpCredit |
      | Y                        | N         | Y            | Family and Friends | SA    | N            |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | PS        | FFPH-ES  | 2001374637 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | PS        | FFPH-GS  | 5510368960 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType | eleDiscount | gasDiscount | campaign         | folderName                                           | state | sourceSystem | journey     | AAH | DD | customerType | newOrExisting        |
      | Existing       | BOTH     | 3           | 7           | familyandfriends | E2E_Campaign_familyandfriends_SA_existing_non-moving | SA    | Quote Tool   | Plan Switch | No  | No | RES          | Existing  non-moving |

  @DR22.10.2.campaign
  Scenario Outline: Validate complete data for familyandfriends campaign for QLD existing non moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides email "geom.george@energyaustralia.com.au" and "4053" and clicks on show me plan link
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit|
      | ELE      | N                | Y                     | N                   | Y                                  | N                               | <state> | N                     |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName           | state   | signUpCredit |
      | Y                        | N         | Y            | Family and Friends | <state> | N            |
    And user clicks on Select plan button
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   | Feature_moveHomeCredit|
      | ELE      | N                | Y                     | N                   | Y                                  | <state> | N                     |
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      | customerStatus   | accountNumber | accountIdentityType | postcodeOrABNACN | idType | idValue   |
      #| <customerStatus> | 4968819589    | Postcode            | 4077             | dob     | 01011980 |
      | <customerStatus> | 8401947303    | Postcode            | 4504             | dl     | 233698026 |
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
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit|
      | ELE      | N                | Y                     | N                   | Y                                  | N                               | <state> | N                     |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName           | state | signUpCredit |
      | Y                        | N         | Y            | Family and Friends | QLD   | N            |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | PS       | FFPH-EQ  | 3114744490 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType | eleDiscount | campaign         | folderName                                            | state | sourceSystem | journey     | AAH | DD | customerType | newOrExisting        |
      | Existing       | ELE      | 3          | familyandfriends | E2E_Campaign_familyandfriends_QLD_existing_non-moving | QLD   | Quote Tool   | Plan Switch | No  | No | RES          | Existing  non-moving |

  @DR22.10.2.campaign
  Scenario: Validate family and friends residential campaign referee email validation rules
    Given user has opened the 'familyandfriends' link in a browser and creates 'E2E_FamilyAndFriends_EmailCodeValidation' to save evidences
    Then user validates the label for Referee email address as the offer code
    And user validates the banner test for Referee email address instead of offer code
    When user provides email "" and "2000" and clicks on show me plan link
    Then user is presented with 'You need to provide an EnergyAustralia employee’s email address to proceed' message
    When user provides email "geom.george" and "2000" and clicks on show me plan link
    Then user is presented with 'That email address is invalid, please try again' message
    When user provides email "geom@energyaustralia.com.au" and "2000" and clicks on show me plan link
    Then user is presented with 'That email address is invalid, please try again' static message
    When user provides email "geom.george@energyaustralia.com.au" and "2000" and clicks on show me plan link
    Then user is presented with the plans
    And user clicks on Add plan button
    And user selects 'New' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                   | movingType | propertyType |
      | RES          | 74 Yillowra Street, AUBURN NSW 2144 | Moving     | Renter       |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType         |
      | RES          | RES     | New            | test      | test     | Driver License |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user submits the quote
    Then user lands on checkout complete page
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed

