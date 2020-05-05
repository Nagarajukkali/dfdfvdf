@E2E
Feature:E2E scenario for new residential non moving customer for $50 credit extension
# New customer non-moving with FRMP/FRO as NON_EA
  #Done

  Scenario Outline: Submit a quote for new residential non moving customer for VIC with FRMP/FRO as NON_EA
  Given user has opened the website link in a browser and creates '<folderName>' to save evidences
  And user has navigated to 'RES' plans page
  When user selects '<planName>'
  And user moves on to fill the qualifier
  And user selects '<customerStatus>' on qualifier
  And user provides all other details on qualifier page
    |customerType|connectionAddress                    | movingType|propertyType|solarOption|
    |RES         |21 Eltham Street, FLEMINGTON VIC 3031|Non-Moving |Renter      |No         |
  And user selects carbon neutral option
  And user provides all details on checkout details page
    |customerType |journey    |customerStatus| firstName| lastName|idType        |
    |RES          |RES        |New           | test     |test   |Driver License|
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
  When user has opened the qt2 Reporting website link in a browser
  And user logs in to qt2 reporting using '<username>' and '<password>'
  And user search quote on the basis of 'Email'
  Then submitted quote is displayed
  And user validates all the details for 'ELE' submitted quote
  And user validates below mandatory fields
    |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
    |ELE     |VERBALLYACCEPTED|RESIDENTIAL |COR      |RSOT-EV |6001456296|N                             |N                             |N                      |                        |EMAIL        |
  And user validates all the details for 'GAS' submitted quote
  And user validates below mandatory fields
    |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
    |GAS     |VERBALLYACCEPTED|RESIDENTIAL |COR      |RSOT-GV |5330396438|N                             |N                             |N                      |                        |EMAIL        |

  Examples:
    |customerStatus|fuelType|planName  |folderName                           |username|password                                    |
    |New           |BOTH    |Basic Home|E2E_New_Resi_NonMoving_$50_VIC_NON_EA|abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

    #done
  Scenario Outline: Submit a quote for new residential non moving customer for NSW with FRMP/FRO as NON_EA
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType|connectionAddress                       | movingType|propertyType|solarOption|
      |RES         |14 Waterside Crescent, EARLWOOD NSW 2206|Non-Moving |Renter      |No         |
    And user selects carbon neutral option
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus| firstName| lastName|idType        |
      |RES          |RES        |New           | testNonMNSWNONEA|test     |Driver License|
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |No          |No         |CC             |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices|GaslifeSupportDevices                             |
      |Yes              |BOTH    |Ele Other             |Medically Required Heating and/or Air Conditioning|
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting using '<username>' and '<password>'
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |COR      |RCPP-EN |4102810387|N                             |N                             |Y                      |OTHER                   |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |COR      |RCPP-GN |5240787742|N                             |N                             |Y                      |GLSMRHAC                |EMAIL        |

    Examples:
      |customerStatus|fuelType|planName |folderName                            |username|password                                    |
      |New           |BOTH    |No Frills|E2E_New_Resi_NonMoving_$50_NSW_NON_EA|abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

    #Done - issue
  Scenario Outline: Submit a quote for new residential non moving customer for QLD with FRMP/FRO as NON_EA
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType|connectionAddress                      | movingType|propertyType|solarOption|
      |RES         |90 Coach Road West, MORAYFIELD QLD 4506|Non-Moving |Renter      |No         |
    And user selects carbon neutral option
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus| firstName| lastName|idType        |
      |RES          |RES        |New           | test     |test     |Driver License|
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
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting using '<username>' and '<password>'
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |COR      |TOPH-EQ |QB11474971|N                             |N                             |Y                      |OTHER                   |EMAIL        |

    Examples:
      |customerStatus|fuelType|planName|folderName                               |username|password                                    |
      |New           |ELE     |Total Plan  |E2E_New_Resi_NonMoving_$50_QLD_NON_EA|abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

    #Negative Scenario

    #done
  Scenario Outline: Submit a quote for new residential non moving customer for SA with FRMP/FRO as NON_EA
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType|connectionAddress                   | movingType|propertyType|solarOption|
      |RES         |6 Kipling Avenue, GLENGOWRIE SA 5044|Non-Moving |Renter      |No         |
    And user selects carbon neutral option
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus| firstName| lastName|idType        |
      |RES          |RES        |New           | testNonMSANONEA|test     |Driver License|
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
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting using '<username>' and '<password>'
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |COR      |RSOT-ES |2002332288|N                             |N                             |Y                      |OTHER                   |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |COR      |RSOT-GS |5510730594|                              |                             |N                      |                        |EMAIL        |

    Examples:
      |customerStatus|fuelType|planName|folderName                              |username|password                                    |
      |New           |BOTH    |Basic Home|E2E_New_Resi_NonMoving_$50_SA_NON_EA|abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

    #Negative Scenario
  #done
  Scenario Outline: Submit a quote for new residential non moving customer for ACT with FRMP/FRO as NON_EA
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType| connectionAddress                | movingType|propertyType|solarOption|
      |RES         | 138 Narden Street, CRACE ACT 2911|Non-Moving     |Renter      |No         |
    And user selects carbon neutral option
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|idType        |medicareType |
      |RES         |RES        |New           | testNonMACTNONEA|test     |Driver License|             |
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |Yes         |No         |               |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                        |GaslifeSupportDevices|
      |Yes              |BOTH    |Crigler Najjar Syndrome Phototherapy Equipment|Gas Other            |
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting using '<username>' and '<password>'
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |COR      |TOPH-EA |7001183574|N                             |N                             |Y                      |LSCNSPE                 |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |COR      |TOPH-GA |5265774405|N                             |N                             |Y                      |OTHER                   |EMAIL        |

    Examples:
      |customerStatus|fuelType|planName  |folderName                           |username|password                                    |
      |New           |BOTH    |Total Plan|E2E_New_Resi_NonMoving_$50_ACT_NON_EA|abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

    # New customer non-moving with FRMP/FRO as EA - Negative Scenario
  #Defect @50CreditExtensionNonMoving

  Scenario Outline: Submit a quote for new residential non moving customer for VIC with FRMP/FRO as EA
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType|connectionAddress               | movingType|propertyType|solarOption|
      |RES         |19 Georgia Grove, CORIO VIC 3214|Non-Moving |Renter      |No         |
    And user selects carbon neutral option
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus| firstName| lastName|idType        |
      |RES          |RES        |New           | testNonMVICEA|test     |Driver License|
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
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting using '<username>' and '<password>'
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |PS       |TOPH-EV |6203117685|N                             |N                             |Y                      |OTHER                   |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |PS       |TOPH-GV |5330248740|N                             |N                             |Y                      |GLSMRHAC                |EMAIL        |

    Examples:
      |customerStatus|fuelType|planName|folderName                              |username|password                                    |
      |New           |BOTH    |Total Plan  |E2E_New_Resi_NonMoving_$50_VIC_EA|abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

  #defect @50CreditExtensionNonMoving
  Scenario Outline: Submit a quote for new residential non moving customer for NSW with FRMP/FRO as EA
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType|connectionAddress                | movingType|propertyType|solarOption|
      |RES         |5 Pine Court, BLUE HAVEN NSW 2262|Non-Moving |Renter      |No         |
    And user selects carbon neutral option
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus| firstName| lastName|idType        |
      |RES          |RES        |New           | testNonMNSWEA     |test     |Driver License|
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |No          |No         |CC             |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices|GaslifeSupportDevices                             |
      |No              |BOTH    |Ele Other             |Medically Required Heating and/or Air Conditioning|
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting using '<username>' and '<password>'
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |PS       |RSOT-EN |4102403140|                              |                               |N                     |                        |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |PS       |RSOT-GN |5240616472|                              |                               |N                     |                        |EMAIL        |

    Examples:
      |customerStatus|fuelType|planName  |folderName                       |username|password                                    |
      |New           |BOTH    |Basic Home|E2E_New_Resi_NonMoving_$50_NSW_EA|abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

    #done
  Scenario Outline: Submit a quote for new residential non moving customer for QLD with FRMP/FRO as EA
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType|connectionAddress                       | movingType|propertyType|solarOption|
      |RES         |21 Halyard Court, DECEPTION BAY QLD 4508|Non-Moving |Renter      |No         |
    And user selects carbon neutral option
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus| firstName| lastName|idType        |
      |RES          |RES        |New           | testNonMQLDEA     |test     |Driver License|
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |No          |No         |CC             |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices|GaslifeSupportDevices                             |
      |No              |ELE     |Ele Other             |Medically Required Heating and/or Air Conditioning|
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting using '<username>' and '<password>'
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |PS       |RCPP-EQ |QB10025146|                              |                             |N                       |                        |EMAIL        |

    Examples:
      |customerStatus|fuelType|planName|folderName                           |username|password                                    |
      |New           |ELE     |No Frills|E2E_New_Resi_NonMoving_$50_QLD_EA|abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

