@campaign @seniors
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

Feature:E2E scenario for seniors campaign

  @DR23.5.3.campaign
  Scenario Outline: Validate complete data for seniors campaign for VIC - new moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "1234" and "3000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_variableRates |Feature_regularPayOption| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | Y                     | N                     |Y                       | Y                                     | N                               | <state> |N                     |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_variableRates |Feature_regularPayOption| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | GAS      | N                | Y                     | N                     |Y                       | Y                                       | N                               | <state> |N                     |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | Flexi Plan | <state> | N            |N             |
    And user clicks on Add plan button
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
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_variableRates |Feature_regularPayOption| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | N                     | N                     |Y                       | Y                                     | N                               | <state> |N                     |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_variableRates |Feature_regularPayOption| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | GAS      | N                | N                     | N                     |Y                       | Y                                     | N                               | <state> |N                     |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | Flexi Plan | <state> | N            |N             |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | BP2H-EV  | 6102221416 | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | BP2H-GV  | 5310425534 | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType | eleDiscount | gasDiscount | campaign| folderName                             | state | sourceSystem | journey   | AAH | DD | customerType | newOrExisting |
      | New            | BOTH     | 13           | 27          | seniors | E2E_Campaign_vicseniors_VIC_new_moving | VIC   | Quote Tool   | Move Home | No  | No | RES          | New           |

  @DR23.5.3.campaign
  Scenario Outline: Validate complete data for seniors campaign for VIC - new non-moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "1234" and "3000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_variableRates |Feature_regularPayOption| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | Y                     | N                     |Y                       | Y                                     | N                               | <state> |N                     |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_variableRates |Feature_regularPayOption| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | GAS      | N                | Y                     | N                     |Y                       | Y                                     | N                               | <state> |N                     |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | Flexi Plan | <state> | N            |N             |
    And user clicks on Add plan button
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
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_variableRates |Feature_regularPayOption| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | N                     | N                     |Y                       | Y                                     | N                               | <state> |N                     |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_variableRates |Feature_regularPayOption| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | GAS      | N                | N                     | N                     |Y                       | Y                                     | N                               | <state> |N                     |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | Flexi Plan | <state> | N            |N             |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | COR       | BP2H-EV  |            | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | COR       | BP2H-GV  | 5310425534 | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType | eleDiscount | gasDiscount | campaign| folderName                               | state | sourceSystem | journey  | AAH | DD | customerType | newOrExisting |
      | New            | BOTH     | 13           | 27          | seniors | E2E_Campaign_vicseniors_VIC_new_nonmoving| VIC   | Quote Tool   | COR      | No  | No | RES        | New           |

  @DR23.5.3.campaign
  Scenario Outline: Validate complete data for seniors campaign for VIC existing non moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "1234" and "3000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_variableRates |Feature_regularPayOption| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | Y                     | N                     |Y                       | Y                                     | N                               | <state> |N                     |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_variableRates |Feature_regularPayOption| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | GAS      | N                | Y                     | N                     |Y                       | Y                                     | N                               | <state> |N                     |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | Flexi Plan | <state> | N            |N             |
    And user clicks on Add plan button
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
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_variableRates |Feature_regularPayOption| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | N                     | N                     |Y                       | Y                                     | N                               | <state> |    N                 |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_variableRates |Feature_regularPayOption| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | GAS      | N                | N                     | N                     |Y                       | Y                                     | N                               | <state> |    N                 |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | Flexi Plan | VIC   | N            |    N         |
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
      | fuelType | quoteStatus      | customerType | offerType| planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | PS       | BP2H-EV  |            | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | COR        | BP2H-GV  | 5321264636 | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType | eleDiscount | gasDiscount | campaign | folderName                                   | state | sourceSystem | journey     | AAH | DD | customerType | newOrExisting        |
      | Existing       | BOTH     | 13           | 27          | seniors  | E2E_Campaign_seniors_VIC_existing_non-moving | VIC   | Quote Tool   | Plan Switch | No  | No | RES          | Existing  non-moving |

  @DR23.5.3.campaign
  Scenario Outline: Validate complete data for seniors campaign for VIC existing moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "1234" and "3000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_variableRates |Feature_regularPayOption| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | Y                     | N                     |Y                       | Y                                     | N                               | <state> |N                     |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_variableRates |Feature_regularPayOption| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | GAS      | N                | Y                     | N                     |Y                       | Y                                     | N                               | <state> |N                     |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | Flexi Plan | <state> | N            |N             |
    And user clicks on Add plan button
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      | customerStatus   | accountNumber | accountIdentityType | postcodeOrABNACN | idType | idValue   |
      | <customerStatus> | 7300591603    | Postcode            | 3074             | dob     | 01011980 |
    And user provides all other details on qualifier page for Existing customer
      | customerType | connectionAddress                   | movingType | propertyType |
      | RES          |107 Cedar Street, THOMASTOWN VIC 3074| Moving     | Renter       |
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
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_variableRates |Feature_regularPayOption| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | N                     | N                     |Y                       | Y                                     | N                               | <state> |    N                 |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_variableRates |Feature_regularPayOption| Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | GAS      | N                | N                     | N                     |Y                       | Y                                     | N                               | <state> |    N                 |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | Flexi Plan | VIC   | N            |    N         |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | BP2H-EV  | 6305223703 | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | BP2H-GV  | 5321264636 | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType | eleDiscount | gasDiscount | campaign | folderName                               | state | sourceSystem | journey   | AAH | DD | customerType | newOrExisting        |
      | Existing       | BOTH     | 13           | 27          | seniors  | E2E_Campaign_seniors_VIC_existing_moving | VIC   | Quote Tool   | Move Home | No  | No | RES          | Existing  moving |

  @DR22.10.2.campaign
  Scenario Outline: Validate complete data for nsw-Endeavour on seniors campaign - new Moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "1234" and "2516" and clicks on show me plan link
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | Y                     | Y                     | Y                                     | N                               | <state> |N                     |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | GAS      | N                | Y                     | Y                     | Y                                     | N                               | <state> |N                     |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | Flexi Plan | <state> | N            |N             |
    And user clicks on Add plan button
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType |connectionAddress                       |movingType |propertyType |
      |RES          |5 Wilkies Street, BULLI NSW 2516        |Moving     |Renter       |
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|idType        |medicareType |
      |RES         |RES        |New           | test     |test     |Medicare      |blue         |
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
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_variableRates  |Feature_XX_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state  |Feature_moveHomeCredit|
      |ELE      |N                 |N                       |Y                      |Y                                       |N                                |<state>|N                     |
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_variableRates  |Feature_XX_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |state  |Feature_moveHomeCredit|
      |GAS      |N                 |N                       |Y                      |Y                                       |N                                |<state>|N                     |
    And user validates disclaimer on review page for "<campaign>"
      |referencePriceComparison |goNeutral  |solarBuyBack   |signUpCredit |planName   |state    |moveHomeCredit|
      |Y                        |Y          |Y              |N            |Flexi Plan |<state>  |N             |
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
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |BP2H-EN |4311150544|N                             |N                             |Y                      |OTHER                   |EMAIL        |<customerStatus>  |<campaign>|
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|customerStatus    |campaign  |
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |BP2H-GN |5240924834|N                             |N                             |Y                      |GLSMRHAC                |EMAIL        |<customerStatus>  |<campaign>|

    Examples:
      |customerStatus|fuelType|eleDiscount|gasDiscount|campaign |folderName               |sourceSystem|journey   |state  |customerType |newOrExisting  |AAH |DD  |
      |New           |BOTH    |7           |10         |seniors  |E2E_Campaign_NSW_seniors |Quote Tool  |Move Home |NSW    |RES          |New            |No  |No  |

  @DR22.10.2.campaign
  Scenario Outline: Validate complete data for NSW-Ausgrid on seniors campaign - new Moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "1234" and "2144" and clicks on show me plan link
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | Y                     | Y                     | Y                                     | N                               | <state> |N                     |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | GAS      | N                | Y                     | Y                     | Y                                     | N                               | <state> |N                     |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | Flexi Plan | <state> | N            |N             |
    And user clicks on Add plan button
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType |connectionAddress                       |movingType |propertyType |
      |RES          |74 Yillowra Street, AUBURN NSW 2144     |Moving     |Renter       |
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|idType        |medicareType |
      |RES         |RES        |New           | test     |test     |Medicare      |blue         |
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user validates details on checkout details page
      |sourceSystem   |journey    |fuelType   |
      |<sourceSystem> |<journey>  |<fuelType> |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices |GaslifeSupportDevices                             |
      |Yes              |BOTH    |Ele Other              |Medically Required Heating and/or Air Conditioning|
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | N                     | Y                     | Y                                     | N                               | <state> |N                     |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | GAS      | N                | N                     | Y                     | Y                                     | N                               | <state> |N                     |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | Flexi Plan | <state> | N            |N             |
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
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |BP2H-EN |4102681649|N                             |N                             |Y                      |OTHER                   |EMAIL        |<customerStatus>  |<campaign>|
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|customerStatus    |campaign  |
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |BP2H-GN |5240524910|N                             |N                             |Y                      |GLSMRHAC                |EMAIL        |<customerStatus>  |<campaign>|

    Examples:
      |customerStatus|fuelType|eleDiscount|gasDiscount|campaign |folderName                       |sourceSystem|journey   |state  |customerType |newOrExisting  |AAH |DD  |
      |New           |BOTH    |7           |10         |seniors  |E2E_Campaign_NSW_seniors_Ausgrid |Quote Tool  |Move Home |NSW    |RES          |New            |No  |No  |

  @DR22.10.2.campaign
  Scenario Outline: Validate complete data for NSW-Essential on seniors campaign - Moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "1234" and "2700" and clicks on show me plan link
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | Y                     | Y                     | Y                                     | N                               | <state> |N                     |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | GAS      | N                | Y                     | Y                     | Y                                     | N                               | <state> |N                     |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | Flexi Plan | <state> | N            |N             |
    And user clicks on Add plan button
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType |connectionAddress                       |movingType |propertyType |
      |RES          |16 King Street, NARRANDERA NSW 2700     |Moving     |Renter       |
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|idType        |medicareType |
      |RES         |RES        |New           | test     |test     |Medicare      |blue         |
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user validates details on checkout details page
      |sourceSystem   |journey    |fuelType   |
      |<sourceSystem> |<journey>  |<fuelType> |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | N                     | Y                     | Y                                     | N                               | <state> |N                     |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | GAS      | N                | N                     | Y                     | Y                                     | N                               | <state> |N                     |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | Flexi Plan | <state> | N            |N             |
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
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |BP2H-EN |4204224763|N                             |N                             |N                      |OTHER                   |EMAIL        |<customerStatus>  |<campaign>|
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|customerStatus    |campaign  |
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |BP2H-GN |5240575116|N                             |N                             |N                      |GLSMRHAC                |EMAIL        |<customerStatus>  |<campaign>|

    Examples:
      |customerStatus|fuelType|eleDiscount|gasDiscount|campaign  |folderName                         |sourceSystem|journey   |state  |customerType |newOrExisting  |AAH |DD  |
      |New           |BOTH    |7          |10         |seniors   |E2E_Campaign_NSW_seniors_Essential |Quote Tool  |Move Home |NSW    |RES          |New            |No  |No  |

  @DR22.10.2.campaign
  Scenario Outline: Validate complete data for NSW-Essential on seniors campaign for new Non-Moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "1234" and "2700" and clicks on show me plan link
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | Y                     | Y                     | Y                                     | N                               | <state> |N                     |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | GAS      | N                | Y                     | Y                     | Y                                     | N                               | <state> |N                     |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | Flexi Plan | <state> | N            |N             |
    And user clicks on Add plan button
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType |connectionAddress                       |movingType |propertyType |
      |RES          |16 King Street, NARRANDERA NSW 2700     |Non-Moving |Renter       |
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|idType        |medicareType |
      |RES         |RES        |New           | test     |test     |Medicare      |blue         |
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user validates details on checkout details page
      |sourceSystem   |journey    |fuelType   |
      |<sourceSystem> |<journey>  |<fuelType> |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | N                     | Y                     | Y                                     | N                               | <state> |N                     |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | GAS      | N                | N                     | Y                     | Y                                     | N                               | <state> |N                     |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | Flexi Plan | <state> | N            |N             |
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
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |COR      |BP2H-EN |4204224763|N                             |N                             |N                      |OTHER                   |EMAIL        |<customerStatus>  |<campaign>|
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|customerStatus    |campaign  |
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |COR      |BP2H-GN |5240575116|N                             |N                             |N                      |GLSMRHAC                |EMAIL        |<customerStatus>  |<campaign>|

    Examples:
      |customerStatus|fuelType|eleDiscount|gasDiscount|campaign |folderName                         |sourceSystem|journey   |state  |customerType |newOrExisting  |AAH |DD  |
      |New           |BOTH    |7           |10         |seniors  |E2E_Campaign_NSW_seniors_Essential |Quote Tool  | COR      |NSW    |RES          |New            |No  |No  |

  @DR22.10.2.campaign
  Scenario Outline: Validate complete data for seniors campaign for NSW-Endeavour existing moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "1234" and "2516" and clicks on show me plan link
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | Y                     | Y                     | Y                                     | N                               | <state> |N                     |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | GAS      | N                | Y                     | Y                     | Y                                     | N                               | <state> |N                     |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | Flexi Plan | <state> | N            |N             |
    And user clicks on Add plan button
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      | customerStatus   | accountNumber | accountIdentityType | postcodeOrABNACN | idType | idValue  |
      | <customerStatus> | 6942134043    | Postcode            | 2529             | dob    | 01011980 |
    And user provides all other details on qualifier page for Existing customer
      | customerType | connectionAddress                      | movingType | propertyType |
      | RES          |10 Norfolk Crescent, SHELL COVE NSW 2529| Moving     | Renter       |
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
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | N                     | Y                     | Y                                     | N                               | <state> |    N                 |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | GAS      | N                | N                     | Y                     | Y                                     | N                               | <state> |    N                 |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | Flexi Plan | NSW   | N            |    N         |
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
      | fuelType | quoteStatus      | customerType | offerType| planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | BP2H-EN  | 4310882164 | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | ENE        | BP2H-GN  |           | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType | eleDiscount | gasDiscount | campaign | folderName                                 | state | sourceSystem | journey   | AAH | DD | customerType | newOrExisting        |
      | Existing       | BOTH     | 7           | 10          | seniors  | E2E_Campaign_seniors_NSW_ex_End_non-moving | NSW   | Quote Tool   | Move Home | No  | No | RES          | Existing  non-moving |

  @DR22.10.2.campaign
  Scenario Outline: Validate complete data for seniors campaign for QLD - new moving customer
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "1234" and "4558" and clicks on show me plan link
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | Y                     | Y                     | Y                                     | N                               | <state> |N                     |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | Flexi Plan | <state> | N            |N             |
    And user clicks on Select plan button
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
      | ELE      | N                | Y                     | Y                     | Y                                     | <state> |    N                 |
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
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | N                     | Y                     | Y                                     | N                               | <state> |N                     |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | Flexi Plan | <state> | N            |N             |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | BP2H-EQ  | QB08556016 | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType| eleDiscount | gasDiscount | campaign| folderName                         | state | sourceSystem | journey   | AAH | DD | customerType | newOrExisting |
      | New            | ELE     | 2          | 0           | seniors | E2E_Campaign_seniors_QLD_new_moving | QLD   | Quote Tool   | Move Home | No  | No | RES          | New           |

  @DR22.10.2.campaign
  Scenario Outline: Validate complete data for seniors campaign for QLD - new non-moving customer
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "1234" and "4558" and clicks on show me plan link
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | Y                     | Y                     | Y                                     | N                               | <state> |N                     |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | Flexi Plan | <state> | N            |N             |
    And user clicks on Select plan button
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
      | ELE      | N                | Y                     | Y                     | Y                                     | <state> |    N                 |
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                  | movingType | propertyType |
      | RES          | 36 Cypress Street, KULUIN QLD 4558 | Non-Moving | Renter       |
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
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | N                     | Y                     | Y                                     | N                               | <state> |N                     |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | Flexi Plan | <state> | N            |N             |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | COR       | BP2H-EQ  | QB08556016 | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType| eleDiscount | gasDiscount | campaign| folderName                          | state | sourceSystem | journey  | AAH | DD | customerType | newOrExisting |
      | New            | ELE     | 2          | 0           | seniors | E2E_Campaign_seniors_QLD_new_nonmoving | QLD   | Quote Tool   | COR      | No  | No | RES          | New           |

  @DR22.10.2.campaign
  Scenario Outline: Validate complete data for seniors campaign for QLD - existing non-moving customer
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "1234" and "4558" and clicks on show me plan link
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | Y                     | Y                     | Y                                     | N                               | <state> |N                     |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | Flexi Plan | <state> | N            |N             |
    And user clicks on Select plan button
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | state   |Feature_moveHomeCredit|
      | ELE      | N                | Y                     | Y                     | Y                                     | <state> |    N                 |
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      | customerStatus   | accountNumber | accountIdentityType | postcodeOrABNACN | idType | idValue   |
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
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |Feature_moveHomeCredit|
      | ELE      | N                | N                     | Y                     | Y                                     | N                               | <state> |    N                 |
     And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit |moveHomeCredit|
      | Y                        | Y         | Y            | Flexi Plan | <state> | N            |    N         |
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
      | fuelType | quoteStatus      | customerType | offerType| planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | PS       | BP2H-EQ  | 3114744490 | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> |
    Examples:
      | customerStatus | fuelType | eleDiscount | gasDiscount | campaign | folderName                                  | state | sourceSystem | journey     | AAH | DD | customerType | newOrExisting        |
      | Existing       | ELE      | 2          | 0           | seniors  | E2E_Campaign_seniors_QLD_existing_non-moving | QLD   | Quote Tool   | Plan Switch | No  | No | RES          | Existing  non-moving |

