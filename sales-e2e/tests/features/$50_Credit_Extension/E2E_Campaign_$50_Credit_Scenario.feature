@$50CampaignTesting @CreditExtensionTesting
Feature:E2E scenario for $50 campaign testing
 #Elec - TPP
  #CAMPNSWELECTPP
Scenario Outline: Submit a quote for elec-tpp campaign for NSW
  Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
  When user provides "2000" and clicks on show me plan link
  And user clicks on Add plan button
  And user selects '<customerStatus>' on qualifier
  And user provides all other details on qualifier page
    |customerType| connectionAddress                    |movingType|propertyType|solarOption|
    |RES         | 2 Cavey Street, MARRICKVILLE NSW 2204|Moving    |Renter      |No         |
  And user provides all details on checkout details page
    |customerType|journey    |customerStatus| firstName     | lastName|idType  |medicareType|
    |RES         |RES        |New           | test|test     |Medicare|blue        |
  And user selects answer for property renovation question for '<state>'
  And user clicks on 'Review your order' button and navigates to review page
  And user provides life support details on review page
    |lifeSupportOption|fuelType|EleclifeSupportDevices                        |GaslifeSupportDevices|
    |Yes              |BOTH    |Crigler Najjar Syndrome Phototherapy Equipment|Gas Other            |
  And user verifies selected plan details for '<fuelType>'
  And user submits the quote
  Then user lands on checkout complete page
  And user downloads a pdf copy of plan details
  When user has opened the qt2 Reporting website link in a browser
  And user logs in to qt2 reporting
  And user search quote on the basis of 'Email'
  Then submitted quote is displayed
  And user validates all the details for 'ELE' submitted quote
  And user validates below mandatory fields
    |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
    |ELE     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |SWSRH-EN|4102999083|N                             |N                             |Y                      |LSCNSPE                 |EMAIL        |
  And user validates all the details for 'GAS' submitted quote
  And user validates below mandatory fields
    |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
    |GAS     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |SWSRH-GN|5240645583|N                             |N                             |Y                      |OTHER                   |EMAIL        |

  Examples:
    |customerStatus|fuelType|campaign  |folderName                          |state|
    |New           |BOTH    |elec-tpp  |E2E_New_Resi_Moving_$50_NSW_ELEC_TPP|NSW  |

  #CAMPVICELECTPP
  Scenario Outline: Submit a quote for elec-tpp campaign for VIC
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "3000" and clicks on show me plan link
    And user clicks on Add plan button
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType|connectionAddress                    | movingType|propertyType|solarOption|
      |RES         |21 Eltham Street, FLEMINGTON VIC 3031|Non-Moving |Renter      |No         |
    And user selects carbon neutral option
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus| firstName| lastName|idType  |medicareType|
      |RES          |RES        |New           | test|test     |Medicare|green       |
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |No          |Yes        |CC             |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices|GaslifeSupportDevices                             |
      |No               |BOTH    |Ele Other             |Medically Required Heating and/or Air Conditioning|
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user downloads a pdf copy of plan details
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |COR      |SWSRH-EV|6001456296|N                             |N                             |N                      |                        |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |COR      |SWSRH-GV|5330396438|N                             |N                             |N                      |                        |EMAIL        |

    Examples:
      |customerStatus|campaign|fuelType|folderName                             |
      |New           |elec-tpp|BOTH    |E2E_New_Resi_NonMoving_$50_VIC_ELEC_TPP|

  #CAMPSAELECTPP
  Scenario Outline: Submit a quote for elec-tpp campaign for SA
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "5000" and clicks on show me plan link
    And user clicks on Add plan button
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType| connectionAddress                  |movingType|propertyType|solarOption|
      |RES         | 9 Gooronga Drive, CRAIGMORE SA 5114|Moving    |Renter      |No         |
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|idType  |medicareType|
      |RES         |RES        |New           | test     |test     |Medicare|yellow      |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                        |GaslifeSupportDevices|
      |Yes              |BOTH    |Crigler Najjar Syndrome Phototherapy Equipment|Gas Other            |
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user downloads a pdf copy of plan details
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |SWSRH-ES|2001576302|N                             |N                             |Y                      |LSCNSPE                 |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |SWSRH-GS|5510035344|N                             |N                             |Y                      |OTHER                   |EMAIL        |

    Examples:
      |customerStatus|fuelType|campaign  |folderName                         |state|
      |New           |BOTH    |elec-tpp  |E2E_New_Resi_Moving_$50_SA_ELEC_TPP|SA  |

  #Gas-TPP
  #CAMPNSWGASTPP
  Scenario Outline: Submit a quote for gas-tpp campaign for NSW
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "2000" and clicks on show me plan link
    And user clicks on Add plan button
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType|connectionAddress                    | movingType|propertyType|solarOption|
      |RES         |89 Winten Drive, GLENDENNING NSW 2761|Non-Moving |Renter      |No         |
    And user selects carbon neutral option
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus| firstName| lastName|idType  |medicareType|
      |RES          |RES        |New           | test|test     |Medicare|blue        |
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |No          |Yes        |CC             |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices|GaslifeSupportDevices                             |
      |Yes              |BOTH    |Ele Other             |Medically Required Heating and/or Air Conditioning|
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user downloads a pdf copy of plan details
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |COR      |SWSRH-EN|4310215226|N                             |N                             |Y                      |OTHER                   |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |COR      |SWSRH-GN|5240564193|N                             |N                             |Y                      |GLSMRHAC                |EMAIL        |

    Examples:
      |customerStatus|campaign|fuelType|folderName                            |
      |New           |gas-tpp |BOTH    |E2E_New_Resi_NonMoving_$50_NSW_GAS_TPP|

 #CAMPVICGASTPP
  Scenario Outline: Submit a quote for gas-tpp campaign for VIC
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "3000" and clicks on show me plan link
    And user clicks on Add plan button
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType| connectionAddress                      |movingType|propertyType|solarOption|
      |RES         | 11 Newry Street, FITZROY NORTH VIC 3068|Moving    |Renter      |No         |
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName    | lastName|idType        |
      |RES         |RES        |New           | test|test     |Driver License|
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                        |GaslifeSupportDevices|
      |Yes              |BOTH    |Crigler Najjar Syndrome Phototherapy Equipment|Gas Other            |
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user downloads a pdf copy of plan details
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |SWSRH-EV|6102512907|N                             |N                             |Y                      |LSCNSPE                 |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |SWSRH-GV|5321198839|N                             |N                             |Y                      |OTHER                   |EMAIL        |

    Examples:
      |customerStatus|fuelType|campaign  |folderName                          |state|
      |New           |BOTH    |gas-tpp   |E2E_New_Resi_Moving_$50_VIC_GAS_TPP|VIC  |

  #CAMPSAGASTPP
  Scenario Outline: Submit a quote for gas-tpp campaign for SA
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "5000" and clicks on show me plan link
    And user clicks on Add plan button
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType|connectionAddress                    | movingType|propertyType|solarOption|
      |RES         |14 Black Road, FLAGSTAFF HILL SA 5159|Non-Moving |Renter      |No         |
    And user selects carbon neutral option
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus| firstName| lastName|idType  |medicareType|
      |RES          |RES        |New           | CAMPSAGASTPP|test     |Medicare|yellow      |
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |No          |Yes        |CC             |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices|GaslifeSupportDevices                             |
      |Yes              |BOTH    |Ele Other             |Medically Required Heating and/or Air Conditioning|
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user downloads a pdf copy of plan details
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |COR      |SWSRH-ES|2001253769|N                             |N                             |Y                      |OTHER                   |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |COR      |SWSRH-GS|5510401451|N                             |N                             |Y                      |GLSMRHAC                |EMAIL        |

    Examples:
      |customerStatus|campaign|fuelType|folderName                           |
      |New           |gas-tpp |BOTH    |E2E_New_Resi_NonMoving_$50_SA_GAS_TPP|

    #Elec-TP
 #CAMPNSWELECTP
  Scenario Outline: Submit a quote for elec-totalP campaign for NSW
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "2000" and clicks on show me plan link
    And user clicks on Add plan button
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType| connectionAddress                      |movingType|propertyType|solarOption|
      |RES         | 43 Coronation Avenue, CRONULLA NSW 2230|Moving    |Renter      |No         |
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|idType  |medicareType|
      |RES         |RES        |New           | test|test     |Medicare|blue        |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                        |GaslifeSupportDevices|
      |Yes              |BOTH    |Crigler Najjar Syndrome Phototherapy Equipment|Gas Other            |
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user downloads a pdf copy of plan details
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |TOPH-EN|4102451318|N                             |N                             |Y                      |LSCNSPE                 |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |TOPH-GN|5244688997|N                             |N                             |Y                      |OTHER                   |EMAIL        |

    Examples:
      |customerStatus|fuelType|campaign  |folderName                         |state|
      |New           |BOTH    |elec-tp   |E2E_New_Resi_Moving_$50_NSW_ELEC_TP|NSW  |

 #CAMPVICELECTP
  Scenario Outline: Submit a quote for elec-totalP campaign for VIC
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "3000" and clicks on show me plan link
    And user clicks on Add plan button
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType|connectionAddress                   | movingType|propertyType|solarOption|
      |RES         |14 Westley Avenue, BRIGHTON VIC 3186|Non-Moving |Renter      |No         |
    And user selects carbon neutral option
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus| firstName| lastName|idType  |medicareType|
      |RES          |RES        |New           | test|test     |Medicare|green       |
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |No          |Yes        |CC             |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices|GaslifeSupportDevices                             |
      |No               |BOTH    |Ele Other             |Medically Required Heating and/or Air Conditioning|
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user downloads a pdf copy of plan details
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |COR      |TOPH-EV|6407331528|N                             |N                             |N                      |                        |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |COR      |TOPH-GV|5310310428|N                             |N                             |N                      |                        |EMAIL        |

    Examples:
      |customerStatus|campaign|fuelType|folderName                            |
      |New           |elec-tp |BOTH    |E2E_New_Resi_NonMoving_$50_VIC_ELEC_TP|

  #CAMPSAELECTP
  Scenario Outline: Submit a quote for elec-totalP campaign for SA
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "5000" and clicks on show me plan link
    And user clicks on Add plan button
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType| connectionAddress                   |movingType|propertyType|solarOption|
      |RES         | 6 Edgar Street, BEDFORD PARK SA 5042|Moving    |Renter      |No         |
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|idType  |medicareType|
      |RES         |RES        |New           | test     |test     |Medicare|yellow      |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                        |GaslifeSupportDevices|
      |Yes              |BOTH    |Crigler Najjar Syndrome Phototherapy Equipment|Gas Other            |
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user downloads a pdf copy of plan details
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |TOPH-ES|2001693482|N                             |N                             |Y                      |LSCNSPE                 |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |TOPH-GS|5510393658|N                             |N                             |Y                      |OTHER                   |EMAIL        |

    Examples:
      |customerStatus|fuelType|campaign  |folderName                        |state|
      |New           |BOTH    |elec-tp   |E2E_New_Resi_Moving_$50_SA_ELEC_TP|SA  |

