@E2E
Feature:E2E scenario for offer campaign

Scenario Outline: Submit a quote for offer campaign
  Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
  When user provides postcode and clicks on show me plan link
  And user clicks on Add plan button
  And user selects '<customerStatus>' on qualifier
  And user provides all other details on qualifier page
    |customerType| connectionAddress               | movingType|propertyType|solarOption|
    |RES         | 5 Wilkies Street, BULLI NSW 2516|Moving     |Renter      |No         |
  And user provides all details on checkout details page
    |customerType|journey    |customerStatus| firstName| lastName|idType        |
    |RES         |RES        |New           | test     |test     |Driver License|
  And user selects answer for property renovation question for '<state>'
  And user clicks on 'Review your order' button and navigates to review page
  And user provides life support details on review page
    |lifeSupportOption|fuelType|EleclifeSupportDevices                        |GaslifeSupportDevices|
    |Yes              |BOTH    |Crigler Najjar Syndrome Phototherapy Equipment|Gas Other            |
  And user submits the quote
  Then user lands on checkout complete page
  Examples:
    |customerStatus|campaign  |folderName         |state|
    |New           |Offer     |E2E_New_Resi_Moving|NSW  |




