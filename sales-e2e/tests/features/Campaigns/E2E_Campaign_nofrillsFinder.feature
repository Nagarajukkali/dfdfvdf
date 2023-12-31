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

Feature:E2E scenario for nofrills-finder campaign for new moving

   @DR22.5.5.campaign
  Scenario Outline: Validate complete data for nofrills-finder campaign for NSW new non moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "2516" and clicks on show me plan link
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | Y                     | Y                   | N                                  | N                               | <state> |    Y                 |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | GAS      | N                | Y                     | Y                   | N                                  | N                               | <state> |    Y                 |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName  | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | No Frills | <state> | N            |    Y         |
    And user clicks on Add plan button
#    And user validates plan details on cart page for "<campaign>"
#      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
#      | ELE      | N                | Y                     | Y                   | N                                  | <state> |    Y                 |
#    And user validates plan details on cart page for "<campaign>"
#      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
#      | GAS      | N                | Y                     | Y                   | N                                  | <state> |    Y                 |
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                | movingType | propertyType |
      | RES          | 5 Wilkies Street, BULLI NSW 2516 | Non-Moving | Renter       |
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
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | N                     | Y                   | N                                  | N                               | <state> |    N                 |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | GAS      | N                | N                     | Y                   | N                                  | N                               | <state> |    N                 |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName  | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | No Frills | <state> | N            |    N         |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | PS        | RCPP-EN  | 4311150544 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | PS        | RCPP-GN  | 5240924834 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType | campaign        | folderName                                     | state | sourceSystem | journey | AAH | DD | customerType | newOrExisting |
      | New            | BOTH     | nofrills-finder | E2E_Campaign_nofrills-finder_NSW_New_NonMoving | NSW   | Quote Tool   | COR     | No  | No | RES          | New           |

   @DR22.5.5.campaign
  Scenario Outline: Validate complete data for nofrills-finder campaign for VIC new moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "3000" and clicks on show me plan link
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | Y                     | Y                   | N                                  | N                               | <state> |    Y                 |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | GAS      | N                | Y                     | Y                   | N                                  | N                               | <state> |    Y                 |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName  | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | No Frills | <state> | N            |    Y         |
    And user clicks on Add plan button
#    And user validates plan details on cart page for "<campaign>"
#      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
#      | ELE      | N                | Y                     | Y                   | N                                  | <state> |    Y                 |
#    And user validates plan details on cart page for "<campaign>"
#      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
#      | GAS      | N                | Y                     | Y                   | N                                  | <state> |    Y                 |
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                   | movingType | propertyType |
      | RES          | 31 Balwyn Road, CANTERBURY VIC 3126 | Moving     | Renter       |
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
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | N                     | Y                   | N                                  | N                               | <state> |    Y                 |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | GAS      | N                | N                     | Y                   | N                                  | N                               | <state> |    Y                 |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName  | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | No Frills | <state> | N            |    Y         |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | RCPP-EV  | 6102221416 | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | RCPP-GV  | 5310425534 | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType | campaign        | folderName                                  | state | sourceSystem | journey   | AAH | DD | customerType | newOrExisting |
      | New            | BOTH     | nofrills-finder | E2E_Campaign_nofrills-finder_VIC_New_Moving | VIC   | Quote Tool   | Move Home | No  | No | RES          | New           |

   @DR22.5.5.campaign
  Scenario Outline: Validate complete data for nofrills-finder campaign for QLD new moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "4500" and clicks on show me plan link
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | Y                     | Y                   | N                                  | N                               | <state> |    Y                 |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName  | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | No Frills | <state> | N            |    Y         |
    And user clicks on Select plan button
