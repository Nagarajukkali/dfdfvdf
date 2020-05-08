@E2E
Feature:E2E scenario for $50 campaign testing
 #Elec - TPP
  #CAMPNSWELECTPP
Scenario Outline: Submit a quote for elec-tpp campaign for NSW
  Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
  When user provides "2000" and clicks on show me plan link
  And user clicks on Add plan button
  And user selects '<customerStatus>' on qualifier
  And user provides all other details on qualifier page
    |customerType| connectionAddress                    |movingType|propertyType|solarOption|
    |RES         | 2 Cavey Street, MARRICKVILLE NSW 2204|Moving    |Renter      |No         |
  And user provides all details on checkout details page
    |customerType|journey    |customerStatus| firstName     | lastName|idType  |medicareType|
    |RES         |RES        |New           | test|test     |Medicare|blue        |
  And user selects answer for property renovation question for '<state>'
  And user clicks on 'Review your order' button and navigates to review page
  And user provides life support details on review page
    |lifeSupportOption|fuelType|EleclifeSupportDevices                        |GaslifeSupportDevices|
    |Yes              |BOTH    |Crigler Najjar Syndrome Phototherapy Equipment|Gas Other            |
  And user verifies selected plan details for '<fuelType>'
  And user submits the quote
  Then user lands on checkout complete page
  And user downloads a pdf copy of plan details

  Examples:
    |customerStatus|fuelType|campaign  |folderName                          |state|username|password                                    |
    |New           |BOTH    |elec-tpp  |E2E_New_Resi_Moving_$50_NSW_ELEC_TPP|NSW  |abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|


  Scenario Outline: Submit a quote for elec-tpp campaign for VIC
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "3000" and clicks on show me plan link
    And user clicks on Add plan button
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType|connectionAddress                    | movingType|propertyType|solarOption|
      |RES         |21 Eltham Street, FLEMINGTON VIC 3031|Non-Moving |Renter      |No         |
    And user selects carbon neutral option
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus| firstName| lastName|idType  |medicareType|
      |RES          |RES        |New           | test|test     |Medicare|green       |
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |No          |Yes        |CC             |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices|GaslifeSupportDevices                             |
      |No               |BOTH    |Ele Other             |Medically Required Heating and/or Air Conditioning|
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user downloads a pdf copy of plan details

    Examples:
      |customerStatus|campaign|fuelType|folderName                             |username|password                                    |
      |New           |elec-tpp|BOTH    |E2E_New_Resi_NonMoving_$50_VIC_ELEC_TPP|abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

  Scenario Outline: Submit a quote for elec-tpp campaign for SA
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "5000" and clicks on show me plan link
    And user clicks on Add plan button
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType| connectionAddress                  |movingType|propertyType|solarOption|
      |RES         | 9 Gooronga Drive, CRAIGMORE SA 5114|Moving    |Renter      |No         |
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|idType  |medicareType|
      |RES         |RES        |New           | test     |test     |Medicare|yellow      |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                        |GaslifeSupportDevices|
      |Yes              |BOTH    |Crigler Najjar Syndrome Phototherapy Equipment|Gas Other            |
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user downloads a pdf copy of plan details

    Examples:
      |customerStatus|fuelType|campaign  |folderName                         |state|username|password                                    |
      |New           |BOTH    |elec-tpp  |E2E_New_Resi_Moving_$50_SA_ELEC_TPP|SA  |abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

  #Gas-TPP
  Scenario Outline: Submit a quote for gas-tpp campaign for NSW
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "2000" and clicks on show me plan link
    And user clicks on Add plan button
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType|connectionAddress                    | movingType|propertyType|solarOption|
      |RES         |89 Winten Drive, GLENDENNING NSW 2761|Non-Moving |Renter      |No         |
    And user selects carbon neutral option
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus| firstName| lastName|idType  |medicareType|
      |RES          |RES        |New           | test|test     |Medicare|blue        |
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |No          |Yes        |CC             |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices|GaslifeSupportDevices                             |
      |Yes              |BOTH    |Ele Other             |Medically Required Heating and/or Air Conditioning|
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user downloads a pdf copy of plan details

    Examples:
      |customerStatus|campaign|fuelType|folderName                            |username|password                                    |
      |New           |gas-tpp |BOTH    |E2E_New_Resi_NonMoving_$50_NSW_GAS_TPP|abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

  Scenario Outline: Submit a quote for gas-tpp campaign for VIC
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "3000" and clicks on show me plan link
    And user clicks on Add plan button
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType| connectionAddress                      |movingType|propertyType|solarOption|
      |RES         | 11 Newry Street, FITZROY NORTH VIC 3068|Moving    |Renter      |No         |
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName    | lastName|idType        |
      |RES         |RES        |New           | test|test     |Driver License|
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                        |GaslifeSupportDevices|
      |Yes              |BOTH    |Crigler Najjar Syndrome Phototherapy Equipment|Gas Other            |
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user downloads a pdf copy of plan details

    Examples:
      |customerStatus|fuelType|campaign  |folderName                          |state|username|password                                    |
      |New           |BOTH    |gas-tpp   |E2E_New_Resi_Moving_$50_VIC_GAS_TPP|VIC  |abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|


  Scenario Outline: Submit a quote for gas-tpp campaign for SA
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "5000" and clicks on show me plan link
    And user clicks on Add plan button
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType|connectionAddress                        | movingType|propertyType|solarOption|
      |RES         |8 Seavista Grove, CHRISTIES BEACH SA 5165|Non-Moving |Renter      |No         |
    And user selects carbon neutral option
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus| firstName| lastName|idType  |medicareType|
      |RES          |RES        |New           | test     |test     |Medicare|yellow      |
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |No          |Yes        |CC             |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices|GaslifeSupportDevices                             |
      |Yes              |BOTH    |Ele Other             |Medically Required Heating and/or Air Conditioning|
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user downloads a pdf copy of plan details

    Examples:
      |customerStatus|campaign|fuelType|folderName                           |username|password                                    |
      |New           |gas-tpp |BOTH    |E2E_New_Resi_NonMoving_$50_SA_GAS_TPP|abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

    #Elec-TP

  Scenario Outline: Submit a quote for elec-totalP campaign for NSW
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "2000" and clicks on show me plan link
    And user clicks on Add plan button
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType| connectionAddress                      |movingType|propertyType|solarOption|
      |RES         | 43 Coronation Avenue, CRONULLA NSW 2230|Moving    |Renter      |No         |
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|idType  |medicareType|
      |RES         |RES        |New           | test|test     |Medicare|blue        |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                        |GaslifeSupportDevices|
      |Yes              |BOTH    |Crigler Najjar Syndrome Phototherapy Equipment|Gas Other            |
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user downloads a pdf copy of plan details

    Examples:
      |customerStatus|fuelType|campaign  |folderName                         |state|username|password                                    |
      |New           |BOTH    |elec-tp   |E2E_New_Resi_Moving_$50_NSW_ELEC_TP|NSW  |abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

  Scenario Outline: Submit a quote for elec-totalP campaign for VIC
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "3000" and clicks on show me plan link
    And user clicks on Add plan button
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType|connectionAddress                   | movingType|propertyType|solarOption|
      |RES         |14 Westley Avenue, BRIGHTON VIC 3186|Non-Moving |Renter      |No         |
    And user selects carbon neutral option
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus| firstName| lastName|idType  |medicareType|
      |RES          |RES        |New           | test|test     |Medicare|green       |
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |No          |Yes        |CC             |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices|GaslifeSupportDevices                             |
      |No               |BOTH    |Ele Other             |Medically Required Heating and/or Air Conditioning|
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user downloads a pdf copy of plan details

    Examples:
      |customerStatus|campaign|fuelType|folderName                            |username|password                                    |
      |New           |elec-tp |BOTH    |E2E_New_Resi_NonMoving_$50_VIC_ELEC_TP|abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|


  Scenario Outline: Submit a quote for elec-totalP campaign for SA
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "5000" and clicks on show me plan link
    And user clicks on Add plan button
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType| connectionAddress                   |movingType|propertyType|solarOption|
      |RES         | 6 Edgar Street, BEDFORD PARK SA 5042|Moving    |Renter      |No         |
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|idType  |medicareType|
      |RES         |RES        |New           | test     |test     |Medicare|yellow      |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                        |GaslifeSupportDevices|
      |Yes              |BOTH    |Crigler Najjar Syndrome Phototherapy Equipment|Gas Other            |
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user downloads a pdf copy of plan details

    Examples:
      |customerStatus|fuelType|campaign  |folderName                        |state|username|password                                    |
      |New           |BOTH    |elec-tp   |E2E_New_Resi_Moving_$50_SA_ELEC_TP|SA  |abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

