@repricePVTSanity
  #For any reprice changes:
# 1. Update EstimatedCost_PVT_Test_Data file if you want to validate estimated cost scenario in this path sales-e2e/resources/Reprice_Data/
# 2. For running the test on non-prod environment, remove PVT from th scenario outline.
# 3. If the scenario outline containing PVT, the test will run on production URL

Feature: This feature is to perform a Sanity check on the sales submission journey after reprice release

  Scenario Outline: PVT - Validate complete data for residential-Flexi-plan for VIC - new non-moving
    Given user has opened the 'residential-home-page' link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    And user enters '3000' in 'POSTCODE' field
    And user validates "ELE" discount to be "<eleDiscount>" percent for "<planName>" plan
    And user validates "GAS" discount to be "<gasDiscount>" percent for "<planName>" plan
    And user validates the data on 'Residential' plans page for "<campaign>" plan
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit | planName   |
      | BOTH     | N                | Y                     | N                   | Y                     | Y                                     | N                               | <state> | N                      | <planName> |
    And user validates disclaimer on plans page for "<campaign>" plan
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit | moveHomeCredit |
      | Y                        | Y         | Y            | <planName> | <state> | N            | N              |
    When user selects '<planName>'
    And user validates the data on carts page for "<campaign>" plan
      | fuelType | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | state   | Feature_50Credit |
      | ELE      | Y                     | Y                     | Y                                     | <state> | N                |
    And user validates the data on carts page for "<campaign>" plan
      | fuelType | Feature_carbonNeutral | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | state   | Feature_50Credit |
      | GAS      | Y                     | Y                     | Y                                     | <state> | N                |
    And user moves on to fill the qualifier
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
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit |
      | ELE      | N                | N                     | N                   | Y                     | Y                                     | N                               | <state> | N                      |
    And user validates plan details on review page for "<campaign>"
      | fuelType | Feature_50Credit | Feature_carbonNeutral | Feature_peaceOfMind | Feature_variableRates | Feature_XX_discountOffTotalEnergyBill | Feature_noStandardConnectionFee | state   | Feature_moveHomeCredit |
      | GAS      | N                | N                     | N                   | Y                     | Y                                     | N                               | <state> | N                      |
    And user validates disclaimer on review page for "<campaign>"
      | referencePriceComparison | goNeutral | solarBuyBack | planName   | state   | signUpCredit | moveHomeCredit |
      | Y                        | Y         | Y            | Flexi Plan | <state> | N            | N              |
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |

    Examples:
      | customerStatus | fuelType | planName   | eleDiscount | gasDiscount | campaign | folderName                             | state | sourceSystem | journey | AAH | DD | customerType | newOrExisting |
      | New            | BOTH     | Flexi Plan | 5           | 12          | flexi    | E2E_resi-flexi-plan_VIC_new_non_moving | VIC   | Quote Tool   | COR     | No  | No | RES          | New           |


