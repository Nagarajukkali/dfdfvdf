@E2E
Feature:E2E scenario for offer campaign

Scenario Outline: Submit a quote for offer campaign
  Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
  When user provides postcode and clicks on show me plan link
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
  And user submits the quote
  Then user lands on checkout complete page
  When user has opened the qt2 Reporting website link in a browser
  And user logs in to qt2 reporting using '<username>' and '<password>'
  And user search quote on the basis of 'Email'
  Then submitted quote is displayed
  And user validates all the details for 'ELE' submitted quote
  And user validates below mandatory fields
    |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
    |ELE     |VERBALLYACCEPTED|RESIDENTIAL |         |TOPH-EN |          |N                             |N                             |Y                      |OTHER                   |EMAIL        |
  And user validates all the details for 'GAS' submitted quote
  And user validates below mandatory fields
    |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
    |GAS     |VERBALLYACCEPTED|RESIDENTIAL |         |TOPH-GN |          |N                             |N                             |Y                      |                        |EMAIL        |

  Examples:
    |customerStatus|campaign  |folderName         |state|username|password                                    |
    |New           |Offer     |E2E_New_Resi_Moving|NSW  |abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|




