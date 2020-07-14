@E2E
Feature:E2E scenario for new connection

Scenario Outline: Submit a quote for electricity new connection for residential customer
  Given user has opened the new connection website link in a browser and creates '<folderName>' to save evidences
  When user provides connection details
    |fuelType   |customerType|premiseType|state   |postcode|
    |<fuelType> |RES         |Single     |Victoria|3008    |
  And user provides property details for electricity connection
    |customerType|optionForPoleInstallation|optionForOffPeakLoad|
    |RES         |No                       |No                  |
  And user provides property contacts
    |idType          |state|
    |Driver's Licence|VIC  |
  And user submit the request
  And user clicks on proceed to quote
  And user validates details on checkout details page
    |sourceSystem   |journey    |fuelType   |
    |<sourceSystem> |<journey>  |<fuelType> |
  And user selects plans on checkout details page
    |fuelType     |planName   |
    |<fuelType>   |Total Plan |
  And user provides dob and id details
    |customerStatus|idType        |
    |New           |Driver License|
  And user clicks on 'Review your order' button and navigates to review page
  And user validates details on checkout review page
    |sourceSystem   |journey    |fuelType   |AAH  |DD   |
    |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |
  And user provides life support details on review page
    |lifeSupportOption|fuelType   |EleclifeSupportDevices|
    |Yes              |<fuelType> |Ele Other             |
  And user submits the quote
  Then user lands on checkout complete page
  And user validates details on checkout complete page
    |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType |newOrExisting  |
    |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |RESI         |New            |

  Examples:
    |folderName         |fuelType |sourceSystem   |journey      |AAH  |DD   |
    |E2E_New_Resi_NC_ELE|ELE      |New Connection |Plan Switch  |No   |No   |

  Scenario Outline: Submit a quote for gas new connection for residential customer
    Given user has opened the new connection website link in a browser and creates '<folderName>' to save evidences
    When user provides connection details
      |fuelType   |customerType|premiseType|state   |postcode|connectionType    |
      |<fuelType> |RES         |Single     |Victoria|3008    |Meter Installation|
    And user provides property details for gas connection
      |optionForServiceLineInstallation|optionForSiteClearance|optionForSiteMarking|
      |Yes                             |Yes                   |Yes                 |
    And user selects appliances
    And user provides property contacts
      |fuelType   |idType          |state|
      |<fuelType> |Driver's Licence|VIC  |
    And user submit the request
    And user clicks on proceed to quote
    And user validates details on checkout details page
      |sourceSystem   |journey    |fuelType   |
      |<sourceSystem> |<journey>  |<fuelType> |
    And user selects plans on checkout details page
      |fuelType   |planName   |
      |<fuelType> |Total Plan |
    And user provides dob and id details
      |customerStatus|idType        |
      |New           |Driver License|
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |
    And user provides life support details on review page
      |lifeSupportOption|fuelType   |GaslifeSupportDevices|
      |No               |<fuelType> |Gas Other            |
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |RESI         |New            |

    Examples:
      |folderName         |fuelType |sourceSystem   |journey      |AAH  |DD   |
      |E2E_New_Resi_NC_GAS|GAS      |New Connection |Plan Switch  |No   |No   |

  Scenario Outline: Submit a quote for electricity new connection for business customer
    Given user has opened the new connection website link in a browser and creates '<folderName>' to save evidences
    When user provides connection details
      |fuelType   |customerType|premiseType|state   |postcode|
      |<fuelType> |BUS         |Single     |Victoria|3008    |
    And user provides property details for electricity connection
      |customerType|optionForPoleInstallation|optionForOffPeakLoad|optionForAMPS|
      |BUS         |No                       |No                  |Below        |
    And user provides property contacts
      |idType          |state|
      |Driver's Licence|VIC  |
    And user submit the request
    And user clicks on proceed to quote
    And user validates details on checkout details page
      |sourceSystem   |journey    |fuelType   |
      |<sourceSystem> |<journey>  |<fuelType> |
    And user selects plans on checkout details page
      |fuelType   |planName       |
      |<fuelType> |Total Business |
    And user provides dob and id details
      |customerStatus|idType  |
      |New           |Passport|
    And user provides business details
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |
    And user provides life support details on review page
      |lifeSupportOption|fuelType   |EleclifeSupportDevices                  |
      |Yes              |<fuelType> |Intermittent Peritoneal Dialysis Machine|
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |BSME         |New            |
    Examples:
      |folderName        |fuelType |sourceSystem   |journey      |AAH  |DD   |
      |E2E_New_BUS_NC_ELE|ELE      |New Connection |Plan Switch  |No   |No   |