#Gas-TP

  Scenario Outline: Submit a quote for gas-totalP campaign for NSW
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "2000" and clicks on show me plan link
    And user clicks on Add plan button
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType|connectionAddress                    | movingType|propertyType|solarOption|
      |RES         |22 Sanderson Road, KANAHOOKA NSW 2530|Non-Moving |Renter      |No         |
    And user selects carbon neutral option
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus| firstName| lastName|idType  |medicareType|
      |RES          |RES        |New           | test     |test     |Medicare|blue        |
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |No          |Yes        |CC             |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices|GaslifeSupportDevices                             |
      |Yes              |BOTH    |Ele Other             |Medically Required Heating and/or Air Conditioning|
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user downloads a pdf copy of plan details

    Examples:
      |customerStatus|campaign|fuelType|folderName                           |username|password                                    |
      |New           |gas-tp  |BOTH    |E2E_New_Resi_NonMoving_$50_NSW_GAS_TP|abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

  Scenario Outline: Submit a quote for gas-totalP campaign for VIC
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "3000" and clicks on show me plan link
    And user clicks on Add plan button
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType| connectionAddress                   |movingType|propertyType|solarOption|
      |RES         | 26 Cameron Street, PORTLAND VIC 3305|Moving    |Renter      |No         |
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus| firstName| lastName|idType  |medicareType|
      |RES          |RES        |New           | test     |test     |Medicare|blue        |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                        |GaslifeSupportDevices|
      |Yes              |BOTH    |Crigler Najjar Syndrome Phototherapy Equipment|Gas Other            |
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user downloads a pdf copy of plan details

    Examples:
      |customerStatus|fuelType|campaign  |folderName                        |state|username|password                                    |
      |New           |BOTH    |gas-tp    |E2E_New_Resi_Moving_$50_VIC_GAS_TP|VIC  |abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

  Scenario Outline: Submit a quote for gas-totalP campaign for SA
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "5000" and clicks on show me plan link
    And user clicks on Add plan button
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType|connectionAddress                      | movingType|propertyType|solarOption|
      |RES         |9 Vynland Drive, FLAGSTAFF HILL SA 5159|Non-Moving |Renter      |No         |
    And user selects carbon neutral option
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus| firstName| lastName|idType  |medicareType|
      |RES          |RES        |New           | test     |test     |Medicare|green        |
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |No          |Yes        |CC             |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices|GaslifeSupportDevices                             |
      |Yes              |BOTH    |Ele Other             |Medically Required Heating and/or Air Conditioning|
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user downloads a pdf copy of plan details

    Examples:
      |customerStatus|campaign|fuelType|folderName                          |username|password                                    |
      |New           |gas-tp  |BOTH    |E2E_New_Resi_NonMoving_$50_SA_GAS_TP|abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

    #Total-Plan

  Scenario Outline: Submit a quote for total-plan campaign for NSW
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "2000" and clicks on show me plan link
    And user clicks on Add plan button
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType|connectionAddress                 | movingType|propertyType|solarOption|
      |RES         |8 French Street, MAROUBRA NSW 2035|Non-Moving |Renter      |No         |
    And user selects carbon neutral option
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName   | lastName|idType        |
      |RES         |RES        |New           | test|test     |Driver License|
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |No          |Yes        |CC             |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices|GaslifeSupportDevices                             |
      |Yes              |BOTH    |Ele Other             |Medically Required Heating and/or Air Conditioning|
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user downloads a pdf copy of plan details

    Examples:
      |customerStatus|campaign|fuelType|folderName                               |username|password                                    |
      |New           |total   |BOTH    |E2E_New_Resi_NonMoving_$50_NSW_Total|abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

  Scenario Outline: Submit a quote for total-plan campaign for VIC
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "3000" and clicks on show me plan link
    And user clicks on Add plan button
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType| connectionAddress                         |movingType|propertyType|solarOption|
      |RES         | 72 Featherbrook Drive, POINT COOK VIC 3030|Moving    |Renter      |No         |
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName   | lastName|idType  |
      |RES         |RES        |New           | test|test     |Passport|
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                        |GaslifeSupportDevices|
      |Yes              |BOTH    |Crigler Najjar Syndrome Phototherapy Equipment|Gas Other            |
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user downloads a pdf copy of plan details

    Examples:
      |customerStatus|campaign|fuelType|campaign  |folderName                             |state|username|password                                    |
      |New           |total   |BOTH    |Offer     |E2E_New_Resi_Moving_$50_VIC_Total|VIC  |abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

  Scenario Outline: Submit a quote for total-plan for QLD
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "4000" and clicks on show me plan link
    And user clicks on Add plan button
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType|connectionAddress                       | movingType|propertyType|solarOption|
      |RES         |27 Cooinda Street, SLACKS CREEK QLD 4127|Non-Moving |Renter      |No         |
    And user selects carbon neutral option
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus| firstName| lastName|idType  |medicareType|
      |RES          |RES        |New           | test|test     |Medicare|yellow      |
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |No          |No         |CC             |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices|GaslifeSupportDevices                             |
      |Yes              |ELE     |Ele Other             |Medically Required Heating and/or Air Conditioning|
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user downloads a pdf copy of plan details

    Examples:
      |customerStatus|campaign|fuelType|folderName                          |username|password                                    |
      |New           |total   |ELE     |E2E_New_Resi_NonMoving_$50_QLD_Total|abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

