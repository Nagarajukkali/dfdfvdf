@E2E
Feature:E2E scenario for existing residential moving customer for $50 credit extension

Scenario Outline: Submit a quote for existing residential moving customer for VIC with FRMP/FRO as EA
  Given user has opened the website link in a browser and creates '<folderName>' to save evidences
  And user has navigated to 'RES' plans page
  And user have selected fuel as "<fuelType>"
  When user clicks on the verify modal window on 'RES' page
  And user verifies the account through verify account journey for residential customer
    |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |postcode |idType |idNumber |
    |RES          |verify account |5564281925       |1956336357       |3840     |dob    |01011980 |
  And user selects '<planName>'
  And user moves on to fill the qualifier
  And user provides all other details on qualifier page for Existing customer
    |customerType|movingType |connectionAddress                  |propertyType |solarOption|
    |RES         |Moving     |25 Churchill Road, MORWELL VIC 3840|Renter       |No         |
  And user selects carbon neutral option
  And user provides all details on checkout details page
    |customerType|journey    |customerStatus| firstName     | lastName|idType        |
    |RES         |RES        |Existing      | test|test     |Driver License|
  And user selects answer for property renovation question for '<state>'
  And user chooses "<optDisconnection>" for disconnection
  And user opts for AAH and DD
    |optAAHOption|optDDOption|directDebitType|
    |No          |No         |Bank           |
  And user clicks on 'Review your order' button and navigates to review page
  And user provides life support details on review page
    |lifeSupportOption|fuelType|EleclifeSupportDevices|GaslifeSupportDevices|
    |Yes              |BOTH    |Ele Other             |Gas Other            |
  And user verifies selected plan details for '<fuelType>'
  And user submits the quote
  Then user lands on checkout complete page
  And user downloads a pdf copy of plan details

  Examples:
  |fuelType|planName  |folderName                         |state|optDisconnection|username|password                                    |
  |BOTH    |Total Plan|E2E_Existing_Resi_Moving_$50_VIC_EA|VIC  |No              |abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

  Scenario Outline: Submit a quote for existing residential moving customer for NSW with FRMP/FRO as EA
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |5712581190   |Postcode           |2283            |dob   |01011980|
    And user provides all other details on qualifier page for Existing customer
      |customerType|movingType |connectionAddress                     |propertyType |solarOption|
      |RES         |Moving     |16 Sandra Street, FENNELL BAY NSW 2283|Renter       |No         |
    And user selects carbon neutral option
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|idType  |
      |RES         |RES        |Existing      | test|test     |Passport|
    And user selects answer for property renovation question for '<state>'
    And user chooses "<optDisconnection>" for disconnection
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |No          |Yes        |Bank           |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices|GaslifeSupportDevices|
      |No               |BOTH    |Ele Other             |Gas Other            |
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user downloads a pdf copy of plan details

    Examples:
      |customerStatus|fuelType|planName  |folderName                         |state|optDisconnection|username|password                                    |
      |Existing      |BOTH    |Basic Home|E2E_Existing_Resi_Moving_$50_NSW_EA|NSW  |No              |abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

  Scenario Outline: Submit a quote for existing residential moving customer for QLD with FRMP/FRO as EA
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    And user have selected fuel as "<fuelType>"
    When user clicks on the verify modal window on 'RES' page
    And user verifies the account through verify account journey for residential customer
      |customer_type|modal_option   |elecAccountNumber|postcode |idType |idNumber |
      |RES          |verify account |1636623646       |4304     |dob    |01011980 |
    And user selects '<planName>'
    And user moves on to fill the qualifier
    And user provides all other details on qualifier page for Existing customer
      |customerType|movingType |connectionAddress                  |propertyType |solarOption|state|
      |RES         |Moving     |18 Bryant Court, SILKSTONE QLD 4304|Renter       |No         |QLD  |
    And user selects carbon neutral option
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|idType        |
      |RES         |RES        |Existing      | test|test     |Driver License|
    And user selects answer for property renovation question for '<state>'
    And user chooses "<optDisconnection>" for disconnection
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |Yes         |No        |Bank           |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices|GaslifeSupportDevices|
      |Yes              |ELE    |Ele Other             |            |
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user downloads a pdf copy of plan details

    Examples:
      |fuelType|planName  |folderName                         |state|optDisconnection|username|password                                    |
      |ELE     |No Frills|E2E_Existing_Resi_Moving_$50_QLD_EA |QLD  |No              |abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

    #Negative Scenario
  Scenario Outline: Submit a quote for existing residential moving customer for SA with FRMP/FRO as EA
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |1589867093   |Postcode           |5109            |dob   |01011980|
    And user provides all other details on qualifier page for Existing customer
      |customerType|movingType |connectionAddress                        |propertyType |solarOption|
      |RES         |Moving     |10 Austral Street, SALISBURY EAST SA 5109|Renter       |No         |
    And user selects carbon neutral option
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|idType        |
      |RES         |RES        |Existing      | test|test     |Driver License|
    And user selects answer for property renovation question for '<state>'
    And user chooses "<optDisconnection>" for disconnection
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |No          |Yes        |Bank           |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices|GaslifeSupportDevices|
      |Yes              |BOTH    |Ele Other             |Gas Other            |
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user downloads a pdf copy of plan details

    Examples:
      |customerStatus|fuelType|planName  |folderName                        |state|optDisconnection|username|password                                    |
      |Existing      |BOTH    |Total Plan|E2E_Existing_Resi_Moving_$50_SA_EA|SA   |No              |abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

    #Negative Scenario
  Scenario Outline: Submit a quote for existing residential moving customer for ACT with FRMP/FRO as EA
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    And user have selected fuel as "<fuelType>"
    When user clicks on the verify modal window on 'RES' page
    And user verifies the account through verify account journey for residential customer
      |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |postcode |idType |idNumber |
      |RES          |verify account |6784499133       |5756853487       |2614     |dob    |01011980 |
    And user selects '<planName>'
    And user moves on to fill the qualifier
    And user provides all other details on qualifier page for Existing customer
      |customerType|movingType |connectionAddress               |propertyType |solarOption|
      |RES         |Moving     |1 Moroak Street, HAWKER ACT 2614|Renter       |No         |
    And user selects carbon neutral option
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|idType        |
      |RES         |RES        |Existing      | test     |test     |Driver License|
    And user selects answer for property renovation question for '<state>'
    And user chooses "<optDisconnection>" for disconnection
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |Yes         |Yes        |Bank           |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices|GaslifeSupportDevices|
      |No              |BOTH    |Ele Other             |Gas Other            |
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user downloads a pdf copy of plan details

    Examples:
      |fuelType|planName  |folderName                         |state|optDisconnection|username|password                                    |
      |BOTH    |Basic Home|E2E_Existing_Resi_Moving_$50_ACT_EA|ACT  |No              |abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

    #Negative Scenario
  Scenario Outline: Submit a quote for existing residential moving customer for VIC with FRMP/FRO as EA
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customer_type>' plans page
    And user have selected fuel as "<fuelType>"
    When user clicks on the verify modal window on '<customer_type>' page
    And user verifies the account through verify account journey for residential customer
      |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |postcode |idType |idNumber |
      |RES          |verify account |7810021000       |3720611000       |3672     |dob    |01011980 |
    And user selects '<planName>'
    And user moves on to fill the qualifier
    And user provides all other details on qualifier page for Existing customer
      |customerType|movingType |connectionAddress              |propertyType |solarOption  |
      |RES         |Moving     |42 Roe Street, BENALLA VIC 3672|Renter       |No           |
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus|firstName|lastName|idType    |
      |RES         |RES        |Existing      |test|test    |Passport  |
    And user selects answer for property renovation question for '<state>'
    And user chooses "<optDisconnection>" for disconnection
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                        |GaslifeSupportDevices        |
      |Yes              |BOTH    |Chronic Positive Airways Pressure Respirator  |Medically Required Hot Water |
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user downloads a pdf copy of plan details

    Examples:
      |folderName                               |customer_type |fuelType |planName       |optDisconnection |state  |username|password                                    |
      |E2E_VerifyAccount_Residential_Moving     |RES           |BOTH     |Total Plan Plus|No               |VIC    |abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

  @50CreditExtensionMovingExisting
  Scenario Outline: Submit a quote for existing residential customer through move house
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    When user has navigated to move house page
    And user enters '<movingAddress>' in address field and selects any available moving date
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |8372937428   |Postcode           |3024            |dob   |01011980|
    And user provides all other details on qualifier page
      |customerType|movingType|connectionAddress                         |propertyType |solarOption|
      |RES         |NA        |21 Carmichael Drive, WYNDHAM VALE VIC 3024|Renter       |No         |
    And user selects plans on checkout details page
      |elePlan   |gasPlan   |
      |Total Plan|Total Plan|
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|idType        |
      |RES         |RES        |Existing      | test|test     |Driver License|
    And user selects answer for property renovation question for '<state>'
    And user chooses "<optDisconnection>" for disconnection
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices|GaslifeSupportDevices|
      |Yes              |BOTH    |Ele Other             |Gas Other            |
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user downloads a pdf copy of plan details

    Examples:
      |folderName                        |fuelType|state|optDisconnection|movingAddress                             |username|password                                    |
      |E2E_Existing_Resi_Moving_MoveHouse|BOTH    |VIC  |No              |21 Carmichael Drive, WYNDHAM VALE VIC 3024|abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|


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
      |RES         |RES        |Existing      | test|test     |Driver License|
    And user selects answer for property renovation question for '<state>'
    And user chooses "<optDisconnection>" for disconnection
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices|GaslifeSupportDevices|
      |Yes              |BOTH    |Ele Other             |Gas Other            |
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user downloads a pdf copy of plan details

    Examples:
      |folderName                                   |fuelType|state|optDisconnection|movingAddress                   |username|password                                    |
      |E2E_Existing_Resi_Moving_Movehouse_Total_Plus|BOTH    |NSW  |No              |5 Wilkies Street, BULLI NSW 2516|abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

  Scenario Outline: Submit a quote for existing residential non moving customer for VIC with FRMP/FRO as EA
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    And user have selected fuel as "<fuelType>"
    When user clicks on the verify modal window on 'RES' page
    And user verifies the account through verify account journey for residential customer
      |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |postcode |idType |idNumber |
      |RES          |verify account |8513751442       |3244400209       |3163     |dob    |01011980 |
    And user selects '<planName>'
    And user moves on to fill the qualifier
    And user provides all other details on qualifier page for Existing customer
      |customerType|movingType |propertyType |solarOption  |
      |RES         |Non-Moving |Owner        |No           |
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus| firstName      | lastName|idType        |
      |RES          |RES        |Existing      | test|test     |Driver License|
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                  |GaslifeSupportDevices       |
      |Yes              |ELE     |Intermittent Peritoneal Dialysis Machine|                            |
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user downloads a pdf copy of plan details

    Examples:
      |planName |folderName                            |fuelType|username|password                                    |
      |No Frills|E2E_Existing_Resi_NonMoving_$50_VIC_EA|BOTH    |abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

  Scenario Outline: Submit a quote for existing residential non moving customer for NSW with FRMP/FRO as EA
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |0053368171   |Postcode           |2322            |dob   |01011980|
    And user provides all other details on qualifier page for Existing customer
      |customerType|movingType |propertyType |solarOption  |
      |RES         |Non-Moving |Owner        |No           |
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus| firstName      | lastName|idType        |
      |RES          |RES        |Existing      | test|test     |Driver License|
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                  |GaslifeSupportDevices       |
      |Yes              |GAS     |                                        |Medically Required Hot Water|
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user downloads a pdf copy of plan details

    Examples:
      |customerStatus|planName  |folderName                            |fuelType  |username|password                                    |
      |Existing      |Total Plan|E2E_Existing_Resi_NonMoving_$50_NSW_EA|BOTH      |abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

  Scenario Outline: Submit a quote for existing residential non moving customer for QLD with FRMP/FRO as EA
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    And user have selected fuel as "<fuelType>"
    When user clicks on the verify modal window on 'RES' page
    And user verifies the account through verify account journey for residential customer
      |customer_type|modal_option   |elecAccountNumber|postcode |idType |idNumber |
      |RES          |verify account |2802690723       |4132     |dob    |01011980 |
    And user selects '<planName>'
    And user moves on to fill the qualifier
    And user provides all other details on qualifier page for Existing customer
      |customerType|movingType |propertyType |solarOption  |
      |RES         |Non-Moving |Owner        |No           |
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus| firstName| lastName|idType        |
      |RES          |RES        |Existing      | test|test     |Driver License|
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                  |GaslifeSupportDevices       |
      |No               |     |                                         |                            |
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user downloads a pdf copy of plan details

    Examples:
      |planName   |folderName                             |fuelType|username|password                                    |
      |Basic Home QLD|E2E_Existing_Resi_NonMoving_$50_QLD_EA|ELE     |abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

  Scenario Outline: Submit a quote for existing residential non moving customer for SA with FRMP/FRO as EA
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |8321102099   |Postcode           |5158            |dob   |01011980|
    And user provides all other details on qualifier page for Existing customer
      |customerType|movingType |propertyType |solarOption  |
      |RES         |Non-Moving |Owner        |No           |
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus| firstName| lastName|idType        |
      |RES          |RES        |Existing      | test|test     |Driver License|
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                  |GaslifeSupportDevices       |
      |Yes              |BOTH    |Intermittent Peritoneal Dialysis Machine|Medically Required Hot Water|
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user downloads a pdf copy of plan details

    Examples:
      |customerStatus|planName |folderName                           |fuelType|username|password                                   |
      |Existing      |No Frills|E2E_Existing_Resi_NonMoving_$50_SA_EA|BOTH    |abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

  Scenario Outline: Submit a quote for existing residential non moving customer for ACT with FRMP/FRO as EA
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    And user have selected fuel as "<fuelType>"
    When user clicks on the verify modal window on 'RES' page
    And user verifies the account through verify account journey for residential customer
      |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |postcode |idType |idNumber |
      |RES          |verify account |0808021000       |5380160000       |2913     |dob    |01011980 |
    And user selects '<planName>'
    And user moves on to fill the qualifier
    And user provides all other details on qualifier page for Existing customer
      |customerType|movingType |propertyType |solarOption  |
      |RES         |Non-Moving |Owner        |No           |
    And user provides all details on checkout details page
      |customerType |journey    |customerStatus| firstName| lastName|idType        |
      |RES          |RES        |Existing      | test|test     |Driver License|
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                  |GaslifeSupportDevices       |
      |No               |     |                                           |                            |
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user downloads a pdf copy of plan details

    Examples:
      |planName |folderName                             |fuelType|username|password                                    |
      |Total Plan|E2E_Existing_Resi_NonMoving_$50_ACT_EA|BOTH    |abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

  Scenario Outline: Submit a quote for existing residential non moving customer for VIC with FRMP/FRO as EA and plan selected as Total Plan Plus
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customer_type>' plans page
    And user have selected fuel as "<fuelType>"
    When user clicks on the verify modal window on '<customer_type>' page
    And user verifies the account through verify account journey for residential customer
      |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |postcode |idType |idNumber |
      |RES          |verify account |8373520946       |2816302453       |3153     |dob    |01011980 |
    And user selects '<planName>'
    And user moves on to fill the qualifier
    And user provides all other details on qualifier page for Existing customer
      |customerType|movingType |propertyType |solarOption  |
      |RES         |Non-Moving |Owner        |No           |
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus|firstName       |lastName|idType        |
      |RES         |RES        |Existing      |test|test    |Driver License|
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                    |GaslifeSupportDevices  |
      |Yes              |BOTH    |Intermittent Peritoneal Dialysis Machine  |Gas Other              |
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user downloads a pdf copy of plan details

    Examples:
      |folderName                               |customer_type |fuelType |planName       |username|password                                    |
      |E2E_VerifyAccount_Residential_NonMoving  |RES           |BOTH     |Total Plan Plus|abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|
