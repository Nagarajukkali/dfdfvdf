#@E2E
  #Disabling MA tests running from scheduled job due to un stability of MA
  #We will trigger thees tests manually in jenkins once/twice in a day
@myaccount
Feature: This feature is to test the My account scenarios for residential customers

  Scenario Outline: Verify the RESI Electricity Plan switch journey from My Account
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
      |fuelType   |planName       |
      |<fuelType> |Total Plan Plus|
    And user clicks on 'Next' button and navigates to review page
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    Then Life support section is displayed on Review page as per selected "<fuelType>" and verified "<fuelType>"
    When user selects carbon neutral option
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|

    Examples:
      |folderName                       |username                               |password                                     |fuelType   |sourceSystem   |journey      |AAH  |DD   |customerType |newOrExisting  |
      |E2E_MyAccount_Residential_ELE_PS |Prateek.Chauhan@energyaustralia.com.au |U2FsdGVkX1+0r7zXQlO8CPFbEq3ETA40fGWjpN+WtGM= |ELE        |My Account     |Plan switch  |No   |No   |RES          |Existing       |

  Scenario Outline: Verify the RESI Gas Plan switch journey from My Account
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
      |fuelType   |planName   |
      |<fuelType> |Total Plan |
    And user clicks on 'Next' button and navigates to review page
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    Then Life support section is displayed on Review page as per selected "<fuelType>" and verified "<fuelType>"
    When user selects carbon neutral option
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|

    Examples:
      |folderName                       |username                               |password                                     |fuelType   |sourceSystem   |journey      |AAH  |DD   |customerType |newOrExisting  |
      |E2E_MyAccount_Residential_GAS_PS |Prateek.Chauhan@energyaustralia.com.au |U2FsdGVkX1+0r7zXQlO8CPFbEq3ETA40fGWjpN+WtGM= |GAS        |My Account     |Plan switch  |No   |No   |RES          |Existing       |
  @deviceCheck
  Scenario Outline: Verify the RESI Move home journey from My Account
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user navigates to my account login page
    When user logs in to my account using '<username>' and '<password>'
    And user clicks on move home link for 'ELE'
    And user enters service address as '<address>'
    And user selects connection date
    And user selects No for solar question on moving service page
    And user clicks on lets get moving button
    And user validates details on checkout details page
      |sourceSystem |journey    |fuelType   |
      |My Account   |Move Home  |BOTH       |
    And user selects plans on checkout details page
      |fuelType |planName       |
      |ELE      |Total Plan Plus|
    And user selects plans on checkout details page
      |fuelType |planName   |
      |GAS      |Total Plan |
    And user provides identification details
      |customerType|customerStatus|idType        |
      |RES         |Existing      |Driver License|
    And user opts for AAH and DD
      |optAAHOption|optDDOption|directDebitType|
      |No          |Yes        |Bank           |
    And user answers No for home improvements question
    And user chooses "<optDisconnection>" for disconnection
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      |sourceSystem |journey    |fuelType   |AAH  |DD   |customerType |newOrExisting  |
      |My Account   |Move Home  |BOTH       |No   |Yes  |<customerType> |<newOrExisting>|
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices   |GaslifeSupportDevices         |
      |Yes              |BOTH    |Kidney Dialysis Machine  |Medically Required Hot Water  |
    When user selects carbon neutral option
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      |sourceSystem |journey    |fuelType   |AAH  |DD   |customerType |newOrExisting  |
      |My Account   |Move Home  |BOTH       |No   |Yes  |<customerType> |<newOrExisting>|

    Examples:
      |folderName                         |address                                  |username                |password                                     |optDisconnection|customerType |newOrExisting  |
      |E2E_MyAccount_Residential_MoveHome |9 Rodier Street, BALLARAT EAST VIC 3350  |MissingID_RESI@test.com |U2FsdGVkX19pydLDPzviWcrNZ6PzbXoPRKv4Bjmqyug= |No              |RES          |Existing       |
  @deviceCheck
  Scenario Outline: Verify the RESI upsell journey from My Account
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user navigates to my account login page
    When user logs in to my account using '<username>' and '<password>'
    And user clicks on compare plans button
    And user validates details on checkout details page
      |sourceSystem   |journey    |fuelType   |
      |<sourceSystem> |<journey>  |<fuelType> |
    And user selects plans on checkout details page
      |fuelType |planName       |
      |GAS      |Total Plan Plus|
    And user opts for concession card
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    And user provides life support details on review page
      |lifeSupportOption|fuelType|GaslifeSupportDevices                                |
      |Yes              |GAS     |Medically Required Heating and/or Air Conditioning   |
    When user selects carbon neutral option
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|

    Examples:
      |folderName                       |username          |password                                    |fuelType   |sourceSystem   |journey      |AAH  |DD   |customerType |newOrExisting  |
      |E2E_MyAccount_Residential_Upsell |upsell02@test.com |U2FsdGVkX18tkoy+x1GGxXg4gex2qBLzChEHNEvDZyE=|GAS        |My Account     |Upsell       |No   |No   |RES          |Existing       |

  Scenario Outline: Verify the RESI Electricity Plan switch journey from My Account where ID details are missing
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
      |fuelType   |planName  |
      |<fuelType> |Total Plan|
    And user clicks on 'Next' button and navigates to review page
    And user provides missing identification details on review page
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    And user provides life support details on review page
      |lifeSupportOption  |fuelType   |EleclifeSupportDevices       |GaslifeSupportDevices|
      |Yes                |<fuelType> |Ventilator For Life Support  |                     |
    And user selects carbon neutral option
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|

    Examples:
      |folderName                                 |username                    |password                                     |fuelType   |sourceSystem   |journey      |AAH  |DD   |customerType |newOrExisting  |
      |E2E_MyAccount_Residential_ELE_PS_MissingID |MissingID_RESI@test.com     |U2FsdGVkX19pydLDPzviWcrNZ6PzbXoPRKv4Bjmqyug= |ELE        |My Account     |Plan switch  |Yes  |Yes  |RES          |Existing       |

  @currentplan @deviceCheck
  Scenario Outline: Verify the RESI Electricity Plan switch journey with current plan having guaranteed discount from My Account
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
      |fuelType   |planName   |
      |<fuelType> |Total Plan |
    And user clicks on 'Next' button and navigates to review page
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType  |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType>|<newOrExisting>|
    And user provides life support details on review page
      |lifeSupportOption  |fuelType   |EleclifeSupportDevices       |
      |Yes                |<fuelType> |Ventilator For Life Support  |
    And user selects carbon neutral option
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType  |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType>|<newOrExisting>|

    Examples:
      |folderName                                |username      |password                                     |fuelType   |sourceSystem   |journey      |AAH  |DD   |customerType|newOrExisting|
      |E2E_MyAccount_Resi_ELE_PS_Current_Plan_GD |cp1@test.com  |U2FsdGVkX19YPkVS1ABCAhv2r+1CGiV9MnvSGz52Qvw= |ELE        |My Account     |Plan switch  |No   |No   |RES         |Existing     |

  @currentplan
  Scenario Outline: Verify the RESI Electricity Plan switch journey with current plan having pay on time discount from My Account
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
      |fuelType   |planName   |
      |<fuelType> |Total Plan |
    And user clicks on 'Next' button and navigates to review page
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType  |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType>|<newOrExisting>|
    And user provides life support details on review page
      |lifeSupportOption  |fuelType   |EleclifeSupportDevices       |
      |Yes                |<fuelType> |Ventilator For Life Support  |
    And user selects carbon neutral option
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType>|<newOrExisting>|

    Examples:
      |folderName                                 |username              |password                                    |fuelType   |sourceSystem   |journey      |AAH  |DD   |customerType  |newOrExisting  |
      |E2E_MyAccount_Resi_ELE_PS_Current_Plan_PDD |currentplan03@test.com|U2FsdGVkX19pZVkiZ60o0iAFhXdDJs0/oxVAuNlMfyY=|ELE        |My Account     |Plan switch  |No   |No   |RES           |Existing       |

    @currentplan
  Scenario Outline: Verify the RESI Electricity Plan switch journey with current plan having no discount from My Account
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
      |fuelType   |planName   |
      |<fuelType> |Total Plan |
    And user clicks on 'Next' button and navigates to review page
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType  |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType>|<newOrExisting>|
    And user provides life support details on review page
      |lifeSupportOption  |fuelType   |EleclifeSupportDevices       |
      |Yes                |<fuelType> |Ventilator For Life Support  |
    And user selects carbon neutral option
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType>|<newOrExisting>|

    Examples:
      |folderName                                         |username                   |password                                    |fuelType   |sourceSystem   |journey      |AAH  |DD   |customerType  |newOrExisting  |
      |E2E_MyAccount_Resi_ELE_PS_Current_Plan_No_Discount |nofrillsnodiscount@test.com|U2FsdGVkX1+VJgjPu6egPMpn4may0nOjl253Oh2CJmw=|ELE        |My Account     |Plan switch  |No   |Yes  |RES           |Existing       |
