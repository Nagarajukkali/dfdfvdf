@mailingaddress
Feature:E2E scenario for validating different Address types handled in Sales Application

  Scenario Outline: Submit a quote and validate the mailing address is sent as PO BOX
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    Then user validates details on plans page for 'RES'
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType| connectionAddress                     | movingType|propertyType|solarOption|
      |RES         | 42 Brownlow Drive, POINT COOK VIC 3030|Moving     |Renter      |No         |
    And user validates details on checkout details page
      |sourceSystem   |journey    |fuelType   |
      |<sourceSystem> |<journey>  |<fuelType> |
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|idType        |medicareType |
      |RES         |RES        |New           | test     |test     |Driver License|             |
    And user selects mailing address option
      |addressType  |otherAddress              |
      |Other Address|PO Box 22, ALTONA VIC 3018|
    And user selects answer for property renovation question for '<state>'
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |Yes         |Yes        |CC             |
    And user opts for concession card
    And user selects "Post" billing preference option
    And user sends welcome pack through 'Post'
    And user opts for special offer
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                        |GaslifeSupportDevices|
      |Yes              |BOTH    |Crigler Najjar Syndrome Phototherapy Equipment|Gas Other            |
    And user selects carbon neutral option
    And user verifies selected plan details for '<fuelType>'
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
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |TOPH-EV |6203778288|N                             |N                             |Y                      |LSCNSPE                 |POSTMM       |
    And user validates the mailing address fields
      |fuelType|streetName |suburb |state    |country |postcode  |addressType |
      |ELE     |PO Box 22  |ALTONA |VIC      |AUS     |3018      |Mailing     |
    And user validates the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |TOPH-GV |5330733757|N                             |N                             |Y                      |OTHER                   |POSTMM       |
    And user validates the mailing address fields
      |fuelType|streetName |suburb |state    |country |postcode  |addressType |
      |GAS     |PO Box 22  |ALTONA |VIC      |AUS     |3018      |Mailing     |


    Examples:
      |customerStatus|fuelType|planName  |folderName           |state|sourceSystem   |journey   |AAH  |DD   |customerType |newOrExisting  |
      |New           |BOTH    |Total Plan|E2E_New_Mailing_POBOX|VIC  |Quote Tool     |Move Home |Yes  |No   |RES          |New            |

  Scenario Outline: Submit a quote and validate the mailing address is sent as GPO BOX
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    Then user validates details on plans page for 'RES'
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType| connectionAddress                     | movingType|propertyType|solarOption|
      |RES         | 42 Brownlow Drive, POINT COOK VIC 3030|Moving     |Renter      |No         |
    And user validates details on checkout details page
      |sourceSystem   |journey    |fuelType   |
      |<sourceSystem> |<journey>  |<fuelType> |
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|idType        |medicareType |
      |RES         |RES        |New           | test     |test     |Driver License|             |
    And user selects mailing address option
      |addressType  |otherAddress                 |
      |Other Address|GPO Box 3294, SYDNEY NSW 2001|
    And user selects answer for property renovation question for '<state>'
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |Yes         |Yes        |CC             |
    And user opts for concession card
    And user selects "Post" billing preference option
    And user sends welcome pack through 'Post'
    And user opts for special offer
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                        |GaslifeSupportDevices|
      |Yes              |BOTH    |Crigler Najjar Syndrome Phototherapy Equipment|Gas Other            |
    And user selects carbon neutral option
    And user verifies selected plan details for '<fuelType>'
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
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |TOPH-EV |6203778288|N                             |N                             |Y                      |LSCNSPE                 |POSTMM       |
    And user validates the mailing address fields
      |fuelType|streetName    |suburb |state    |country |postcode  |addressType |
      |ELE     |GPO Box 3294  |SYDNEY |NSW      |AUS     |2001      |Mailing     |
    And user validates the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |TOPH-GV |5330733757|N                             |N                             |Y                      |OTHER                   |POSTMM       |
    And user validates the mailing address fields
      |fuelType|streetName    |suburb |state    |country |postcode  |addressType |
      |GAS     |GPO Box 3294  |SYDNEY |NSW      |AUS     |2001      |Mailing     |

    Examples:
      |customerStatus|fuelType|planName  |folderName            |state|sourceSystem   |journey   |AAH  |DD   |customerType |newOrExisting  |
      |New           |BOTH    |Total Plan|E2E_New_Mailing_GPOBOX|VIC  |Quote Tool     |Move Home |Yes  |No   |RES          |New            |

  Scenario Outline: Submit a quote and validate the mailing address is sent as Private Bag
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    Then user validates details on plans page for 'RES'
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType| connectionAddress                     | movingType|propertyType|solarOption|
      |RES         | 42 Brownlow Drive, POINT COOK VIC 3030|Moving     |Renter      |No         |
    And user validates details on checkout details page
      |sourceSystem   |journey    |fuelType   |
      |<sourceSystem> |<journey>  |<fuelType> |
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|idType        |medicareType |
      |RES         |RES        |New           | test     |test     |Driver License|             |
    And user selects mailing address option
      |addressType  |otherAddress                          |
      |Other Address|Private Bag 6, HAMILTON VIC 3300|
    And user selects answer for property renovation question for '<state>'
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |Yes         |Yes        |CC             |
    And user opts for concession card
    And user selects "Post" billing preference option
    And user sends welcome pack through 'Post'
    And user opts for special offer
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                        |GaslifeSupportDevices|
      |Yes              |BOTH    |Crigler Najjar Syndrome Phototherapy Equipment|Gas Other            |
    And user selects carbon neutral option
    And user verifies selected plan details for '<fuelType>'
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
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |TOPH-EV |6203778288|N                             |N                             |Y                      |LSCNSPE                 |POSTMM       |
    And user validates the mailing address fields
      |fuelType|streetName     |suburb   |state    |country |postcode  |addressType |
      |ELE     |Private Bag 6  |HAMILTON |VIC      |AUS     |3300      |Mailing     |
    And user validates the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |TOPH-GV |5330733757|N                             |N                             |Y                      |OTHER                   |POSTMM       |
    And user validates the mailing address fields
      |fuelType|streetName     |suburb   |state    |country |postcode  |addressType |
      |GAS     |Private Bag 6  |HAMILTON |VIC      |AUS     |3300      |Mailing     |

    Examples:
      |customerStatus|fuelType|planName  |folderName                |state|sourceSystem   |journey   |AAH  |DD   |customerType |newOrExisting  |
      |New           |BOTH    |Total Plan|E2E_New_Mailing_PrivateBag|VIC  |Quote Tool     |Move Home |Yes  |No   |RES          |New            |

  Scenario Outline: Submit a quote and validate the mailing address is sent as Locked Bag
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    Then user validates details on plans page for 'RES'
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType| connectionAddress                     | movingType|propertyType|solarOption|
      |RES         | 42 Brownlow Drive, POINT COOK VIC 3030|Moving     |Renter      |No         |
    And user validates details on checkout details page
      |sourceSystem   |journey    |fuelType   |
      |<sourceSystem> |<journey>  |<fuelType> |
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|idType        |medicareType |
      |RES         |RES        |New           | test     |test     |Driver License|             |
    And user selects mailing address option
      |addressType  |otherAddress                          |
      |Other Address|Locked Bag 6, NORTHCOTE VIC 3070|
    And user selects answer for property renovation question for '<state>'
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |Yes         |Yes        |CC             |
    And user opts for concession card
    And user selects "Post" billing preference option
    And user sends welcome pack through 'Post'
    And user opts for special offer
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                        |GaslifeSupportDevices|
      |Yes              |BOTH    |Crigler Najjar Syndrome Phototherapy Equipment|Gas Other            |
    And user selects carbon neutral option
    And user verifies selected plan details for '<fuelType>'
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
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |TOPH-EV |6203778288|N                             |N                             |Y                      |LSCNSPE                 |POSTMM       |
    And user validates the mailing address fields
      |fuelType|streetName    |suburb    |state    |country |postcode  |addressType |
      |ELE     |Locked Bag 6  |NORTHCOTE |VIC      |AUS     |3070      |Mailing     |
    And user validates the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |TOPH-GV |5330733757|N                             |N                             |Y                      |OTHER                   |POSTMM       |
    And user validates the mailing address fields
      |fuelType|streetName    |suburb    |state    |country |postcode  |addressType |
      |GAS     |Locked Bag 6  |NORTHCOTE |VIC      |AUS     |3070      |Mailing     |

    Examples:
      |customerStatus|fuelType|planName  |folderName               |state|sourceSystem   |journey   |AAH  |DD   |customerType |newOrExisting  |
      |New           |BOTH    |Total Plan|E2E_New_Mailing_LockedBag|VIC  |Quote Tool     |Move Home |Yes  |No   |RES          |New            |

  Scenario Outline: Submit a quote for existing residential moving customer with selecting PO BOX as final billing address
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    Then user validates details on plans page for 'RES'
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |8372937428   |Postcode           |3024            |dob   |01011980|
    And user provides all other details on qualifier page for Existing customer
      |customerType|movingType |connectionAddress                       |propertyType |solarOption|
      |RES         |Moving     |9 Charming Street, HAMPTON EAST VIC 3188|Renter       |No         |
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|idType  |
      |RES         |RES        |Existing      | test     |test     |Medicare|
    And user validates details on checkout details page
      |sourceSystem   |journey    |fuelType   |
      |<sourceSystem> |<journey>  |<fuelType> |
    And user selects mailing address option
      |addressType  |otherAddress                     |
      |Other Address|3 River Drive, ATHELSTONE SA 5076|
    And user selects answer for property renovation question for '<state>'
    And user chooses "<optDisconnection>" for disconnection
    And user selects final bill option
      |option       |otherAddress                 |
      |Other Address|PO Box 22, ALTONA VIC 3018   |
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |Yes         |No         |               |
    And user opts for concession card
    And user selects "Post" billing preference option
    And user opts for special offer
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    And user selects carbon neutral option
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices|GaslifeSupportDevices|
      |Yes              |BOTH    |Ele Other             |Gas Other            |
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |RSOT-EV |6407220528|N                             |N                             |Y                      |OTHER                   |POSTMM        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |RSOT-GV |5310571404|N                             |N                             |Y                      |OTHER                   |POSTMM        |

    Examples:
      |customerStatus|fuelType|planName  |folderName                     |state|optDisconnection|sourceSystem  |journey  |AAH  |DD   |customerType |newOrExisting  |
      |Existing      |BOTH    |Basic Home|E2E_Existing_FinalBilling_POBOX|VIC  |Yes             |Quote Tool    |Move Home|Yes  |No  |RES          |Existing       |
