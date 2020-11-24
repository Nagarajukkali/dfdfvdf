@E2E @newcustomer

Feature:E2E scenario for new business moving and non moving customer

  Scenario Outline: Submit a quote for new business moving customer
  Given user has opened the website link in a browser and creates '<folderName>' to save evidences
  And user has navigated to 'BUS' plans page
  #And user enters '3355' in 'POSTCODE' field
  #Then user validates reference price for '<planName>'
  Then user validates details on plans page for 'BUS'
  When user selects '<planName>'
  And user moves on to fill the qualifier
  And user selects '<customerStatus>' on qualifier
  And user provides all other details on qualifier page
    |customerType| customerStatus| connectionAddress                     |movingType|propertyType|solarOption|
    |BUS         |New            | 320 Crown Street, SURRY HILLS NSW 2010|Moving    |            |No         |
  And user provides all details on checkout details page
    |customerType|journey    | firstName| lastName|businessType|
    |BUS         |BUS        | test     |test     |ABN         |
  And user validates details on checkout details page
    |sourceSystem   |journey    |fuelType   |
    |<sourceSystem> |<journey>  |<fuelType> |
  And user selects mailing address option
    |addressType  |otherAddress                      |
    |Other Address|68 Mercer Street, GEELONG VIC 3220|
  And user selects answer for property renovation question for '<state>'
  And user opts for AAH and DD
    |optAAHOption|optDDOption|directDebitType|
    |No          |Yes        |Bank           |
  And user selects "Post" billing preference option
  And user sends welcome pack through 'Email'
  And user clicks on 'Review your order' button and navigates to review page
  And user validates details on checkout review page
    |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
    |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
  And user provides life support details on review page
    |lifeSupportOption|fuelType|EleclifeSupportDevices |GaslifeSupportDevices                             |
    |Yes              |BOTH    |Kidney Dialysis Machine|Medically Required Heating and/or Air Conditioning|
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
    |ELE     |VERBALLYACCEPTED|BUSINESS    |ENE      |BSOT-EN |NCCC005405|N                             |N                             |Y                      |LSKDM                   |POSTMM       |
  And user validates all the details for 'GAS' submitted quote
  And user validates below mandatory fields
    |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
    |GAS     |VERBALLYACCEPTED|BUSINESS    |ENE      |BSOT-GN |5240554353|N                             |N                             |Y                      |GLSMRHAC                |POSTMM       |

  Examples:
    |customerStatus|fuelType|planName      |folderName        |state|sourceSystem  |journey  |AAH  |DD  |customerType |newOrExisting  |
    |New           |BOTH    |Basic Business|E2E_New_Bus_Moving|NSW  |Quote Tool    |Move Home|No   |Yes |BUS          |New            |

  @deviceCheck @smoke
Scenario Outline: Submit a quote for new business non moving customer
  Given user has opened the website link in a browser and creates '<folderName>' to save evidences
  And user has navigated to 'BUS' plans page
  #And user enters '3220' in 'POSTCODE' field
  #Then user validates reference price for '<planName>'
  Then user validates details on plans page for 'BUS'
  When user selects '<planName>'
  And user moves on to fill the qualifier
  And user selects '<customerStatus>' on qualifier
  And user provides all other details on qualifier page
    |customerType| connectionAddress                |movingType|propertyType|solarOption|
    |BUS         |68 Mercer Street, GEELONG VIC 3220|Non-Moving|            |No         |
  And user provides all details on checkout details page
    |customerType|journey    |customerStatus| firstName| lastName|businessType|
    |BUS         |BUS        |New           | test     |test     |ACN         |
  And user validates details on checkout details page
    |sourceSystem   |journey    |fuelType   |
    |<sourceSystem> |<journey>  |<fuelType> |
  And user selects mailing address option
    |addressType       |otherAddress |
    |Connection Address|             |
  And user opts for AAH and DD
    |optAAHOption|optDDOption|directDebitType|
    |Yes         |No         |               |
  And user selects "Email" billing preference option
  And user sends welcome pack through 'Post'
  And user opts for special offer
  And user clicks on 'Review your order' button and navigates to review page
  And user validates details on checkout review page
    |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
    |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
  And user provides life support details on review page
    |lifeSupportOption|fuelType|EleclifeSupportDevices|GaslifeSupportDevices                             |
    |Yes              |BOTH    |Ele Other             |Medically Required Heating and/or Air Conditioning|
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
    |ELE     |VERBALLYACCEPTED|BUSINESS    |COR      |TOPB-EV |6203142753|N                             |N                             |Y                      |OTHER                   |EMAIL        |
  And user validates all the details for 'GAS' submitted quote
  And user validates below mandatory fields
    |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
    |GAS     |VERBALLYACCEPTED|BUSINESS    |COR      |TOPB-GV |5330726895|N                             |N                             |Y                      |GLSMRHAC                |EMAIL        |

  Examples:
  |customerStatus|fuelType|planName      |folderName           |sourceSystem  |journey      |AAH  |DD  |customerType |newOrExisting  |
  |New           |BOTH    |Total Plan - Business|E2E_New_Bus_NonMoving|Quote Tool    |Plan Switch  |Yes  |No  |BUS          |New            |
