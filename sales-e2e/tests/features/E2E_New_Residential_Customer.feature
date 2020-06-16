@E2E
Feature:E2E scenario for new residential moving and non moving customer

Scenario Outline: Submit a quote for new residential moving customer
  Given user has opened the website link in a browser and creates '<folderName>' to save evidences
  And user has navigated to 'RES' plans page
  When user selects '<planName>'
  And user moves on to fill the qualifier
  And user selects '<customerStatus>' on qualifier
  And user provides all other details on qualifier page
    |customerType| connectionAddress               | movingType|propertyType|solarOption|
    |RES         | 5 Wilkies Street, BULLI NSW 2516|Moving     |Renter      |No         |
  And user selects carbon neutral option
  And user provides all details on checkout details page
    |customerType|journey    |customerStatus| firstName| lastName|idType        |medicareType |
    |RES         |RES        |New           | test     |test     |Driver License|             |
  And user selects answer for property renovation question for '<state>'
  And user opts for AAH and DD
    |optAAHOption|optDDOption|directDebitType|
    |Yes         |No         |               |
  And user clicks on 'Review your order' button and navigates to review page
  And user provides life support details on review page
    |lifeSupportOption|fuelType|EleclifeSupportDevices                        |GaslifeSupportDevices|
    |Yes              |BOTH    |Crigler Najjar Syndrome Phototherapy Equipment|Gas Other            |
  And user verifies selected plan details for '<fuelType>'
  And user submits the quote
  Then user lands on checkout complete page
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
    |customerStatus|fuelType|planName  |folderName         |state|username|password                                    |
    |New           |BOTH    |Total Plan|E2E_New_Resi_Moving|NSW  |abhar   |U2FsdGVkX1+ofbMmTfeufCoLeZbhDgsePj0GzAmmyv0=|


Scenario Outline: Submit a quote for new residential non moving customer
  Given user has opened the website link in a browser and creates '<folderName>' to save evidences
  And user has navigated to 'RES' plans page
  When user selects '<planName>'
  And user moves on to fill the qualifier
  And user selects '<customerStatus>' on qualifier
  And user provides all other details on qualifier page
    |customerType|connectionAddress                     | movingType|propertyType|solarOption|
    |RES         |42 Brownlow Drive, POINT COOK VIC 3030|Non-Moving |Renter      |No         |
  And user selects carbon neutral option
  And user provides all details on checkout details page
    |customerType |journey    |customerStatus| firstName| lastName|idType        |
    |RES          |RES        |New           | test     |test     |Driver License|
  And user opts for AAH and DD
    |optAAHOption|optDDOption|directDebitType|
    |No          |Yes        |CC             |
  And user clicks on 'Review your order' button and navigates to review page
  And user provides life support details on review page
    |lifeSupportOption|fuelType|EleclifeSupportDevices|GaslifeSupportDevices                             |
    |Yes              |BOTH    |Ele Other             |Medically Required Heating and/or Air Conditioning|
  And user verifies selected plan details for '<fuelType>'
  And user submits the quote
  Then user lands on checkout complete page
  When user has opened the qt2 Reporting website link in a browser
  And user logs in to qt2 reporting
  And user search quote on the basis of 'Email'
  Then submitted quote is displayed
  And user validates all the details for 'ELE' submitted quote
  And user validates below mandatory fields
    |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
    |ELE     |VERBALLYACCEPTED|RESIDENTIAL |COR      |TOPH-EV |6203778288|N                             |N                             |Y                      |OTHER                   |EMAIL        |
  And user validates all the details for 'GAS' submitted quote
  And user validates below mandatory fields
    |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
    |GAS     |VERBALLYACCEPTED|RESIDENTIAL |COR      |TOPH-GV |5330733757|N                             |N                             |Y                      |GLSMRHAC                |EMAIL        |

  Examples:
    |customerStatus|fuelType|planName|folderName                |username|password                                    |
    |New           |BOTH    |Total Plan  |E2E_New_Resi_NonMoving|abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

