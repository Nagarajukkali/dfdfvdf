@E2E
Feature:E2E scenario for existing business moving and non moving customer

  Scenario Outline: Submit a quote for existing business moving customer
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'BUS' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |8541728674   |ABN                |13756067200     |dob   |01011980|
    And user provides all other details on qualifier page for Existing customer
      |customerType|movingType |connectionAddress                         |solarOption|
      |BUS         |Moving     |36 Gregory Street West, WENDOUREE VIC 3355|No         |
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|businessType|
      |BUS         |BUS        |Existing      | test     |test     |ABN         |
    And user validates details on checkout details page
      |sourceSystem   |journey    |fuelType   |
      |<sourceSystem> |<journey>  |<fuelType> |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices     |GaslifeSupportDevices|
      |Yes              |BOTH    |Ventilator For Life Support|Gas Other            |
    And user verifies selected plan details for '<fuelType>'
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |BSME         |Existing       |
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|BUSINESS    |ENE      |BSOT-EV |6203822385|N                             |N                             |Y                      |LSVFLS                  |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|BUSINESS    |ENE      |BSOT-GV |5330956738|N                             |N                             |Y                      |OTHER                   |EMAIL        |

    Examples:
      |customerStatus|fuelType|planName         |folderName             |state|sourceSystem  |journey  |AAH  |DD |
      |Existing      |BOTH    |Basic Business   |E2E_Existing_Bus_Moving|VIC  |Quote Tool    |Move Home|No   |No |

  Scenario Outline: Submit a quote for existing business non moving customer with LS, select dual fuel and verify electricity account
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'BUS' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |6261447599   |ABN                |63824650000     |dob   |01011980|
    And user provides all other details on qualifier page for Existing customer
      |customerType|movingType |solarOption|
      |BUS         |Non-Moving |No         |
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|businessType|
      |BUS         |BUS        |Existing      | test     |test     |ABN         |
    And user validates details on checkout details page
      |sourceSystem   |journey    |fuelType   |
      |<sourceSystem> |<journey>  |<fuelType> |
    And user clicks on 'Review your order' button and navigates to review page
    Then Life support section is displayed on Review page as per selected "<fuelType>" and verified "<accountType>"
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                      |GaslifeSupportDevices       |
      |No               |ELE     |                                            |                            |
    And user verifies selected plan details for '<fuelType>'
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |
    And user submits the quote
    And user lands on checkout complete page
    And user validates details on checkout complete page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |BSME         |Existing       |
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|BUSINESS    |PS       |TOPB-EV |6203822385|N                             |N                             |Y                      |LSOC                    |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|BUSINESS    |PS       |TOPB-GV |5330956738|N                             |N                             |N                      |                        |EMAIL        |

    Examples:
      |customerStatus|planName         |folderName                |fuelType|accountType|sourceSystem  |journey    |AAH  |DD |
      |Existing      |Total Business   |E2E_Existing_Bus_NonMoving|BOTH    |ELE        |Quote Tool    |Plan Switch|No   |No |


