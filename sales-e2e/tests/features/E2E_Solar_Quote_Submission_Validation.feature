@solar
Feature:E2E scenario for validating solar details in QT2 Reporting app on quote submission

  Scenario Outline: Submit a residential quote and validate the solar details for NSW retail offering
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    Then user validates details on plans page for 'RES'
    When user enters the address "61 Cleveland Avenue, CROMER NSW 2099" on plans page
    Then user validates the solar disclaimer on the page
      |solarBuyBack |state    |
      |Y            |<state>  |
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType| connectionAddress                   | movingType|propertyType|
      |RES         | 61 Cleveland Avenue, CROMER NSW 2099|Non-Moving |Renter      |
    And user validates details on checkout details page
      |sourceSystem   |journey    |fuelType   |solarSetup|
      |<sourceSystem> |<journey>  |<fuelType> |Yes       |
    And user validates solar indicator on checkout details page
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|idType        |medicareType |
      |RES         |RES        |New           | test     |test     |Driver License|             |
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user selects "Post" billing preference option
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                        |GaslifeSupportDevices|
      |Yes              |BOTH    |Crigler Najjar Syndrome Phototherapy Equipment|Gas Other            |
    And user verifies selected plan details for '<fuelType>'
    And user validates "single_rate" solar tariff type for "<state>" under electricity rates section
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |PS       |TOPH-EN |4103372290|N                             |N                             |Y                      |LSCNSPE                 |POSTMM       |
    And user validates the solar details
      |fuelType|solarPowerIndicator|solarNetworkTariffCode|solarTimeOfUse|
      |ELE     |Y                  |GENR                  |N             |
    And user validates the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |COR      |TOPH-GN |          |N                             |N                             |Y                      |OTHER                   |POSTMM       |

    Examples:
      |customerStatus|fuelType|planName  |folderName               |state|sourceSystem   |journey     |AAH |DD   |customerType |newOrExisting  |
      |New           |BOTH    |Total Plan|E2E_Resi_Solar_NSW_Retail|NSW  |Quote Tool     |Plan Switch |No  |No   |RES          |New            |

  Scenario Outline: Submit a business quote and validate the solar details for NSW retail offering
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'BUS' plans page
    Then user validates details on plans page for 'BUS'
    When user enters the address "1 Reads Road, WAMBERAL NSW 2260" on plans page
    Then user validates the solar disclaimer on the page
      |solarBuyBack |state    |
      |Y            |<state>  |
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType| connectionAddress              | movingType|propertyType|
      |BUS         | 1 Reads Road, WAMBERAL NSW 2260|Moving     |Renter      |
    And user validates details on checkout details page
      |sourceSystem   |journey    |fuelType   |solarSetup|
      |<sourceSystem> |<journey>  |<fuelType> |Yes       |
    And user validates solar indicator on checkout details page
    And user provides all details on checkout details page
      |customerType|journey    | firstName| lastName|businessType|
      |BUS         |BUS        | test     |test     |ABN         |
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user selects answer for property renovation question for '<state>'
    And user selects "Email" billing preference option
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                        |GaslifeSupportDevices|
      |Yes              |GAS     |Crigler Najjar Syndrome Phototherapy Equipment|Gas Other            |
    And user verifies selected plan details for '<fuelType>'
    And user validates "single_rate" solar tariff type for "<state>" under electricity rates section
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|BUSINESS    |ENE      |TOPB-EN |4103881834|                              |                              |                       |                        |EMAIL       |
    And user validates the solar details
      |fuelType|solarPowerIndicator|solarNetworkTariffCode|solarTimeOfUse|
      |ELE     |Y                  |GENR                  |N             |
    And user validates the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|BUSINESS    |ENE      |TOPB-GN |          |N                             |N                             |Y                      |OTHER                   |EMAIL       |

    Examples:
      |customerStatus|fuelType|planName             |folderName              |state|sourceSystem   |journey   |AAH |DD   |customerType |newOrExisting  |
      |New           |BOTH    |Total Plan - Business|E2E_Bus_Solar_NSW_Retail|NSW  |Quote Tool     |move home |No  |No   |BUS          |New            |

  Scenario Outline: Submit a residential quote and validate the solar details for SA retail offering
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    Then user validates details on plans page for 'RES'
    When user enters the address "1 Alexander Avenue, KLEMZIG SA 5087" on plans page
    Then user validates the solar disclaimer on the page
      |solarBuyBack |state    |
      |Y            |<state>  |
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType| connectionAddress                  | movingType|propertyType|
      |RES         | 1 Alexander Avenue, KLEMZIG SA 5087|Non-Moving |Renter      |
    And user validates details on checkout details page
      |sourceSystem   |journey    |fuelType   |solarSetup|
      |<sourceSystem> |<journey>  |<fuelType> |Yes       |
    And user validates solar indicator on checkout details page
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|idType        |medicareType |
      |RES         |RES        |New           | test     |test     |Driver License|             |
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user selects "Post" billing preference option
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                        |GaslifeSupportDevices|
      |Yes              |BOTH    |Crigler Najjar Syndrome Phototherapy Equipment|Gas Other            |
    And user verifies selected plan details for '<fuelType>'
    And user validates "single_rate" solar tariff type for "<state>" under electricity rates section
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |PS       |TOPH-ES |2001108890|N                             |N                             |Y                      |LSCNSPE                 |POSTMM       |
    And user validates the solar details
      |fuelType|solarPowerIndicator|solarNetworkTariffCode|solarTimeOfUse|
      |ELE     |Y                  |GEN2028S              |N             |
    And user validates the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |PS       |TOPH-GS |5510522799|N                             |N                             |Y                      |OTHER                   |POSTMM       |

    Examples:
      |customerStatus|fuelType|planName  |folderName              |state|sourceSystem   |journey     |AAH |DD   |customerType |newOrExisting  |
      |New           |BOTH    |Total Plan|E2E_Resi_Solar_SA_Retail|SA   |Quote Tool     |Plan Switch |No  |No   |RES          |New            |

  Scenario Outline: Submit a residential quote and validate the solar details for SA government offering
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    Then user validates details on plans page for 'RES'
    When user enters the address "98a Dawkins Road, LEWISTON SA 5501" on plans page
    Then user validates the solar disclaimer on the page
      |solarBuyBack |state    |
      |Y            |<state>  |
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType| connectionAddress                 | movingType|propertyType|
      |RES         | 98a Dawkins Road, LEWISTON SA 5501|Non-Moving |Renter      |
    And user validates details on checkout details page
      |sourceSystem   |journey    |fuelType   |solarSetup|
      |<sourceSystem> |<journey>  |<fuelType> |Yes       |
    And user validates solar indicator on checkout details page
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|idType        |medicareType |
      |RES         |RES        |New           | test     |test     |Driver License|             |
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user selects "Email" billing preference option
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                        |GaslifeSupportDevices|
      |No               |BOTH    |Crigler Najjar Syndrome Phototherapy Equipment|Gas Other            |
    And user verifies selected plan details for '<fuelType>'
    And user validates "single_rate" solar tariff type for "<state>" under electricity rates section
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |PS       |TOPH-ES |2001393411|                              |                              |N                      |                        |EMAIL        |
    And user validates the solar details
      |fuelType|solarPowerIndicator|solarNetworkTariffCode|solarTimeOfUse|
      |ELE     |Y                  |GENR2028S             |N             |

    Examples:
      |customerStatus|fuelType|planName  |folderName            |state|sourceSystem   |journey     |AAH |DD   |customerType |newOrExisting  |
      |New           |ELE     |Total Plan|E2E_Resi_Solar_SA_Govt|SA   |Quote Tool     |Plan Switch |No  |No   |RES          |New            |

  Scenario Outline: Submit a business quote and validate the solar details for SA retail offering
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'BUS' plans page
    Then user validates details on plans page for 'BUS'
    When user enters the address "3 Fisher Street, MYRTLE BANK SA 5064" on plans page
    Then user validates the solar disclaimer on the page
      |solarBuyBack |state    |
      |Y            |<state>  |
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType| connectionAddress                   | movingType|
      |BUS         | 3 Fisher Street, MYRTLE BANK SA 5064|Non-Moving |
    And user validates details on checkout details page
      |sourceSystem   |journey    |fuelType   |solarSetup|
      |<sourceSystem> |<journey>  |<fuelType> |Yes       |
    And user validates solar indicator on checkout details page
    And user provides all details on checkout details page
      |customerType|journey    | firstName| lastName|businessType|
      |BUS         |BUS        | test     |test     |ABN         |
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user selects "Email" billing preference option
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                        |GaslifeSupportDevices|
      |No               |BOTH    |Crigler Najjar Syndrome Phototherapy Equipment|Gas Other            |
    And user verifies selected plan details for '<fuelType>'
    And user validates "single_rate" solar tariff type for "<state>" under electricity rates section
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|BUSINESS    |PS       |TOPB-ES |2001003192|                              |                             |                       |                         |EMAIL       |
    And user validates the solar details
      |fuelType|solarPowerIndicator|solarNetworkTariffCode|solarTimeOfUse|
      |ELE     |Y                  |GENR2016              |N             |
    And user validates the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN     |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|BUSINESS    |PS      |TOPB-GS |5510279400|                              |                             |                       |                         |EMAIL       |

    Examples:
      |customerStatus|fuelType|planName             |folderName             |state|sourceSystem   |journey     |AAH |DD   |customerType |newOrExisting  |
      |New           |BOTH    |Total Plan - Business|E2E_Bus_Solar_SA_Retail|SA   |Quote Tool     |Plan Switch |No  |No   |BUS          |New            |

  Scenario Outline: Submit a residential quote and validate the solar details for ACT retail offering
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    Then user validates details on plans page for 'RES'
    When user enters the address "52 Pademelon Street, THROSBY ACT 2914" on plans page
    Then user validates the solar disclaimer on the page
      |solarBuyBack |state    |
      |Y            |<state>  |
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType| connectionAddress                    | movingType|propertyType|
      |RES         | 52 Pademelon Street, THROSBY ACT 2914|Moving     |Owner       |
    And user validates details on checkout details page
      |sourceSystem   |journey    |fuelType   |solarSetup|
      |<sourceSystem> |<journey>  |<fuelType> |Yes       |
    And user validates solar indicator on checkout details page
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|idType        |medicareType |
      |RES         |RES        |New           | test     |test     |Driver License|             |
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user selects answer for property renovation question for '<state>'
    And user selects "Post" billing preference option
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                        |GaslifeSupportDevices|
      |Yes              |BOTH    |Crigler Najjar Syndrome Phototherapy Equipment|Gas Other            |
    And user verifies selected plan details for '<fuelType>'
    And user validates "single_rate" solar tariff type for "<state>" under electricity rates section
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |TOPH-EA |7001325845|N                             |N                             |Y                      |LSCNSPE                 |POSTMM       |
    And user validates the solar details
      |fuelType|solarPowerIndicator|solarNetworkTariffCode|solarTimeOfUse|
      |ELE     |Y                  |GENR                  |N             |
    And user validates the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |TOPH-GA |5261011996|N                             |N                             |Y                      |OTHER                   |POSTMM       |

    Examples:
      |customerStatus|fuelType|planName  |folderName               |state|sourceSystem   |journey   |AAH |DD   |customerType |newOrExisting  |
      |New           |BOTH    |Total Plan|E2E_Resi_Solar_ACT_Retail|ACT |Quote Tool     |move home |No  |No   |RES          |New            |

  Scenario Outline: Submit a residential quote and validate the solar details for ACT government offering
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    Then user validates details on plans page for 'RES'
    When user enters the address "5 Kitson Place, FLOREY ACT 2615" on plans page
    Then user validates the solar disclaimer on the page
      |solarBuyBack |state    |
      |Y            |<state>  |
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType| connectionAddress              | movingType|propertyType|
      |RES         | 5 Kitson Place, FLOREY ACT 2615|Non-Moving |Owner       |
    And user validates details on checkout details page
      |sourceSystem   |journey    |fuelType   |solarSetup|
      |<sourceSystem> |<journey>  |<fuelType> |Yes       |
    And user validates solar indicator on checkout details page
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|idType        |medicareType |
      |RES         |RES        |New           | test     |test     |Driver License|             |
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user selects "Post" billing preference option
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                        |GaslifeSupportDevices|
      |Yes              |BOTH    |Crigler Najjar Syndrome Phototherapy Equipment|Gas Other            |
    And user verifies selected plan details for '<fuelType>'
    And user validates "single_rate" solar tariff type for "<state>" under electricity rates section
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |PS       |TOPH-EA |7001051092|N                             |N                             |Y                      |LSCNSPE                 |POSTMM       |
    And user validates the solar details
      |fuelType|solarPowerIndicator|solarNetworkTariffCode|solarTimeOfUse|
      |ELE     |Y                  |1999                  |N             |
    And user validates the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |PS       |TOPH-GA |5260039502|N                             |N                             |Y                      |OTHER                   |POSTMM       |

    Examples:
      |customerStatus|fuelType|planName  |folderName             |state|sourceSystem  |journey   |AAH |DD   |customerType |newOrExisting  |
      |New           |BOTH    |Total Plan|E2E_Resi_Solar_ACT_Govt|ACT |Quote Tool     |plan switch |No  |No   |RES          |New            |

  Scenario Outline: Submit a business quote and validate the solar details for ACT government offering
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'BUS' plans page
    Then user validates details on plans page for 'BUS'
    When user enters the address "6 Kultarr Lane, THROSBY ACT 2914" on plans page
    Then user validates the solar disclaimer on the page
      |solarBuyBack |state    |
      |Y            |<state>  |
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType| connectionAddress               | movingType|
      |BUS         | 6 Kultarr Lane, THROSBY ACT 2914|Non-Moving |
    And user validates details on checkout details page
      |sourceSystem   |journey    |fuelType   |solarSetup|
      |<sourceSystem> |<journey>  |<fuelType> |Yes       |
    And user validates solar indicator on checkout details page
    And user provides all details on checkout details page
      |customerType|journey    | firstName| lastName|businessType|
      |BUS         |BUS        | test     |test     |ACN         |
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user selects "Email" billing preference option
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                        |GaslifeSupportDevices|
      |No               |BOTH    |Crigler Najjar Syndrome Phototherapy Equipment|Gas Other            |
    And user verifies selected plan details for '<fuelType>'
    And user validates "single_rate" solar tariff type for "<state>" under electricity rates section
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|BUSINESS    |COR       |TOPB-EA |7001327621|                              |                             |                       |                         |EMAIL       |
    And user validates the solar details
      |fuelType|solarPowerIndicator|solarNetworkTariffCode|solarTimeOfUse|
      |ELE     |Y                  |1999                  |N             |
    And user validates the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN     |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|BUSINESS    |COR      |TOPB-GA |5261012701|                              |                             |                       |                         |EMAIL       |

    Examples:
      |customerStatus|fuelType|planName             |folderName            |state|sourceSystem   |journey     |AAH |DD   |customerType |newOrExisting  |
      |New           |BOTH    |Total Plan - Business|E2E_Bus_Solar_ACT_Govt|ACT  |Quote Tool     |Plan Switch |No  |No   |BUS          |New            |

  Scenario Outline: Submit a residential quote and validate the solar details for VIC retail single feed in tariff offering
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    Then user validates details on plans page for 'RES'
    When user enters the address "27 Zorro Drive, YARRAWONGA VIC 3730" on plans page
    Then user validates the solar disclaimer on the page
      |solarBuyBack |state    |
      |Y            |<state>  |
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType| connectionAddress                  | movingType|propertyType|
      |RES         | 27 Zorro Drive, YARRAWONGA VIC 3730|Non-Moving |Owner       |
    And user validates details on checkout details page
      |sourceSystem   |journey    |fuelType   |solarSetup|
      |<sourceSystem> |<journey>  |<fuelType> |Yes       |
    And user validates solar indicator on checkout details page
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|idType        |medicareType |
      |RES         |RES        |New           | test     |test     |Driver License|             |
    And user selects "single_rate" solar tariff type for "VIC"
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user selects "Post" billing preference option
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                        |GaslifeSupportDevices|
      |Yes              |BOTH    |Crigler Najjar Syndrome Phototherapy Equipment|Gas Other            |
    And user verifies selected plan details for '<fuelType>'
    And user validates "single_rate" solar tariff type for "<state>" under electricity rates section
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |COR      |TOPH-EV |6203701204|N                             |N                             |Y                      |LSCNSPE                 |POSTMM       |
    And user validates the solar details
      |fuelType|solarPowerIndicator|solarNetworkTariffCode|solarTimeOfUse|
      |ELE     |Y                  |GENR13                |N             |
    And user validates the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |COR      |TOPH-GV |5320077574|N                             |N                             |Y                      |OTHER                   |POSTMM       |

    Examples:
      |customerStatus|fuelType|planName  |folderName                           |state|sourceSystem  |journey   |AAH |DD   |customerType |newOrExisting  |
      |New           |BOTH    |Total Plan|E2E_Resi_Solar_VIC_Single_Rate_Retail|VIC  |Quote Tool    |COR       |No  |No   |RES          |New            |

  Scenario Outline: Submit a residential quote and validate the solar details for VIC retail time of use offering
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    Then user validates details on plans page for 'RES'
    When user enters the address "235 Chadds Creek Road, STRATHEWEN VIC 3099" on plans page
    Then user validates the solar disclaimer on the page
      |solarBuyBack |state    |
      |Y            |<state>  |
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType| connectionAddress                         | movingType|propertyType|
      |RES         | 235 Chadds Creek Road, STRATHEWEN VIC 3099|Moving     |Owner       |
    And user validates details on checkout details page
      |sourceSystem   |journey    |fuelType   |solarSetup|
      |<sourceSystem> |<journey>  |<fuelType> |Yes       |
    And user validates solar indicator on checkout details page
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|idType        |medicareType |
      |RES         |RES        |New           | test     |test     |Driver License|             |
    And user selects "time_of_use" solar tariff type for "VIC"
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user selects answer for property renovation question for '<state>'
    And user selects "Post" billing preference option
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                        |GaslifeSupportDevices|
      |Yes              |BOTH    |Crigler Najjar Syndrome Phototherapy Equipment|Gas Other            |
    And user verifies selected plan details for '<fuelType>'
    And user validates "time_of_use" solar tariff type for "<state>" under electricity rates section
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |TOPH-EV |6305861551|N                             |N                             |Y                      |LSCNSPE                 |POSTMM       |
    And user validates the solar details
      |fuelType|solarPowerIndicator|solarNetworkTariffCode|solarTimeOfUse|
      |ELE     |Y                  |NEE26                 |Y             |
    And user validates the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |TOPH-GV |          |N                             |N                             |Y                      |OTHER                   |POSTMM       |

    Examples:
      |customerStatus|fuelType|planName  |folderName                           |state|sourceSystem  |journey   |AAH |DD   |customerType |newOrExisting  |
      |New           |BOTH    |Total Plan|E2E_Resi_Solar_VIC_time_of_use_Retail|VIC  |Quote Tool    |move home |No  |No   |RES          |New            |

  Scenario Outline: Submit a residential quote and validate the solar details for VIC government single feed in tariff offering
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    Then user validates details on plans page for 'RES'
    When user enters the address "87 Westlake Drive, MELTON WEST VIC 3337" on plans page
    Then user validates the solar disclaimer on the page
      |solarBuyBack |state    |
      |Y            |<state>  |
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType| connectionAddress                      | movingType|propertyType|
      |RES         | 87 Westlake Drive, MELTON WEST VIC 3337|Non-Moving |Owner       |
    And user validates details on checkout details page
      |sourceSystem   |journey    |fuelType   |solarSetup|
      |<sourceSystem> |<journey>  |<fuelType> |Yes       |
    And user validates solar indicator on checkout details page
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|idType        |medicareType |
      |RES         |RES        |New           | test     |test     |Driver License|             |
    And user selects "single_rate" solar tariff type for "VIC"
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user selects "Post" billing preference option
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                        |GaslifeSupportDevices|
      |Yes              |BOTH    |Crigler Najjar Syndrome Phototherapy Equipment|Gas Other            |
    And user verifies selected plan details for '<fuelType>'
    And user validates "single_rate" solar tariff type for "<state>" under electricity rates section
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |COR      |TOPH-EV |6203683344|N                             |N                             |Y                      |LSCNSPE                 |POSTMM       |
    And user validates the solar details
      |fuelType|solarPowerIndicator|solarNetworkTariffCode|solarTimeOfUse|
      |ELE     |Y                  |PFIT                  |N             |
    And user validates the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |COR      |TOPH-GV |5330593612|N                             |N                             |Y                      |OTHER                   |POSTMM       |

    Examples:
      |customerStatus|fuelType|planName  |folderName                         |state|sourceSystem  |journey   |AAH |DD   |customerType |newOrExisting  |
      |New           |BOTH    |Total Plan|E2E_Resi_Solar_VIC_Single_Rate_Govt|VIC  |Quote Tool    |COR       |No  |No   |RES          |New            |

  Scenario Outline: Submit a residential quote and validate the solar details for VIC government time of use offering
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    Then user validates details on plans page for 'RES'
    When user enters the address "7 Albert Road, BEECHWORTH VIC 3747" on plans page
    Then user validates the solar disclaimer on the page
      |solarBuyBack |state    |
      |Y            |<state>  |
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType| connectionAddress                 | movingType|propertyType|
      |RES         | 7 Albert Road, BEECHWORTH VIC 3747|Moving     |Owner       |
    And user validates details on checkout details page
      |sourceSystem   |journey    |fuelType   |solarSetup|
      |<sourceSystem> |<journey>  |<fuelType> |Yes       |
    And user validates solar indicator on checkout details page
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|idType        |medicareType |
      |RES         |RES        |New           | test     |test     |Driver License|             |
    And user selects "time_of_use" solar tariff type for "VIC"
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user selects answer for property renovation question for '<state>'
    And user selects "Post" billing preference option
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                       |
      |Yes              |ELE    |Crigler Najjar Syndrome Phototherapy Equipment|
    And user verifies selected plan details for '<fuelType>'
    And user validates "time_of_use" solar tariff type for "<state>" under electricity rates section
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |TOPH-EV |6305885528|N                             |N                             |Y                      |LSCNSPE                 |POSTMM       |
    And user validates the solar details
      |fuelType|solarPowerIndicator|solarNetworkTariffCode|solarTimeOfUse|
      |ELE     |Y                  |SUN23                 |Y             |

    Examples:
      |customerStatus|fuelType|planName  |folderName                         |state|sourceSystem  |journey   |AAH |DD   |customerType |newOrExisting  |
      |New           |ELE     |Total Plan|E2E_Resi_Solar_VIC_time_of_use_Govt|VIC  |Quote Tool    |move home |No  |No   |RES          |New            |

  Scenario Outline: Submit a business quote and validate the solar details for VIC retail offering
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'BUS' plans page
    Then user validates details on plans page for 'BUS'
    When user enters the address "1 Pintail Drive, TORQUAY VIC 3228" on plans page
    Then user validates the solar disclaimer on the page
      |solarBuyBack |state    |
      |Y            |<state>  |
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType| connectionAddress                | movingType|
      |BUS         | 1 Pintail Drive, TORQUAY VIC 3228|Non-Moving |
    And user validates details on checkout details page
      |sourceSystem   |journey    |fuelType   |solarSetup|
      |<sourceSystem> |<journey>  |<fuelType> |Yes       |
    And user validates solar indicator on checkout details page
    And user provides all details on checkout details page
      |customerType|journey    | firstName| lastName|businessType|
      |BUS         |BUS        | test     |test     |ABN         |
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user selects "Email" billing preference option
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                        |GaslifeSupportDevices|
      |No               |BOTH    |Crigler Najjar Syndrome Phototherapy Equipment|Gas Other            |
    And user verifies selected plan details for '<fuelType>'
    And user validates "single_rate" solar tariff type for "<state>" under electricity rates section
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|BUSINESS    |PS       |TOPB-EV |6203928101|                              |                             |                       |                         |EMAIL       |
    And user validates the solar details
      |fuelType|solarPowerIndicator|solarNetworkTariffCode|solarTimeOfUse|
      |ELE     |Y                  |GENR13                |N             |
    And user validates the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN     |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|BUSINESS    |PS       |TOPB-GV |5331227952|                              |                             |                       |                         |EMAIL       |

    Examples:
      |customerStatus|fuelType|planName             |folderName              |state|sourceSystem   |journey     |AAH |DD   |customerType |newOrExisting  |
      |New           |BOTH    |Total Plan - Business|E2E_Bus_Solar_VIC_Retail|VIC  |Quote Tool     |Plan Switch |No  |No   |BUS          |New            |

  Scenario Outline: Submit a business quote and validate the solar details for VIC government offering
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'BUS' plans page
    Then user validates details on plans page for 'BUS'
    When user enters the address "66-68 Melville Road, BRUNSWICK WEST VIC 3055" on plans page
    Then user validates the solar disclaimer on the page
      |solarBuyBack |state    |
      |Y            |<state>  |
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType| connectionAddress                           | movingType|
      |BUS         | 66-68 Melville Road, BRUNSWICK WEST VIC 3055|Moving     |
    And user validates details on checkout details page
      |sourceSystem   |journey    |fuelType   |solarSetup|
      |<sourceSystem> |<journey>  |<fuelType> |Yes       |
    And user validates solar indicator on checkout details page
    And user provides all details on checkout details page
      |customerType|journey    | firstName| lastName|businessType|
      |BUS         |BUS        | test     |test     |ACN         |
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user selects answer for property renovation question for '<state>'
    And user selects "Email" billing preference option
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                        |GaslifeSupportDevices|
      |No               |BOTH    |Crigler Najjar Syndrome Phototherapy Equipment|Gas Other            |
    And user verifies selected plan details for '<fuelType>'
    And user validates "single_rate" solar tariff type for "<state>" under electricity rates section
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|BUSINESS    |ENE      |TOPB-EV |6102136213|                              |                             |                       |                         |EMAIL       |
    And user validates the solar details
      |fuelType|solarPowerIndicator|solarNetworkTariffCode|solarTimeOfUse|
      |ELE     |Y                  |PFIT                  |N             |
    And user validates the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|BUSINESS    |ENE      |TOPB-GV |5321141138|                              |                             |                       |                         |EMAIL       |

    Examples:
      |customerStatus|fuelType|planName             |folderName            |state|sourceSystem   |journey   |AAH |DD   |customerType |newOrExisting  |
      |New           |BOTH    |Total Plan - Business|E2E_Bus_Solar_VIC_Govt|VIC  |Quote Tool     |move home |No  |No   |BUS          |New            |

  Scenario Outline: Submit a residential quote and validate the solar details for QLD retail offering
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    Then user validates details on plans page for 'RES'
    When user enters the address "4 North Point Crescent, PELICAN WATERS QLD 4551" on plans page
    Then user validates the solar disclaimer on the page
      |solarBuyBack |state    |
      |Y            |<state>  |
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType| connectionAddress                              | movingType|propertyType|
      |RES         | 4 North Point Crescent, PELICAN WATERS QLD 4551|Moving     |Owner       |
    And user validates details on checkout details page
      |sourceSystem   |journey    |fuelType   |solarSetup|
      |<sourceSystem> |<journey>  |<fuelType> |Yes       |
    And user validates solar indicator on checkout details page
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|idType        |medicareType |
      |RES         |RES        |New           | test     |test     |Driver License|             |
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user selects answer for property renovation question for '<state>'
    And user selects "Post" billing preference option
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                        |
      |Yes              |ELE    |Crigler Najjar Syndrome Phototherapy Equipment |
    And user verifies selected plan details for '<fuelType>'
    And user validates "single_rate" solar tariff type for "<state>" under electricity rates section
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |TOPH-EQ |3120046220|N                             |N                             |Y                      |LSCNSPE                 |POSTMM       |
    And user validates the solar details
      |fuelType|solarPowerIndicator|solarNetworkTariffCode|solarTimeOfUse|
      |ELE     |Y                  |9870                  |N             |

    Examples:
      |customerStatus|fuelType|planName  |folderName               |state|sourceSystem   |journey   |AAH |DD   |customerType |newOrExisting  |
      |New           |ELE     |Total Plan|E2E_Resi_Solar_QLD_Retail|QLD  |Quote Tool     |move home |No  |No   |RES          |New            |

  Scenario Outline: Submit a residential quote and validate the solar details for PS QLD retail offering
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    Then user validates details on plans page for 'RES'
    When user enters the address "240 Benowa Road, BENOWA QLD 4217" on plans page
    Then user validates the solar disclaimer on the page
      |solarBuyBack |state    |
      |Y            |<state>  |
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType| connectionAddress               | movingType|propertyType|
      |RES         | 240 Benowa Road, BENOWA QLD 4217|Non-Moving |Owner       |
    And user validates details on checkout details page
      |sourceSystem   |journey    |fuelType   |solarSetup|
      |<sourceSystem> |<journey>  |<fuelType> |Yes       |
    And user validates solar indicator on checkout details page
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|idType        |medicareType |
      |RES         |RES        |New           | test     |test     |Driver License|             |
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user selects "Post" billing preference option
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                        |
      |No               |ELE    |Crigler Najjar Syndrome Phototherapy Equipment |
    And user verifies selected plan details for '<fuelType>'
    And user validates "single_rate" solar tariff type for "<state>" under electricity rates section
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |PS       |TOPH-EQ |3116684567|                              |                              |                       |                        |POSTMM       |
    And user validates the solar details
      |fuelType|solarPowerIndicator|solarNetworkTariffCode|solarTimeOfUse|
      |ELE     |Y                  |7550                  |N             |

    Examples:
      |customerStatus|fuelType|planName  |folderName                 |state|sourceSystem  |journey   |AAH |DD   |customerType |newOrExisting  |
      |New           |ELE    |Total Plan|E2E_Resi_Solar_QLD_PS_Retail|QLD |Quote Tool     |plan switch |No  |No   |RES          |New            |

  Scenario Outline: Submit a business quote and validate the solar details for QLD retail offering
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'BUS' plans page
    Then user validates details on plans page for 'BUS'
    When user enters the address "7 Kimlin Lane, DAGUN QLD 4570" on plans page
    Then user validates the solar disclaimer on the page
      |solarBuyBack |state    |
      |Y            |<state>  |
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType| connectionAddress            | movingType|
      |BUS         | 7 Kimlin Lane, DAGUN QLD 4570|Non-Moving |
    And user validates details on checkout details page
      |sourceSystem   |journey    |fuelType   |solarSetup|
      |<sourceSystem> |<journey>  |<fuelType> |Yes       |
    And user validates solar indicator on checkout details page
    And user provides all details on checkout details page
      |customerType|journey    | firstName| lastName|businessType|
      |BUS         |BUS        | test     |test     |ACN         |
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user selects "Email" billing preference option
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                        |
      |No               |ELE     |Crigler Najjar Syndrome Phototherapy Equipment|
    And user verifies selected plan details for '<fuelType>'
    And user validates "single_rate" solar tariff type for "<state>" under electricity rates section
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|BUSINESS    |PS       |TOPB-EQ |QB02178486|                              |                             |                       |                         |EMAIL       |
    And user validates the solar details
      |fuelType|solarPowerIndicator|solarNetworkTariffCode|solarTimeOfUse|
      |ELE     |Y                  |9870                  |N             |

    Examples:
      |customerStatus|fuelType|planName             |folderName              |state|sourceSystem   |journey     |AAH |DD   |customerType |newOrExisting  |
      |New           |ELE     |Total Plan - Business|E2E_Bus_Solar_QLD_Retail|SA   |Quote Tool     |Plan Switch |No  |No   |BUS          |New            |

  Scenario Outline: Submit a residential quote and swap PFIT NTC(9900,9950,9970) to retail NTC(7500) for QLD energisation requests
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    Then user validates details on plans page for 'RES'
    When user enters the address "500 Sandy Creek Road, SANDY CREEK QLD 4515" on plans page
    Then user validates the solar disclaimer on the page
      |solarBuyBack |state    |
      |Y            |<state>  |
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType| connectionAddress                         | movingType|propertyType|
      |RES         | 500 Sandy Creek Road, SANDY CREEK QLD 4515|Moving     |Owner       |
    And user validates details on checkout details page
      |sourceSystem   |journey    |fuelType   |solarSetup|
      |<sourceSystem> |<journey>  |<fuelType> |Yes       |
    And user validates solar indicator on checkout details page
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|idType        |medicareType |
      |RES         |RES        |New           | test     |test     |Driver License|             |
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user selects answer for property renovation question for '<state>'
    And user selects "Post" billing preference option
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                        |
      |No               |ELE    |Crigler Najjar Syndrome Phototherapy Equipment |
    And user verifies selected plan details for '<fuelType>'
    And user validates "single_rate" solar tariff type for "<state>" under electricity rates section
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |TOPH-EQ |3114726378|                              |                              |                       |                        |POSTMM       |
    And user validates the solar details
      |fuelType|solarPowerIndicator|solarNetworkTariffCode|solarTimeOfUse|
      |ELE     |Y                  |7500                  |N             |

    Examples:
      |customerStatus|fuelType|planName  |folderName                         |state|sourceSystem  |journey   |AAH |DD   |customerType |newOrExisting  |
      |New           |ELE    |Total Plan|E2E_Resi_Solar_QLD_Govt_NTC_SWAP_ENE|QLD |Quote Tool     |move home |No  |No   |RES          |New            |

  Scenario Outline: Submit a residential quote and validate the solar details for QLD government offering along with solar disclaimer for COR
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    Then user validates details on plans page for 'RES'
    When user enters the address "10 Bunya Pine Court, EATONS HILL QLD 4037" on plans page
    Then user validates the solar disclaimer on the page
      |solarBuyBack |state    |
      |Y            |<state>  |
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType| connectionAddress                        | movingType|propertyType|
      |RES         | 10 Bunya Pine Court, EATONS HILL QLD 4037|Non-Moving |Owner       |
    Then user validates details on checkout details page
      |sourceSystem   |journey    |fuelType   |solarSetup|
      |<sourceSystem> |<journey>  |<fuelType> |Yes       |
    And user validates solar indicator on checkout details page
    And user validates solar disclaimer for QLD COR customer on PFIT NTC
    When user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|idType        |medicareType |
      |RES         |RES        |New           | test     |test     |Driver License|             |
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user selects "Post" billing preference option
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                        |
      |No               |ELE    |Crigler Najjar Syndrome Phototherapy Equipment |
    And user verifies selected plan details for '<fuelType>'
    And user validates "single_rate" solar tariff type for "<state>" under electricity rates section
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |COR      |TOPH-EQ |QB13072625|                              |                              |                       |                        |POSTMM       |
    And user validates the solar details
      |fuelType|solarPowerIndicator|solarNetworkTariffCode|solarTimeOfUse|
      |ELE     |Y                  |9970                  |N             |

    Examples:
      |customerStatus|fuelType|planName  |folderName                    |state|sourceSystem  |journey   |AAH |DD   |customerType |newOrExisting  |
      |New           |ELE    |Total Plan|E2E_Resi_Solar_QLD_Govt_NTC_COR|QLD |Quote Tool     |COR        |No  |No   |RES         |New            |
