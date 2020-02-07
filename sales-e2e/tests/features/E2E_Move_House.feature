@E2E
Feature:E2E scenario for existing residential moving customer through move house

Scenario Outline: Submit a quote for existing residential customer through move house
  Given user has opened the website link in a browser and creates '<folderName>' to save evidences
  When user has navigated to move house page
  And user enters '<movingAddress>' in address field and selects any available moving date
  And user verifies account on qualifier
    |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
    |Existing      |8372937428   |Postcode           |3024            |dob   |01011980|
  And user provides all other details on qualifier page
    |customerType|movingType|connectionAddress               |propertyType |solarOption|
    |RES         |NA        |5 Wilkies Street, BULLI NSW 2516|Renter       |No         |
  And user selects plans on checkout details page
    |elePlan        |gasPlan   |
    |Total Plan Plus|Total Plan|
  And user provides all details on checkout details page
    |customerType|journey    |customerStatus| firstName| lastName|idType        |
    |RES         |RES        |Existing      | test     |test     |Driver License|
  And user selects answer for property renovation question for '<state>'
  And user chooses "<optDisconnection>" for disconnection
  And user clicks on 'Review your order' button and navigates to review page
  And user provides life support details on review page
    |lifeSupportOption|fuelType|EleclifeSupportDevices|GaslifeSupportDevices|
    |Yes              |BOTH    |Ele Other             |Gas Other            |
  And user submits the quote
  Then user lands on checkout complete page
  Examples:
    |folderName              |state|optDisconnection|movingAddress                   |
    |E2E_Existing_Resi_Moving|NSW  |Yes             |5 Wilkies Street, BULLI NSW 2516|


