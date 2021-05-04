#@E2E
@billuploader
Feature: This feature is to test the Bill Uploader scenarios
  #@deviceCheck
  Scenario Outline: Submit a quote for a bill uploader journey with DD
    Given user has opened the bill uploader website link in a browser and creates '<folderName>' to save evidences
    When user clicks on upload bill button
    And user uploads the '<billName>' bill
    And user selects the recommended plan
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page for Existing customer
      | customerType | movingType | propertyType |
      | RES          | Non-Moving | Owner        |
    And user validates details on checkout details page
      | sourceSystem   | journey   | fuelType   |
      | <sourceSystem> | <journey> | <fuelType> |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType   | medicareType |
      | RES          | RES     | New            | test      | test     | Medicare | blue         |
    And user selects mailing address option
      | addressType   | otherAddress                      |
      | Other Address | 3 River Drive, ATHELSTONE SA 5076 |
    And user opts for AAH and DD
      | optAAHOption | optDDOption | directDebitType |
      | <AAH>        | <DD>        | CC              |
    And user opts for concession card
    And user selects "Post" billing preference option
    And user sends welcome pack through 'Email'
    And user opts for special offer
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices |
      | Yes               | ELE      | Ele Other              |
    And user selects carbon neutral option
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType |
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | COR       | TOPH-EV  | 6305515608 | N                              | N                              | Y                       | OTHER                    | POSTMM        |

    Examples:
      | billName | customerStatus | fuelType | folderName                  | sourceSystem | journey     | AAH | DD  | customerType | newOrExisting |
      | Bill.pdf | New            | ELE      | E2E_New_Resi_Bill_Upload_01 | Quote Tool   | Plan Switch | No  | Yes | RES          | New           |

  Scenario Outline: Submit a quote for a bill uploader journey with AAH
    Given user has opened the bill uploader website link in a browser and creates '<folderName>' to save evidences
    When user clicks on upload bill button
    And user uploads the '<billName>' bill
    And user selects the recommended plan
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page for Existing customer
      | customerType | movingType | propertyType |
      | RES          | Non-Moving | Owner        |
    And user validates details on checkout details page
      | sourceSystem   | journey   | fuelType   |
      | <sourceSystem> | <journey> | <fuelType> |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType         |
      | RES          | RES     | New            | test      | test     | Driver License |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user opts for AAH and DD
      | optAAHOption | optDDOption | directDebitType |
      | <AAH>        | <DD>        | CC              |
    And user opts for concession card
    And user selects "Email" billing preference option
    And user sends welcome pack through 'Post'
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices |
      | Yes               | ELE      | Ele Other              |
    And user selects carbon neutral option
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType |
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | COR       | TOPH-EV  | 6305515608 | N                              | N                              | Y                       | OTHER                    | EMAIL         |

    Examples:
      | billName | customerStatus | fuelType | folderName                  | sourceSystem | journey     | AAH | DD | customerType | newOrExisting |
      | Bill.pdf | New            | ELE      | E2E_New_Resi_Bill_Upload_02 | Quote Tool   | Plan Switch | Yes | No | RES          | New           |
