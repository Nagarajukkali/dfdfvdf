@E2E
Feature: This feature is to test the verify account scenarios for existing business customers

  Scenario Outline: Non moving business customer
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customer_type>' plans page
    And User have selected fuel as "<fuelType>"
    When user clicks on the verify modal window on '<customer_type>' page
    And user verifies the account through verify account journey for business customer
      |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |ABNOrACN     |idType |idNumber  |
      |BUS          |verify account |2870412120       |3231348465       |78538656400  |dob    |01011980  |
    And user selects '<planName>'
    And user moves on to fill the qualifier
    And user provides all other details on qualifier page for Existing customer
      |customerType|movingType |propertyType |solarOption  |
      |BUS         |Non-Moving |Owner        |No           |
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus|firstName|lastName|businessType |
      |BUS         |BUS        |Existing      |test     |test    |ABN          |
    And user clicks on 'Review your order' button and navigates to review page
    And user submits the quote
    Then user lands on checkout complete page

    Examples:
      |folderName                               |customer_type |fuelType |planName        |
      |E2E_VerifyAccount_Business_NonMoving     |BUS           |BOTH     |Basic Business  |

  Scenario Outline: Moving business customer
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customer_type>' plans page
    And User have selected fuel as "<fuelType>"
    When user clicks on the verify modal window on '<customer_type>' page
    And user verifies the account through verify account journey for business customer
      |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |ABNOrACN   |idType |idNumber  |
      |BUS          |verify account |5802060000       |7745301000       |30179084300|dob    |01011980  |
    And user selects '<planName>'
    And user moves on to fill the qualifier
    And user provides all other details on qualifier page for Existing customer
      |customerType|movingType |connectionAddress                          |propertyType |solarOption  |
      |BUS         |Moving     |36 Gregory Street West, WENDOUREE VIC 3355 |Renter       |No           |
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus|firstName|lastName|businessType   |
      |BUS         |BUS        |Existing      |test     |test    |ABN            |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                        |GaslifeSupportDevices        |
      |Yes              |BOTH    |Chronic Positive Airways Pressure Respirator  |Medically Required Hot Water |
    And user submits the quote
    Then user lands on checkout complete page

    Examples:
      |folderName                               |customer_type |fuelType |planName        |state  |
      |E2E_VerifyAccount_Business_Moving        |BUS           |BOTH     |Total Business  |VIC    |
