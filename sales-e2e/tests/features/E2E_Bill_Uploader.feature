#@E2E
Feature: This feature is to test the Bill Uploader scenarios

  Scenario Outline: Submit a quote for a bill uploader journey
    Given user has opened the bill uploader website link in a browser and creates '<folderName>' to save evidences
    When user clicks on upload bill button
    And user uploads the '<billName>' bill
    And user selects the recommended plan
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page for Existing customer
      |customerType|movingType |propertyType |solarOption  |
      |RES         |Non-Moving |Owner        |No           |
    And user selects carbon neutral option
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus| firstName| lastName|idType        |
      |RES          |RES        |New           | test     |test     |Driver License|
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |No          |Yes        |CC             |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices|
      |Yes              |ELE     |Ele Other             |
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
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |COR      |TOPH-EV |6305515608|N                             |N                             |Y                      |OTHER                   |EMAIL        |

    Examples:
      |billName|customerStatus|fuelType|folderName              |username|password                                    |
      |Bill.pdf|New           |ELE     |E2E_New_Resi_Bill_Upload|abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

