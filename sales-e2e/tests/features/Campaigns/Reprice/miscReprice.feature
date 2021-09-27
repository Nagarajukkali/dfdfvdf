

Feature:E2E scenario for misc campaigns
  @DR21.9.5.campaign
Scenario: Validate reprice data for basichome-canstarblue campaign for VIC
    Given user has opened the 'basichome-canstarblue' link in a browser and creates 'Reprice_basicHomeCanstarBlue_campaign_VIC' to save evidences
    When user provides "3000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Basic Home' 'basichome-canstarblue' for 'VIC' state

  @DR21.9.5.campaign
Scenario: Validate reprice data for basichome-finder campaign for VIC
    Given user has opened the 'basichome-finder' link in a browser and creates 'Reprice_basicHomeFinder_campaign_VIC' to save evidences
    When user provides "3000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Basic Home' 'basichome-finder' for 'VIC' state

  @DR21.9.5.campaign
  Scenario: Validate reprice data for employee campaign for NSW
    Given user has opened the 'employee' link in a browser and creates 'Reprice_employee_Campaign_NSW' to save evidences
    When user provides email "nathan.glen@energyaustralia.com.au" employee id "10000033" and "2000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Employee' 'employee' for 'NSW' state
  @DR21.9.5.campaign
  Scenario: Validate reprice data for employee campaign for VIC
    Given user has opened the 'employee' link in a browser and creates 'Reprice_employee_Campaign_VIC' to save evidences
    When user provides email "nathan.glen@energyaustralia.com.au" employee id "10000033" and "3000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Employee' 'employee' for 'VIC' state
  @DR21.9.5.campaign
  Scenario: Validate reprice data for employee campaign for QLD
    Given user has opened the 'employee' link in a browser and creates 'Reprice_employee_Campaign_QLD' to save evidences
    When user provides email "nathan.glen@energyaustralia.com.au" employee id "10000033" and "4000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Employee' 'employee' for 'QLD' state


