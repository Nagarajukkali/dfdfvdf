#@E2E
#@reprice
  #For any reprice changes:
# 1. Update Reference_Price_Test_Data file if you want to validate reference price scenario in this path sales-e2e/resources/Reprice_Data/
# 2. Use Estimate Calculator and calculate on `Average Usage` and update the require columns in Reference_Price_Test_Data file
# 3. Update Estimate_Cost_Test_Data file if you want to validate estimated cost scenario in this path sales-e2e/resources/Reprice_Data/
# 4. Use Estimate Calculator and calculate on different usage band and update the require columns in Estimate_Cost_Test_Data file

Feature: This feature is to test the reference price and estimated cost on plans page

  Scenario Outline: verify reference price for different "<customerType>" NMIs
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customerType>' plans page
    And user have selected fuel as "ELE"
    Then user enters NMI and validate reference price for "<customerType>"

    Examples:
      |folderName                        |customerType|
      |Reference_Price_RES               |RES         |
      |Reference_Price_BUS               |BUS         |

    @reprice
  Scenario Outline: verify estimated cost for different "<customerType>" NMIs
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customerType>' plans page
    And user have selected fuel as "ELE"
    Then user enters NMI and validate estimated cost for "<customerType>"

    Examples:
      |folderName                        |customerType|
      |Estimated_Cost_RES                |RES         |
      |Estimated_Cost_BUS                |BUS         |

  Scenario Outline: verify estimated cost for best offer tool output file different "<customerType>" NMIs
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customerType>' plans page
    And user have selected fuel as "ELE"
    Then user enters NMI and validate estimated cost in best offer tool output file for "<customerType>"

    Examples:
      |folderName                        |customerType|
      |Estimated_Cost_RES                |RES         |
      |Estimated_Cost_BUS                |BUS         |
