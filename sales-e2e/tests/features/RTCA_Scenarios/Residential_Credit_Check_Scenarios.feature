@CDECheck @plansystemrefactor
Feature:E2E scenario of RTCA validation for new residential customer

  Scenario Outline: Verify if a residential customer is displayed with accept with condition pop up when wrong ID is provided
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                | movingType | propertyType |
      | RES          | 5 Wilkies Street, BULLI NSW 2516 | Moving     | Renter       |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName  | lastName | idType         | medicareType |
      | RES          | RES     | New            | AcceptCond | test     | Driver License |              |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user selects answer for property renovation question for '<state>'
    And user opts for AAH and DD
      | optAAHOption | optDDOption | directDebitType |
      | Yes          | No          |                 |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices                         | GaslifeSupportDevices |
      | Yes               | BOTH     | Crigler Najjar Syndrome Phototherapy Equipment | Gas Other             |
    And user selects carbon neutral option
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then identification verification pop up is displayed
    When user clicks on identification confirmation button
    Then user lands on checkout complete page
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType |
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | TOPH-EN  | 4311150544 | N                              | N                              | Y                       | LSCNSPE                  | EMAIL         |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | TOPH-GN  | 5240924834 | N                              | N                              | Y                       | OTHER                    | EMAIL         |

    Examples:
      | customerStatus | fuelType | planName   | folderName                     | state |
      | New            | BOTH     | Total Plan | E2E_New_Resi_Moving_AcceptCond | NSW   |

  Scenario Outline: Verify if a residential customer is displayed with application decline when the user is blocked with faulty credit check
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                      | movingType | propertyType |
      | RES          | 42 Brownlow Drive, DIAMOND CREEK VIC 3089 | Non-Moving | Renter       |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType         |
      | RES          | RES     | New            | decline   | test     | Driver License |
    And user selects mailing address option
      | addressType   | otherAddress                       |
      | Other Address | 68 Mercer Street, GEELONG VIC 3220 |
    And user opts for AAH and DD
      | optAAHOption | optDDOption | directDebitType |
      | No           | Yes         | CC              |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices                              |
      | Yes               | BOTH     | Ele Other              | Medically Required Heating and/or Air Conditioning |
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then Your application has been declined is displayed
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType |
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | COR       | TOPH-EV  | 6305727918 | N                              | N                              | Y                       | OTHER                    | EMAIL         |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | COR       | TOPH-GV  | 5320087624 | N                              | N                              | Y                       | GLSMRHAC                 | EMAIL         |

    Examples:
      | customerStatus | fuelType | planName   | folderName                     |
      | New            | BOTH     | Total Plan | E2E_New_Resi_NonMoving_decline |


  Scenario Outline: verify if a residential customer is displayed with accept message when CDE returns accept
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                | movingType | propertyType |
      | RES          | 5 Wilkies Street, BULLI NSW 2516 | Moving     | Renter       |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType         | medicareType |
      | RES          | RES     | New            | accept    | test     | Driver License |              |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user selects answer for property renovation question for '<state>'
    And user opts for AAH and DD
      | optAAHOption | optDDOption | directDebitType |
      | Yes          | No          |                 |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices                         | GaslifeSupportDevices |
      | Yes               | BOTH     | Crigler Najjar Syndrome Phototherapy Equipment | Gas Other             |
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType |
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | TOPH-EN  | 4311150544 | N                              | N                              | Y                       | LSCNSPE                  | EMAIL         |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | TOPH-GN  | 5240924834 | N                              | N                              | Y                       | OTHER                    | EMAIL         |

    Examples:
      | customerStatus | fuelType | planName   | folderName                 | state |
      | New            | BOTH     | Total Plan | E2E_New_Resi_Moving_Accept | NSW   |

  Scenario Outline: verify quote is submitted when CDE returns error due to connectivity
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                      | movingType | propertyType |
      | RES          | 42 Brownlow Drive, DIAMOND CREEK VIC 3089 | Non-Moving | Renter       |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType         |
      | RES          | RES     | New            | error     | test     | Driver License |
    And user selects mailing address option
      | addressType   | otherAddress                       |
      | Other Address | 68 Mercer Street, GEELONG VIC 3220 |
    And user opts for AAH and DD
      | optAAHOption | optDDOption | directDebitType |
      | No           | Yes         | CC              |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices                              |
      | Yes               | BOTH     | Ele Other              | Medically Required Heating and/or Air Conditioning |
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType |
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | COR       | TOPH-EV  | 6305727918 | N                              | N                              | Y                       | OTHER                    | EMAIL         |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | COR       | TOPH-GV  | 5320087624 | N                              | N                              | Y                       | GLSMRHAC                 | EMAIL         |

    Examples:
      | customerStatus | fuelType | planName   | folderName                   |
      | New            | BOTH     | Total Plan | E2E_New_Resi_NonMoving_Error |