#Gas-TP
  #CAMPNSWGASTP
  Scenario Outline: Submit a quote for gas-totalP campaign for NSW
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "2000" and clicks on show me plan link
    And user clicks on Add plan button
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType|connectionAddress                    | movingType|propertyType|solarOption|
      |RES         |22 Sanderson Road, KANAHOOKA NSW 2530|Non-Moving |Renter      |No         |
    And user selects carbon neutral option
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus| firstName| lastName|idType  |medicareType|
      |RES          |RES        |New           | test     |test     |Medicare|blue        |
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |No          |Yes        |CC             |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices|GaslifeSupportDevices                             |
      |Yes              |BOTH    |Ele Other             |Medically Required Heating and/or Air Conditioning|
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user downloads a pdf copy of plan details
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |COR      |TOPH-EN|4310686924|N                             |N                             |Y                      |OTHER                   |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |COR      |TOPH-GN|5240701389|N                             |N                             |Y                      |GLSMRHAC                |EMAIL        |

    Examples:
      |customerStatus|campaign|fuelType|folderName                           |
      |New           |gas-tp  |BOTH    |E2E_New_Resi_NonMoving_$50_NSW_GAS_TP|

  #CAMPVICGASTP
  Scenario Outline: Submit a quote for gas-totalP campaign for VIC
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "3000" and clicks on show me plan link
    And user clicks on Add plan button
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType| connectionAddress                   |movingType|propertyType|solarOption|
      |RES         | 26 Cameron Street, PORTLAND VIC 3305|Moving    |Renter      |No         |
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus| firstName| lastName|idType  |medicareType|
      |RES          |RES        |New           | test     |test     |Medicare|blue        |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                        |GaslifeSupportDevices|
      |Yes              |BOTH    |Crigler Najjar Syndrome Phototherapy Equipment|Gas Other            |
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user downloads a pdf copy of plan details
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |TOPH-EV|6203558238|N                             |N                             |Y                      |LSCNSPE                 |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |TOPH-GV|5330030642|N                             |N                             |Y                      |OTHER                   |EMAIL        |

    Examples:
      |customerStatus|fuelType|campaign  |folderName                        |state|
      |New           |BOTH    |gas-tp    |E2E_New_Resi_Moving_$50_VIC_GAS_TP|VIC  |

  #CAMPSAGASTP
  Scenario Outline: Submit a quote for gas-totalP campaign for SA
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "5000" and clicks on show me plan link
    And user clicks on Add plan button
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType|connectionAddress                      | movingType|propertyType|solarOption|
      |RES         |9 Vynland Drive, FLAGSTAFF HILL SA 5159|Non-Moving |Renter      |No         |
    And user selects carbon neutral option
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus| firstName| lastName|idType  |medicareType|
      |RES          |RES        |New           | test     |test     |Medicare|green        |
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |No          |Yes        |CC             |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices|GaslifeSupportDevices                             |
      |Yes              |BOTH    |Ele Other             |Medically Required Heating and/or Air Conditioning|
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user downloads a pdf copy of plan details
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |COR      |TOPH-ES|2001253567|N                             |N                             |Y                      |OTHER                   |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |COR      |TOPH-GS|5510402883|N                             |N                             |Y                      |GLSMRHAC                |EMAIL        |

    Examples:
      |customerStatus|campaign|fuelType|folderName                          |
      |New           |gas-tp  |BOTH    |E2E_New_Resi_NonMoving_$50_SA_GAS_TP|

    #Total-Plan
 #CAMPNSWTOTAL
  Scenario Outline: Submit a quote for total-plan campaign for NSW
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "2000" and clicks on show me plan link
    And user clicks on Add plan button
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType|connectionAddress                 | movingType|propertyType|solarOption|
      |RES         |8 French Street, MAROUBRA NSW 2035|Non-Moving |Renter      |No         |
    And user selects carbon neutral option
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName   | lastName|idType        |
      |RES         |RES        |New           | test|test     |Driver License|
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |No          |Yes        |CC             |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices|GaslifeSupportDevices                             |
      |Yes              |BOTH    |Ele Other             |Medically Required Heating and/or Air Conditioning|
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user downloads a pdf copy of plan details
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |COR      |TOPH-EN |4102965002|N                             |N                             |Y                      |OTHER                   |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |COR      |TOPH-GN|5240128893|N                             |N                             |Y                      |GLSMRHAC                |EMAIL        |

    Examples:
      |customerStatus|campaign|fuelType|folderName                          |
      |New           |total   |BOTH    |E2E_New_Resi_NonMoving_$50_NSW_Total|

  #CAMPVICTOTAL
  Scenario Outline: Submit a quote for total-plan campaign for VIC
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "3000" and clicks on show me plan link
    And user clicks on Add plan button
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType| connectionAddress                         |movingType|propertyType|solarOption|
      |RES         | 72 Featherbrook Drive, POINT COOK VIC 3030|Moving    |Renter      |No         |
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName   | lastName|idType  |
      |RES         |RES        |New           | test|test     |Passport|
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                        |GaslifeSupportDevices|
      |Yes              |BOTH    |Crigler Najjar Syndrome Phototherapy Equipment|Gas Other            |
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user downloads a pdf copy of plan details
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |TOPH-EV|6203805728|N                             |N                             |Y                      |LSCNSPE                 |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |TOPH-GV|5330770342|N                             |N                             |Y                      |OTHER                   |EMAIL        |

    Examples:
      |customerStatus|campaign|fuelType|campaign  |folderName                       |state|
      |New           |total   |BOTH    |Offer     |E2E_New_Resi_Moving_$50_VIC_Total|VIC  |

  #CAMPQLDTOTAL
  Scenario Outline: Submit a quote for total-plan for QLD
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "4000" and clicks on show me plan link
    And user clicks on Add plan button
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType|connectionAddress                       | movingType|propertyType|solarOption|
      |RES         |27 Cooinda Street, SLACKS CREEK QLD 4127|Non-Moving |Renter      |No         |
    And user selects carbon neutral option
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus| firstName| lastName|idType  |medicareType|
      |RES          |RES        |New           | test|test     |Medicare|yellow      |
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |No          |No         |CC             |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices|GaslifeSupportDevices                             |
      |Yes              |ELE     |Ele Other             |Medically Required Heating and/or Air Conditioning|
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user downloads a pdf copy of plan details
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |COR      |TOPH-EQ |QB00224057|N                             |N                             |Y                      |OTHER                   |EMAIL        |

    Examples:
      |customerStatus|campaign|fuelType|folderName                          |
      |New           |total   |ELE     |E2E_New_Resi_NonMoving_$50_QLD_Total|

