Feature: This feature is to test the My account scenarios for residential customers

  @test
  Scenario Outline: Verify the RESI Plan switch journey from My Account
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user navigates to my account login page
    When user logs in to my account using '<username>' and '<password>'
    And user clicks on view and change plan accordion
    And user clicks on compare and switch plan button
    And user selects No for solar question and confirm
#    Then user validates if user is on express checkout page
#    And Connection address is displayed as "<addressCheckout>"
#    And Your electricity distributor name is displayed as "<Distributor>"
#    And User saved plans related data from Checkout details page for "<Fuel type>" fuel as a "<Customer>" customer for "<State>"
#    When User has selected "<Electricity Plan>" and "<Gas Plan>" plan as per "<Fuel type>"
#    Then Plan section is collapsed and displays as "<Electricity Plan>" 'selected' and "<Gas Plan>" 'selected' with "<Fuel type>" as per fuel selection
#    And All toggle bar got disable as per plan selection for "<Fuel type>"
#    And User has provided his id details in Identification section as "<idType>" and "<idValue>"
#    And User has clicked on 'Review your Order' button and navigated to review page
#    And User has verified his "Address" as "<addressCheckout>"
#    And User has verified his "Distributor" name as "<Distributor>"
#    And User has verified his "Customer type" detail as "<Meter type>"
#    And User has verified estimated cost for selected "<Electricity Plan>" for "<Fuel type>"
#    And User has verified estimated cost for selected "<Gas Plan>" for "<Fuel type>"
#    And User has verified reference price text for selected "<Electricity Plan>" for "<Fuel type>"
#    And User has verified all the remaining details on review page for selected "<Electricity Plan>" for "<Fuel type>"

    Examples:
      |folderName                   |customer_type |fuelType |planName        |username                               |password                         |
      |E2E_MyAccount_Residential_PS |BUS           |BOTH     |Basic Business  |Prateek.Chauhan@energyaustralia.com.au |94-111-125-126-90-107-125-125-59 |
