@E2E @ExistingCustomerTesting
Feature:E2E scenario for existing residential non moving customer for $50 credit extension
#testExNonMVICEA
  Scenario Outline: Submit a quote for existing residential non moving customer for VIC with FRMP/FRO as EA
  Given user has opened the website link in a browser and creates '<folderName>' to save evidences
  And user has navigated to 'RES' plans page
  And user have selected fuel as "<fuelType>"
  When user clicks on the verify modal window on 'RES' page
  And user verifies the account through verify account journey for residential customer
    |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |postcode |idType |idNumber |
    |RES          |verify account |8513751442       |3244400209       |3163     |dob    |01011980 |
  And user selects '<planName>'
  And user moves on to fill the qualifier
  And user provides all other details on qualifier page for Existing customer
    |customerType|movingType |propertyType |solarOption  |
    |RES         |Non-Moving |Owner        |No           |
  And user provides all details on checkout details page
    |customerType |journey    |customerStatus| firstName      | lastName|idType        |
    |RES          |RES        |Existing      | test|test     |Driver License|
  And user clicks on 'Review your order' button and navigates to review page
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
    |ELE     |VERBALLYACCEPTED|RESIDENTIAL |PS       |RCPP-EV |6407348771|N                             |N                             |Y                      |LSIPDM                  |EMAIL        |
  And user validates all the details for 'GAS' submitted quote
  And user validates below mandatory fields
    |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
    |GAS     |VERBALLYACCEPTED|RESIDENTIAL |PS       |RCPP-GV |5310611153|N                             |N                             |N                      |                        |EMAIL        |

  Examples:
    |planName |folderName                            |fuelType|username|password                                    |
    |No Frills|E2E_Existing_Resi_NonMoving_$50_VIC_EA|BOTH    |abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|
#testExNonMNSWEA
  Scenario Outline: Submit a quote for existing residential non moving customer for NSW with FRMP/FRO as EA
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |0053368171   |Postcode           |2322            |dob   |01011980|
    And user provides all other details on qualifier page for Existing customer
      |customerType|movingType |propertyType |solarOption  |
      |RES         |Non-Moving |Owner        |No           |
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus| firstName      | lastName|idType        |
      |RES          |RES        |Existing      | test|test     |Driver License|
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                  |GaslifeSupportDevices       |
      |Yes              |GAS     |                                        |Medically Required Hot Water|
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
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |PS       |TOPH-EN |4102236498|                              |                              |N                      |                        |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |PS       |TOPH-GN |5240811020|N                             |N                             |Y                      |GLSMRHW                 |EMAIL        |

    Examples:
      |customerStatus|planName  |folderName                            |fuelType  |username|password                                    |
      |Existing      |Total Plan|E2E_Existing_Resi_NonMoving_$50_NSW_EA|BOTH      |abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|
#testExNonMQLDEA
  Scenario Outline: Submit a quote for existing residential non moving customer for QLD with FRMP/FRO as EA
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    And user have selected fuel as "<fuelType>"
    When user clicks on the verify modal window on 'RES' page
    And user verifies the account through verify account journey for residential customer
      |customer_type|modal_option   |elecAccountNumber|postcode |idType |idNumber |
      |RES          |verify account |2802690723       |4132     |dob    |01011980 |
    And user selects '<planName>'
    And user moves on to fill the qualifier
    And user provides all other details on qualifier page for Existing customer
      |customerType|movingType |propertyType |solarOption  |
      |RES         |Non-Moving |Owner        |No           |
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus| firstName| lastName|idType        |
      |RES          |RES        |Existing      | test|test     |Driver License|
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                  |GaslifeSupportDevices       |
      |No               |     |                                         |                            |
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
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |PS       |GRT-EQ  |QB09795804|                             |                              |N                      |                  |EMAIL        |

    Examples:
    |planName   |folderName                             |fuelType|username|password                                    |
    |Basic Home QLD|E2E_Existing_Resi_NonMoving_$50_QLD_EA|ELE     |abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

    #testExNonMSAEA
  Scenario Outline: Submit a quote for existing residential non moving customer for SA with FRMP/FRO as EA
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |8321102099   |Postcode           |5158            |dob   |01011980|
    And user provides all other details on qualifier page for Existing customer
      |customerType|movingType |propertyType |solarOption  |
      |RES         |Non-Moving |Owner        |No           |
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus| firstName| lastName|idType        |
      |RES          |RES        |Existing      | test|test     |Driver License|
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                  |GaslifeSupportDevices       |
      |Yes              |BOTH    |Intermittent Peritoneal Dialysis Machine|Medically Required Hot Water|
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
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |PS       |RCPP-ES |2001308560|N                             |N                             |Y                      |LSIPDM                  |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |PS       |RCPP-GS |5510350927|N                             |N                             |Y                      |GLSMRHW                 |EMAIL        |

    Examples:
      |customerStatus|planName |folderName                           |fuelType|username|password                                   |
      |Existing      |No Frills|E2E_Existing_Resi_NonMoving_$50_SA_EA|BOTH    |abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

    #testExNonMACTEA
  Scenario Outline: Submit a quote for existing residential non moving customer for ACT with FRMP as NON_EA and FRO as EA
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    And user have selected fuel as "<fuelType>"
    When user clicks on the verify modal window on 'RES' page
    And user verifies the account through verify account journey for residential customer
      |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |postcode |idType |idNumber |
      |RES          |verify account |0808021000       |5380160000       |2913     |dob    |01011980 |
    And user selects '<planName>'
    And user moves on to fill the qualifier
    And user provides all other details on qualifier page for Existing customer
      |customerType|movingType |propertyType |solarOption  |
      |RES         |Non-Moving |Owner        |No           |
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus| firstName| lastName|idType        |
      |RES          |RES        |Existing      | test|test     |Driver License|
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                  |GaslifeSupportDevices       |
      |No               |     |                                           |                            |
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
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |COR      |TOPH-EA |7001143726|                              |                              |N                      |                        |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |PS       |TOPH-GA |5260069937|                              |                              |N                      |                        |EMAIL        |

    Examples:
      |planName |folderName                             |fuelType|username|password                                    |
      |Total Plan|E2E_Existing_Resi_NonMoving_$50_ACT_EA|BOTH    |abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

    #testExNonMVICTEA
  Scenario Outline: Submit a quote for existing residential non moving customer for VIC with FRMP/FRO as EA and plan selected as Total Plan Plus
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customer_type>' plans page
    And user have selected fuel as "<fuelType>"
    When user clicks on the verify modal window on '<customer_type>' page
    And user verifies the account through verify account journey for residential customer
      |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |postcode |idType |idNumber |
      |RES          |verify account |8373520946       |2816302453       |3153     |dob    |01011980 |
    And user selects '<planName>'
    And user moves on to fill the qualifier
    And user provides all other details on qualifier page for Existing customer
      |customerType|movingType |propertyType |solarOption  |
      |RES         |Non-Moving |Owner        |No           |
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus|firstName       |lastName|idType        |
      |RES         |RES        |Existing      |test|test    |Driver License|
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                    |GaslifeSupportDevices  |
      |Yes              |BOTH    |Intermittent Peritoneal Dialysis Machine  |Gas Other              |
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
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |PS       |SWSRH-EV|6305325960|N                             |N                             |Y                      |LSIPDM                  |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |PS       |SWSRH-GV|5310602455|N                             |N                             |Y                      |OTHER                   |EMAIL        |

    Examples:
      |folderName                               |customer_type |fuelType |planName       |username|password                                    |
      |E2E_VerifyAccount_Residential_NonMoving  |RES           |BOTH     |Total Plan Plus|abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|
