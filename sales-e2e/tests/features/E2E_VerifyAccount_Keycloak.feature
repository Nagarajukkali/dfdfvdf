
Feature: This feature is to test the keycloak

  Scenario Outline: keycloak
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customer_type>' plans page
    Then user validates details on plans page for '<customer_type>'
    And user have selected fuel as "<fuelType>"
    When user clicks on the verify modal window on '<customer_type>' page
    And user verifies the account through verify account journey for residential customer
      |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |postcode |idType |idNumber |
      |RES          |verify account |8373520946       |2816302453       |3153     |dob    |01011980 |


    Examples:
      |folderName                                   |customer_type |fuelType |
      |E2E_VerifyAccount_Residential_NonMoving_KC   |RES           |BOTH     |
