@E2E
Feature:E2E scenario for offer campaign

Scenario Outline: Submit a quote for offer campaign for '<folderName>'
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
  And user validates details on checkout details page
    |sourceSystem   |journey    |fuelType   |
    |<sourceSystem> |<journey>  |<fuelType> |
  And user opts for AAH and DD
    |optAAHOption|optDDOption|directDebitType|
    |<AAH>       |<DD>       |Bank           |
  And user selects answer for property renovation question for '<state>'
  And user clicks on 'Review your order' button and navigates to review page
  And user validates details on checkout review page
    |sourceSystem   |journey    |fuelType   |AAH  |DD   |
    |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |
  And user provides life support details on review page
    |lifeSupportOption|fuelType|EleclifeSupportDevices                        |GaslifeSupportDevices|
    |Yes              |BOTH    |Crigler Najjar Syndrome Phototherapy Equipment|Gas Other            |
  And user verifies selected plan details for '<fuelType>'
  And user submits the quote
  Then user lands on checkout complete page
  And user validates details on checkout complete page
    |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType |newOrExisting  |
    |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |RESI         |               |
  When user has opened the qt2 Reporting website link in a browser
  And user logs in to qt2 reporting
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
    |customerStatus|fuelType|campaign  |folderName                                    |state|sourceSystem  |journey  |AAH  |DD  |
    |New           |BOTH    |offer     |E2E_New_Resi_Camp_OFFER_WithoutAAH_WithoutDD  |NSW  |Quote Tool    |Move Home|No   |No  |
    |New           |BOTH    |offer     |E2E_New_Resi_Camp_OFFER_WithAAH_WithDD        |NSW  |Quote Tool    |Move Home|Yes  |Yes |




