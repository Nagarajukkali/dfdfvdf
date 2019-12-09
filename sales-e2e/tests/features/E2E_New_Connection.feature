@E2E
Feature:E2E scenario for existing residential moving and non moving customer

Scenario Outline: Submit a quote for electricity new connection for residential customer
  Given user has opened the new connection website link in a browser and creates '<folderName>' to save evidences
  When user selects '<fuelType>' for new connection
  And user provides connection details
    |fuelType|customerType|premiseType|state|postcode|
    |ELE     |RES         |Single     |VIC  |3008    |
  And user provides property details for electricity connection
    |optionForPoleInstallation|optionForOffPeakLoad|
    |No                       |No                  |
  And user provides property contacts
    |idType          |state|
    |Driver's Licence|VIC  |
  And user submit the request
  And user clicks on proceed to quote
  And user selects plans on checkout details page
    |elePlan   |
    |Total Plan|
  And user provides dob and id details
    |customerStatus|idType        |
    |New           |Driver License|
  And user clicks on 'Review your order' button and navigates to review page
  And user provides life support details on review page
    |lifeSupportOption|fuelType|EleclifeSupportDevices|
    |Yes              |ELE     |Ele Other             |
  #And user submits the quote
  #Then user lands on checkout complete page
  Examples:
    |fuelType|folderName          |
    |ELE     |E2E_Existing_Resi_NC|

  Scenario Outline: Submit a quote for gas new connection for residential customer
    Given user has opened the new connection website link in a browser and creates '<folderName>' to save evidences
    When user selects '<fuelType>' for new connection
    And user provides connection details
      |fuelType|customerType|premiseType|state|postcode|connectionType    |
      |GAS     |RES         |Single     |VIC  |3008    |Meter Installation|
    And user provides property details for gas connection
      |optionForServiceLineInstallation|optionForSiteClearance|optionForSiteMarking|
      |Yes                             |Yes                   |Yes                 |
    And user selects appliances
    And user provides property contacts
      |fuelType|idType          |state|
      |GAS     |Driver's Licence|VIC  |
    And user submit the request
    And user clicks on proceed to quote
    And user selects plans on checkout details page
      |gasPlan   |
      |Total Plan|
    And user provides dob and id details
      |customerStatus|idType        |
      |New           |Driver License|
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|GaslifeSupportDevices|
      |No               |GAS     |                     |
  #And user submits the quote
  #Then user lands on checkout complete page
    Examples:
      |fuelType|folderName          |
      |GAS     |E2E_Existing_Resi_NC|

  @test
  Scenario Outline: Submit a quote for electricity new connection for business customer
    Given user has opened the new connection website link in a browser and creates '<folderName>' to save evidences
    When user selects '<fuelType>' for new connection
    And user provides connection details
      |fuelType|customerType|premiseType|state|postcode|
      |ELE     |RES         |Single     |VIC  |3008    |
    And user provides property details for electricity connection
      |customerType|optionForPoleInstallation|optionForOffPeakLoad|
      |BUS         |No                       |No                  |
    And user provides property contacts
      |idType          |state|
      |Driver's Licence|VIC  |
    And user submit the request
    And user clicks on proceed to quote
    And user selects plans on checkout details page
      |elePlan   |
      |Total Plan|
    And user provides dob and id details
      |customerStatus|idType        |
      |New           |Driver License|
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices|
      |Yes              |ELE     |Ele Other             |
  #And user submits the quote
  #Then user lands on checkout complete page
    Examples:
      |fuelType|folderName          |
      |ELE     |E2E_Existing_Resi_NC|


