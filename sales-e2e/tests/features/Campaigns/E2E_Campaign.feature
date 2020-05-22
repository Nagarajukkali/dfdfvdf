#@E2E
Feature:E2E scenario for offer campaign

  Scenario Outline: Validate complete data for offer campaign for NSW
    Given user has opened the '<campaign>' link in a browser and creates 'E2E_Campaign_Offer_NSW' to save evidences
    When user provides "2000" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |ELE      |Y                 |Y                       |Y                    |Y                                    |N                                |
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |GAS      |Y                 |Y                       |Y                    |Y                                    |N                                |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |
      |ELE      |Y                 |Y                       |N                    |Y                                    |
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |
      |GAS      |Y                 |Y                       |N                    |Y                                    |
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType |connectionAddress                      |movingType |propertyType |solarOption  |
      |RES          |8 Wenden Avenue, NEWINGTON NSW 2127    |Moving     |Renter       |No           |
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus |firstName  |lastName |idType         |medicareType |
      |RES          |RES        |New            |test       |test     |Driver License |             |
    And user selects answer for property renovation question for '<state>'
    And user opts in for Carbon Neutral
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType |EleclifeSupportDevices    |GaslifeSupportDevices  |
      |No               |         |                          |                       |
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |ELE      |Y                 |Y                       |N                    |Y                                    |N                                |
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |GAS      |Y                 |Y                       |N                    |Y                                    |N                                |

    Examples:
      |customerStatus |campaign  |state  |eleDiscount |gasDiscount  |username |password                                    |
      |New            |Offer     |NSW    |16          |16           |abhar    |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

  Scenario Outline: Validate complete data for offer campaign for ACT
    Given user has opened the '<campaign>' link in a browser and creates 'E2E_Campaign_Offer_ACT' to save evidences
    When user provides "2600" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |ELE      |N                 |Y                       |Y                    |Y                                    |N                                |
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |GAS      |N                 |Y                       |Y                    |Y                                    |N                                |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |
      |ELE      |N                 |Y                       |Y                    |Y                                    |
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |
      |GAS      |N                 |Y                       |Y                    |Y                                    |
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType |connectionAddress                    |movingType |propertyType |solarOption  |
      |RES          |138 Narden Street, CRACE ACT 2911    |Moving     |Renter       |No           |
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus |firstName  |lastName |idType         |medicareType |
      |RES          |RES        |New            |test       |test     |Driver License |             |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType |EleclifeSupportDevices    |GaslifeSupportDevices  |
      |No               |         |                          |                       |
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |ELE      |N                 |N                       |Y                    |Y                                    |N                                |
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |GAS      |N                 |N                       |Y                    |Y                                    |N                                |

    Examples:
      |customerStatus |campaign  |state  |eleDiscount |gasDiscount  |username |password                                    |
      |New            |Offer     |ACT    |9           |9            |abhar    |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

  Scenario Outline: Validate complete data for offer campaign for VIC
    Given user has opened the '<campaign>' link in a browser and creates 'E2E_Campaign_Offer_VIC' to save evidences
    When user provides "3000" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |ELE      |Y                 |Y                       |Y                    |Y                                    |N                                |
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |GAS      |N                 |Y                       |Y                    |Y                                    |N                                |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |
      |ELE      |Y                 |Y                       |N                    |Y                                    |
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |
      |GAS      |Y                 |Y                       |N                    |Y                                    |
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType |connectionAddress                        |movingType |propertyType |solarOption  |
      |RES          |21 Eltham Street, FLEMINGTON VIC 3031    |Moving     |Renter       |No           |
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus |firstName  |lastName |idType         |medicareType |
      |RES          |RES        |New            |test       |test     |Driver License |             |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType |EleclifeSupportDevices    |GaslifeSupportDevices  |
      |No               |         |                          |                       |
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |ELE      |Y                 |N                       |N                    |Y                                    |N                                |
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |GAS      |Y                 |N                       |N                    |Y                                    |N                                |

    Examples:
      |customerStatus |campaign  |state  |eleDiscount |gasDiscount  |username |password                                    |
      |New            |Offer     |VIC    |9           |27           |abhar    |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

  Scenario Outline: Validate complete data for offer campaign for QLD
    Given user has opened the '<campaign>' link in a browser and creates 'E2E_Campaign_Offer_QLD' to save evidences
    When user provides "4000" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |ELE      |Y                 |Y                       |Y                    |N                                    |Y                                |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |
      |ELE      |Y                 |Y                       |N                    |N                                    |
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType |connectionAddress                        |movingType |propertyType |solarOption  |
      |RES          |90 Coach Road West, MORAYFIELD QLD 4506  |Moving     |Renter       |No           |
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus |firstName  |lastName |idType         |medicareType |
      |RES          |RES        |New            |test       |test     |Driver License |             |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType |EleclifeSupportDevices    |GaslifeSupportDevices  |
      |No               |         |                          |                       |
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |ELE      |N                 |N                       |N                    |N                                    |Y                                |

    Examples:
      |customerStatus |campaign  |state  |eleDiscount |username |password                                    |
      |New            |Offer     |QLD    |14          |abhar    |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

  Scenario Outline: Validate complete data for offer campaign for SA
    Given user has opened the '<campaign>' link in a browser and creates 'E2E_Campaign_Offer_SA' to save evidences
    When user provides "5000" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates "ELE" discount to be "<eleDiscount>" percent
    And user validates "GAS" discount to be "<gasDiscount>" percent
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |ELE      |N                 |Y                       |Y                    |Y                                    |N                                |
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |GAS      |N                 |Y                       |Y                    |Y                                    |N                                |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |
      |ELE      |N                 |Y                       |Y                    |Y                                    |
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |
      |GAS      |N                 |Y                       |Y                    |Y                                    |
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType |connectionAddress                      |movingType |propertyType |solarOption  |
      |RES          |6 Kipling Avenue, GLENGOWRIE SA 5044   |Moving     |Renter       |No           |
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus |firstName  |lastName |idType         |medicareType |
      |RES          |RES        |New            |test       |test     |Driver License |             |
    And user selects answer for property renovation question for '<state>'
    And user opts in for Carbon Neutral
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType |EleclifeSupportDevices    |GaslifeSupportDevices  |
      |No               |         |                          |                       |
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |ELE      |N                 |Y                       |Y                    |Y                                    |N                                |
    And user validates plan details on review page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |GAS      |N                 |Y                       |Y                    |Y                                    |N                                |

    Examples:
      |customerStatus |campaign  |state  |eleDiscount |gasDiscount  |username |password                                    |
      |New            |Offer     |SA     |6           |15           |abhar    |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|