#    And user validates plan details on cart page for "<campaign>"
#      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
#      | ELE      | N                | Y                     | Y                   | N                                  | <state> |    Y                 |
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                  | movingType | propertyType |
      | RES          | 36 Cypress Street, KULUIN QLD 4558 | Moving     | Renter       |
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
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | N                     | Y                   | N                                  | N                               | <state> |    Y                 |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName  | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | No Frills | <state> | N            |    Y         |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | RCPP-EQ  | QB08556016 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType | campaign        | folderName                                  | state | sourceSystem | journey   | AAH | DD | customerType | newOrExisting |
      | New            | ELE      | nofrills-finder | E2E_Campaign_nofrills-finder_QLD_New_Moving | QLD   | Quote Tool   | Move Home | No  | No | RES          | New           |

   @DR22.5.5.campaign
  Scenario Outline: Validate complete data for nofrills-finder campaign for ACT for new moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "2911" for postcode and proceed to view the plans
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | Y                     | Y                   | N                                  | N                               | <state> |    Y                 |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | GAS      | N                | Y                     | Y                   | N                                  | N                               | <state> |    Y                 |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName  | state   |moveHomeCredit|
      | Y                        | Y         | Y            | No Frills | <state> |    Y         |
    And user clicks on Add plan button
#    And user validates plan details on cart page for "<campaign>"
#      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
#      | ELE      | N                | Y                     | Y                   | N                                  | <state> |    Y                 |
#    And user validates plan details on cart page for "<campaign>"
#      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
#      | GAS      | N                | Y                     | Y                   | N                                  | <state> |    Y                 |
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                 | movingType | propertyType |
      | RES          | 138 Narden Street, CRACE ACT 2911 | Moving     | Renter       |
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
      | ELE      | N                | N                     | Y                   | N                                  | N                               | <state> |    Y                 |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | GAS      | N                | N                     | Y                   | N                                  | N                               | <state> |    Y                 |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName  | state   |moveHomeCredit|
      | Y                        | Y         | Y            | No Frills | <state> |    Y         |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | RCPP-EA  | 7001183574 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    #update NMI
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | RCPP-GA  | 5265774405 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    #update MIRN
    Examples:
      | customerStatus | fuelType | campaign        | folderName                                  | state | sourceSystem | journey   | AAH | DD | customerType | newOrExisting |
      | New            | BOTH     | nofrills-finder | E2E_Campaign_nofrills-finder_ACT_New_moving | ACT   | Quote Tool   | Move Home | No  | No | RES          | New           |

   @DR22.5.5.campaign @Acquisition_ATL_Total_nofrills-finder
  Scenario Outline: Validate complete data for nofrills-finder campaign for VIC existing non moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "3000" and clicks on show me plan link
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state  |Feature_moveHomeCredit|
      |ELE      |N                 |Y                       |Y                    |N                                    |N                                |<state>|    Y                 |
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state|Feature_moveHomeCredit|
      |GAS      |N                 |Y                       |Y                    |N                                    |N                                |<state>|    Y                 |
    And user validates disclaimer on plans page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName  |state|signUpCredit|moveHomeCredit|
      |Y                        |Y          |Y              |No Frills |<state>  |N           |    Y         |
    And user clicks on Add plan button
