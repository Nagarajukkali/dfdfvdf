Feature: This feature is to test the verify account scenarios for existing business customers

  Scenario Outline: Non moving business customer
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customer_type>' plans page
    And User have selected fuel as "<fuelType>"
    When user clicks on the verify modal window on '<customer_type>' page
    And user verifies the account through verify account journey for business customer
      |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |ABNOrACN |idType |idNumber |
      |BUS          |verify account |5650256936       |5891300788       |3038     |dob    |17091932 |
    And user selects '<planName>' from '<customer_type>' plans page
    And user moves on to fill the qualifier
    And user provides all other details on qualifier page for Existing customer
      |movingType |propertyType |solarOption  |
      |Non-Moving |Owner        |No           |
    And user provides all details on checkout details page for business customer
      |journey    |customerStatus|firstName|lastName |idType        |
      |BUS        |Existing      |test     |test     |Driver License|
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                    |GaslifeSupportDevices  |
      |Yes              |BOTH    |Intermittent Peritoneal Dialysis Machine  |Gas Other              |
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
      |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |postcode |idType |idNumber |
      |BUS          |verify account |5650256936       |5891300788       |3038     |dob    |17091932 |
    And user selects '<planName>' from '<customer_type>' plans page
    And user moves on to fill the qualifier
    And user provides all other details on qualifier page for Existing customer
      |movingType |connectionAddress                          |propertyType |solarOption  |
      |Moving     |271 Heatherhill Road, FRANKSTON  VIC  3199 |Renter       |No           |
    And user provides all details on checkout details page for business customer
      |journey    |customerStatus| firstName| lastName|idType        |
      |BUS        |Existing      | test     |test     |Passport      |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                        |GaslifeSupportDevices        |
      |Yes              |BOTH    |Chronic Positive Airways Pressure Respirator  |Medically Required Hot Water |
    And user submits the quote
    Then user lands on checkout complete page

    Examples:
      |folderName                               |customer_type |fuelType |planName        |
      |E2E_VerifyAccount_Business_Moving        |BUS           |BOTH     |Total Business  |
