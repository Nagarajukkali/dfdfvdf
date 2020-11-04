@E2E @existingcustomerQT
Feature:E2E scenario for existing residential moving customer through move house

Scenario Outline: Submit a quote for existing residential customer through move house without AAH and DD
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
    |fuelType |planName       |
    |ELE      |Total Plan Plus|
  And user selects plans on checkout details page
    |fuelType |planName   |
    |GAS      |Total Plan |
  And user provides all details on checkout details page
    |customerType|journey    |customerStatus| firstName| lastName|idType        |
    |RES         |RES        |Existing      | test     |test     |Driver License|
  And user selects mailing address option
    |addressType  |otherAddress                            |
    |Other Address|9 Charming Street, HAMPTON EAST VIC 3188|
  And user opts for AAH and DD
    |optAAHOption|optDDOption|directDebitType|
    |<AAH>       |<DD>       |CC             |
  And user opts for concession card
  And user validates details on checkout details page
    |sourceSystem   |journey    |fuelType   |
    |<sourceSystem> |<journey>  |<fuelType> |
  And user selects answer for property renovation question for '<state>'
  And user selects "Email" billing preference option
  And user sends welcome pack through 'Email'
  And user chooses "<optDisconnection>" for disconnection
  And user clicks on 'Review your order' button and navigates to review page
  And user validates details on checkout review page
    |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
    |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
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
    |ELE     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |SWSR1-EN |4311150544|N                             |N                             |Y                      |OTHER                   |EMAIL        |
  And user validates all the details for 'GAS' submitted quote
  And user validates below mandatory fields
    |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
    |GAS     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |TOPH-GN |5240924834|N                             |N                             |Y                      |OTHER                   |EMAIL        |

  Examples:
    |folderName                     |fuelType|state|optDisconnection|movingAddress                   |sourceSystem  |journey  |AAH  |DD   |customerType |newOrExisting  |
    |E2E_Existing_Resi_MoveHouse_01 |BOTH    |NSW  |No              |5 Wilkies Street, BULLI NSW 2516|Quote Tool    |Move Home|No   |No   |RES          |Existing       |

  @deviceCheck @smoke
  Scenario Outline: Submit a quote for existing residential customer through move house with AAH and DD
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
      |fuelType |planName       |
      |ELE      |Total Plan Plus|
    And user selects plans on checkout details page
      |fuelType |planName   |
      |GAS      |Total Plan |
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|idType        |
      |RES         |RES        |Existing      | test     |test     |Driver License|
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |<AAH>       |<DD>       |CC             |
    And user validates details on checkout details page
      |sourceSystem   |journey    |fuelType   |
      |<sourceSystem> |<journey>  |<fuelType> |
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user selects answer for property renovation question for '<state>'
    And user chooses "<optDisconnection>" for disconnection
    And user selects "Post" billing preference option
    And user sends welcome pack through 'Post'
    And user opts for special offer
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
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
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |SWSR1-EN |4311150544|N                             |N                             |Y                      |OTHER                   |POSTMM      |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |TOPH-GN |5240924834|N                             |N                             |Y                      |OTHER                   |POSTMM       |

    Examples:
      |folderName                     |fuelType|state|optDisconnection|movingAddress                   |sourceSystem  |journey  |AAH  |DD   |customerType |newOrExisting  |
      |E2E_Existing_Resi_MoveHouse_02 |BOTH    |NSW  |No              |5 Wilkies Street, BULLI NSW 2516|Quote Tool    |Move Home|Yes  |Yes  |RES          |Existing       |

