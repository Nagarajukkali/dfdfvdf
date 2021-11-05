
Feature:E2E scenario for business balance plan campaigns
  @DR21.11.2.campaign
  Scenario: Validate rate type text for fca-biz campaign for VIC
    Given user has opened the 'fca-biz' link in a browser and creates 'RatesTooltip_fca_biz_Campaign_VIC' to save evidences
    When user provides "3000" for postcode and proceed to view the plans
    Then user is presented with the plans
    Then user click on Rates tooltip for 'Electricity' and validates the rate type text for 'Business Balance Plan' on 'Business' plans page for 'VIC'
    Then user click on Rates tooltip for 'Gas' and validates the rate type text for 'Business Balance Plan' on 'Business' plans page for 'VIC'
  @DR21.11.2.campaign
  Scenario: Validate rate type text for fca-biz campaign for NSW
    Given user has opened the 'fca-biz' link in a browser and creates 'RatesTooltip_fca_biz_Campaign_NSW' to save evidences
    When user provides "2042" for postcode and proceed to view the plans
    Then user is presented with the plans
    Then user click on Rates tooltip for 'Electricity' and validates the rate type text for 'Business Balance Plan' on 'Business' plans page for 'NSW'
    Then user click on Rates tooltip for 'Gas' and validates the rate type text for 'Business Balance Plan' on 'Business' plans page for 'NSW'
  @DR21.11.2.campaign
  Scenario: Validate rate type text for biztpp campaign for VIC
    Given user has opened the 'biztpp' link in a browser and creates 'RatesTooltip_biztpp_Campaign_VIC' to save evidences
    When user provides "3031" for postcode and proceed to view the plans
    Then user is presented with the plans
    Then user click on Rates tooltip for 'Electricity' and validates the rate type text for 'Business Balance Plan' on 'Business' plans page for 'VIC'
    Then user click on Rates tooltip for 'Gas' and validates the rate type text for 'Business Balance Plan' on 'Business' plans page for 'VIC'
  @DR21.11.2.campaign
  Scenario: Validate rate type text for biztpp campaign for NSW
    Given user has opened the 'biztpp' link in a browser and creates 'RatesTooltip_biztpp_Campaign_NSW' to save evidences
    When user provides "2000" for postcode and proceed to view the plans
    Then user is presented with the plans
    Then user click on Rates tooltip for 'Electricity' and validates the rate type text for 'Business Balance Plan' on 'Business' plans page for 'NSW'
    Then user click on Rates tooltip for 'Gas' and validates the rate type text for 'Business Balance Plan' on 'Business' plans page for 'NSW'
  @DR21.11.2.campaign
  Scenario: Validate rate type text for amic-biz campaign for NSW
    Given user has opened the 'amic-biz' link in a browser and creates 'RatesTooltip_amic_biz_Campaign_NSW' to save evidences
    When user provides "2042" for postcode and proceed to view the plans
    Then user is presented with the plans
    Then user click on Rates tooltip for 'Electricity' and validates the rate type text for 'Business Balance Plan' on 'Business' plans page for 'NSW'
    Then user click on Rates tooltip for 'Gas' and validates the rate type text for 'Business Balance Plan' on 'Business' plans page for 'NSW'
  @DR21.11.2.campaign
  Scenario: Validate rate type text for amic-biz campaign for VIC
    Given user has opened the 'amic-biz' link in a browser and creates 'RatesTooltip_amic_biz_Campaign_VIC' to save evidences
    When user provides "3031" for postcode and proceed to view the plans
    Then user is presented with the plans
    Then user click on Rates tooltip for 'Electricity' and validates the rate type text for 'Business Balance Plan' on 'Business' plans page for 'VIC'
    Then user click on Rates tooltip for 'Gas' and validates the rate type text for 'Business Balance Plan' on 'Business' plans page for 'VIC'
  @DR21.11.2.campaign
  Scenario: Validate rate type text for biz-australia campaign for SA
    Given user has opened the 'biz-australia' link in a browser and creates 'RatesTooltip_biz_australia_Campaign_SA' to save evidences
    When user provides "5088" for postcode and proceed to view the plans
    Then user is presented with the plans
    Then user click on Rates tooltip for 'Electricity' and validates the rate type text for 'Business Balance Plan' on 'Business' plans page for 'SA'
    Then user click on Rates tooltip for 'Gas' and validates the rate type text for 'Business Balance Plan' on 'Business' plans page for 'SA'
  @DR21.11.2.campaign
  Scenario: Validate rate type text for biz-australia campaign for VIC
    Given user has opened the 'biz-australia' link in a browser and creates 'RatesTooltip_biz_australia_Campaign_VIC' to save evidences
    When user provides "3031" for postcode and proceed to view the plans
    Then user is presented with the plans
    Then user click on Rates tooltip for 'Electricity' and validates the rate type text for 'Business Balance Plan' on 'Business' plans page for 'VIC'
    Then user click on Rates tooltip for 'Gas' and validates the rate type text for 'Business Balance Plan' on 'Business' plans page for 'VIC'
  @DR21.11.2.campaign
  Scenario: Validate rate type text for business-industryoffer campaign for NSW
    Given user has opened the 'industryoffer' link in a browser and creates 'RatesTooltip_industryoffer_Campaign_SA' to save evidences
    When user provides "2000" for postcode and proceed to view the plans
    Then user is presented with the plans
    Then user click on Rates tooltip for 'Electricity' and validates the rate type text for 'Business Balance Plan' on 'Business' plans page for 'NSW'
    Then user click on Rates tooltip for 'Gas' and validates the rate type text for 'Business Balance Plan' on 'Business' plans page for 'NSW'
  @DR21.11.2.campaign
  Scenario: Validate rate type text for business-industryoffer campaign for VIC
    Given user has opened the 'industryoffer' link in a browser and creates 'RatesTooltip_industryoffer_Campaign_VIC' to save evidences
    When user provides "3031" for postcode and proceed to view the plans
    Then user is presented with the plans
    Then user click on Rates tooltip for 'Electricity' and validates the rate type text for 'Business Balance Plan' on 'Business' plans page for 'VIC'
    Then user click on Rates tooltip for 'Gas' and validates the rate type text for 'Business Balance Plan' on 'Business' plans page for 'VIC'
  @DR21.11.2.campaign
  Scenario: Validate rate type text for Business Balance Plan on business page for NSW
    Given user has opened the website link in a browser and creates 'RatesTooltip_BusinessBalancePlan_PlansPage_NSW' to save evidences
    And user has navigated to 'BUS' plans page
    And user enters '2000' in 'POSTCODE' field
    Then user click on Rates tooltip for 'ELE' and validates the rate type text for 'Business Balance Plan' on 'Business' plans page for 'NSW'
    Then user click on Rates tooltip for 'GAS' and validates the rate type text for 'Business Balance Plan' on 'Business' plans page for 'NSW'
  @DR21.11.2.campaign
  Scenario: Validate rate type text for Business Balance Plan on business page for VIC
    Given user has opened the website link in a browser and creates 'RatesTooltip_BusinessBalancePlan_PlansPage_VIC' to save evidences
    And user has navigated to 'BUS' plans page
    And user enters '3000' in 'POSTCODE' field
    Then user click on Rates tooltip for 'ELE' and validates the rate type text for 'Business Balance Plan' on 'Business' plans page for 'VIC'
    Then user click on Rates tooltip for 'GAS' and validates the rate type text for 'Business Balance Plan' on 'Business' plans page for 'VIC'
