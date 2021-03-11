@abtest
Feature: This feature is to test the verify account scenarios for existing residential customers with AB test functionality for plans page

  Scenario Outline: Submit a quote for existing residential customer through verify account AB test functionality for plans page
    Given user has opened AB Test Plans Page in a browser and creates '<folderName>' to save evidences
    And user validates details on plans page for '<customerType>'
    And user validates cro refine options on plans page for '<customerType>'
    When user clicks the 'More' option
    And user validates the existing customer section in the sidebar
    And user verifies the account through verify account journey for residential customer through AB test side Bar
      |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |postcode |idType |idNumber |
      |RES          |verify account |8373520946       |2816302453       |3153     |dob    |01011980 |
    Examples:
      |folderName                                  |customerType |
      |ABTest_VerifyAccount_Residential_NonMoving  |RES     |

  Scenario Outline: Submit a quote for QLD existing moving residential customer through verify account through AB test functionality
    Given user has opened AB Test Plans Page in a browser and creates '<folderName>' to save evidences
    And user validates details on plans page for '<customerType>'
    And user validates cro refine options on plans page for '<customerType>'
    When user clicks the 'More' option
    And user validates the existing customer section in the sidebar
    And user verifies the account through verify account journey for residential customer through AB test side Bar
      |customer_type|modal_option   |elecAccountNumber|postcode |idType|idNumber |
      |RES          |verify account |9485951606       |4215     |dl    |139955532|

    Examples:
      |folderName                                      |customerType |
      |ABTest_E2E_VerifyAccount_QLD_Residential_Moving |RES          |
