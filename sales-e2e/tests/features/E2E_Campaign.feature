
Feature:E2E scenario for offer campaign

  @test
  Scenario Outline: Validate complete data for offer campaign for NSW
    Given user has opened the '<campaign>' link in a browser and creates 'E2E_Campaign_Offer_NSW' to save evidences
    When user provides "2000" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates "ELE" discount to be "16" percent
    And user validates "GAS" discount to be "16" percent
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

    Examples:
      |customerStatus|fuelType|campaign  |folderName         |state|username|password                                    |
      |New           |BOTH    |Offer     |E2E_New_Resi_Moving|NSW  |abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

  @test
  Scenario Outline: Validate complete data for offer campaign for ACT
    Given user has opened the '<campaign>' link in a browser and creates 'E2E_Campaign_Offer_ACT' to save evidences
    When user provides "2600" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates "ELE" discount to be "9" percent
    And user validates "GAS" discount to be "9" percent
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

    Examples:
      |customerStatus|fuelType|campaign  |folderName         |state|username|password                                    |
      |New           |BOTH    |Offer     |E2E_New_Resi_Moving|NSW  |abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

  @test
  Scenario Outline: Validate complete data for offer campaign for VIC
    Given user has opened the '<campaign>' link in a browser and creates 'E2E_Campaign_Offer_VIC' to save evidences
    When user provides "3000" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates "ELE" discount to be "9" percent
    And user validates "GAS" discount to be "27" percent
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

    Examples:
      |customerStatus|fuelType|campaign  |folderName         |state|username|password                                    |
      |New           |BOTH    |Offer     |E2E_New_Resi_Moving|NSW  |abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

  @test
  Scenario Outline: Validate complete data for offer campaign for QLD
    Given user has opened the '<campaign>' link in a browser and creates 'E2E_Campaign_Offer_QLD' to save evidences
    When user provides "4000" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates "ELE" discount to be "14" percent
    And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |ELE      |Y                 |Y                       |Y                    |N                                    |Y                                |
    And user clicks on Add plan button
    And user validates plan details on cart page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |
      |ELE      |Y                 |Y                       |N                    |N                                    |

    Examples:
      |customerStatus|fuelType|campaign  |folderName         |state|username|password                                    |
      |New           |BOTH    |Offer     |E2E_New_Resi_Moving|NSW  |abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

  @test
  Scenario Outline: Validate complete data for offer campaign for SA
    Given user has opened the '<campaign>' link in a browser and creates 'E2E_Campaign_Offer_SA' to save evidences
    When user provides "5000" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates "ELE" discount to be "6" percent
    And user validates "GAS" discount to be "15" percent
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

    Examples:
      |customerStatus|fuelType|campaign  |folderName         |state|username|password                                    |
      |New           |BOTH    |Offer     |E2E_New_Resi_Moving|NSW  |abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|
