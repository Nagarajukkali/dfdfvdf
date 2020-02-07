@E2E
Feature:E2E scenario for existing business moving and non moving customer

  Scenario Outline: Submit a quote for existing business moving customer
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'BUS' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |8541728674   |ABN                |13756067200     |dob   |01011980|
    And user provides all other details on qualifier page for Existing customer
      |customerType|movingType |connectionAddress                         |solarOption|
      |BUS         |Moving     |36 Gregory Street West, WENDOUREE VIC 3355|No         |
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|businessType|
      |BUS         |BUS        |Existing      | test     |test     |ABN         |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices     |GaslifeSupportDevices|
      |Yes              |BOTH    |Ventilator For Life Support|Gas Other            |
    And user submits the quote
    Then user lands on checkout complete page
    Examples:
      |customerStatus|planName         |folderName              |state|
      |Existing      |Basic Business   |E2E_Existing_Resi_Moving|VIC  |

  Scenario Outline: Submit a quote for existing business non moving customer with LS, select dual fuel and verify electricity account
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'BUS' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |4719568937   |ABN                |63824650000     |dob   |01011980|
    And user provides all other details on qualifier page for Existing customer
      |customerType|movingType |solarOption|
      |BUS         |Non-Moving |No         |
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|businessType|
      |BUS         |BUS        |Existing      | test     |test     |ABN         |
    And user clicks on 'Review your order' button and navigates to review page
    Then Life support section is displayed on Review page as per selected "<fuelType>" and verified "<accountType>"
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                      |GaslifeSupportDevices       |
      |No               |ELE     |Chronic Positive Airways Pressure Respirator|                            |
    And user submits the quote
    Then user lands on checkout complete page
    Examples:
      |customerStatus|planName         |folderName              |fuelType|accountType|
      |Existing      |Basic Business   |E2E_Existing_Resi_Moving|BOTH    |ELE        |