#    And user validates plan details on cart page for "<campaign>"
#      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |state|Feature_moveHomeCredit|
#      |ELE      |N                 |Y                       |Y                    |N                                    |<state>|    Y                 |
#    And user validates plan details on cart page for "<campaign>"
#      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |state|Feature_moveHomeCredit|
#      |GAS      |N                 |Y                       |Y                    |N                                    |<state>|    Y                 |
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      |customerStatus   |accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |<customerStatus> |7300591603   |Postcode           |3074            |dob     | 01011980|
    And user provides all other details on qualifier page for Existing customer
      |customerType|movingType |propertyType |
      |RES         |Non-Moving |Renter       |
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus   | firstName| lastName|idType        |
      |RES         |RES        |<customerStatus> | test     |test     |Driver License|
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType |EleclifeSupportDevices    |GaslifeSupportDevices  |
      |No               |         |                          |                       |
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state|Feature_moveHomeCredit|
      |ELE      |N                 |N                       |Y                    |N                                    |N                                |<state>|    N               |
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state|Feature_moveHomeCredit|
      |GAS      |N                 |N                       |Y                    |N                                    |N                                |<state>|    N               |
    And user validates disclaimer on review page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName  |state|moveHomeCredit|
      |Y                        |Y          |Y              |No Frills |<state>  |    N     |
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
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|customerStatus    |campaign  |
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |PS       |RCPP-EV |6305223703|N                             |N                             |N                      |                 |EMAIL        |<customerStatus>  |<campaign>|
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|customerStatus    |campaign  |
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |PS       |RCPP-GV |5321264636|N                             |N                             |N                      |                   |EMAIL        |<customerStatus>  |<campaign>|
    Examples:
      | customerStatus | fuelType | campaign        | folderName                                           | state | sourceSystem | journey     | AAH | DD | customerType | newOrExisting        |
      | Existing       | BOTH     | nofrills-finder | E2E_Campaign_nofrills-finder_VIC_existing_non-moving | VIC   | Quote Tool   | Plan Switch | No  | No | RES          | Existing  non-moving |

   @DR22.5.5.campaign @Acquisition_ATL_Total_nofrills-finder
  Scenario Outline: Validate complete data for nofrills-finder campaign for NSW existing non moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "2000" and clicks on show me plan link
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state  |Feature_moveHomeCredit|
      |ELE      |N                 |Y                       |Y                    |N                                    |N                                |<state>|    Y                 |
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state|Feature_moveHomeCredit|
      |GAS      |N                 |Y                       |Y                    |N                                    |N                                |<state>|    Y                 |
    And user validates disclaimer on plans page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName  |state|signUpCredit|moveHomeCredit|
      |Y                        |Y          |Y              |No Frills |<state>  |N           |    Y         |
    And user clicks on Add plan button
#    And user validates plan details on cart page for "<campaign>"
#      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |state|Feature_moveHomeCredit|
#      |ELE      |N                 |Y                       |Y                    |N                                    |<state>|    Y                 |
#    And user validates plan details on cart page for "<campaign>"
#      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |state|Feature_moveHomeCredit|
#      |GAS      |N                 |Y                       |Y                    |N                                    |<state>|    Y                 |
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      |customerStatus   |accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |<customerStatus> |6942134043   |Postcode           |2529            |dob   |01011980|
    And user provides all other details on qualifier page for Existing customer
      |customerType|movingType |propertyType |
      |RES         |Non-Moving |Renter       |
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus   | firstName| lastName|idType        |
      |RES         |RES        |<customerStatus> | test     |test     |Driver License|
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType |EleclifeSupportDevices |GaslifeSupportDevices|
      |No               |         |                       |               |
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state|Feature_moveHomeCredit|
      |ELE      |N                 |N                       |Y                    |N                                    |N                                |<state>|    N               |
    And user validates disclaimer on review page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName  |state|moveHomeCredit|
      |Y                        |Y          |Y              |No Frills |<state>  |    N     |
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |ELE |<AAH>|<DD> |<customerType> |<newOrExisting>|
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|customerStatus    |campaign  |
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |PS       |RCPP-EN |4310882164|                             |                             |N                      |                 |EMAIL        |<customerStatus>  |<campaign>|
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | PS       | RCPP-GN  | 5240869476 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |


    Examples:
      | customerStatus | fuelType | campaign        | folderName                                           | state | sourceSystem | journey     | AAH | DD | customerType | newOrExisting        |
      | Existing       | BOTH     | nofrills-finder | E2E_Campaign_nofrills-finder_NSW_existing_non-moving | NSW   | Quote Tool   | Plan Switch | No  | No | RES          | Existing  non-moving |

   @DR22.5.5.campaign @Acquisition_ATL_Total_nofrills-finder
  Scenario Outline: Validate complete data for nofrills-finder campaign for SA existing non moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "5000" and clicks on show me plan link
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state  |Feature_moveHomeCredit|
      |ELE      |N                 |Y                       |Y                    |N                                    |N                                |<state>|    Y                 |
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state|Feature_moveHomeCredit|
      |GAS      |N                 |Y                       |Y                    |N                                    |N                                |<state>|    Y                 |
    And user validates disclaimer on plans page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName  |state|signUpCredit|moveHomeCredit|
      |Y                        |Y          |Y              |No Frills |<state>  |N           |    Y         |
    And user clicks on Add plan button
