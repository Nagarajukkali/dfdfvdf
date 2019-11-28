@E2E
Feature:E2E scenario for new business moving and non moving customer
@test
Scenario Outline: Submit a quote for new business moving customer
  Given user has opened the website link in a browser and creates '<folderName>' to save evidences
  And user has navigated to 'BUS' plans page
  When user selects '<planName>' from 'BUS' plans page
  And user moves on to fill the qualifier
  And user provides all details on qualifier page for New customer
  |customerType| customerStatus| connectionAddress                         | movingType|propertyType|solarOption|
  |BUS         |New            | 36 Gregory Street West, WENDOUREE VIC 3355|Moving     |            |No         |
  And user provides all details on checkout details page
  |customerType|journey    |customerStatus| firstName| lastName|businessType|
  |BUS         |BUS        |New           | test     |test     |ABN         |
  And user selects answer for property renovation question for '<state>'
  And user clicks on 'Review your order' button and navigates to review page
  And user provides life support details on review page
  |lifeSupportOption|fuelType|EleclifeSupportDevices |GaslifeSupportDevices                             |
  |Yes              |BOTH    |Kidney Dialysis Machine|Medically Required Heating and/or Air Conditioning|
  #And user submits the quote
  Examples:
  |planName      |folderName        |state|
  |Basic Business|E2E_New_Bus_Moving|VIC  |

Scenario Outline: Submit a quote for new business non moving customer
  Given user has opened the website link in a browser and creates '<folderName>' to save evidences
  And user has navigated to 'RES' plans page
  When user selects '<planName>' from 'RES' plans page
  And user moves on to fill the qualifier
  And user provides all details on qualifier page for New customer
    | customerStatus| connectionAddress               | movingType|propertyType|solarOption|
    |New            | 5 Wilkies Street, BULLI NSW 2516|Non-Moving |Renter      |No         |
  And user provides all details on checkout details page for Residential customer
    |journey    |customerStatus| firstName| lastName|idType        |
    |RES        |New           | test     |test     |Driver License|
  And user clicks on 'Review your order' button and navigates to review page
  And user provides life support details on review page
    |lifeSupportOption|fuelType|EleclifeSupportDevices|GaslifeSupportDevices                             |
    |Yes              |BOTH    |Ele Other             |Medically Required Heating and/or Air Conditioning|
  And user submits the quote
  Examples:
    |planName|folderName                |
    |Total Plan  |E2E_New_Resi_NonMoving|
