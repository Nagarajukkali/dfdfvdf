@componentlibrary @analytics
Feature: Scenarios to cover the component library button tooltip toggle links and accordion data layer updates and analytics events trigger on plan page

  Scenario: Validate the component library events for button on plans page
    Given user has opened the website link in a browser and creates 'E2E_Analytics_Plans_Page_Button_Event' to save evidences
    And user has navigated to 'RES' plans page
    And user initiates the call to capture analytics events
    When user selects 'Total Plan'
    Then user validates the 'plans_page' 'Total_Select_Plan_Button' event
    When user closes the cart page
    Then user validates the 'cart_page' 'close_button' event
    When user selects 'No Frills'
    Then user validates the 'plans_page' 'NoFrills_Select_Plan_Button' event
    When user moves on to fill the qualifier
    #Then user validates the 'cart_page' 'continue_button' event
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
    #Then user validates the 'cart_page' 'continue_button' event
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
    #Then user validates the 'cart_page' 'continue_button' event
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
    When user selects 'Business Balance Plan'
    And user selects gas 'Business Balance Plan'
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
    When user selects 'Business Carbon Neutral'
    Then user validates the 'plans_page' 'business_carbon_electricity_select_plan_button' event
    When user closes the cart page
    Then user validates the 'cart_page' 'close_button' event
    When user selects 'Business Balance Plan'
    Then user validates the 'plans_page' 'business_balance_electricity_select_plan_button' event
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
    When user selects 'Business Balance Plan'
    And user moves on to fill the qualifier
    And user selects 'New' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                      | movingType | propertyType |
      | BUS          | 320 Crown Street, SURRY HILLS NSW 2010 | Moving     |              |
    And user closes the spy on datalayer

  Scenario: Validate the component library events for tooltips on residential plans page
    Given user has opened the website link in a browser and creates 'E2E_Analytics_Plans_Page_Tooltip_Event1' to save evidences
    And user has navigated to 'RES' plans page
    And user initiates the call to capture analytics events
    When user clicks the estimate cost tooltip
    Then user validates the 'plans_page' 'estimate_cost_tooltip' event
    When user clicks the green energy tooltip
    Then user validates the 'plans_page' 'green_Energy_tooltip' event
    When user clicks the green energy tooltip
    Then user validates the 'plans_page' 'green_Energy_tooltip' event
    When user clicks on 'no-frills' estimate tooltip
    Then user validates the 'plans_page' 'nofrills_estimate_cost_ToolTip' event
    When user clicks on 'total-plan' estimate tooltip
    Then user validates the 'plans_page' 'total_plan_estimate_cost_ToolTip' event
    When user clicks on 'no-frills' benefit period tooltip
    Then user validates the 'plans_page' 'nofrills_benefit_period_ToolTip' event
    When user clicks on 'total-plan' benefit period tooltip
    Then user validates the 'plans_page' 'total_plan_benefit_period_ToolTip' event
    When user clicks on 'no-frills' exit fees tooltip
    Then user validates the 'plans_page' 'nofrills_exitfees_ToolTip' event
    When user clicks on 'total-plan' exit fees tooltip
    Then user validates the 'plans_page' 'total_plan_exitfees_ToolTip' event
    When user clicks on 'no-frills' fees tooltip
    Then user validates the 'plans_page' 'nofrills_fees_ToolTip' event
    When user clicks on 'total-plan' fees tooltip
    Then user validates the 'plans_page' 'total_plan_fees_ToolTip' event
    When user clicks on 'no-frills' rates tooltip
    Then user validates the 'plans_page' 'nofrills_rates_ToolTip' event
    When user clicks on 'total-plan' rates tooltip
    Then user validates the 'plans_page' 'total_plan_rates_ToolTip' event
    When user clicks on 'no-frills' late payment tooltip
    Then user validates the 'plans_page' 'nofrills_late_payment_ToolTip' event
    When user clicks on 'total-plan' late payment tooltip
    Then user validates the 'plans_page' 'total_plan_late_payment_ToolTip' event
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

  Scenario: Validate the component library events for tooltips on residential plans pages
    Given user has opened the website link in a browser and creates 'E2E_Analytics_Plans_Page_Tooltip_Event2' to save evidences
    And user has navigated to 'RES' plans page
    And user initiates the call to capture analytics events
    When user clicks the electricity usage tooltip
    Then user validates the 'plans_page' 'elec_usage_tooltip' event
    And user closes the electricity usage modal window
    When user clicks the gas usage tooltip
    Then user validates the 'plans_page' 'gas_usage_tooltip' event
    And user closes the gas usage modal window
    And user closes the spy on datalayer

  Scenario: Validate the component library events for toggle button on residential plans page
    Given user has opened the website link in a browser and creates 'E2E_Analytics_Plans_Page_Toggle_Event' to save evidences
    And user has navigated to 'RES' plans page
    And user initiates the call to capture analytics events
    When user clicks 'Total Plan' toggle button
    Then user validates the 'plans_page' 'total_plan_toggle_off' event
    When user clicks 'Total Plan' toggle button
    Then user validates the 'plans_page' 'total_plan_toggle_on' event
    When user clicks 'No Frills' toggle button
    Then user validates the 'plans_page' 'nofrills_toggle_off' event
    When user clicks 'No Frills' toggle button
    Then user validates the 'plans_page' 'nofrills_toggle_on' event
    When user clicks 'Balance Plan' toggle button
    Then user validates the 'plans_page' 'balance_plan_toggle_off' event
    When user clicks 'Balance Plan' toggle button
    Then user validates the 'plans_page' 'balance_plan_toggle_on' event
    And user closes the spy on datalayer

  Scenario: Validate the component library events for toggle button on business plans page
    Given user has opened the website link in a browser and creates 'E2E_Analytics_Bsme_Page_Toggle_Event' to save evidences
    And user has navigated to 'BUS' plans page
    And user initiates the call to capture analytics events
    When user clicks 'Business Balance Plan' toggle button
    Then user validates the 'plans_page' 'bsme_balance_toggle_off' event
    When user clicks 'Business Balance Plan' toggle button
    Then user validates the 'plans_page' 'bsme_balance_toggle_on' event
    When user clicks 'Total Plan - Business' toggle button
    Then user validates the 'plans_page' 'total_business_toggle_off' event
    When user clicks 'Total Plan - Business' toggle button
    Then user validates the 'plans_page' 'total_business_toggle_on' event
    And user closes the spy on datalayer

  Scenario: Validate the component library events for accordion on residential plans page
    Given user has opened the website link in a browser and creates 'E2E_Analytics_Plans_Page_accordion_Event' to save evidences
    And user has navigated to 'RES' plans page
    And user initiates the call to capture analytics events
    When user clicks 'Total Plan' electricity accordion button
    Then user validates the 'plans_page' 'total_plan_electricity_accordion_on' event
    When user clicks 'Total Plan' electricity accordion button
    Then user validates the 'plans_page' 'total_plan_electricity_accordion_off' event
    When user clicks 'Total Plan' gas accordion button
    Then user validates the 'plans_page' 'total_plan_gas_accordion_on' event
    When user clicks 'Total Plan' gas accordion button
    Then user validates the 'plans_page' 'total_plan_gas_accordion_off' event
    When user clicks 'No Frills' electricity accordion button
    Then user validates the 'plans_page' 'nofrills_electricity_accordion_on' event
    When user clicks 'No Frills' electricity accordion button
    Then user validates the 'plans_page' 'nofrills_electricity_accordion_off' event
    When user clicks 'No Frills' gas accordion button
    Then user validates the 'plans_page' 'nofrills_gas_accordion_on' event
    When user clicks 'No Frills' gas accordion button
    Then user validates the 'plans_page' 'nofrills_gas_accordion_off' event
    And user closes the spy on datalayer

  Scenario: Validate the component library events for accordion button on business plans page for electricity fuel
    Given user has opened the website link in a browser and creates 'E2E_Analytics_Bsme_Page_accordion_Elec_Event' to save evidences
    And user has navigated to 'BUS' plans page
    And user initiates the call to capture analytics events
    When user clicks 'Total Plan - Business' electricity accordion button
    Then user validates the 'plans_page' 'total_business_electricity_accordion_on' event
    When user clicks 'Total Plan - Business' electricity accordion button
    Then user validates the 'plans_page' 'total_business_electricity_accordion_off' event
    When user clicks 'Business Balance Plan' electricity accordion button
    Then user validates the 'plans_page' 'bsme_balance_electricity_accordion_on' event
    When user clicks 'Business Balance Plan' electricity accordion button
    Then user validates the 'plans_page' 'bsme_balance_electricity_accordion_off' event
    And user closes the spy on datalayer

  Scenario: Validate the component library events for accordion button on business plans page for gas fuel
    Given user has opened the website link in a browser and creates 'E2E_Analytics_Bsme_Page_accordion_Gas_Event' to save evidences
    And user has navigated to 'BUS' plans page
    And user initiates the call to capture analytics events
    And user have selected fuel as "GAS"
    When user selects 'Business Balance Plan'
    And user closes the cart page
    When user clicks 'Total Plan - Business' gas accordion button
    Then user validates the 'plans_page' 'total_business_gas_accordion_on' event
    When user clicks 'Total Plan - Business' gas accordion button
    Then user validates the 'plans_page' 'total_business_gas_accordion_off' event
    And user closes the spy on datalayer


  Scenario: Validate the component library events for dropdown on residential plans page
    Given user has opened the website link in a browser and creates 'E2E_Analytics_Residential_Plans_Page_dropdown_event' to save evidences
    And user has navigated to 'RES' plans page
    And user initiates the call to capture analytics events
    And user have selected fuel as "ELE"
    #Then user validates the 'plans_page' 'fueltype_electricity_only' event
    When user selects the 'Yearly' usage period
    Then user validates the 'plans_page' 'usage_period_yearly' event
    And user selects 'High - 20 kWh' 'Electricity' usage per day
    Then user validates the 'plans_page' 'res_electricity_usage_high' event
    And user selects '20%' green energy
    Then user validates the 'plans_page' 'green_energy_20%' event
    And user have selected fuel as "BOTH"
    #Then user validates the 'plans_page' 'fueltype_dual' event
    And user selects 'High - 100 MJ' 'Gas' usage per day
    Then user validates the 'plans_page' 'res_gas_usage_high' event
    And user closes the spy on datalayer

  Scenario: Validate the component library events for dropdown on business plans page
    Given user has opened the website link in a browser and creates 'E2E_Analytics_Business_Plans_Page_usage_event' to save evidences
    And user has navigated to 'BUS' plans page
    And user initiates the call to capture analytics events
    When user selects the 'Bi-monthly' usage period
    Then user validates the 'plans_page' 'usage_period_bi-monthly' event
    And user selects 'Medium - 17 kWh' 'Electricity' usage per day
    Then user validates the 'plans_page' 'bus_electricity_usage_medium' event
    And user selects '25%' green energy
    Then user validates the 'plans_page' 'green_energy_25%' event
    And user have selected fuel as "GAS"
    #Then user validates the 'plans_page' 'fueltype_gas_only' event
    And user selects 'Medium - 345 MJ' 'Gas' usage per day
    Then user validates the 'plans_page' 'bus_gas_usage_medium' event
    And user closes the spy on datalayer
  @failed
    #have to be done manually as the plan view event is trigerred after the key feature event
  Scenario: Validate the component library events for All features/Key Features toggle button on residential plans page
    Given user has opened the website link in a browser and creates 'E2E_Analytics_Residential_Plans_Page_feature_toggle' to save evidences
    And user has navigated to 'RES' plans page
    And user initiates the call to capture analytics events
    And  user clicks 'Key' features plan toggle button
    Then user validates the 'plans_page' 'key_features_plan_toggle' event
    And  user clicks 'All' features plan toggle button
    Then user validates the 'plans_page' 'all_features_plan_toggle' event
    And user closes the spy on datalayer
  @failed
    #have to be done manually as the plan view event is trigerred after the key feature event
  Scenario: Validate the component library events for All features/Key Features toggele button on business plans page
    Given user has opened the website link in a browser and creates 'E2E_Analytics_Business_Plans_Page_feature_toggle' to save evidences
    And user has navigated to 'BUS' plans page
    And user initiates the call to capture analytics events
    And  user clicks 'Key' features plan toggle button
    Then user validates the 'plans_page' 'key_features_plan_toggle' event
    And  user clicks 'All' features plan toggle button
    Then user validates the 'plans_page' 'all_features_plan_toggle' event
    And user closes the spy on datalayer
