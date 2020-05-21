@E2E
Feature: This feature is to test the My account scenarios for residential customers

  Scenario Outline: Verify the RESI Plan switch journey from My Account
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user navigates to my account login page
    When user logs in to my account using '<username>' and '<password>'
    And user clicks on view and change plan accordion for 'ELE'
    And user clicks on compare and switch plan button
    And user selects No for solar question and confirm
    And user selects plans on checkout details page
      |elePlan        |gasPlan   |
      |Total Plan Plus|Total Plan|
    And user provides identification details
      |customerType|customerStatus|idType        |
      |RES         |Existing      |Driver License|
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |Yes         |No         |Bank           |
    And user clicks on 'Review your order' button and navigates to review page
    Then Life support section is displayed on Review page as per selected "BOTH" and verified "BOTH"
    When user submits the quote
    Then user lands on checkout complete page

    Examples:
      |folderName                   |username                               |password                                     |
      |E2E_MyAccount_Residential_PS |Prateek.Chauhan@energyaustralia.com.au |U2FsdGVkX1+0r7zXQlO8CPFbEq3ETA40fGWjpN+WtGM= |

  Scenario Outline: Verify the RESI Move home journey from My Account
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user navigates to my account login page
    When user logs in to my account using '<username>' and '<password>'
    And user clicks on move home link for 'ELE'
    And user enters service address as '<address>'
    And user selects connection date
    And user selects No for solar question on moving service page
    And user clicks on lets get moving button
    And user selects plans on checkout details page
      |elePlan        |gasPlan   |
      |Total Plan Plus|Total Plan|
    And user provides identification details
      |customerType|customerStatus|idType        |
      |RES         |Existing      |Driver License|
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |No          |Yes        |Bank           |
    And user answers No for home improvements question
    And user chooses "<optDisconnection>" for disconnection
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices   |GaslifeSupportDevices         |
      |Yes              |BOTH    |Kidney Dialysis Machine  |Medically Required Hot Water  |
    And user submits the quote
    Then user lands on checkout complete page

    Examples:
      |folderName                         |address                                  |username                               |password                                     |optDisconnection|
      |E2E_MyAccount_Residential_MoveHome |9 Rodier Street, BALLARAT EAST VIC 3350  |Prateek.Chauhan@energyaustralia.com.au |U2FsdGVkX1+0r7zXQlO8CPFbEq3ETA40fGWjpN+WtGM= |No              |

  Scenario Outline: Verify the RESI upsell journey from My Account
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user navigates to my account login page
    When user logs in to my account using '<username>' and '<password>'
    And user clicks on compare plans button
    And user selects plans on checkout details page
      |gasPlan        |
      |Total Plan Plus|
    And user opts for concession card
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|GaslifeSupportDevices                                |
      |Yes              |GAS     |Medically Required Heating and/or Air Conditioning   |
    And user submits the quote
    Then user lands on checkout complete page

    Examples:
      |folderName                       |username          |password                                    |
      |E2E_MyAccount_Residential_Upsell |upsell02@test.com |U2FsdGVkX18tkoy+x1GGxXg4gex2qBLzChEHNEvDZyE=|
