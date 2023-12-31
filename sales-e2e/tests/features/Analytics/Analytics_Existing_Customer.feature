@existingcustomer @analytics @21.6.4.analytics
Feature: Scenarios to cover the data layer analytics for existing customer

  Scenario: Validate the account state analytics for a residential existing dual fuel customer through verify account journey
    Given user has opened the website link in a browser and creates 'E2E_Analytics_Verify_Account_AccountState1' to save evidences
    And user has navigated to 'RES' plans page
    And user initiates the call to capture analytics events
    Then user validates details on plans page for 'RES'
    And user have selected fuel as "BOTH"
    When user clicks on the verify modal window on 'RES' page
    And user validates the 'refine_modal' 'refine_modal_button' event
    And user verifies the account through verify account journey for residential customer
    |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |postcode |idType |idNumber |
    |RES          |verify account |8373520946       |2816302453       |3153     |dob    |01011980 |
    Then user validates the 'Electricity' account state for '8373520946' account number and '3153'
    And user validates the 'Gas' account state for '2816302453' account number and '3153'
    And user closes the spy on datalayer

  Scenario: Validate the account state analytics for a residential existing electricity fuel customer through verify account journey
    Given user has opened the website link in a browser and creates 'E2E_Analytics_Verify_Account_AccountState2' to save evidences
    And user has navigated to 'RES' plans page
    And user initiates the call to capture analytics events
    Then user validates details on plans page for 'RES'
    And user have selected fuel as "BOTH"
    When user clicks on the verify modal window on 'RES' page
    And user validates the 'refine_modal' 'refine_modal_button' event
    And user verifies the account through verify account journey for residential customer
      |customer_type|modal_option   |elecAccountNumber|postcode |idType |idNumber |
      |RES          |verify account |8373520946       |3153     |dob    |01011980 |
    Then user validates the 'Electricity' account state for '8373520946' account number and '3153'
    And user validates the 'Gas' account state for '2816302453' account number and '3153'
    And user closes the spy on datalayer

  Scenario: Validate the account state analytics for a residential existing gas fuel customer through verify account journey
    Given user has opened the website link in a browser and creates 'E2E_Analytics_Verify_Account_AccountState3' to save evidences
    And user has navigated to 'RES' plans page
    And user initiates the call to capture analytics events
    Then user validates details on plans page for 'RES'
    And user have selected fuel as "BOTH"
    When user clicks on the verify modal window on 'RES' page
    And user validates the 'refine_modal' 'refine_modal_button' event
    And user verifies the account through verify account journey for residential customer
      |customer_type|modal_option   |gasAccountNumber |postcode |idType |idNumber |
      |RES          |verify account |2816302453       |3153     |dob    |01011980 |
    Then user validates the 'Electricity' account state for '8373520946' account number and '3153'
    And user validates the 'Gas' account state for '2816302453' account number and '3153'
    And user closes the spy on datalayer

  Scenario: Validate the updated data layer for moving state and person state on existing customer residential journey
    Given user has opened the website link in a browser and creates 'E2E_Analytics_Qualifier_AccountState1' to save evidences
    And user has navigated to 'RES' plans page
    Then user validates details on plans page for 'RES'
    When user selects 'Total Plan'
    And user moves on to fill the qualifier
    And user selects 'Existing' on qualifier
    And user verifies account on qualifier
      | customerStatus | accountNumber | accountIdentityType | postcodeOrABNACN | idType | idValue  |
      | Existing       | 8372937428    | Postcode            | 3024             | dob    | 01011980 |
    Then user validates the 'Electricity' account state for '8372937428' account number and '3024'
    And user validates the 'Gas' account state for '1919752359' account number and '3024'
    And user closes the spy on datalayer

  Scenario: Validate the updated data layer for moving state and person state on existing customer residential journey when gas account number is provided
    Given user has opened the website link in a browser and creates 'E2E_Analytics_Qualifier_AccountState2' to save evidences
    And user has navigated to 'RES' plans page
    Then user validates details on plans page for 'RES'
    When user selects 'Total Plan'
    And user moves on to fill the qualifier
    And user selects 'Existing' on qualifier
    And user verifies account on qualifier
      | customerStatus | accountNumber | accountIdentityType | postcodeOrABNACN | idType | idValue  |
      | Existing       | 2816302453    | Postcode            | 3153             | dob    | 01011980 |
    Then user validates the 'Electricity' account state for '8373520946' account number and '3153'
    And user validates the 'Gas' account state for '2816302453' account number and '3153'
    And user closes the spy on datalayer

  Scenario: Validate the updated data layer for moving state and person state on existing customer business journey
    Given user has opened the website link in a browser and creates 'E2E_Analytics_Existing_Business_Customer_Qualifier_Button' to save evidences
    And user has navigated to 'BUS' plans page
    And user initiates the call to capture analytics events
    Then user validates details on plans page for 'BUS'
    When user selects 'Business Balance Plan'
    Then user validates the 'plans_page' 'business_balance_electricity_select_plan_button' event
    When user selects gas 'Business Balance Plan'
    Then user validates the 'plans_page' 'business_balance_gas_select_plan_button' event
    And user moves on to fill the qualifier
    Then user validates the 'cart_page' 'continue_button' event
    And user selects 'Existing' on qualifier
    And user verifies account on qualifier
      | customerStatus | accountNumber | accountIdentityType | postcodeOrABNACN | idType | idValue  |
      | Existing       | 8541728674    | ABN                 | 13756067200      | dob    | 01011980 |
    And user provides all other details on qualifier page for Existing customer
      | customerType | movingType | connectionAddress                      |
      | BUS          | Moving     | 320 Crown Street, SURRY HILLS NSW 2010 |
    Then user validates the 'Electricity' account state for '8541728674' account number and '3133'
