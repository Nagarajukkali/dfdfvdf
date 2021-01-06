@ghosting @myaccount
Feature: This feature is to test that the ghosting user is able to submit quotes

  Scenario Outline: Verify the ghosting user is able to submit Plan Switch quote
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user navigates to my account login page
    And user logs in to my account as a ghosting user
    And the user searches '<account number>'
    And the user clicks on Impersonate button
    And user clicks on view and change plan accordion for '<fuelType>'
    And user clicks on compare and switch plan button
    And user selects No for solar question and confirm
    And user validates details on checkout details page
      |sourceSystem   |journey    |fuelType   |
      |<sourceSystem> |<journey>  |<fuelType> |
    And user selects plans on checkout details page
      |fuelType   |planName       |
      |<fuelType> |Total Plan|
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
      |folderName                |account number |fuelType   |sourceSystem   |journey      |AAH  |DD   |customerType |newOrExisting  |
      |E2E_MyAccount_Ghosting_PS |4368599970     |ELE        |My Account     |Plan switch  |No   |No   |RES          |Existing       |
@failed
  Scenario Outline: Verify the ghosting user is able to submit Move home quote
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user navigates to my account login page
    And user logs in to my account as a ghosting user
    And the user searches '<account number>'
    And the user clicks on Impersonate button
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
      |folderName                        |address                                  |account number   |optDisconnection|customerType |newOrExisting  |
      |E2E_MyAccount_Ghosting_MoveHome   |9 Rodier Street, BALLARAT EAST VIC 3350  |8548648306       |No              |RES          |Existing       |

  Scenario Outline: Verify the ghosting user is able to submit quote for upsell
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user navigates to my account login page
    And user logs in to my account as a ghosting user
    And the user searches '<account number>'
    And the user clicks on Impersonate button
    And user clicks on compare plans button
    And user validates details on checkout details page
      |sourceSystem   |journey    |fuelType   |
      |<sourceSystem> |<journey>  |<fuelType> |
    And user selects plans on checkout details page
      |fuelType |planName       |
      |GAS      |Total Plan Plus|
    And user selects mailing address option
      |addressType       |otherAddress |
      |Connection Address|             |
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
      |folderName                     |account number   |fuelType   |sourceSystem   |journey      |AAH  |DD   |customerType |newOrExisting  |
      |E2E_MyAccount_Ghosting_Upsell  |5573387464       |GAS        |My Account     |Upsell       |No   |No   |RES          |Existing       |