#total-plan-plus - Negative Scenario
  #CAMPQLDTPP
  Scenario Outline: Submit a quote for total-plan-plus for QLD
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "4000" and clicks on show me plan link
    And user clicks on Add plan button
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType|connectionAddress              | movingType|propertyType|solarOption|
      |RES         |1 Remo Place, BIRKDALE QLD 4159|Non-Moving |Renter      |No         |
    And user selects carbon neutral option
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus| firstName| lastName|idType  |medicareType|
      |RES          |RES        |New           | test|test     |Medicare|yellow      |
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |No          |No         |CC             |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices|GaslifeSupportDevices                             |
      |Yes              |ELE     |Ele Other             |Medically Required Heating and/or Air Conditioning|
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user downloads a pdf copy of plan details
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |COR      |SWSRH-EQ|3114804395|N                             |N                             |Y                      |OTHER                   |EMAIL        |

    Examples:
      |customerStatus|campaign|fuelType|folderName                                      |
      |New           |total-plan-plus|ELE     |E2E_New_Resi_NonMoving_$50_QLD_Total_Plus|
#comeback
  #CAMPQLDCOMEBACK
  Scenario Outline: Submit a quote for comeback for QLD
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "4000" and clicks on show me plan link
    And user clicks on Add plan button
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType|connectionAddress                        | movingType|propertyType|solarOption|
      |RES         |29 Ingleston Street, WYNNUM WEST QLD 4178|Non-Moving |Renter      |No         |
    And user selects carbon neutral option
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus| firstName| lastName|idType  |medicareType|
      |RES          |RES        |New           | test|test     |Medicare|yellow      |
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |No          |No         |CC             |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices|GaslifeSupportDevices                             |
      |Yes              |ELE     |Ele Other             |Medically Required Heating and/or Air Conditioning|
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user downloads a pdf copy of plan details
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |COR      |SWSRH-EQ|QB10901621|N                             |N                             |Y                      |OTHER                   |EMAIL        |

    Examples:
      |customerStatus|campaign|fuelType|folderName                             |
      |New           |comeback|ELE     |E2E_New_Resi_NonMoving_$50_QLD_COMEBACK|

  #familyandfriends - negative scenario
 #CAMPQLDFnF
  Scenario Outline: Submit a quote for familyandfriends for QLD
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "test111111" and "4000" and clicks on show me plan link
    And user clicks on Add plan button
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType| connectionAddress                 | movingType|propertyType|solarOption|
      |RES         | 83 Viewland Drive, DOONAN QLD 4562|Moving     |Renter      |No         |
    And user selects carbon neutral option
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus| firstName| lastName|idType  |medicareType|
      |RES          |RES        |New           | test|test     |Medicare|blue      |
    And user selects answer for property renovation question for '<state>'
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |No         |No         |               |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                        |GaslifeSupportDevices|
      |Yes              |ELE     |Crigler Najjar Syndrome Phototherapy Equipment|Gas Other            |
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user downloads a pdf copy of plan details
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |FFPH-EQ |3120049919|N                             |N                             |Y                      |LSCNSPE                 |EMAIL        |

    Examples:
      |customerStatus|campaign|fuelType|folderName                             |state|
      |New           |familyandfriends|ELE     |E2E_New_Resi_Moving_$50_QLD_FnF|QLD  |

    #EACorporateOffer - negative scenario
  #CAMPQLDEACORP
  Scenario Outline: Submit a quote for EACorporateOffer for QLD
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "reward" and "4000" and clicks on show me plan link
    And user clicks on Add plan button
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType| connectionAddress                    | movingType|propertyType|solarOption|
      |RES         | 53 Woodford Street, ONE MILE QLD 4305|Moving     |Renter      |No         |
    And user selects carbon neutral option
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus| firstName| lastName|idType  |medicareType|
      |RES          |RES        |New           | test|test     |Medicare|blue      |
    And user selects answer for property renovation question for '<state>'
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |No         |No         |               |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                        |GaslifeSupportDevices|
      |Yes              |ELE     |Crigler Najjar Syndrome Phototherapy Equipment|Gas Other            |
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user downloads a pdf copy of plan details
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |TOPH-EQ |QB00672441|N                             |N                             |Y                      |LSCNSPE                 |EMAIL        |

    Examples:
      |customerStatus|campaign|fuelType|folderName                                |state|
      |New           |eacorporateOffer|ELE     |E2E_New_Resi_Moving_$50_QLD_EACorp|QLD  |

    #ElecTppVICPS
  Scenario Outline: Submit a quote for elec-tpp campaign for VIC
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "3000" and clicks on show me plan link
    And user clicks on Add plan button
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |8513751442   |Postcode           |3163            |dob   |01011980|
    And user provides all other details on qualifier page for Existing customer
      |customerType|movingType |propertyType |solarOption  |
      |RES         |Non-Moving |Owner        |No           |

    And user provides all details on checkout details page
      |customerType|journey    |customerStatus|firstName     |lastName |idType  |medicareType|
      |RES         |RES        |Existing           |test  |test     |Medicare|blue        |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                        |GaslifeSupportDevices|
      |Yes              |BOTH    |Crigler Najjar Syndrome Phototherapy Equipment|Gas Other            |
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user downloads a pdf copy of plan details
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |PS      |SWSRH-EV|6407348771|N                             |N                             |Y                      |LSCNSPE                 |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |PS      |SWSRH-GV|5310611153|N                             |N                             |Y                      |OTHER                   |EMAIL        |

    Examples:
      |customerStatus|fuelType|campaign  |folderName                          |
      |Existing      |BOTH    |elec-tpp  |E2E_New_Resi_Moving_$50_NSW_ELEC_TPP|


  #GasTppNSWPS
  Scenario Outline: Submit a quote for gas-tpp campaign for NSW
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "2000" and clicks on show me plan link
    And user clicks on Add plan button
    And user selects '<customerStatus>' on qualifier

    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |1063404416   |Postcode           |2322            |dob   |01011980|
    And user provides all other details on qualifier page for Existing customer
      |customerType|movingType |propertyType |solarOption  |
      |RES         |Non-Moving |Owner        |No           |

    And user selects carbon neutral option
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus| firstName| lastName|idType  |medicareType|
      |RES          |RES        |Existing           | test|test     |Medicare|blue        |
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |No          |Yes        |CC             |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices|GaslifeSupportDevices                             |
      |Yes              |BOTH    |Ele Other             |Medically Required Heating and/or Air Conditioning|
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user downloads a pdf copy of plan details
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |PS      |SWSRH-EN|4102236498|N                             |N                             |Y                      |OTHER                   |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |PS      |SWSRH-GN|5240811020|N                             |N                             |Y                      |GLSMRHAC                |EMAIL        |

    Examples:
      |customerStatus|campaign|fuelType|folderName                                 |
      |Existing           |gas-tpp |BOTH    |E2E_New_Resi_NonMoving_$50_NSW_GAS_TPP|


    #ElecTppSAPS
  Scenario Outline: Submit a quote for elec-tpp campaign for SA
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "5000" and clicks on show me plan link
    And user clicks on Add plan button
    And user selects '<customerStatus>' on qualifier

    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |8321102099   |Postcode           |5158            |dob   |01011980|
    And user provides all other details on qualifier page for Existing customer
      |customerType|movingType |propertyType |solarOption  |
      |RES         |Non-Moving |Owner        |No           |

    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName     | lastName|idType  |medicareType|
      |RES         |RES        |Existing           | test   |test     |Medicare|yellow      |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                        |GaslifeSupportDevices|
      |Yes              |BOTH    |Crigler Najjar Syndrome Phototherapy Equipment|Gas Other            |
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user downloads a pdf copy of plan details
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |PS      |SWSRH-ES|2001308560|N                             |N                             |Y                      |LSCNSPE                 |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |PS      |SWSRH-GS|5510350927|N                             |N                             |Y                      |OTHER                   |EMAIL        |

    Examples:
      |customerStatus|fuelType|campaign  |folderName                              |
      |Existing           |BOTH    |elec-tpp  |E2E_New_Resi_Moving_$50_SA_ELEC_TPP|
