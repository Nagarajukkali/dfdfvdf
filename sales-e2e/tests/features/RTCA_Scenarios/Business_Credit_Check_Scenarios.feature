@CDECheck
Feature:E2E scenario of RTCA validation for new business customer

  Scenario Outline: Verify if a business customer is displayed with accept with condition pop up when wrong ID is provided
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'BUS' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | customerStatus | connectionAddress                          | movingType | propertyType |
      | BUS          | New            | 36 Gregory Street West, WENDOUREE VIC 3355 | Moving     |              |
    And user provides all details on checkout details page
      | customerType | journey | firstName | lastName | businessType |
      | BUS          | BUS     | test      | test     | ABN          |
    And user selects answer for property renovation question for '<state>'
    And user selects mailing address option
      | addressType   | otherAddress                       |
      | Other Address | 68 Mercer Street, GEELONG VIC 3220 |
    And user opts for AAH and DD
      | optAAHOption | optDDOption | directDebitType |
      | No           | Yes         | Bank            |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices  | GaslifeSupportDevices                              |
      | Yes               | BOTH     | Kidney Dialysis Machine | Medically Required Heating and/or Air Conditioning |
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then identification verification pop up is displayed
    When user enters identification details on identification popup
    When user clicks on identification confirmation button
    Then user lands on checkout complete page
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | NMI        | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType |
      | ELE      | VERBALLYACCEPTED | BUSINESS     | ENE       | BSOT-EV  | 6203822385 | N                              | N                              | Y                       | LSKDM                    | EMAIL         |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType |
      | GAS      | VERBALLYACCEPTED | BUSINESS     | ENE       | BSOT-GV  | 5330956738 | N                              | N                              | Y                       | GLSMRHAC                 | EMAIL         |

    Examples:
      | customerStatus | fuelType | planName       | folderName                    | state |
      | New            | BOTH     | Basic Business | E2E_New_Bus_Moving_AcceptCond | VIC   |


  Scenario Outline: Verify if a business customer is displayed with application decline when the user is blocked with faulty credit check
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'BUS' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                  | movingType | propertyType |
      | BUS          | 68 Mercer Street, GEELONG VIC 3220 | Non-Moving |              |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | businessType |
      | BUS          | BUS     | New            | test      | test     | ACN          |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user opts for AAH and DD
      | optAAHOption | optDDOption | directDebitType |
      | Yes          | No          |                 |
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
      | ELE      | VERBALLYACCEPTED | BUSINESS     | COR       | TOPB-EV  | 6203142753 | N                              | N                              | Y                       | OTHER                    | EMAIL         |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType |
      | GAS      | VERBALLYACCEPTED | BUSINESS     | COR       | TOPB-GV  | 5330726895 | N                              | N                              | Y                       | GLSMRHAC                 | EMAIL         |

    Examples:
      | customerStatus | fuelType | planName              | folderName                    |
      | New            | BOTH     | Total Plan - Business | E2E_New_Bus_NonMoving_Decline |


  Scenario Outline: verify if a business customer is displayed with accept message when CDE returns accept
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'BUS' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | customerStatus | connectionAddress                          | movingType | propertyType |
      | BUS          | New            | 36 Gregory Street West, WENDOUREE VIC 3355 | Moving     |              |
    And user provides all details on checkout details page
      | customerType | journey | firstName | lastName | businessType |
      | BUS          | BUS     | test      | test     | ABN          |
    And user selects answer for property renovation question for '<state>'
    And user selects mailing address option
      | addressType   | otherAddress                       |
      | Other Address | 68 Mercer Street, GEELONG VIC 3220 |
    And user opts for AAH and DD
      | optAAHOption | optDDOption | directDebitType |
      | No           | Yes         | Bank            |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices  | GaslifeSupportDevices                              |
      | Yes               | BOTH     | Kidney Dialysis Machine | Medically Required Heating and/or Air Conditioning |
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
      | ELE      | VERBALLYACCEPTED | BUSINESS     | ENE       | BSOT-EV  | 6203822385 | N                              | N                              | Y                       | LSKDM                    | EMAIL         |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType |
      | GAS      | VERBALLYACCEPTED | BUSINESS     | ENE       | BSOT-GV  | 5330956738 | N                              | N                              | Y                       | GLSMRHAC                 | EMAIL         |

    Examples:
      | customerStatus | fuelType | planName       | folderName                | state |
      | New            | BOTH     | Basic Business | E2E_New_Bus_Moving_Accept | VIC   |

  Scenario Outline: verify quote is submitted when CDE returns error due to connectivity
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'BUS' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                  | movingType | propertyType |
      | BUS          | 68 Mercer Street, GEELONG VIC 3220 | Non-Moving |              |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | businessType |
      | BUS          | BUS     | New            | test      | test     | ACN          |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user opts for AAH and DD
      | optAAHOption | optDDOption | directDebitType |
      | Yes          | No          |                 |
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
      | ELE      | VERBALLYACCEPTED | BUSINESS     | COR       | TOPB-EV  | 6203142753 | N                              | N                              | Y                       | OTHER                    | EMAIL         |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType |
      | GAS      | VERBALLYACCEPTED | BUSINESS     | COR       | TOPB-GV  | 5330726895 | N                              | N                              | Y                       | GLSMRHAC                 | EMAIL         |

    Examples:
      | customerStatus | fuelType | planName              | folderName                  |
      | New            | BOTH     | Total Plan - Business | E2E_New_Bus_NonMoving_Error |
