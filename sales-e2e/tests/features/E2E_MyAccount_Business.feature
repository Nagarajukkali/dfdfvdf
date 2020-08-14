@E2E
Feature: This feature is to test the My account scenarios for business customers

  Scenario Outline: Verify the BSME Plan switch journey from My Account
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user navigates to my account login page
    When user logs in to my account using '<username>' and '<password>'
    And user clicks on view and change plan accordion for 'ELE'
    And user clicks on compare and switch plan button
    And user selects No for solar question and confirm
    And user validates details on checkout details page
      |sourceSystem   |journey    |fuelType   |
      |<sourceSystem> |<journey>  |<fuelType> |
    And user selects plans on checkout details page
      |fuelType   |planName       |
      |<fuelType> |Total Business |
    And user clicks on 'Next' button and navigates to review page
    And user provides business details on review page
      |isCustomerContactPersonMissing |isABNACNMissing |
      |No                             |No              |
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    And user provides life support details on review page
      |lifeSupportOption  |fuelType   |EleclifeSupportDevices  |GaslifeSupportDevices|
      |Yes                |<fuelType> |Oxygen Concentrator     |                     |
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|

    Examples:
      |folderName                |username             |password                                     |fuelType|sourceSystem   |journey      |AAH  |DD   |customerType |newOrExisting  |
      |E2E_MyAccount_Business_PS |e2e_bsme_ps@test.com |U2FsdGVkX1+ftH+UunfGSZtCIUBjus/t531HwywA6fY= |ELE     |My Account     |Plan Switch  |Yes  |Yes  |BUS          |Existing       |

  Scenario Outline: Verify the BSME Plan switch with current plan journey from My Account where customer contact person and ABN/ACN is missing
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user navigates to my account login page
    When user logs in to my account using '<username>' and '<password>'
    And user clicks on view and change plan accordion for 'ELE'
    And user clicks on compare and switch plan button
    And user selects No for solar question and confirm
    And user validates details on checkout details page
      |sourceSystem   |journey    |fuelType   |
      |<sourceSystem> |<journey>  |<fuelType> |
    And user selects plans on checkout details page
      |fuelType   |planName       |
      |<fuelType> |Total Business |
    And user clicks on 'Next' button and navigates to review page
    And user provides business details on review page
      |isCustomerContactPersonMissing |isABNACNMissing |
      |Yes                            |Yes             |
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    And user provides life support details on review page
      |lifeSupportOption  |fuelType   |EleclifeSupportDevices  |GaslifeSupportDevices|
      |Yes                |<fuelType> |Oxygen Concentrator     |                     |
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|

    Examples:
      |folderName                          |username                |password                                     |fuelType|sourceSystem   |journey      |AAH  |DD   |customerType |newOrExisting  |
      |E2E_MyAccount_Business_PS_MissingID |MissingID_BSME@test.com |U2FsdGVkX19c8L2pzEDdebOhgJBsSfi7fZpLS5vRkI0= |ELE     |My Account     |Plan Switch  |No   |No   |BUS          |Existing       |

  @currentplan
  Scenario Outline: Verify the BSME Electricity Plan switch journey to not show current plan for account having both GD and PDD discounts from My Account
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user navigates to my account login page
    When user logs in to my account using '<username>' and '<password>'
    And user clicks on view and change plan accordion for '<fuelType>'
    And user clicks on compare and switch plan button
    And user selects No for solar question and confirm
    And user validates details on checkout details page
      |sourceSystem   |journey    |fuelType   |
      |<sourceSystem> |<journey>  |<fuelType> |
    And user selects plans on checkout details page
      |fuelType   |planName                 |
      |<fuelType> |Total Plan Plus Business |
    And user clicks on 'Next' button and navigates to review page
    And user provides business details on review page
      |isCustomerContactPersonMissing |isABNACNMissing|
      |No                             |No             |
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    And user provides life support details on review page
      |lifeSupportOption  |fuelType   |EleclifeSupportDevices       |
      |Yes                |<fuelType> |Ventilator For Life Support  |
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|

    Examples:
      |folderName                                        |username                  |password                                    |fuelType   |sourceSystem   |journey      |AAH  |DD   |customerType   |newOrExisting  |
      |E2E_MyAccount_Bsme_ELE_PS_Not_Current_Plan_GD_PDD |bsmecurrentplansa@test.com|U2FsdGVkX19fWGmAK8EevhuEO0lsln1rmWQcWHsU0ec=|ELE        |My Account     |Plan switch  |No   |No   |BUS            |Existing       |
