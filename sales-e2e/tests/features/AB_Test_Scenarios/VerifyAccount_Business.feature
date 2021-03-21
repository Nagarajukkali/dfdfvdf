@abtest
Feature: This feature is to test the verify account scenarios for existing business customers with AB test functionality on plans page

  Scenario Outline: Submit a quote for existing business customer through verify account AB test functionality
    Given user has opened AB Test Business Plans Page in a browser and creates '<folderName>' to save evidences
    And user validates details on plans page for '<customerType>'
    And user validates cro refine options on plans page for '<customerType>'
    When user clicks the 'More' option
    And user validates the existing customer section in the sidebar
    And user verifies the account through verify account journey for business customer through AB test side Bar
      |customer_type|modal_option   |elecAccountNumber|ABNOrACN     |idType |idNumber  |
      |BUS          |verify account |2870412120       |78538656400  |dob    |01011980  |

    Examples:
      |folderName                        |customerType |
      |ABTest_VerifyAccount_Business     |BUS           |
