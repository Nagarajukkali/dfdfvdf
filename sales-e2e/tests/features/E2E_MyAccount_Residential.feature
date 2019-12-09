@E2E
Feature: This feature is to test the My account scenarios for residential customers

  Scenario Outline: Verify the RESI Plan switch journey from My Account
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user navigates to my account login page
    When user logs in to my account using '<username>' and '<password>'
    And user clicks on view and change plan accordion
    And user clicks on compare and switch plan button
    And user selects No for solar question and confirm
    And user selects plans on checkout details page
      |elePlan        |gasPlan   |
      |Total Plan Plus|Total Plan|
    And user provides identification details
      |customerType|customerStatus|idType        |
      |RES         |Existing      |Driver License|
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                          |GaslifeSupportDevices                                |
      |Yes              |BOTH    |Crigler Najjar Syndrome Phototherapy Equipment  |Medically Required Heating and/or Air Conditioning   |
    And user submits the quote
    Then user lands on checkout complete page

    Examples:
      |folderName                   |customer_type |fuelType |planName        |username                               |password                         |
      |E2E_MyAccount_Residential_PS |BUS           |BOTH     |Basic Business  |Prateek.Chauhan@energyaustralia.com.au |94-111-125-126-90-107-125-125-59 |
