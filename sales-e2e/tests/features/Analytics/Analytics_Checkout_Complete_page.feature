@checkoutcomplete @analytics
Feature: Scenarios to cover the data layer updates and analytics events trigger on checkout complete page

  Scenario Outline: Validate the updated data layer for quoteId
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    And user initiates the call to capture analytics events
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                 | movingType | propertyType |
      | RES          | 3 River Drive, ATHELSTONE SA 5076 | Non-Moving | Renter       |
    And user validates details on checkout details page
      | sourceSystem   | journey   | fuelType   |
      | <sourceSystem> | <journey> | <fuelType> |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType   |
      | RES          | RES     | New            | test      | test     | Passport |
    And user selects mailing address option
      | addressType   | otherAddress                           |
      | Other Address | 42 Brownlow Drive, POINT COOK VIC 3030 |
    And user opts for AAH and DD
      | optAAHOption | optDDOption | directDebitType |
      | No           | Yes         | Bank            |
    And user selects "Email" billing preference option
    And user sends welcome pack through 'Email'
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices                              |
      | Yes               | BOTH     | Ele Other              | Medically Required Heating and/or Air Conditioning |
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
      | ELE      | VERBALLYACCEPTED | RESIDENTIAL  | COR       | TOPH-ES  | 2001245279 | N                              | N                              | Y                       | OTHER                    | EMAIL         |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | COR       | TOPH-GS  | 5510149276 | N                              | N                              | Y                       | GLSMRHAC                 | EMAIL         |
    And user closes the spy on datalayer
    Examples:
      | customerStatus | fuelType | planName   | folderName                                    | sourceSystem | journey     | AAH | DD  | customerType | newOrExisting |
      | New            | BOTH     | Total Plan | E2E_Analytics_Resi_Checkout_Complete_QuoteID  | Quote Tool   | Plan Switch | No  | Yes | RES          | New           |
