@E2E @newcustomer
Feature:E2E scenario for new residential moving and non moving customer
  @deviceCheck @smoke
Scenario Outline: Submit a quote for new residential moving customer
  Given user has opened the website link in a browser and creates '<folderName>' to save evidences
  And user has navigated to 'RES' plans page
#  And user enters '2516' in 'POSTCODE' field
#  Then user validates reference price for '<planName>'
  Then user validates details on plans page for 'RES'
  When user selects '<planName>'
  And user moves on to fill the qualifier
  And user selects '<customerStatus>' on qualifier
  And user provides all other details on qualifier page
    |customerType| connectionAddress                     | movingType|propertyType|solarOption|
    |RES         | 42 Brownlow Drive, POINT COOK VIC 3030|Moving     |Renter      |No         |
  And user provides all details on checkout details page
    |customerType|journey    |customerStatus| firstName| lastName|idType        |medicareType |
    |RES         |RES        |New           | test     |test     |Driver License|             |
  And user validates details on checkout details page
    |sourceSystem   |journey    |fuelType   |
    |<sourceSystem> |<journey>  |<fuelType> |
  And user selects answer for property renovation question for '<state>'
  And user opts for AAH and DD
    |optAAHOption|optDDOption|directDebitType|
    |Yes         |Yes        |CC             |
  And user opts for concession card
  And user selects billing preference option
    |option             |otherAddress        |
    |Connection address |                    |
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
  And user validates all the details for 'ELE' submitted quote
  And user validates below mandatory fields
    |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
    |ELE     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |TOPH-EV |6203778288|N                             |N                             |Y                      |LSCNSPE                 |POSTMM       |
  And user validates all the details for 'GAS' submitted quote
  And user validates below mandatory fields
    |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
    |GAS     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |TOPH-GV |5330733757|N                             |N                             |Y                      |OTHER                   |POSTMM       |

  Examples:
    |customerStatus|fuelType|planName  |folderName         |state|sourceSystem   |journey   |AAH  |DD   |customerType |newOrExisting  |
    |New           |BOTH    |Total Plan|E2E_New_Resi_Moving|VIC  |Quote Tool     |Move Home |Yes  |No   |RES          |New            |

Scenario Outline: Submit a quote for new residential non moving customer
  Given user has opened the website link in a browser and creates '<folderName>' to save evidences
  And user has navigated to 'RES' plans page
#  And user enters '3030' in 'POSTCODE' field
#  Then user validates reference price for '<planName>'
  Then user validates details on plans page for 'RES'
  When user selects '<planName>'
  And user moves on to fill the qualifier
  And user selects '<customerStatus>' on qualifier
  And user provides all other details on qualifier page
    |customerType|connectionAddress                | movingType|propertyType|solarOption|
    |RES         |3 River Drive, ATHELSTONE SA 5076|Non-Moving |Renter      |No         |
  And user validates details on checkout details page
    |sourceSystem   |journey    |fuelType   |
    |<sourceSystem> |<journey>  |<fuelType> |
  And user provides all details on checkout details page
    |customerType |journey    |customerStatus| firstName| lastName|idType        |
    |RES          |RES        |New           | test     |test     |Passport      |
  And user opts for AAH and DD
    |optAAHOption|optDDOption|directDebitType|
    |No          |Yes        |Bank           |
  And user selects billing preference option
    |option        |otherAddress                              |
    |Email         |                                          |
  And user sends welcome pack through 'Email'
  And user clicks on 'Review your order' button and navigates to review page
  And user validates details on checkout review page
    |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
    |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
  And user provides life support details on review page
    |lifeSupportOption|fuelType|EleclifeSupportDevices|GaslifeSupportDevices                             |
    |Yes              |BOTH    |Ele Other             |Medically Required Heating and/or Air Conditioning|
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
  And user validates all the details for 'ELE' submitted quote
  And user validates below mandatory fields
    |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
    |ELE     |VERBALLYACCEPTED|RESIDENTIAL |COR      |TOPH-ES |2001245279|N                             |N                             |Y                      |OTHER                   |EMAIL        |
  And user validates all the details for 'GAS' submitted quote
  And user validates below mandatory fields
    |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
    |GAS     |VERBALLYACCEPTED|RESIDENTIAL |COR      |TOPH-GS |5510149276|N                             |N                             |Y                      |GLSMRHAC                |EMAIL        |

  Examples:
    |customerStatus|fuelType|planName     |folderName                |sourceSystem   |journey     |AAH  |DD   |customerType |newOrExisting  |
    |New           |BOTH    |Total Plan   |E2E_New_Resi_NonMoving    |Quote Tool     |Plan Switch |No   |Yes  |RES          |New            |

