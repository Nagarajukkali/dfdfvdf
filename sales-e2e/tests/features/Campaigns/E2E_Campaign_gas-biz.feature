@campaign21.4.3 @campaign
Feature:E2E scenario for gas-biz campaign

  Scenario Outline: Validate complete data for gas-biz campaign for NSW Ausgrid for new customer
    Given user has opened the '<campaign>' link in a browser and creates 'E2E_Campaign_gas-biz_NSW_Ausgrid' to save evidences
    When user provides "BIZOFFER5" and "2042" and clicks on show me plan link
    Then user is presented with the plans
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |
      | GAS      | Y                | N                     | Y                   | Y                                  | N                               | <state> |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName              | state | signUpCredit |
      | Y                        | N         | Y            | Total Plan - Business | NSW   | Y            |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   |
      | GAS      | Y                | N                     | Y                   | Y                                  | <state> |
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                   | movingType | propertyType | solarOption |
      | BUS          | 73-75 Enmore Road, NEWTOWN NSW 2042 | Moving     | Renter       |             |
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
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |
      | GAS      | Y                | N                     | Y                   | Y                                  | N                               | <state> |
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | BUSINESS     | ENE       | TOPB-GN  | 5247073457 |                                |                                | N                       |                          | EMAIL         | <customerStatus> | <campaign> |

    Examples:
      | customerStatus | fuelType | campaign | state | eleDiscount | gasDiscount |
      | New            | GAS      | gas-biz  | NSW   | 22          | 19          |

  Scenario Outline: Validate complete data for gas-biz campaign for VIC
    Given user has opened the '<campaign>' link in a browser and creates 'E2E_Campaign_gas-biz_VIC' to save evidences
    When user provides "BIZOFFER5" and "3031" and clicks on show me plan link
    Then user is presented with the plans
    And user validates "GAS" discount to be "<gasDiscount>" percent
      | ELE | Y | N | Y | Y | N | <state> |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |
      | GAS      | Y                | N                     | Y                   | Y                                  | N                               | <state> |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName              | state   | signUpCredit |
      | Y                        | N         | Y            | Total Plan - Business | <state> | Y            |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | state   |
      | GAS      | Y                | N                     | Y                   | Y                                  | <state> |
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                          | movingType | propertyType | solarOption |
      | BUS          | 36 Gregory Street West, WENDOUREE VIC 3355 | Moving     | Renter       |             |
    And user provides all details on checkout details page
      | customerType | journey | firstName | lastName | businessType |
      | BUS          | BUS     | test      | test     | ABN          |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    #And user opts in for Carbon Neutral
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   |
      | GAS      | Y                | N                     | Y                   | Y                                  | N                               | <state> |
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | BUSINESS     | ENE       | TOPB-GV  | 5330956738 | N                              | N                              | N                       |                          | EMAIL         | <customerStatus> | <campaign> |

    Examples:
      | customerStatus | fuelType | campaign | state | eleDiscount | gasDiscount |
      | New            | GAS      | gas-biz  | VIC   | 6           | 23          |