#total-plan-plus - Negative Scenario
  Scenario Outline: Submit a quote for total-plan-plus for QLD
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "4000" and clicks on show me plan link
    And user clicks on Add plan button
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType|connectionAddress              | movingType|propertyType|solarOption|
      |RES         |1 Remo Place, BIRKDALE QLD 4159|Non-Moving |Renter      |No         |
    And user selects carbon neutral option
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus| firstName| lastName|idType  |medicareType|
      |RES          |RES        |New           | test|test     |Medicare|yellow      |
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |No          |No         |CC             |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices|GaslifeSupportDevices                             |
      |Yes              |ELE     |Ele Other             |Medically Required Heating and/or Air Conditioning|
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user downloads a pdf copy of plan details

    Examples:
      |customerStatus|campaign|fuelType|folderName                            |username|password                                    |
      |New           |total-plan-plus|ELE     |E2E_New_Resi_NonMoving_$50_QLD_Total_Plus|abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

#comeback
  Scenario Outline: Submit a quote for comeback for QLD
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "4000" and clicks on show me plan link
    And user clicks on Add plan button
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType|connectionAddress                        | movingType|propertyType|solarOption|
      |RES         |29 Ingleston Street, WYNNUM WEST QLD 4178|Non-Moving |Renter      |No         |
    And user selects carbon neutral option
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus| firstName| lastName|idType  |medicareType|
      |RES          |RES        |New           | test|test     |Medicare|yellow      |
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |No          |No         |CC             |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices|GaslifeSupportDevices                             |
      |Yes              |ELE     |Ele Other             |Medically Required Heating and/or Air Conditioning|
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user downloads a pdf copy of plan details

    Examples:
      |customerStatus|campaign|fuelType|folderName                             |username|password                                    |
      |New           |comeback|ELE     |E2E_New_Resi_NonMoving_$50_QLD_COMEBACK|abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

  #familyandfriends - negative scenario
  Scenario Outline: Submit a quote for familyandfriends for QLD
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "test111111" and "4000" and clicks on show me plan link
    And user clicks on Add plan button
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType| connectionAddress                 | movingType|propertyType|solarOption|
      |RES         | 83 Viewland Drive, DOONAN QLD 4562|Moving     |Renter      |No         |
    And user selects carbon neutral option
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus| firstName| lastName|idType  |medicareType|
      |RES          |RES        |New           | test|test     |Medicare|blue      |
    And user selects answer for property renovation question for '<state>'
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |No         |No         |               |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                        |GaslifeSupportDevices|
      |Yes              |ELE     |Crigler Najjar Syndrome Phototherapy Equipment|Gas Other            |
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user downloads a pdf copy of plan details

    Examples:
      |customerStatus|campaign|fuelType|folderName                     |state|username|password                                    |
      |New           |familyandfriends|ELE     |E2E_New_Resi_Moving_$50_QLD_FnF|QLD  |abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

    #EACorporateOffer - negative scenario
  Scenario Outline: Submit a quote for EACorporateOffer for QLD
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "reward" and "4000" and clicks on show me plan link
    And user clicks on Add plan button
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType| connectionAddress                    | movingType|propertyType|solarOption|
      |RES         | 53 Woodford Street, ONE MILE QLD 4305|Moving     |Renter      |No         |
    And user selects carbon neutral option
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus| firstName| lastName|idType  |medicareType|
      |RES          |RES        |New           | test|test     |Medicare|blue      |
    And user selects answer for property renovation question for '<state>'
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |No         |No         |               |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                        |GaslifeSupportDevices|
      |Yes              |ELE     |Crigler Najjar Syndrome Phototherapy Equipment|Gas Other            |
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user downloads a pdf copy of plan details

    Examples:
      |customerStatus|campaign|fuelType|folderName                        |state|username|password                                    |
      |New           |eacorporateOffer|ELE     |E2E_New_Resi_Moving_$50_QLD_EACorp|QLD  |abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|
