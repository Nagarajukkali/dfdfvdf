
Feature:E2E scenario for total plan business campaigns
  @DR21.9.5.campaign-R
  Scenario: Validate reprice data for industryoffer campaign for NSW
    Given user has opened the 'industryoffer' link in a browser and creates 'Reprice_industryoffer_Campaign_NSW' to save evidences
    When user provides "2042" for postcode and proceed to view the plans
    Then user is presented with the plans
    Then user validates the reprice pre-positioning disclaimer for 'Total Plan - Business' on 'Business' plans page
  @DR21.9.5.campaign-R
  Scenario: Validate reprice data for industryoffer campaign for ACT
    Given user has opened the 'industryoffer' link in a browser and creates 'Reprice_industryoffer_Campaign_ACT' to save evidences
    When user provides "2602" for postcode and proceed to view the plans
    Then user is presented with the plans
    Then user validates the reprice pre-positioning disclaimer for 'Total Plan - Business' on 'Business' plans page
  @DR21.9.5.campaign-R
  Scenario: Validate reprice data for industryoffer campaign for VIC
    Given user has opened the 'industryoffer' link in a browser and creates 'Reprice_industryoffer_Campaign_VIC' to save evidences
    When user provides "3031" for postcode and proceed to view the plans
    Then user is presented with the plans
    Then user validates the reprice pre-positioning disclaimer for 'Total Plan - Business' on 'Business' plans page
  @DR21.9.5.campaign
  Scenario: Validate reprice data for business/total-canstarblue campaign for VIC
    Given user has opened the 'business/total-canstarblue' link in a browser and creates 'Reprice_total_canstarblue_Campaign_VIC' to save evidences
    When user provides "3355" and clicks on show me plan link
    Then user is presented with the plans
    Then user validates the reprice pre-positioning disclaimer for 'Total Plan - Business' on 'Business' plans page
  @DR21.9.5.campaign
  Scenario: Validate reprice data for business/total-canstarblue campaign for QLD
    Given user has opened the 'business/total-canstarblue' link in a browser and creates 'Reprice_total_canstarblue_Campaign_QLD' to save evidences
    When user provides "4000" and clicks on show me plan link
    Then user is presented with the plans
    Then user validates the reprice pre-positioning disclaimer for 'Total Plan - Business' on 'Business' plans page
  @DR21.9.5.campaign
  Scenario: Validate reprice data for business/total-canstarblue campaign for SA
    Given user has opened the 'business/total-canstarblue' link in a browser and creates 'Reprice_total_canstarblue_Campaign_SA' to save evidences
    When user provides "5000" and clicks on show me plan link
    Then user is presented with the plans
    Then user validates the reprice pre-positioning disclaimer for 'Total Plan - Business' on 'Business' plans page
  @DR21.9.5.campaign
  Scenario: Validate reprice data for business-energy campaign for VIC
    Given user has opened the 'business-energy' link in a browser and creates 'Reprice_total_business_energy_Campaign_VIC' to save evidences
    When user provides "3355" and clicks on show me plan link
    Then user is presented with the plans
    Then user validates the reprice pre-positioning disclaimer for 'Total Plan - Business' on 'Business' plans page
  @DR21.9.5.campaign
  Scenario: Validate reprice data for business-energy campaign for ACT
    Given user has opened the 'business-energy' link in a browser and creates 'Reprice_total_business_energy_Campaign_ACT' to save evidences
    When user provides "2600" and clicks on show me plan link
    Then user is presented with the plans
    Then user validates the reprice pre-positioning disclaimer for 'Total Plan - Business' on 'Business' plans page
  @DR21.9.5.campaign
  Scenario: Validate reprice data for business-energy campaign for NSW
    Given user has opened the 'business-energy' link in a browser and creates 'Reprice_total_business_energy_Campaign_NSW' to save evidences
    When user provides "2042" and clicks on show me plan link
    Then user is presented with the plans
    Then user validates the reprice pre-positioning disclaimer for 'Total Plan - Business' on 'Business' plans page