#Negative Scenario
    #done
  Scenario Outline: Submit a quote for new residential non moving customer for SA with FRMP/FRO as EA
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType|connectionAddress                        | movingType|propertyType|solarOption|
      |RES         |3 Mowbray Crescent, FAIRVIEW PARK SA 5126|Non-Moving |Renter      |No         |
    And user selects carbon neutral option
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus| firstName| lastName|idType        |
      |RES          |RES        |New           | testNonMSAEA     |test     |Driver License|
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |No          |No         |CC             |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices|GaslifeSupportDevices                             |
      |Yes              |BOTH    |Ele Other             |Medically Required Heating and/or Air Conditioning|
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting using '<username>' and '<password>'
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |PS       |TOPH-ES |2001177655|N                             |N                             |Y                      |OTHER                   |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |PS       |TOPH-GS |5510166114|N                             |N                             |N                      |GLSMRHAC                |EMAIL        |

    Examples:
      |customerStatus|fuelType|planName|folderName                          |username|password                                    |
      |New           |BOTH    |Total Plan  |E2E_New_Resi_NonMoving_$50_SA_EA|abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

    # New customer non-moving with FRMP/FRO as UNKNOWN
  #need to find test data
  Scenario Outline: Submit a quote for new residential non moving customer for VIC with FRMP/FRO as UNKNOWN
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType|connectionAddress               | movingType|propertyType|solarOption|
      |RES         |19 Georgia Grove, CORIO VIC 3214|Non-Moving |Renter      |No         |
    And user selects carbon neutral option
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus| firstName| lastName|idType        |
      |RES          |RES        |New           | test     |test     |Driver License|
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
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting using '<username>' and '<password>'
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |COR      |RCPP-EV |6203117685|N                             |N                             |Y                      |OTHER                   |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |COR      |RCPP-GV |5330248740|N                             |N                             |Y                      |GLSMRHAC                |EMAIL        |

    Examples:
      |customerStatus|fuelType|planName|folderName                                |username|password                                    |
      |New           |BOTH    |No Frills|E2E_New_Resi_NonMoving_$50_VIC_UNKNOWN|abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

 #data updated
  Scenario Outline: Submit a quote for new residential non moving customer for NSW with FRMP/FRO as UNKNOWN
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType|connectionAddress                     | movingType|propertyType|solarOption|
      |RES         |71b Waterview Street, WOY WOY NSW 2256|Non-Moving |Renter      |No         |
    And user selects carbon neutral option
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus| firstName| lastName|idType        |
      |RES          |RES        |New           | test     |test     |Driver License|
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |No          |No         |CC             |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices|GaslifeSupportDevices                             |
      |Yes              |BOTH    |Ele Other             |Medically Required Heating and/or Air Conditioning|
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting using '<username>' and '<password>'
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |COR      |TOPH-EN |          |N                             |N                             |Y                      |OTHER                   |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |COR      |TOPH-GN |          |N                             |N                             |Y                      |GLSMRHAC                |EMAIL        |

    Examples:
      |customerStatus|fuelType|planName|folderName                                |username|password                                    |
      |New           |BOTH    |Total Plan  |E2E_New_Resi_NonMoving_$50_NSW_UNKNOWN|abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

 #need to find test data
  Scenario Outline: Submit a quote for new residential non moving customer for QLD with FRMP/FRO as UNKNOWN
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType|connectionAddress                       | movingType|propertyType|solarOption|
      |RES         |21 Halyard Court, DECEPTION BAY QLD 4508|Non-Moving |Renter      |No         |
    And user selects carbon neutral option
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus| firstName| lastName|idType        |
      |RES          |RES        |New           | test     |test     |Driver License|
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
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting using '<username>' and '<password>'
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |COR      |RSOT-EQ |QB10025146|N                             |N                             |Y                      |OTHER                   |EMAIL        |

    Examples:
      |customerStatus|fuelType|planName|folderName                                |username|password                                    |
      |New           |ELE     |Basic Home  |E2E_New_Resi_NonMoving_$50_QLD_UNKNOWN|abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

 #need to find test data
  #Negative Scenario
  Scenario Outline: Submit a quote for new residential non moving customer for SA with FRMP/FRO as UNKNOWN
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType|connectionAddress               | movingType|propertyType|solarOption|
      |RES         |19 Kings Court, ADELAIDE SA 5000|Non-Moving |Renter      |No         |
    And user selects carbon neutral option
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus| firstName| lastName|idType        |
      |RES          |RES        |New           | test     |test     |Driver License|
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
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting using '<username>' and '<password>'
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |COR      |RCPP-ES |          |N                             |N                             |Y                      |OTHER                   |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |COR      |RCPP-GS |          |N                             |N                             |N                      |                        |EMAIL        |

    Examples:
      |customerStatus|fuelType|planName|folderName                               |username|password                                    |
      |New           |BOTH    |No Frills|E2E_New_Resi_NonMoving_$50_SA_UNKNOWN|abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|
