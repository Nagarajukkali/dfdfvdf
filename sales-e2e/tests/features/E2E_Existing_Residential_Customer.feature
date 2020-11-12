@E2E @existingcustomerQT
Feature:E2E scenario for existing residential moving and non moving customer
@failed
  #Not able to proceed to review page
Scenario Outline: Submit a quote for existing residential moving customer
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
  |customerStatus|fuelType|planName  |folderName              |state|optDisconnection|sourceSystem  |journey  |AAH  |DD   |customerType |newOrExisting  |
  |Existing      |BOTH    |Basic Home|E2E_Existing_Resi_Moving|VIC  |No              |Quote Tool    |Move Home|Yes  |No  |RES          |Existing       |

  @deviceCheck @smoke
Scenario Outline: Submit a quote for existing residential non moving customer with LS, select dual fuel and verify gas account
  Given user has opened the website link in a browser and creates '<folderName>' to save evidences
  And user has navigated to 'RES' plans page
  Then user validates details on plans page for 'RES'
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
  And user validates details on checkout details page
    |sourceSystem   |journey    |fuelType   |
    |<sourceSystem> |<journey>  |<fuelType> |
  And user selects mailing address option
    |addressType       |otherAddress                              |
    |Connection Address|                                          |
  And user opts for AAH and DD
    |optAAHOption|optDDOption|directDebitType|
    |No          |Yes        |Bank           |
  And user opts for concession card
  And user selects "Post" billing preference option
  And user clicks on 'Review your order' button and navigates to review page
  Then Life support section is displayed on Review page as per selected "<fuelType>" and verified "<accountType>"
  And user provides life support details on review page
    |lifeSupportOption|fuelType|EleclifeSupportDevices                  |GaslifeSupportDevices       |
    |Yes              |ELE     |Intermittent Peritoneal Dialysis Machine|                            |
  And user verifies selected plan details for '<fuelType>'
  And user validates details on checkout review page
    |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
    |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
  And user submits the quote
  And user lands on checkout complete page
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
    |ELE     |VERBALLYACCEPTED|RESIDENTIAL |PS       |RCPP-EN |4311150544|N                             |N                             |Y                      |LSIPDM                  |POSTMM        |
  And user validates all the details for 'GAS' submitted quote
  And user validates below mandatory fields
    |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
    |GAS     |VERBALLYACCEPTED|RESIDENTIAL |PS       |RCPP-GN |5240924834|N                             |N                             |Y                      |GLSMRHW                 |POSTMM        |

  Examples:
    |customerStatus|planName |folderName                 |fuelType|accountType|sourceSystem  |journey     |AAH  |DD   |customerType |newOrExisting  |
    |Existing      |No Frills|E2E_Existing_Resi_NonMoving|BOTH    |GAS        |Quote Tool    |Plan Switch |No   |Yes  |RES          |Existing       |


    #concession card number is required
  Scenario Outline: Submit a quote for QLD existing residential non moving customer
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    Then user validates details on plans page for 'RES'
    When user have selected fuel as "<fuelType>"
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |9485951606   |Postcode           |4215            |dl    |139955532|
    And user provides all other details on qualifier page for Existing customer
      |customerType|movingType |propertyType |solarOption  |
      |RES         |Non-Moving |Owner        |No           |
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus| firstName| lastName|idType        |
      |RES          |RES        |Existing      | test     |test     |Passport      |
    And user validates details on checkout details page
      |sourceSystem   |journey    |fuelType   |
      |<sourceSystem> |<journey>  |<fuelType> |
    And user selects mailing address option
      |addressType  |otherAddress                         |
      |Other Address|13 Jacobs Ridge Road, ORMEAU QLD 4208|
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |No          |Yes        |Bank           |
    And user opts for concession card
    And user selects "Post" billing preference option
    And user opts for special offer
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                  |GaslifeSupportDevices       |
      |Yes              |ELE     |Intermittent Peritoneal Dialysis Machine|                            |
    And user verifies selected plan details for '<fuelType>'
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    And user submits the quote
    And user lands on checkout complete page
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
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |PS       |TOPH-EQ |QB01405934|N                             |N                             |Y                      |LSIPDM                  |POSTMM       |


    Examples:
      |customerStatus|planName  |folderName                 |fuelType|sourceSystem  |journey     |AAH  |DD   |customerType |newOrExisting  |
      |Existing      |Total Plan|E2E_Existing_Resi_NonMoving|ELE     |Quote Tool    |Plan Switch |No   |Yes  |RES          |Existing       |


