@E2E
Feature:E2E scenario for new residential moving and non moving customer

Scenario Outline: Submit a quote for new residential moving customer
  Given user has opened the website link in a browser and creates '<folderName>' to save evidences
  And user has navigated to 'RES' plans page
  When user selects '<planName>' from 'RES' plans page
  And user moves on to fill the qualifier
  And user provides all details on qualifier page for New customer
  |customerType| customerStatus| connectionAddress               | movingType|propertyType|solarOption|
  |RES         |New            | 5 Wilkies Street, BULLI NSW 2516|Moving     |Renter      |No         |
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
  |planName|folderName             |state|
  |Total Plan  |E2E_New_Resi_Moving|NSW  |

Scenario Outline: Submit a quote for new residential non moving customer
  Given user has opened the website link in a browser and creates '<folderName>' to save evidences
  And user has navigated to 'RES' plans page
  When user selects '<planName>' from 'RES' plans page
  And user moves on to fill the qualifier
  And user provides all details on qualifier page for New customer
    |customerType| customerStatus| connectionAddress               | movingType|propertyType|solarOption|
    |RES         |New            | 5 Wilkies Street, BULLI NSW 2516|Non-Moving |Renter      |No         |
  And user provides all details on checkout details page
    |customerType |journey    |customerStatus| firstName| lastName|idType        |
    |RES          |RES        |New           | test     |test     |Driver License|
  And user clicks on 'Review your order' button and navigates to review page
  And user provides life support details on review page
    |lifeSupportOption|fuelType|EleclifeSupportDevices|GaslifeSupportDevices                             |
    |Yes              |BOTH    |Ele Other             |Medically Required Heating and/or Air Conditioning|
  And user submits the quote
  Then user lands on checkout complete page
  Examples:
    |planName|folderName                |
    |Total Plan  |E2E_New_Resi_NonMoving|
