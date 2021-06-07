@componentlibrary @analytics
Feature: Scenarios to cover the data layer updates and analytics events trigger on plan page

  Scenario: Validate the component library events for message on plans page
    Given user has opened the website link in a browser and creates 'E2E_Analytics_Verify_Modal_Message_Event' to save evidences
    And user has navigated to 'RES' plans page
    And user have selected fuel as "<fuelType>"
    And user initiates the call to capture analytics events
    When user clicks on the verify modal window on '<customer_type>' page
    And user verifies the account through verify account journey with invalid postcide for residential customer
      | customer_type | modal_option   | elecAccountNumber | gasAccountNumber | postcode |
      | RES           | verify account | 8373520946        | 2816302453       | 6000     | 
    Then user validates the 'refine_modal' 'verify_account_error_message' event
    And user closes the spy on datalayer
  Examples:
      | customer_type | fuelType | 
      | RES           | BOTH     |
@demo
  Scenario: Validate the component library events for message on plans page
    Given user has opened the website link in a browser and creates 'E2E_Analytics_Plans_Page_Message_Event' to save evidences
    And user has navigated to 'RES' plans page
    And user initiates the call to capture analytics events
    When user enters the address "48 East Bagdad Road, BAGDAD TAS 7030" on plans page
    Then user validates the 'plans_page' 'Address_Not_Serviced_Error_Message' event
    When user enters the address "27 Munnell Street, GULARGAMBONE NSW 2828" on plans page
    Then user validates the 'plans_page' 'Gas_Not_Serviced_Error_Message' event
    When user enters the address "20-30 Bourke Street, MELBOURNE VIC 3000" on plans page
    Then user validates the 'plans_page' 'NMI_Blocked_Error_Message' event
    When user enters the address "12 Abattoir Lane, AVOCA VIC 3467" on plans page
    When user selects 'Basic Home'
    And user moves on to fill the qualifier
    And user selects 'New' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                      | movingType | propertyType |
      | RES          | 12 Abattoir Lane, AVOCA VIC 3467     | Moving       |Renter          |
    And user closes the spy on datalayer