Feature: This feature is to test the verify account scenarios for existing residential customers

  @test
  Scenario Outline: Non moving residential customer
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customer_type>' plans page
    And User have selected fuel as "<fuelType>"
    When user clicks on the verify modal window on '<customer_type>' page
    And user verifies the account through verify account journey for residential customer
    |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |postcode |idType |idNumber |
    |RES          |verify account |5650256936       |5891300788       |3038     |dob    |17091932 |
    And user selects '<planName>' from '<customer_type>' plans page
    And user moves on to fill the qualifier
    And user provides all other details on qualifier page for Existing customer
    |movingType |propertyType |solarOption  |
    |Non-Moving |Owner        |No           |

    Examples:
      |folderName                               |customer_type |fuelType |planName    |
      |E2E_VerifyAccount_Residential_NonMoving  |RES           |BOTH     |Total Plan  |
