@E2E
Feature:E2E scenario for existing residential moving customer for $50 credit extension
  @50CreditExtensionMovingExisting1
  #testExMOVVICEA
Scenario Outline: Submit a quote for existing residential moving customer for VIC with FRMP/FRO as EA
  Given user has opened the website link in a browser and creates '<folderName>' to save evidences
  And user has navigated to 'RES' plans page
  And user have selected fuel as "<fuelType>"
  When user clicks on the verify modal window on 'RES' page
  And user verifies the account through verify account journey for residential customer
    |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |postcode |idType |idNumber |
    |RES          |verify account |5564281925       |1956336357       |3840     |dob    |01011980 |
  And user selects '<planName>'
  And user moves on to fill the qualifier
  And user provides all other details on qualifier page for Existing customer
    |customerType|movingType |connectionAddress                  |propertyType |solarOption|
    |RES         |Moving     |25 Churchill Road, MORWELL VIC 3840|Renter       |No         |
  And user selects carbon neutral option
  And user provides all details on checkout details page
    |customerType|journey    |customerStatus| firstName     | lastName|idType        |
    |RES         |RES        |Existing      | test          |test     |Driver License|
  And user selects answer for property renovation question for '<state>'
  And user chooses "<optDisconnection>" for disconnection
  And user opts for AAH and DD
    |optAAHOption|optDDOption|directDebitType|
    |No          |No         |Bank           |
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
    |ELE     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |TOPH-EV |          |N                             |N                             |Y                      |OTHER                   |EMAIL        |
  And user validates all the details for 'GAS' submitted quote
  And user validates below mandatory fields
    |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
    |GAS     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |TOPH-GV |          |N                             |N                             |Y                      |OTHER                   |EMAIL        |

  Examples:
  |fuelType|planName  |folderName                         |state|optDisconnection|username|password                                    |
  |BOTH    |Total Plan|E2E_Existing_Resi_Moving_$50_VIC_EA|VIC  |No              |abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|
  @50CreditExtensionMovingExisting
  Scenario Outline: Submit a quote for existing residential moving customer for NSW with FRMP/FRO as EA
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |5712581190   |Postcode           |2283            |dob   |01011980|
    And user provides all other details on qualifier page for Existing customer
      |customerType|movingType |connectionAddress                     |propertyType |solarOption|
      |RES         |Moving     |16 Sandra Street, FENNELL BAY NSW 2283|Renter       |No         |
    And user selects carbon neutral option
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|idType        |
      |RES         |RES        |Existing      | test     |test     |Driver License|
    And user selects answer for property renovation question for '<state>'
    And user chooses "<optDisconnection>" for disconnection
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |No          |Yes        |Bank           |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices|GaslifeSupportDevices|
      |No               |BOTH    |Ele Other             |Gas Other            |
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
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |RSOT-EN |4102174688|                              |                              |Y                      |                   |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |RSOT-GN |5240479855|                              |                              |N                     |                   |EMAIL        |

    Examples:
      |customerStatus|fuelType|planName  |folderName                         |state|optDisconnection|username|password                                    |
      |Existing      |BOTH    |Basic Home|E2E_Existing_Resi_Moving_$50_NSW_EA|NSW  |No              |abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|
  @50CreditExtensionMovingExisting
  Scenario Outline: Submit a quote for existing residential moving customer for QLD with FRMP/FRO as EA
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
      |customerType|movingType |connectionAddress                  |propertyType |solarOption|
      |RES         |Moving     |18 Bryant Court, SILKSTONE QLD 4304|Renter       |No         |
    And user selects carbon neutral option
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|idType        |
      |RES         |RES        |Existing      | test     |test     |Driver License|
    And user selects answer for property renovation question for '<state>'
    And user chooses "<optDisconnection>" for disconnection
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |Yes         |No        |Bank           |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices|GaslifeSupportDevices|
      |Yes              |ELE    |Ele Other             |            |
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
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |RCPP-EQ |QB02707217|N                             |N                             |Y                      |OTHER                   |EMAIL        |

    Examples:
      |fuelType|planName  |folderName                         |state|optDisconnection|username|password                                    |
      |ELE     |No Frills|E2E_Existing_Resi_Moving_$50_QLD_EA |QLD  |No              |abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|
  @50CreditExtensionMovingExisting
    #Negative Scenario
  Scenario Outline: Submit a quote for existing residential moving customer for SA with FRMP/FRO as EA
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |1589867093   |Postcode           |5109            |dob   |01011980|
    And user provides all other details on qualifier page for Existing customer
      |customerType|movingType |connectionAddress                        |propertyType |solarOption|
      |RES         |Moving     |10 Austral Street, SALISBURY EAST SA 5109|Renter       |No         |
    And user selects carbon neutral option
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|idType        |
      |RES         |RES        |Existing      | test     |test     |Driver License|
    And user selects answer for property renovation question for '<state>'
    And user chooses "<optDisconnection>" for disconnection
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |No          |Yes        |Bank           |
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
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |TOPH-ES |2001476634|N                             |N                             |Y                      |OTHER                   |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |TOPH-GS |5510125399|N                             |N                             |Y                      |OTHER                   |EMAIL        |

    Examples:
      |customerStatus|fuelType|planName  |folderName                        |state|optDisconnection|username|password                                    |
      |Existing      |BOTH    |Total Plan|E2E_Existing_Resi_Moving_$50_SA_EA|SA   |No              |abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|
  @50CreditExtensionMovingExisting
    #Negative Scenario
  Scenario Outline: Submit a quote for existing residential moving customer for ACT with FRMP/FRO as EA
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    And user have selected fuel as "<fuelType>"
    When user clicks on the verify modal window on 'RES' page
    And user verifies the account through verify account journey for residential customer
      |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |postcode |idType |idNumber |
      |RES          |verify account |6784499133       |5756853487       |2614     |dob    |01011980 |
    And user selects '<planName>'
    And user moves on to fill the qualifier
    And user provides all other details on qualifier page for Existing customer
      |customerType|movingType |connectionAddress               |propertyType |solarOption|
      |RES         |Moving     |1 Moroak Street, HAWKER ACT 2614|Renter       |No         |
    And user selects carbon neutral option
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|idType        |
      |RES         |RES        |Existing      | test     |test     |Driver License|
    And user selects answer for property renovation question for '<state>'
    And user chooses "<optDisconnection>" for disconnection
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |Yes         |Yes        |Bank           |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices|GaslifeSupportDevices|
      |No              |BOTH    |Ele Other             |Gas Other            |
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
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |RSOT-EA |4311150544|                              |                              |N                      |                   |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |RSOT-GA |5240924834|                              |                              |N                      |                   |EMAIL        |

    Examples:
      |fuelType|planName  |folderName                         |state|optDisconnection|username|password                                    |
      |BOTH    |Basic Home|E2E_Existing_Resi_Moving_$50_ACT_EA|ACT  |No              |abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

  @50CreditExtensionMovingExisting
    #Negative Scenario
  Scenario Outline: Submit a quote for existing residential moving customer for VIC with FRMP/FRO as EA
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customer_type>' plans page
    And user have selected fuel as "<fuelType>"
    When user clicks on the verify modal window on '<customer_type>' page
    And user verifies the account through verify account journey for residential customer
      |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |postcode |idType |idNumber |
      |RES          |verify account |7810021000       |3720611000       |3672     |dob    |01011980 |
    And user selects '<planName>'
    And user moves on to fill the qualifier
    And user provides all other details on qualifier page for Existing customer
      |customerType|movingType |connectionAddress              |propertyType |solarOption  |
      |RES         |Moving     |42 Roe Street, BENALLA VIC 3672|Renter       |No           |
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus|firstName|lastName|idType    |
      |RES         |RES        |Existing      |test     |test    |Passport  |
    And user selects answer for property renovation question for '<state>'
    And user chooses "<optDisconnection>" for disconnection
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                        |GaslifeSupportDevices        |
      |Yes              |BOTH    |Chronic Positive Airways Pressure Respirator  |Medically Required Hot Water |
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
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |SWSRH-EV|6407557087|N                             |N                             |Y                      |LSCPAPR                 |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |SWSRH-GV|5321574765|N                             |N                             |Y                      |GLSMRHW                 |EMAIL        |

    Examples:
      |folderName                               |customer_type |fuelType |planName       |optDisconnection |state  |username|password                                    |
      |E2E_VerifyAccount_Residential_Moving     |RES           |BOTH     |Total Plan Plus|No               |VIC    |abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

  @50CreditExtensionMovingExisting
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
      |elePlan   |gasPlan   |
      |Total Plan|Total Plan|
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|idType        |
      |RES         |RES        |Existing      | test     |test     |Driver License|
    And user selects answer for property renovation question for '<state>'
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
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |TOPH-EV |6203712871|N                             |N                             |Y                      |OTHER                   |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |TOPH-GV |5330641914|N                             |N                             |Y                      |OTHER                   |EMAIL        |

    Examples:
      |folderName              |fuelType|state|optDisconnection|movingAddress                             |username|password                                    |
      |E2E_Existing_Resi_Moving|BOTH    |VIC  |No              |21 Carmichael Drive, WYNDHAM VALE VIC 3024|abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

  @50CreditExtensionMovingExisting
  Scenario Outline: Submit a quote for existing residential customer through move house
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    When user has navigated to move house page
    And user enters '<movingAddress>' in address field and selects any available moving date
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |8372937428   |Postcode           |3024            |dob   |01011980|
    And user provides all other details on qualifier page
      |customerType|movingType|connectionAddress               |propertyType |solarOption|
      |RES         |NA        |5 Wilkies Street, BULLI NSW 2516|Renter       |No         |
    And user selects plans on checkout details page
      |elePlan        |gasPlan   |
      |Total Plan Plus|Total Plan|
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|idType        |
      |RES         |RES        |Existing      | test     |test     |Driver License|
    And user selects answer for property renovation question for '<state>'
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
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |SWSRH-EN|6203712871|N                             |N                             |Y                      |OTHER                   |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |TOPH-GN |5330641914|N                             |N                             |Y                      |OTHER                   |EMAIL        |

    Examples:
      |folderName              |fuelType|state|optDisconnection|movingAddress                   |username|password                                    |
      |E2E_Existing_Resi_Moving|BOTH    |NSW  |No              |5 Wilkies Street, BULLI NSW 2516|abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|
