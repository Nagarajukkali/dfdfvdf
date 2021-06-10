@componentlibrary @analytics
Feature: Scenarios to cover the data layer updates and analytics events trigger on plan page

  Scenario: Validate the component library events for button on plans page
    Given user has opened the website link in a browser and creates 'E2E_Analytics_Plans_Page_Button_Event' to save evidences
    And user has navigated to 'RES' plans page
    And user initiates the call to capture analytics events
    When user enters the address "271 Heatherhill Road, FRANKSTON VIC 3199" on plans page
    And user selects 'Total Plan'
    Then user validates the 'plans_page' 'Total_Select_Plan_Button' event
    When user closes the cart page
    Then user validates the 'cart_page' 'close_button' event
    When user selects 'No Frills'
    Then user validates the 'plans_page' 'NoFrills_Select_Plan_Button' event
    When user moves on to fill the qualifier
    Then user validates the 'cart_page' 'continue_button' event
    And user selects 'New' on qualifier
    And user provides all other details on qualifier page
      |customerType|connectionAddress                | movingType|propertyType|
      |RES         |3 River Drive, ATHELSTONE SA 5076|Non-Moving |Renter      |
    And user closes the spy on datalayer

  Scenario: Validate the component library events for button for existing customer verified through verify account
    Given user has opened the website link in a browser and creates 'E2E_Analytics_Verify_Account_Button_Modal' to save evidences
    And user has navigated to 'RES' plans page
    And user initiates the call to capture analytics events
    Then user validates details on plans page for 'RES'
    And user have selected fuel as "BOTH"
    When user clicks on the verify modal window on 'RES' page
    Then user validates the 'refine_modal' 'refine_modal_button' event
    And user verifies the account through verify account journey for residential customer
      |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |postcode |idType |idNumber |
      |RES          |verify account |8373520946       |2816302453       |3153     |dob    |01011980 |
    And user selects 'Total Plan'
    Then user validates the 'plans_page' 'Total_Select_Plan_Button' event
    And user moves on to fill the qualifier
    Then user validates the 'cart_page' 'continue_button' event
    And user provides all other details on qualifier page for Existing customer
      |customerType|movingType |connectionAddress                          |propertyType |
      |RES         |Moving     |10 Keswick Crescent, BAYSWATER NORTH VIC 3153   |Renter       |
    And user closes the spy on datalayer

  Scenario: Validate the component library events for button for existing residential customer verified through qualifier
    Given user has opened the website link in a browser and creates 'E2E_Analytics_Existing_Residential_Customer_Qualifier_Button' to save evidences
    And user has navigated to 'RES' plans page
    And user initiates the call to capture analytics events
    Then user validates details on plans page for 'RES'
    When user selects 'Total Plan'
    Then user validates the 'plans_page' 'Total_Select_Plan_Button' event
    When user moves on to fill the qualifier
    Then user validates the 'cart_page' 'continue_button' event
    And user selects 'Existing' on qualifier
    And user verifies account on qualifier
      | customerStatus | accountNumber | accountIdentityType | postcodeOrABNACN | idType | idValue  |
      | Existing       | 8372937428    | Postcode            | 3024             | dob    | 01011980 |
    When user clicks on back button
    Then user validates the 'qualifier_page' 'back_button' event
    And user closes the spy on datalayer

  Scenario: Validate the component library events for button for existing business customer verified through qualifier
    Given user has opened the website link in a browser and creates 'E2E_Analytics_Existing_Business_Customer_Qualifier_Button' to save evidences
    And user has navigated to 'BUS' plans page
    And user initiates the call to capture analytics events
    Then user validates details on plans page for 'BUS'
    When user selects 'Basic Business'
    Then user validates the 'plans_page' 'Basic_Business_Electricity_Select_Plan_Button' event
    When user selects gas 'Basic Business'
    Then user validates the 'plans_page' 'Basic_Business_Gas_Select_Plan_Button' event
    And user moves on to fill the qualifier
    Then user validates the 'cart_page' 'continue_button' event
    And user selects 'Existing' on qualifier
    And user verifies account on qualifier
      | customerStatus | accountNumber | accountIdentityType | postcodeOrABNACN | idType | idValue  |
      | Existing       | 8541728674    | ABN                 | 13756067200      | dob    | 01011980 |
    And user provides all other details on qualifier page for Existing customer
      | customerType | movingType | connectionAddress                      |
      | BUS          | Moving     | 320 Crown Street, SURRY HILLS NSW 2010 |

  Scenario: Validate the component library events for button on plans page for business new customer
    Given user has opened the website link in a browser and creates 'E2E_Analytics__BSME_Plans_Page_Button_Event' to save evidences
    And user has navigated to 'BUS' plans page
    And user initiates the call to capture analytics events
    Then user validates details on plans page for 'BUS'
    When user enters the address "320 Crown Street, SURRY HILLS NSW 2010" on plans page
    When user selects 'Basic Business'
    Then user validates the 'plans_page' 'Basic_Business_Electricity_Select_Plan_Button' event
    When user closes the cart page
    Then user validates the 'cart_page' 'close_button' event
    When user selects 'Total Plan - Business'
    Then user validates the 'plans_page' 'Total_Business_Electricity_Select_Plan_Button' event
    And user moves on to fill the qualifier
    Then user validates the 'cart_page' 'continue_button' event
    And user selects 'New' on qualifier
    And user provides all other details on qualifier page
      | customerType | customerStatus | connectionAddress                      | movingType | propertyType |
      | BUS          | New            | 320 Crown Street, SURRY HILLS NSW 2010 | Moving     |              |
    And user closes the spy on datalayer

  Scenario: Validate the component library events for links on residential plans page
    Given user has opened the website link in a browser and creates 'E2E_Analytics_Plans_Page_Links' to save evidences
    And user has navigated to 'RES' plans page
    And user initiates the call to capture analytics events
    Then user validates details on plans page for 'RES'
    When user clicks on the verify modal window on 'RES' page
    Then user validates the 'refine_modal' 'refine_modal_button' event
    When user clicks on upload bill button
    Then user validates the 'refine_modal' 'bill_upload_link' link event
    When user closes the refine modal
    When user selects 'Basic Home' fact sheet
    Then user validates the 'plans_page' 'basic_plan_bpid_link' link event
    When user selects 'No Frills' fact sheet
    Then user validates the 'plans_page' 'nofrills_plan_bpid_link' link event
    When user selects 'Total Plan' fact sheet
    Then user validates the 'plans_page' 'total_plan_bpid_link' link event
    When user clicks on best electricity offer link
    Then user validates the 'plans_page' 'best_electricity_offer_link' link event
    When user clicks on reference price disclaimer link
    Then user validates the 'plans_page' 'ref_price_disclaimer_link' link event
    When user clicks on solar disclaimer link
    Then user validates the 'plans_page' 'solar_disclaimer_link' link event
    When user clicks on carbon neutral disclaimer link
    Then user validates the 'plans_page' 'carbon_neutral_disclaimer_link' link event
    When user selects 'Total Plan'
    And user moves on to fill the qualifier
    And user selects 'New' on qualifier
    And user provides all other details on qualifier page
      |customerType| connectionAddress                   | movingType|propertyType|
      |RES         | Unit 1 297 Dorset Road, CROYDON VIC 3136|Non-Moving |Renter      |
    Then user validates the data layer is updated for solar as 'unknown'
    And user closes the spy on datalayer

  Scenario: Validate the component library events for radio button on residential plans page
    Given user has opened the website link in a browser and creates 'E2E_Analytics_Plans_Page_Radio_Button' to save evidences
    And user has navigated to 'RES' plans page
    And user initiates the call to capture analytics events
    When user selects 'Address' location type
    Then user validates the 'plans_page' 'Address_Radio_Button' event for NSW remote meter
    When user selects 'Postcode' location type
    Then user validates the 'plans_page' 'Postcode_Radio_Button' event for NSW remote meter
    When user selects 'Total Plan'
    And user moves on to fill the qualifier
    And user selects 'New' on qualifier
    And user provides all other details on qualifier page
      |customerType| connectionAddress                   | movingType|propertyType  |
      |RES         | 10 Keswick Crescent, BAYSWATER NORTH VIC 3153|Non-Moving |Renter      |
    And user closes the spy on datalayer

  Scenario: Validate the component library events for radio button on business plans page
    Given user has opened the website link in a browser and creates 'E2E_Analytics_Plans_Page_Radio_Button' to save evidences
    And user has navigated to 'BUS' plans page
    And user initiates the call to capture analytics events
    When user selects 'Address' location type
    Then user validates the 'plans_page' 'Address_Radio_Button' event for NSW remote meter
    When user selects 'Postcode' location type
    Then user validates the 'plans_page' 'Postcode_Radio_Button' event for NSW remote meter
    When user selects 'Basic Business'
    And user moves on to fill the qualifier
    And user selects 'New' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                      | movingType | propertyType |
      | BUS          | 320 Crown Street, SURRY HILLS NSW 2010 | Moving     |              |
    And user closes the spy on datalayer

  Scenario: Validate the component library events for tooltips on residential plans page
    Given user has opened the website link in a browser and creates 'E2E_Analytics_Plans_Page_Tooltip_Event' to save evidences
    And user has navigated to 'RES' plans page
    And user initiates the call to capture analytics events
    When user clicks the estimate cost tooltip
    Then user validates the 'plans_page' 'estimate_cost_tooltip' event
    When user clicks the green energy tooltip
    Then user validates the 'plans_page' 'green_Energy_tooltip' event
    When user clicks the green energy tooltip
    Then user validates the 'plans_page' 'green_Energy_tooltip' event
    When user clicks on 'basic-home' estimate tooltip
    Then user validates the 'plans_page' 'basic_home_estimate_cost_tooltip' event
    When user clicks on 'no-frills' estimate tooltip
    Then user validates the 'plans_page' 'nofrills_estimate_cost_ToolTip' event
    When user clicks on 'total-plan' estimate tooltip
    Then user validates the 'plans_page' 'total_plan_estimate_cost_ToolTip' event
    When user clicks on 'basic-home' benefit period tooltip
    Then user validates the 'plans_page' 'basic_home_benefit_period_ToolTip' event
    When user clicks on 'no-frills' benefit period tooltip
    Then user validates the 'plans_page' 'nofrills_benefit_period_ToolTip' event
    When user clicks on 'total-plan' benefit period tooltip
    Then user validates the 'plans_page' 'total_plan_benefit_period_ToolTip' event
    When user clicks on 'basic-home' exit fees tooltip
    Then user validates the 'plans_page' 'basic_home_exitfees_ToolTip' event
    When user clicks on 'no-frills' exit fees tooltip
    Then user validates the 'plans_page' 'nofrills_exitfees_ToolTip' event
    When user clicks on 'total-plan' exit fees tooltip
    Then user validates the 'plans_page' 'total_plan_exitfees_ToolTip' event
    When user clicks on 'basic-home' fees tooltip
    Then user validates the 'plans_page' 'basic_home_fees_ToolTip' event
    When user clicks on 'no-frills' fees tooltip
    Then user validates the 'plans_page' 'nofrills_fees_ToolTip' event
    When user clicks on 'total-plan' fees tooltip
    Then user validates the 'plans_page' 'total_plan_fees_ToolTip' event
    When user clicks on 'basic-home' rates tooltip
    Then user validates the 'plans_page' 'basic_home_rates_ToolTip' event
    When user clicks on 'no-frills' rates tooltip
    Then user validates the 'plans_page' 'nofrills_rates_ToolTip' event
    When user clicks on 'total-plan' rates tooltip
    Then user validates the 'plans_page' 'total_plan_rates_ToolTip' event
    When user clicks on 'basic-home' late payment tooltip
    Then user validates the 'plans_page' 'basic_home_late_payment_ToolTip' event
    When user clicks on 'no-frills' late payment tooltip
    Then user validates the 'plans_page' 'nofrills_late_payment_ToolTip' event
    When user clicks on 'total-plan' late payment tooltip
    Then user validates the 'plans_page' 'total_plan_late_payment_ToolTip' event
    When user clicks on 'basic-home' solar buyback tooltip
    Then user validates the 'plans_page' 'basic_home_solar_buyback_ToolTip' event
    When user clicks on 'no-frills' solar buyback tooltip
    Then user validates the 'plans_page' 'nofrills_solar_buyback_ToolTip' event
    When user clicks on 'total-plan' solar buyback tooltip
    Then user validates the 'plans_page' 'total_plan_solar_buyback_ToolTip' event
    And user closes the spy on datalayer

  Scenario: Validate the component library events for tooltips on business plans page
    Given user has opened the website link in a browser and creates 'E2E_Analytics_Business_Page_Tooltip_Event' to save evidences
    And user has navigated to 'BUS' plans page
    And user initiates the call to capture analytics events
    When user clicks the estimate cost tooltip
    Then user validates the 'plans_page' 'estimate_cost_tooltip' event
    When user clicks the green energy tooltip
    Then user validates the 'plans_page' 'green_Energy_tooltip' event
    And user closes the spy on datalayer

  Scenario: Validate the component library events for tooltips on residential plans page
    Given user has opened the website link in a browser and creates 'E2E_Analytics_Plans_Page_Tooltip_Event' to save evidences
    And user has navigated to 'RES' plans page
    And user initiates the call to capture analytics events
    When user clicks the electricity usage tooltip
    Then user validates the 'plans_page' 'elec_usage_tooltip' event
    And user closes the electricity usage modal window
    When user clicks the gas usage tooltip
    Then user validates the 'plans_page' 'gas_usage_tooltip' event
    And user closes the gas usage modal window
    And user closes the spy on datalayer


