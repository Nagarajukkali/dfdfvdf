@abtest
Feature: This feature is to test the NMI and MIRN validation for the sidebar when running on AB test on plans page

  Scenario Outline: verify the behaviour of AB test plans page on entering '<NMIorMIRNorPostcodeType>' for residential customer
    Given user has opened AB Test Plans Page in a browser and creates '<folderName>' to save evidences
    And user validates details on plans page for '<customerType>'
    And user validates cro refine options on plans page for '<customerType>'
    When user clicks the '<Option>' option
    And user clicks the NMI or MIRN accordion in the side bar
    Then user validates the NMI or MIRN section in the sidebar
    And user enters '<NMIorMIRNorPostcodeValue>' in '<NMIorMIRNorPostcode>' field
    And user clicks the done button to close the sidebar
    Then plans page load according to the type of '<NMIorMIRNorPostcodeType>'

    Examples:
      |folderName                         |customerType      |NMIorMIRNorPostcodeType|NMIorMIRNorPostcodeValue|NMIorMIRNorPostcode|Option  |
      |ABTest_Extinct_NMI_BLOCKED               |RES         |NMI_BLOCKED            |6305132344              |NMI                |More    |
      |ABTest_Parent_Embedde_Network_NMI_BLOCKED|RES         |NMI_BLOCKED            |6305824268              |NMI                |More    |
      |ABTest_Child_Embedde_Network_NMI_BLOCKED |RES         |NMI_BLOCKED            |6305899601              |NMI                |More    |
      |ABTest_CnI_NMI_BLOCKED                   |RES         |NMI_BLOCKED            |7001182664              |NMI                |More    |
      |ABTest_Resi_INVALID_CUSTOMER_TYPE        |RES         |INVALID_CUSTOMER_TYPE  |64073631673             |NMI                |More    |
      |ABTest_GAS_NOT_SERVICED_NMI              |RES         |GAS_NOT_SERVICED       |20015938669             |NMI                |More    |
      |ABTest_NMI_NOT_FOUND                     |RES         |NMI_NOT_FOUND          |6435787996              |NMI                |More    |
      |ABTest_Valid_NMI                         |RES         |SUCCESS                |6407557087              |NMI                |More    |
      |ABTest_Valid_MIRN                        |RES         |SUCCESS                |5321574765              |MIRN               |More    |

  Scenario Outline: verify the behaviour of AB test plans page on entering '<NMIorMIRNorPostcodeType>' for a business customer
    Given user has opened AB Test Business Plans Page in a browser and creates '<folderName>' to save evidences
    And user validates details on plans page for '<customerType>'
    And user validates cro refine options on plans page for '<customerType>'
    When user clicks the '<Option>' option
    And user clicks the NMI or MIRN accordion in the side bar
    Then user validates the NMI or MIRN section in the sidebar
    And user enters '<NMIorMIRNorPostcodeValue>' in '<NMIorMIRNorPostcode>' field
    And user clicks the done button to close the sidebar
    Then plans page load according to the type of '<NMIorMIRNorPostcodeType>'

    Examples:
      |folderName                         |customerType|NMIorMIRNorPostcodeType|NMIorMIRNorPostcodeValue|NMIorMIRNorPostcode|Option|
      |ABTest_Bus_INVALID_CUSTOMER_TYPE   |BUS         |INVALID_CUSTOMER_TYPE  |64075570879             |NMI                |More    |
      |ABTest_MIRN_NOT_FOUND              |BUS         |MIRN_NOT_FOUND         |5467868933              |MIRN               |More    |

  Scenario Outline: verify the behaviour of lookup call when we provide '<addressType>' address on qualifier for AB testing
    Given user has opened AB Test Plans Page in a browser and creates '<folderName>' to save evidences
    And user validates details on plans page for '<customerType>'
    And user validates cro refine options on plans page for '<customerType>'
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user selects '<movingType>' for moving question on qualifier
    And user enters the address '<address>' on qualifier
    Then relevant popup displays for provided '<addressType>'
    When user closes the qualifier
    And user closes the cart page
    Then plans page load according to the type of '<addressType>' on plans page

    Examples:
      |folderName                        |customerType|planName             |customerStatus|movingType|address                                |addressType          |
      |ADDRESS_NOT_SERVICED             |RES         |Total Plan    |New           |Non-Moving|48 East Bagdad Road, BAGDAD TAS 7030    |ADDRESS_NOT_SERVICED |
      |GAS_NOT_SERVICED_ADDRESS         |RES         |Total Plan    |New           |Non-Moving|27 Munnell Street, GULARGAMBONE NSW 2828|GAS_NOT_SERVICED     |


