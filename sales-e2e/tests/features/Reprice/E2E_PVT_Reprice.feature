@repricePVT
  #For any reprice changes:
# 1. Update EstimatedCost_PVT_Test_Data file if you want to validate estimated cost scenario in this path sales-e2e/resources/Reprice_Data/
# 2. For running the test on non-prod environment, remove PVT from the scenario outline.
# 3. If the scenario outline containing PVT, the test will run on production URL

Feature: This feature is to perform PVT on reprice release and verify estimated cost on plans page

  Scenario Outline: PVT - verify estimated cost for different "<customerType>" Addresses with fuel type: "<fuelType>"
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customerType>' plans page
    And user have selected fuel as "<fuelType>"
    Then user enters address and validate estimated cost for '<customerType>' and '<fuelType>'

    Examples:
      | folderName                       | customerType | fuelType |
      | PVT_Reprice_Estimated_Cost_RES_E | RES          | ELE      |
      | PVT_Reprice_Estimated_Cost_RES_G | RES          | GAS      |
      | PVT_Reprice_Estimated_Cost_BUS_E | BUS          | ELE      |
      | PVT_Reprice_Estimated_Cost_BUS_G | BUS          | GAS      |

