
Feature:E2E scenario for basic-home residential plans page

  Scenario Outline: Validate complete data for basic-home residential plans page for NSW new non moving
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    And user enters '2000' in 'POSTCODE' field
    And user validates the data on 'Residential' plans page for "basicHome-ResidentialPage"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | state | Feature_noStandardConnectionFee |
      | BOTH      | N                | Y                     | Y                    | NSW   | N                               |
#    And user validates the data on plans page for "<campaign>"
#      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | state | Feature_noStandardConnectionFee |
#      | GAS      | N                | Y                     | N                    | NSW   | N                               |
#    And user validates disclaimer on plans page for "<campaign>"
#      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state |signUpCredit|
#      | Y                        | Y         | Y            | Basic Home | NSW   |N           |
#    Then user validates details on plans page for 'RES'
#    When user selects 'Basic Home'
#    And user moves on to fill the qualifier
#
#    And user clicks on Add plan button
#    And user validates plan details on cart page for "<campaign>"
#      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | Feature_discountOffTotalEnergyBill |state|
#      | ELE      | N                | Y                     | Y                    | N                                  |<state>|
#    And user validates plan details on cart page for "<campaign>"
#      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | Feature_discountOffTotalEnergyBill |state|
#      | GAS      | N                | Y                     | N                    | N                                  |<state>|
#    And user selects '<customerStatus>' on qualifier
#    And user provides all other details on qualifier page
#      | customerType | connectionAddress                   | movingType | propertyType |
#      | RES          | 74 Yillowra Street, AUBURN NSW 2144 | Non-Moving | Renter       |
#    And user provides all details on checkout details page
#      | customerType | journey | customerStatus | firstName | lastName | idType         |
#      | RES          | RES     | New            | test      | test     | Driver License |
#    And user selects mailing address option
#      |addressType       |otherAddress                              |
#      |Connection Address|                                          |
#    And user validates details on checkout details page
#      | sourceSystem   | journey   | fuelType   |
#      | <sourceSystem> | <journey> | <fuelType> |
#    And user opts for AAH and DD
#      | optAAHOption | optDDOption | directDebitType |
#      | <AAH>        | <DD>        | Bank            |
#    And user clicks on 'Review your order' button and navigates to review page
#    And user validates details on checkout review page
#      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
#      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
#    And user provides life support details on review page
#      | lifeSupportOption | fuelType | EleclifeSupportDevices                         | GaslifeSupportDevices |
#      | Yes               | BOTH     | Crigler Najjar Syndrome Phototherapy Equipment | Gas Other             |
#    And user verifies selected plan details for '<fuelType>'
#    And user selects carbon neutral option
#    And user validates plan details on review page for "<campaign>"
#      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | Feature_noStandardConnectionFee |state|
#      | ELE      | N                | N                     | Y                    | N                               |<state>|
#    And user validates plan details on review page for "<campaign>"
#      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | Feature_discountOffTotalEnergyBill |state|
#      | GAS      | N                | N                     | N                    | N                                  |<state>|
#    And user validates disclaimer on review page for "<campaign>"
#      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state |signUpCredit|
#      | Y                        | Y         | Y            | Basic Home | NSW   |N           |
#    And user submits the quote
#    Then user lands on checkout complete page
#    And user validates details on checkout complete page
#      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
#      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
#    When user has opened the qt2 Reporting website link in a browser
#    And user logs in to qt2 reporting
#    And user search quote on the basis of 'Email'
#    Then submitted quote is displayed
#    And user validates all the details for 'ELE' submitted quote
#    And user validates below mandatory fields
#      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType |customerStatus    |campaign  |
#      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | COR       | RSOT-EN  | 4102681649 | N                              | N                              | Y                       | LSCNSPE                  | EMAIL         |<customerStatus>  |<campaign>|
#    And user validates all the details for 'GAS' submitted quote
#    And user validates below mandatory fields
#      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType |customerStatus    |campaign  |
#      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | COR       | RSOT-GN  | 5240524910 | N                              | N                              | Y                       | OTHER                    | EMAIL         |<customerStatus>  |<campaign>|

    Examples:
      | customerStatus | fuelType | eleDiscount | gasDiscount | campaign   | folderName                               | state | sourceSystem | journey | AAH | DD | customerType | newOrExisting |
      | New            | BOTH     | No          | No          | basic-home | E2E_basicHome_residentialCampaignTest_new_nonmoving_NSW | NSW   | Quote Tool   | COR     | No  | No | RES          | New           |

  Scenario Outline: Validate complete data for basic-home residential plans page for ACT for new moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "2615" for postcode and proceed to view the plans
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | state | Feature_noStandardConnectionFee |
      | ELE      | Y                | Y                     | Y                    | ACT   | N                               |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | state | Feature_noStandardConnectionFee |
      | GAS      | Y                | Y                     | N                    | ACT   | N                               |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state |signUpCredit|
      | Y                        | Y         | Y            | Basic Home | ACT   |Y           |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | Feature_discountOffTotalEnergyBill |state|
      | ELE      | Y                | Y                     | Y                    | N                                  |<state>|
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | Feature_discountOffTotalEnergyBill |state|
      | GAS      | Y                | Y                     | N                    | N                                  |<state>|
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                         | movingType | propertyType |
      | RES          | 126 Shakespeare Crescent, FRASER ACT 2615 | Moving     | Renter       |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType         | medicareType |
      | RES          | RES     | New            | test      | test     | Driver License |              |
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user verifies selected plan details for '<fuelType>'
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee |state|
      | ELE      | Y                | N                     | Y                    | N                                  | N                               |<state>|
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee |state|
      | GAS      | Y                | N                     | N                    | N                                  | N                               |<state>|
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state |signUpCredit|
      | Y                        | Y         | Y            | Basic Home | ACT   |Y           |
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
      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType |customerStatus    |campaign  |
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | RSOT-EA  | 7001068488 |                                |                                | N                       |                          | EMAIL         |<customerStatus>  |<campaign>|
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType |customerStatus    |campaign  |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | RSOT-GA  | 5261512002 |                                |                                | N                       |                          | EMAIL         |<customerStatus>  |<campaign>|

    Examples:
      | customerStatus | fuelType | eleDiscount | gasDiscount | campaign   | folderName                            | state | sourceSystem | journey   | AAH | DD | customerType | newOrExisting |
      | New            | BOTH     | No          | No          | basic-home | E2E_Campaign_basicHome_new_moving_ACT | ACT   | Quote Tool   | Move Home | No  | No | RES          | New           |

  Scenario Outline: Validate complete data for basic-home residential plans page for SA for new moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "5076" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | state | Feature_noStandardConnectionFee |
      | ELE      | N                | Y                     | Y                    | SA    | N                               |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | state | Feature_noStandardConnectionFee |
      | GAS      | N                | Y                     | N                    | SA    | N                               |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state |signUpCredit|
      | Y                        | Y         | Y            | Basic Home | SA    |N           |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | Feature_discountOffTotalEnergyBill |state|
      | ELE      | N                | Y                     | Y                    | N                                  |<state>|
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | Feature_discountOffTotalEnergyBill |state|
      | GAS      | N                | Y                     | N                    | N                                  |<state>|
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                 | movingType | propertyType |
      | RES          | 3 River Drive, ATHELSTONE SA 5076 | Moving     | Renter       |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType         | medicareType |
      | RES          | RES     | New            | test      | test     | Driver License |              |
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices                         | GaslifeSupportDevices |
      | Yes               | ELE      | Crigler Najjar Syndrome Phototherapy Equipment |                       |
    And user verifies selected plan details for '<fuelType>'
    And user opts in for Carbon Neutral
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee |state|
      | ELE      | N                | N                     | Y                    | N                                  | N                               |<state>|
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee |state|
      | GAS      | N                | N                     | N                    | N                                  | N                               |<state>|
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state |signUpCredit|
      | Y                        | Y         | Y            | Basic Home | SA    |N           |
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
      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType |customerStatus    |campaign  |
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | RSOT-ES  | 2001245279 |                                |                                | Y                       | LSCNSPE                  | EMAIL         |<customerStatus>  |<campaign>|
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType |customerStatus    |campaign  |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | RSOT-GS  | 5510149276 |                                |                                | N                       |                          | EMAIL         |<customerStatus>  |<campaign>|

    Examples:
      | customerStatus | fuelType | eleDiscount | gasDiscount | campaign   | folderName                           | state | sourceSystem | journey   | AAH | DD | customerType | newOrExisting |
      | New            | BOTH     | No          | No          | basic-home | E2E_Campaign_basicHome_new_moving_SA | SA    | Quote Tool   | Move Home | No  | No | RES          | New           |

  Scenario Outline: Validate complete data for basic-home residential plans page for QLD
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "4208" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | state | Feature_noStandardConnectionFee |
      | ELE      | N                | Y                     | Y                    | QLD   | N                               |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state |signUpCredit|
      | Y                        | Y         | Y            | Basic Home | QLD   |N           |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | Feature_discountOffTotalEnergyBill |state|
      | ELE      | N                | Y                     | Y                    | N                                  |<state>|
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                     | movingType | propertyType |
      | RES          | 13 Jacobs Ridge Road, ORMEAU QLD 4208 | Moving     | Renter       |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType         | medicareType |
      | RES          | RES     | New            | test      | test     | Driver License |              |
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user verifies selected plan details for '<fuelType>'
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee |state|
      | ELE      | N                | N                     | Y                    | N                                  | N                               |<state>|
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state |signUpCredit|
      | Y                        | Y         | Y            | Basic Home | QLD   |N           |
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
      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType |customerStatus    |campaign  |
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | GRT-EQ   | 3115863522 |                                |                                | N                       |                          | EMAIL         |<customerStatus>  |<campaign>|

    Examples:
      | customerStatus | fuelType | eleDiscount | campaign   | folderName                 | state | sourceSystem | journey   | AAH | DD | customerType | newOrExisting |
      | New            | ELE      | No          | basic-home | E2E_Campaign_basicHome_QLD | QLD   | Quote Tool   | Move Home | No  | No | RES          | New           |