#    And user validates plan details on cart page for "<campaign>"
#      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |state|Feature_moveHomeCredit|
#      |ELE      |N                 |Y                       |Y                    |N                                    |<state>|    Y                 |
#    And user validates plan details on cart page for "<campaign>"
#      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |state|Feature_moveHomeCredit|
#      |GAS      |N                 |Y                       |Y                    |N                                    |<state>|    Y                 |
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      |customerStatus   |accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |<customerStatus> |7296521692   |Postcode           |5163            |dl   |107164445|
    And user provides all other details on qualifier page for Existing customer
      |customerType|movingType |propertyType |
      |RES         |Non-Moving |Renter       |
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus   | firstName| lastName|idType        |
      |RES         |RES        |<customerStatus> | test     |test     |Driver License|
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType |EleclifeSupportDevices    |GaslifeSupportDevices  |
      |No               |         |                          |                       |
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state|Feature_moveHomeCredit|
      |ELE      |N                 |N                       |Y                    |N                                    |N                                |<state>|    N               |
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state|Feature_moveHomeCredit|
      |GAS      |N                 |N                       |Y                    |N                                    |N                                |<state>|    N               |
    And user validates disclaimer on review page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName  |state|moveHomeCredit|
      |Y                        |Y          |Y              |No Frills |<state>  |    N     |
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
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|customerStatus    |campaign  |
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |PS       |RCPP-ES |2001374637|                             |                             |N                      |                 |EMAIL        |<customerStatus>  |<campaign>|
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|customerStatus    |campaign  |
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |PS       |RCPP-GS |5510368960|                             |                             |N                      |                   |EMAIL        |<customerStatus>  |<campaign>|
    Examples:
      | customerStatus | fuelType | campaign        | folderName                                          | state | sourceSystem | journey     | AAH | DD | customerType | newOrExisting        |
      | Existing       | BOTH     | nofrills-finder | E2E_Campaign_nofrills-finder_SA_existing_non-moving | SA    | Quote Tool   | Plan Switch | No  | No | RES          | Existing  non-moving |

   @DR22.5.5.campaign @Acquisition_ATL_Total_nofrills-finder
  Scenario Outline: Validate complete data for nofrills-finder campaign for QLD existing non moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "4500" and clicks on show me plan link
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state  |Feature_moveHomeCredit|
      |ELE      |N                 |Y                       |Y                    |N                                    |N                                |<state>|    Y                 |
    And user validates disclaimer on plans page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName  |state|signUpCredit|moveHomeCredit|
      |Y                        |Y          |Y              |No Frills |<state>  |N           |    Y         |
    And user clicks on Select plan button
#    And user validates plan details on cart page for "<campaign>"
#      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |state|Feature_moveHomeCredit|
#      |ELE      |N                 |Y                       |Y                    |N                                    |<state>|    Y                 |
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      |customerStatus   |accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |<customerStatus> |8401947303   |Postcode           |4504            |dl    |233698026|
    And user provides all other details on qualifier page for Existing customer
      |customerType|movingType |propertyType |
      |RES         |Non-Moving |Renter       |
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus   | firstName| lastName|idType        |
      |RES         |RES        |<customerStatus> | test     |test     |Driver License|
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType |EleclifeSupportDevices    |GaslifeSupportDevices  |
      |No               |         |                          |                       |
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state|Feature_moveHomeCredit|
      |ELE      |N                 |N                       |Y                    |N                                    |N                                |<state>|    N               |
    And user validates disclaimer on review page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |planName  |state|moveHomeCredit|
      |Y                        |Y          |Y              |No Frills |<state>  |    N     |
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
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|customerStatus    |campaign  |
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |PS       |RCPP-EQ |3114744490|                             |                             |N                      |                 |EMAIL        |<customerStatus>  |<campaign>|
    Examples:
      | customerStatus | fuelType | campaign        | folderName                                           | state | sourceSystem | journey     | AAH | DD | customerType | newOrExisting        |
      | Existing       | ELE      | nofrills-finder | E2E_Campaign_nofrills-finder_QLD_existing_non-moving | QLD   | Quote Tool   | Plan Switch | No  | No | RES          | Existing  non-moving |

