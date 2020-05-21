
Feature:Regression scenarios
#1
  Scenario Outline: Submit a quote for new residential moving customer
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType| connectionAddress                        | movingType|propertyType|solarOption|
      |RES         | 42 Brownlow Drive, DIAMOND CREEK VIC 3089|Moving     |Renter      |No         |
    And user selects carbon neutral option
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|idType        |medicareType |
      |RES         |RES        |New           | test     |test     |Driver License|             |
    And user selects answer for property renovation question for '<state>'
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
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |TOPH-EV |6305727918|N                             |N                             |Y                      |LSCNSPE                 |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |TOPH-GV |5320087624|N                             |N                             |Y                      |OTHER                   |EMAIL        |

    Examples:
      |customerStatus|fuelType|planName  |folderName         |state|username|password                                    |
      |New           |BOTH    |Total Plan|E2E_New_Resi_Moving|VIC  |abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

    #2
  Scenario Outline: Submit a quote for new residential non moving customer
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType|connectionAddress                       | movingType|propertyType|solarOption|
      |RES         |14 Waterside Crescent, EARLWOOD NSW 2206|Non-Moving |Renter      |No         |
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus| firstName| lastName|idType        |
      |RES          |RES        |New           | test|test     |Driver License|
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |Yes         |No         |               |
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
      |customerStatus|fuelType|planName |folderName            |username|password                                    |
      |New           |BOTH    |No Frills|E2E_New_Resi_NonMoving|abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

    #3
  Scenario Outline: Submit a quote for existing moving residential customer through verify account
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    And user have selected fuel as "<fuelType>"
    When user clicks on the verify modal window on 'RES' page
    And user verifies the account through verify account journey for residential customer
      |customer_type|modal_option   |elecAccountNumber|postcode |idType |idNumber |
      |RES          |verify account |1636623646       |4304     |dob    |01011980 |
    And user selects '<planName>'
    And user moves on to fill the qualifier
    And user provides all other details on qualifier page for Existing customer
      |customerType|movingType |connectionAddress                  |propertyType |solarOption|state|
      |RES         |Moving     |18 Bryant Court, SILKSTONE QLD 4304|Renter       |No         |QLD  |
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|idType        |
      |RES         |RES        |Existing      | test|test     |Driver License|
    And user selects answer for property renovation question for '<state>'
    And user chooses "<optDisconnection>" for disconnection
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |No          |Yes        |CC             |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices|GaslifeSupportDevices|
      |No               |ELE    |Ele Other             |            |
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
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |RCPP-EQ |          |                              |                              |N                      |                        |EMAIL        |

    Examples:
      |fuelType|planName  |folderName                         |state|optDisconnection|username|password                                    |
      |ELE     |No Frills|E2E_VerifyAccount_Residential_Moving|QLD  |No              |abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

    #4
  Scenario Outline: Submit a quote for existing residential non moving customer with LS, select dual fuel and verify gas account
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |5134624952   |Postcode           |2516            |dob   |01011980|
    And user provides all other details on qualifier page for Existing customer
      |customerType|movingType |propertyType |solarOption  |
      |RES         |Non-Moving |Owner        |No           |
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus| firstName| lastName|idType        |
      |RES          |RES        |Existing      | test     |test     |Driver License|
    And user opts for concession card
    And user clicks on 'Review your order' button and navigates to review page
    Then Life support section is displayed on Review page as per selected "<fuelType>" and verified "<accountType>"
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                  |GaslifeSupportDevices       |
      |Yes              |ELE     |Intermittent Peritoneal Dialysis Machine|                            |
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    And user lands on checkout complete page
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting using '<username>' and '<password>'
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |PS       |RCPP-EN |4311150544|N                             |N                             |Y                      |LSIPDM                  |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |PS       |RCPP-GN |5240924834|N                             |N                             |Y                      |GLSMRHW                 |EMAIL        |

    Examples:
      |customerStatus|planName |folderName                 |fuelType|accountType|username|password                                    |
      |Existing      |No Frills|E2E_Existing_Resi_NonMoving|BOTH    |GAS        |abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

    #5
  Scenario Outline: Submit a quote for existing residential customer through move house
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    When user has navigated to move house page
    And user enters '<movingAddress>' in address field and selects any available moving date
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |8372937428   |Postcode           |3024            |dob   |01011980|
    And user provides all other details on qualifier page
      |customerType|movingType|connectionAddress                         |propertyType |solarOption|
      |RES         |NA        |21 Carmichael Drive, WYNDHAM VALE VIC 3024|Renter       |No         |
    And user selects plans on checkout details page
      |elePlan        |gasPlan        |
      |Total Plan Plus|Total Plan Plus|
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|idType        |
      |RES         |RES        |Existing      | test|test     |Driver License|
    And user selects answer for property renovation question for '<state>'
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |No          |Yes        |Bank           |
    And user chooses "<optDisconnection>" for disconnection
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices|GaslifeSupportDevices|
      |Yes              |BOTH    |Ele Other             |Gas Other            |
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
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |SWSRH-EV|6203712871|N                             |N                             |Y                      |OTHER                   |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |SWSRH-GV|5330641914|N                             |N                             |Y                      |OTHER                   |EMAIL        |

    Examples:
      |folderName                 |fuelType|state|optDisconnection|movingAddress                             |username|password                                    |
      |E2E_Existing_Resi_MoveHouse|BOTH    |VIC  |No              |21 Carmichael Drive, WYNDHAM VALE VIC 3024|abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

   #6
  @regression
  Scenario Outline: Submit a quote for new business moving customer
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'BUS' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType| customerStatus| connectionAddress                         |movingType|propertyType|solarOption|
      |BUS         |New            | 36 Gregory Street West, WENDOUREE VIC 3355|Moving    |            |No         |
    And user provides all details on checkout details page
      |customerType|journey    | firstName| lastName|businessType|
      |BUS         |BUS        | test     |test     |ABN         |
    And user selects answer for property renovation question for '<state>'
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |No          |No         |               |
    And user opts for concession card
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices |GaslifeSupportDevices                             |
      |No               |BOTH    |Kidney Dialysis Machine|Medically Required Heating and/or Air Conditioning|
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
      |ELE     |VERBALLYACCEPTED|BUSINESS    |ENE      |BSOT-EV |6203822385|N                             |N                             |N                      |                        |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|BUSINESS    |ENE      |BSOT-GV |5330956738|N                             |N                             |N                      |                        |EMAIL        |

    Examples:
      |customerStatus|fuelType|planName      |folderName        |state|username|password                                    |
      |New           |BOTH    |Basic Business|E2E_New_Bus_Moving|VIC  |abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

    #7
  @regression
  Scenario Outline: Submit a quote for new business non moving customer
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'BUS' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType| connectionAddress                |movingType|propertyType|solarOption|
      |BUS         |68 Mercer Street, GEELONG VIC 3220|Non-Moving|            |No         |
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|businessType|
      |BUS         |BUS        |New           | test     |test     |ACN         |
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |Yes         |No         |               |
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
      |ELE     |VERBALLYACCEPTED|BUSINESS    |COR      |TOPB-EV |6203142753|N                             |N                             |Y                      |OTHER                   |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|BUSINESS    |COR      |TOPB-GV |5330726895|N                             |N                             |Y                      |GLSMRHAC                |EMAIL        |

    Examples:
      |customerStatus|fuelType|planName      |folderName            |username|password                                    |
      |New           |BOTH    |Total Business|E2E_New_Bus_NonMoving|abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

    #8
  @regression
  Scenario Outline: Submit a quote for existing business moving customer
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'BUS' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue|
      |Existing      |0054845249   |ABN                |17944501400     |pin   |7890   |
    And user provides all other details on qualifier page for Existing customer
      |customerType|movingType |connectionAddress                                 |solarOption|state|
      |BUS         |Moving     |Shop 8 21 South Coolum Road, COOLUM BEACH QLD 4573|No         |QLD  |
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|businessType|
      |BUS         |BUS        |Existing      | test     |test     |ABN         |
    And user selects answer for property renovation question for '<state>'
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |No          |Yes        |Bank           |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices     |GaslifeSupportDevices|
      |Yes              |ELE     |Ventilator For Life Support|                     |
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
      |ELE     |VERBALLYACCEPTED|BUSINESS    |ENE      |TOPB-EQ |3115761509|N                             |N                             |Y                      |LSVFLS                  |EMAIL        |

    Examples:
      |customerStatus|fuelType|planName     |folderName              |state|username|password                                    |
      |Existing      |ELE     |Total Business|E2E_Existing_Bus_Moving|QLD  |abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|


    #9
  @regression
  Scenario Outline: Submit a quote for existing non moving business customer with life support for both accounts through verify account
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customer_type>' plans page
    And user have selected fuel as "<fuelType>"
    When user clicks on the verify modal window on '<customer_type>' page
    And user verifies the account through verify account journey for business customer
      |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |ABNOrACN     |idType |idNumber  |
      |BUS          |verify account |2870412120       |3231348465       |78538656400  |dob    |01011980  |
    And user selects '<planName>'
    And user moves on to fill the qualifier
    And user provides all other details on qualifier page for Existing customer
      |customerType|movingType |propertyType |solarOption  |
      |BUS         |Non-Moving |Owner        |No           |
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus|firstName|lastName|businessType |
      |BUS         |BUS        |Existing      |test     |test    |ABN          |
    And user clicks on 'Review your order' button and navigates to review page
    Then Life support section is displayed on Review page as per selected "<fuelType>" and verified "<accountType>"
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    And user lands on checkout complete page
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting using '<username>' and '<password>'
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|BUSINESS    |PS       |SWSRB-EV|6305402728|N                             |N                             |Y                      |LSVFLS                  |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|BUSINESS    |PS       |SWSRB-GV|5323580662|N                             |N                             |Y                      |OTHER                   |EMAIL        |

    Examples:
      |folderName                               |customer_type |fuelType |planName                |accountType|username|password                                    |
      |E2E_VerifyAccount_Business_NonMoving     |BUS           |BOTH     |Total Plan Plus Business|BOTH       |abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|


    #10
  @regression
  Scenario Outline: Submit a quote for electricity new connection for residential customer
    Given user has opened the new connection website link in a browser and creates '<folderName>' to save evidences
    When user provides connection details
      |fuelType|customerType|premiseType|state   |postcode|
      |ELE     |RES         |Single     |Victoria|3008    |
    And user provides property details for electricity connection
      |customerType|optionForPoleInstallation|optionForOffPeakLoad|
      |RES         |No                       |No                  |
    And user provides property contacts
      |idType          |state|
      |Driver's Licence|VIC  |
    And user submit the request
    And user clicks on proceed to quote
    And user selects plans on checkout details page
      |elePlan   |
      |Total Plan|
    And user provides dob and id details
      |customerStatus|idType        |
      |New           |Driver License|
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices|
      |Yes              |ELE     |Ele Other             |
    And user submits the quote
    Then user lands on checkout complete page
    Examples:
      |folderName              |
      |E2E_New_Resi_NC_ELE|

    #11
  @regression
  Scenario Outline: Submit a quote for gas new connection for residential customer
    Given user has opened the new connection website link in a browser and creates '<folderName>' to save evidences
    When user provides connection details
      |fuelType|customerType|premiseType|state   |postcode|connectionType    |
      |GAS     |RES         |Single     |Victoria|3008    |Meter Installation|
    And user provides property details for gas connection
      |optionForServiceLineInstallation|optionForSiteClearance|optionForSiteMarking|
      |Yes                             |Yes                   |Yes                 |
    And user selects appliances
    And user provides property contacts
      |fuelType|idType          |state|
      |GAS     |Driver's Licence|VIC  |
    And user submit the request
    And user clicks on proceed to quote
    And user selects plans on checkout details page
      |gasPlan   |
      |Total Plan|
    And user provides dob and id details
      |customerStatus|idType        |
      |New           |Driver License|
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|GaslifeSupportDevices|
      |No               |GAS     |Gas Other            |
    And user submits the quote
    Then user lands on checkout complete page
    Examples:
      |folderName              |
      |E2E_New_Resi_NC_GAS|

    #12
  @regression
  Scenario Outline: Submit a quote for electricity new connection for business customer
    Given user has opened the new connection website link in a browser and creates '<folderName>' to save evidences
    When user provides connection details
      |fuelType|customerType|premiseType|state   |postcode|
      |ELE     |BUS         |Single     |Victoria|3008    |
    And user provides property details for electricity connection
      |customerType|optionForPoleInstallation|optionForOffPeakLoad|optionForAMPS|
      |BUS         |No                       |No                  |Below        |
    And user provides property contacts
      |idType          |state|
      |Driver's Licence|VIC  |
    And user submit the request
    And user clicks on proceed to quote
    And user selects plans on checkout details page
      |elePlan       |
      |Total Business|
    And user provides dob and id details
      |customerStatus|idType  |
      |New           |Passport|
    And user provides business details
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                  |
      |Yes              |ELE     |Intermittent Peritoneal Dialysis Machine|
    And user submits the quote
    Then user lands on checkout complete page
    Examples:
      |folderName        |
      |E2E_New_BUS_NC_ELE|

    #13
  @regression
  Scenario Outline: Submit a quote for offer campaign
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "2000" and clicks on show me plan link
    And user clicks on Add plan button
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType| connectionAddress               | movingType|propertyType|solarOption|
      |RES         | 5 Wilkies Street, BULLI NSW 2516|Moving     |Renter      |No         |
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|idType        |
      |RES         |RES        |New           | test     |test     |Driver License|
    And user selects answer for property renovation question for '<state>'
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
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |TOPH-EN |4311150544|N                             |N                             |Y                      |LSCNSPE                 |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |TOPH-GN |5240924834|N                             |N                             |Y                      |OTHER                   |EMAIL        |

    Examples:
      |customerStatus|fuelType|campaign  |folderName             |state|username|password                                    |
      |New           |BOTH    |offer     |E2E_New_Resi_Camp_OFFER|NSW  |abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

    #14 - Business Campaign

    #15
  Scenario Outline: Verify the RESI Plan switch journey from My Account
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user navigates to my account login page
    When user logs in to my account using '<username>' and '<password>'
    And user clicks on view and change plan accordion for 'ELE'
    And user clicks on compare and switch plan button
    And user selects No for solar question and confirm
    And user selects plans on checkout details page
      |elePlan        |gasPlan   |
      |Total Plan Plus|Total Plan|
    And user provides identification details
      |customerType|customerStatus|idType        |
      |RES         |Existing      |Driver License|
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |Yes         |No         |Bank           |
    And user clicks on 'Review your order' button and navigates to review page
    Then Life support section is displayed on Review page as per selected "BOTH" and verified "BOTH"
    When user submits the quote
    Then user lands on checkout complete page

    Examples:
      |folderName                   |username                               |password                                     |
      |E2E_MyAccount_Residential_PS |Prateek.Chauhan@energyaustralia.com.au |U2FsdGVkX1+0r7zXQlO8CPFbEq3ETA40fGWjpN+WtGM= |

    #16
  Scenario Outline: Verify the RESI Move home journey from My Account
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user navigates to my account login page
    When user logs in to my account using '<username>' and '<password>'
    And user clicks on move home link for 'ELE'
    And user enters service address as '<address>'
    And user selects connection date
    And user selects No for solar question on moving service page
    And user clicks on lets get moving button
    And user selects plans on checkout details page
      |elePlan        |gasPlan   |
      |Total Plan Plus|Total Plan|
    And user provides identification details
      |customerType|customerStatus|idType        |
      |RES         |Existing      |Driver License|
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |No          |Yes        |Bank           |
    And user answers No for home improvements question
    And user chooses "<optDisconnection>" for disconnection
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices   |GaslifeSupportDevices         |
      |Yes              |BOTH    |Kidney Dialysis Machine  |Medically Required Hot Water  |
    And user submits the quote
    Then user lands on checkout complete page

    Examples:
      |folderName                         |address                                  |username                               |password                                     |optDisconnection|
      |E2E_MyAccount_Residential_MoveHome |9 Rodier Street, BALLARAT EAST VIC 3350  |Prateek.Chauhan@energyaustralia.com.au |U2FsdGVkX1+0r7zXQlO8CPFbEq3ETA40fGWjpN+WtGM= |No              |

    #17
  Scenario Outline: Verify the RESI upsell journey from My Account
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user navigates to my account login page
    When user logs in to my account using '<username>' and '<password>'
    And user clicks on compare plans button
    And user selects plans on checkout details page
      |gasPlan        |
      |Total Plan Plus|
    And user opts for concession card
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|GaslifeSupportDevices                                |
      |Yes              |GAS     |Medically Required Heating and/or Air Conditioning   |
    And user submits the quote
    Then user lands on checkout complete page

    Examples:
      |folderName                       |username          |password                                    |
      |E2E_MyAccount_Residential_Upsell |upsell02@test.com |U2FsdGVkX18tkoy+x1GGxXg4gex2qBLzChEHNEvDZyE=|

    #18
  Scenario Outline: Verify the BSME Plan switch journey from My Account
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user navigates to my account login page
    When user logs in to my account using '<username>' and '<password>'
    And user clicks on view and change plan accordion for 'ELE'
    And user clicks on compare and switch plan button
    And user selects No for solar question and confirm
    And user selects plans on checkout details page
      |elePlan         |gasPlan        |
      |Total Business  |Basic Business |
    And user provides business details for My Account journey
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |No          |Yes        |CC             |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption  |fuelType |EleclifeSupportDevices  |GaslifeSupportDevices|
      |Yes                |BOTH     |Oxygen Concentrator    |Gas Other             |
    And user submits the quote
    Then user lands on checkout complete page

    Examples:
      |folderName                |username             |password                                     |
      |E2E_MyAccount_Business_PS |e2e_bsme_ps@test.com |U2FsdGVkX1+ftH+UunfGSZtCIUBjus/t531HwywA6fY= |

