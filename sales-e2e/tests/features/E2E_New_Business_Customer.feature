@E2E
Feature:E2E scenario for new business moving and non moving customer

Scenario Outline: Submit a quote for new business moving customer
  Given user has opened the website link in a browser and creates '<folderName>' to save evidences
  And user has navigated to 'BUS' plans page
  When user selects '<planName>'
  And user moves on to fill the qualifier
  And user selects '<customerStatus>' on qualifier
  And user provides all other details on qualifier page
    |customerType| customerStatus| connectionAddress                         |movingType|propertyType|solarOption|
    |BUS         |New            | 36 Gregory Street West, WENDOUREE VIC 3355|Moving    |            |No         |
  And user provides all details on checkout details page
    |customerType|journey    | firstName| lastName|businessType|
    |BUS         |BUS        | test     |test     |ABN         |
  And user selects answer for property renovation question for '<state>'
  And user opts for AAH and DD
    |optAAHOption|optDDOption|directDebitType|
    |No          |Yes        |Bank           |
  And user clicks on 'Review your order' button and navigates to review page
  And user provides life support details on review page
    |lifeSupportOption|fuelType|EleclifeSupportDevices |GaslifeSupportDevices                             |
    |Yes              |BOTH    |Kidney Dialysis Machine|Medically Required Heating and/or Air Conditioning|
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
    |customerStatus|planName      |folderName        |state|username|password                                    |
    |New           |Basic Business|E2E_New_Bus_Moving|VIC  |abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

Scenario Outline: Submit a quote for new business non moving customer
  Given user has opened the website link in a browser and creates '<folderName>' to save evidences
  And user has navigated to 'BUS' plans page
  When user selects '<planName>'
  And user moves on to fill the qualifier
  And user selects '<customerStatus>' on qualifier
  And user provides all other details on qualifier page
    |customerType| connectionAddress                        |movingType|propertyType|solarOption|
    |BUS         |36 Gregory Street West, WENDOUREE VIC 3355|Non-Moving|            |No         |
  And user provides all details on checkout details page
    |customerType|journey    |customerStatus| firstName| lastName|businessType|
    |BUS         |BUS        |New           | test     |test     |ACN         |
  And user opts for AAH and DD
    |optAAHOption|optDDOption|directDebitType|
    |Yes         |No         |               |
  And user clicks on 'Review your order' button and navigates to review page
  And user provides life support details on review page
    |lifeSupportOption|fuelType|EleclifeSupportDevices|GaslifeSupportDevices                             |
    |Yes              |BOTH    |Ele Other             |Medically Required Heating and/or Air Conditioning|
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
  |customerStatus|planName      |folderName            |username|password                                    |
  |New           |Basic Business|E2E_New_Resi_NonMoving|abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|
