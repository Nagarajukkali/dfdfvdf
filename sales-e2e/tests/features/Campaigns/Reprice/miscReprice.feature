
Feature:E2E scenario for misc campaigns
@DR21.8.1.campaign
Scenario: Validate reprice data for basichome-canstarblue campaign for VIC
    Given user has opened the 'basichome-canstarblue' link in a browser and creates 'Reprice_basicHomeCanstarBlue_campaign_VIC' to save evidences
    When user provides "3000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Basic Home' 'basichome-canstarblue' for 'VIC' state

@DR21.8.1.campaign
Scenario: Validate reprice data for basichome-finder campaign for VIC
    Given user has opened the 'basichome-finder' link in a browser and creates 'Reprice_basicHomeFinder_campaign_VIC' to save evidences
    When user provides "3000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Basic Home' 'basichome-finder' for 'VIC' state