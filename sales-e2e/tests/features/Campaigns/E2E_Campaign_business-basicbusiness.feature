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

Feature:E2E scenario for basic business campaign

  @DR21.9.3.campaign
  Scenario Outline: Validate complete data for basic-business campaign for NSW-Ausgrid new non moving
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "2144" and clicks on show me plan link
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | state | Feature_noStandardConnectionFee |
      | ELE      | N                | N                     | Y                    | NSW   | N                               |
    And user validates the data on plans page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | state | Feature_noStandardConnectionFee |
      | GAS      | N                | N                     | N                    | NSW   | N                               |
    And user validates disclaimer on plans page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName       | state | signUpCredit |
      | N                        | N         | N            | Basic Business | NSW   | N            |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | Feature_discountOffTotalEnergyBill | state   |
      | ELE      | N                | N                     | Y                    | N                                  | <state> |
    And user validates plan details on cart page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | Feature_discountOffTotalEnergyBill | state   |
      | GAS      | N                | N                     | N                    | N                                  | <state> |
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
      | lifeSupportOption | fuelType | EleclifeSupportDevices                         | GaslifeSupportDevices |
      | Yes               | BOTH     | Crigler Najjar Syndrome Phototherapy Equipment | Gas Other             |
    And user verifies selected plan details for '<fuelType>'
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | Feature_noStandardConnectionFee | state   |
      | ELE      | N                | N                     | Y                    | N                               | <state> |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | Feature_discountOffTotalEnergyBill | state   |
      | GAS      | N                | N                     | N                    | N                                  | <state> |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName       | state | signUpCredit |
      | N                        | N         | N            | Basic Business | NSW   | N            |
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
      | ELE      | VERBALLYACCEPTED | BUSINESS     | PS       | BSOT-EN  |     | N                              | N                              | Y                       | LSCNSPE                  | EMAIL         | <customerStatus> | <campaign> |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
      | GAS      | VERBALLYACCEPTED | BUSINESS     | PS       | BSOT-GN  | 5247073457 | N                              | N                              | Y                       | OTHER                    | EMAIL         | <customerStatus> | <campaign> |

    Examples:
      | customerStatus | fuelType | eleDiscount | gasDiscount | campaign               | folderName                                   | state | sourceSystem | journey | AAH | DD | customerType | newOrExisting |
      | New            | BOTH     | No          | No          | business-basicbusiness | E2E_Campaign_basicBusiness_new_nonmoving_NSW | NSW   | Quote Tool   | COR     | No  | No | BUS          | New           |


    @DR21.9.3.campaign
    Scenario Outline: Validate complete data for basic-business campaign for VIC new non moving
      Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
      When user provides "3355" and clicks on show me plan link
      And user validates the data on plans page for "<campaign>"
        | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | state | Feature_noStandardConnectionFee |
        | ELE      | N                | N                     | Y                    | VIC   | N                               |
      And user validates the data on plans page for "<campaign>"
        | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | state | Feature_noStandardConnectionFee |
        | GAS      | N                | N                     | N                    | VIC   | N                               |
      And user validates disclaimer on plans page for "<campaign>"
        | referencePriceComparison | goNeutral | solarBuyBack | planName       | state | signUpCredit |
        | N                        | N         | Y            | Basic Business | VIC   | N            |
      And user clicks on Add plan button
      And user validates plan details on cart page for "<campaign>"
        | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | Feature_discountOffTotalEnergyBill | state   |
        | ELE      | N                | N                     | Y                    | N                                  | <state> |
      And user validates plan details on cart page for "<campaign>"
        | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | Feature_discountOffTotalEnergyBill | state   |
        | GAS      | N                | N                     | N                    | N                                  | <state> |
      And user selects '<customerStatus>' on qualifier
      And user provides all other details on qualifier page
        | customerType | connectionAddress                   | movingType | propertyType |
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
#      And user selects answer for property renovation question for '<state>'
      And user clicks on 'Review your order' button and navigates to review page
      And user validates details on checkout review page
        | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
        | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
      And user provides life support details on review page
        | lifeSupportOption | fuelType | EleclifeSupportDevices                         | GaslifeSupportDevices |
        | Yes               | BOTH     | Crigler Najjar Syndrome Phototherapy Equipment | Gas Other             |
      And user verifies selected plan details for '<fuelType>'
      And user validates plan details on review page for "<campaign>"
        | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | Feature_noStandardConnectionFee | state   |
        | ELE      | N                | N                     | Y                    | N                               | <state> |
      And user validates plan details on review page for "<campaign>"
        | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_defaultOffer | Feature_discountOffTotalEnergyBill | state   |
        | GAS      | N                | N                     | N                    | N                                  | <state> |
      And user validates disclaimer on review page for "<campaign>"
        | referencePriceComparison | goNeutral | solarBuyBack | planName       | state | signUpCredit |
        | N                        | N         |   N          | Basic Business | VIC   | N            |
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
        | ELE      | VERBALLYACCEPTED | BUSINESS     | PS       | BSOT-EV  | 6203822385    | N                              | N                              | Y                       | LSCNSPE                  | EMAIL         | <customerStatus> | <campaign> |
      And user validates all the details for 'GAS' submitted quote
      And user validates below mandatory fields
        | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType | customerStatus   | campaign   |
        | GAS      | VERBALLYACCEPTED | BUSINESS     | PS       | BSOT-GV  | 5330956738 | N                              | N                              | Y                       | OTHER                    | EMAIL         | <customerStatus> | <campaign> |

      Examples:
        | customerStatus | fuelType | eleDiscount | gasDiscount | campaign               | folderName                                   | state | sourceSystem | journey | AAH | DD | customerType | newOrExisting |
        | New            | BOTH     | No          | No          | business-basicbusiness | E2E_Campaign_basicBusiness_new_nonmoving_VIC| VIC   | Quote Tool   | COR     | No  | No | BUS          | New           |
