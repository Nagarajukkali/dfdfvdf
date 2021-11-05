
Feature:E2E scenario for residential balance plan campaigns
  @DR21.11.2.campaign
  Scenario: Validate rate type text for balance-canstarblue campaign for VIC
    Given user has opened the 'balance-canstarblue' link in a browser and creates 'RatesTooltip_balance_canstarblue_Campaign_VIC' to save evidences
    When user provides "3000" for postcode and proceed to view the plans
    Then user is presented with the plans
    Then user click on Rates tooltip for 'Electricity' and validates the rate type text for 'Balance Plan' on 'Residential' plans page for 'VIC'
    Then user click on Rates tooltip for 'Gas' and validates the rate type text for 'Balance Plan' on 'Residential' plans page for 'VIC'
  @DR21.11.2.campaign
  Scenario: Validate rate type text for balance-canstarblue campaign for NSW
    Given user has opened the 'balance-canstarblue' link in a browser and creates 'RatesTooltip_balance_canstarblue_Campaign_NSW' to save evidences
    When user provides "2000" for postcode and proceed to view the plans
    Then user is presented with the plans
    Then user click on Rates tooltip for 'Electricity' and validates the rate type text for 'Balance Plan' on 'Residential' plans page for 'NSW'
    Then user click on Rates tooltip for 'Gas' and validates the rate type text for 'Balance Plan' on 'Residential' plans page for 'NSW'
 @DR21.11.2.campaign
  Scenario: Validate rate type text for Balance Plan on residential page for NSW
    Given user has opened the website link in a browser and creates 'RatesTooltip_BalancePlan_PlansPage_NSW' to save evidences
    And user has navigated to 'RES' plans page
    And user enters '2000' in 'POSTCODE' field
    Then user click on Rates tooltip for 'ELE' and validates the rate type text for 'Balance Plan' on 'Residential' plans page for 'NSW'
    Then user click on Rates tooltip for 'GAS' and validates the rate type text for 'Balance Plan' on 'Residential' plans page for 'NSW'
   Then user click on Rates tooltip for 'Both' and validates the rate type text for 'Balance Plan' on 'Residential' plans page for 'NSW'
  @DR21.11.2.campaign
  Scenario: Validate rate type text for Balance Plan on residential page for VIC
    Given user has opened the website link in a browser and creates 'RatesTooltip_BalancePlan_PlansPage_VIC' to save evidences
    And user has navigated to 'RES' plans page
    And user enters '3000' in 'POSTCODE' field
    Then user click on Rates tooltip for 'ELE' and validates the rate type text for 'Balance Plan' on 'Residential' plans page for 'VIC'
    Then user click on Rates tooltip for 'GAS' and validates the rate type text for 'Balance Plan' on 'Residential' plans page for 'VIC'
    Then user click on Rates tooltip for 'Both' and validates the rate type text for 'Balance Plan' on 'Residential' plans page for 'VIC'
