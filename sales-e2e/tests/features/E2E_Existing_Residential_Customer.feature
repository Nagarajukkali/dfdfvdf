@E2E
Feature:E2E scenario for existing residential moving and non moving customer

Scenario Outline: Submit a quote for existing residential moving customer
  Given user has opened the website link in a browser and creates '<folderName>' to save evidences
  And user has navigated to 'RES' plans page
  When user selects '<planName>'
  And user moves on to fill the qualifier
  And user selects '<customerStatus>' on qualifier
  And user verifies account on qualifier
    |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
    |Existing      |8372937428   |Postcode           |3024            |dob   |01011980|
  And user provides all other details on qualifier page for Existing customer
    |customerType|movingType |connectionAddress               |propertyType |solarOption|
    |RES         |Moving     |5 Wilkies Street, BULLI NSW 2516|Renter       |No         |
  And user selects carbon neutral option
  And user provides all details on checkout details page
    |customerType|journey    |customerStatus| firstName| lastName|idType        |
    |RES         |RES        |Existing      | test     |test     |Driver License|
  And user selects answer for property renovation question for '<state>'
  And user chooses "<optDisconnection>" for disconnection
  And user opts for AAH and DD
    |optAAHOption|optDDOption|directDebitType|
    |No          |Yes        |Bank           |
  And user clicks on 'Review your order' button and navigates to review page
  And user provides life support details on review page
    |lifeSupportOption|fuelType|EleclifeSupportDevices|GaslifeSupportDevices|
    |Yes              |BOTH    |Ele Other             |Gas Other            |
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
    |ELE     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |RSOT-EN |4311150544|N                             |N                             |Y                      |OTHER                   |EMAIL        |
  And user validates all the details for 'GAS' submitted quote
  And user validates below mandatory fields
    |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
    |GAS     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |RSOT-GN |5240924834|N                             |N                             |Y                      |OTHER                   |EMAIL        |

  Examples:
  |customerStatus|fuelType|planName  |folderName              |state|optDisconnection|username|password                                    |
  |Existing      |BOTH    |Basic Home|E2E_Existing_Resi_Moving|NSW  |No              |abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

Scenario Outline: Submit a quote for existing residential non moving customer with LS, select dual fuel and verify gas account
  Given user has opened the website link in a browser and creates '<folderName>' to save evidences
  And user has navigated to 'RES' plans page
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
  And user clicks on 'Review your order' button and navigates to review page
  Then Life support section is displayed on Review page as per selected "<fuelType>" and verified "<accountType>"
  And user provides life support details on review page
    |lifeSupportOption|fuelType|EleclifeSupportDevices                  |GaslifeSupportDevices       |
    |Yes              |ELE     |Intermittent Peritoneal Dialysis Machine|                            |
  And user verifies selected plan details for '<fuelType>'
  And user submits the quote
  And user lands on checkout complete page
  When user has opened the qt2 Reporting website link in a browser
  And user logs in to qt2 reporting
  And user search quote on the basis of 'Email'
  Then submitted quote is displayed
  And user validates all the details for 'ELE' submitted quote
  And user validates below mandatory fields
    |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
    |ELE     |VERBALLYACCEPTED|RESIDENTIAL |PS       |RCPP-EN |4311150544|N                             |N                             |Y                      |LSIPDM                  |EMAIL        |
  And user validates all the details for 'GAS' submitted quote
  And user validates below mandatory fields
    |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
    |GAS     |VERBALLYACCEPTED|RESIDENTIAL |PS       |RCPP-GN |5240924834|N                             |N                             |Y                      |GLSMRHW                 |EMAIL        |

  Examples:
    |customerStatus|planName |folderName                 |fuelType|accountType|username|password                                    |
    |Existing      |No Frills|E2E_Existing_Resi_NonMoving|BOTH    |GAS        |abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|
