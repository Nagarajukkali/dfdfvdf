@DR21.6.1.repricetest @DR21.7.1.campaign

Feature:E2E scenario for total plan campaigns
  @DR21.9.5.campaign
  Scenario: Validate reprice data for total plan campaign for NSW
    Given user has opened the 'total' link in a browser and creates 'Reprice_total_campaign_NSW' to save evidences
    When user provides "2000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Total Plan' 'total' for 'NSW' state

  Scenario: Validate reprice data for total plan campaign for ACT
    Given user has opened the 'total' link in a browser and creates 'Reprice_total_campaign_ACT' to save evidences
    When user provides "2600" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Total Plan' 'total' for 'ACT' state

  Scenario: Validate reprice data for total plan campaign for SA
    Given user has opened the 'total' link in a browser and creates 'Reprice_total_campaign_SA' to save evidences
    When user provides "5000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Total Plan' 'total' for 'SA' state

  Scenario: Validate reprice data for total plan campaign for QLD
    Given user has opened the 'total' link in a browser and creates 'Reprice_total_campaign_QLD' to save evidences
    When user provides "4000" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Total Plan' 'total' for 'QLD' state
  @DR21.9.5.campaign
  Scenario: Validate reprice data for offer campaign for NSW
    Given user has opened the 'offer' link in a browser and creates 'Reprice_offer_campaign_NSW' to save evidences
    When user provides "2000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Total Plan' 'offer' for 'NSW' state
  @DR21.9.5.campaign
  Scenario: Validate reprice data for offer campaign for ACT
    Given user has opened the 'offer' link in a browser and creates 'Reprice_offer_campaign_ACT' to save evidences
    When user provides "2600" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Total Plan' 'offer' for 'ACT' state
  @DR21.9.5.campaign
  Scenario: Validate reprice data for offer campaign for SA
    Given user has opened the 'offer' link in a browser and creates 'Reprice_offer_campaign_SA' to save evidences
    When user provides "5000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Total Plan' 'offer' for 'SA' state
  @DR21.9.5.campaign
  Scenario: Validate reprice data for offer campaign for QLD
    Given user has opened the 'offer' link in a browser and creates 'Reprice_offer_campaign_QLD' to save evidences
    When user provides "4000" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Total Plan' 'offer' for 'QLD' state
  @DR21.9.5.campaign
  Scenario: Validate reprice data for offer-canstarblue campaign for NSW
    Given user has opened the 'offer-canstarblue' link in a browser and creates 'Reprice_offer-canstarblue_campaign_NSW' to save evidences
    When user provides "2000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Total Plan' 'offer-canstarblue' for 'NSW' state
  @DR21.9.5.campaign
  Scenario: Validate reprice data for offer-canstarblue campaign for ACT
    Given user has opened the 'offer-canstarblue' link in a browser and creates 'Reprice_offer-canstarblue_campaign_ACT' to save evidences
    When user provides "2600" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Total Plan' 'offer-canstarblue' for 'ACT' state
  @DR21.9.5.campaign
  Scenario: Validate reprice data for offer-canstarblue campaign for SA
    Given user has opened the 'offer-canstarblue' link in a browser and creates 'Reprice_offer-canstarblue_campaign_SA' to save evidences
    When user provides "5000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Total Plan' 'offer-canstarblue' for 'SA' state
  @DR21.9.5.campaign
  Scenario: Validate reprice data for offer-canstarblue campaign for QLD
    Given user has opened the 'offer-canstarblue' link in a browser and creates 'Reprice_offer-canstarblue_campaign_QLD' to save evidences
    When user provides "4000" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Total Plan' 'offer-canstarblue' for 'QLD' state
  @DR21.9.5.campaign
  Scenario: Validate reprice data for offer-finder campaign for NSW
    Given user has opened the 'offer-finder' link in a browser and creates 'Reprice_offer-finder_campaign_NSW' to save evidences
    When user provides "2000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Total Plan' 'offer-finder' for 'NSW' state
  @DR21.9.5.campaign
  Scenario: Validate reprice data for offer-finder campaign for ACT
    Given user has opened the 'offer-finder' link in a browser and creates 'Reprice_offer-finder_campaign_ACT' to save evidences
    When user provides "2600" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Total Plan' 'offer-finder' for 'ACT' state
  @DR21.9.5.campaign
  Scenario: Validate reprice data for offer-finder campaign for SA
    Given user has opened the 'offer-finder' link in a browser and creates 'Reprice_offer-finder_campaign_SA' to save evidences
    When user provides "5000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Total Plan' 'offer-finder' for 'SA' state
  @DR21.9.5.campaign
  Scenario: Validate reprice data for offer-finder campaign for QLD
    Given user has opened the 'offer-finder' link in a browser and creates 'Reprice_offer-finder_campaign_QLD' to save evidences
    When user provides "4000" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Total Plan' 'offer-finder' for 'QLD' state
  @DR21.9.5.campaign
  Scenario: Validate reprice data for movehouse campaign for NSW
    Given user has opened the 'movehouse' link in a browser and creates 'Reprice_movehouse_campaign_NSW' to save evidences
    When user provides "2000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Total Plan' 'movehouse' for 'NSW' state
  @DR21.9.5.campaign
  Scenario: Validate reprice data for movehouse campaign for ACT
    Given user has opened the 'movehouse' link in a browser and creates 'Reprice_movehouse_campaign_ACT' to save evidences
    When user provides "2600" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Total Plan' 'movehouse' for 'ACT' state
  @DR21.9.5.campaign
  Scenario: Validate reprice data for movehouse campaign for SA
    Given user has opened the 'movehouse' link in a browser and creates 'Reprice_movehouse_campaign_SA' to save evidences
    When user provides "5000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Total Plan' 'movehouse' for 'SA' state
  @DR21.9.5.campaign
  Scenario: Validate reprice data for movehouse campaign for QLD
    Given user has opened the 'movehouse' link in a browser and creates 'Reprice_movehouse_campaign_QLD' to save evidences
    When user provides "4000" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Total Plan' 'movehouse' for 'QLD' state
  @DR21.9.5.campaign
  Scenario: Validate reprice data for cashrewards campaign for NSW
    Given user has opened the 'cashrewards' link in a browser and creates 'Reprice_cashrewards_campaign_NSW' to save evidences
    When user provides "2000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Total Plan' 'cashrewards' for 'NSW' state
  @DR21.9.5.campaign
  Scenario: Validate reprice data for cashrewards campaign for ACT
    Given user has opened the 'cashrewards' link in a browser and creates 'Reprice_cashrewards_campaign_ACT' to save evidences
    When user provides "2600" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Total Plan' 'cashrewards' for 'ACT' state
  @DR21.9.5.campaign
  Scenario: Validate reprice data for cashrewards campaign for SA
    Given user has opened the 'cashrewards' link in a browser and creates 'Reprice_cashrewards_campaign_SA' to save evidences
    When user provides "5000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Total Plan' 'cashrewards' for 'SA' state
  @DR21.9.5.campaign
  Scenario: Validate reprice data for cashrewards campaign for QLD
    Given user has opened the 'cashrewards' link in a browser and creates 'Reprice_cashrewards_campaign_QLD' to save evidences
    When user provides "4000" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Total Plan' 'cashrewards' for 'QLD' state
  @DR21.9.5.campaign
  Scenario: Validate reprice data for partner-program campaign for NSW
    Given user has opened the 'partner-program' link in a browser and creates 'Reprice_partner-program_campaign_NSW' to save evidences
    When user provides "bizoffer5" and "2000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Total Plan' 'partner-program' for 'NSW' state
  @DR21.9.5.campaign
  Scenario: Validate reprice data for partner-program campaign for ACT
    Given user has opened the 'partner-program' link in a browser and creates 'Reprice_partner-program_campaign_ACT' to save evidences
    When user provides "bizoffer5" and "2600" and clicks on show me plan link
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Total Plan' 'partner-program' for 'ACT' state
  @DR21.9.5.campaign
  Scenario: Validate reprice data for partner-program campaign for SA
    Given user has opened the 'partner-program' link in a browser and creates 'Reprice_partner-program_campaign_SA' to save evidences
    When user provides "bizoffer5" and "5000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Total Plan' 'partner-program' for 'SA' state
  @DR21.9.5.campaign
  Scenario: Validate reprice data for partner-program campaign for QLD
    Given user has opened the 'partner-program' link in a browser and creates 'Reprice_partner-program_campaign_QLD' to save evidences
    When user provides "bizoffer5" and "4000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Total Plan' 'partner-program' for 'QLD' state
  @DR21.9.5.campaign
  Scenario: Validate reprice data for mcc campaign for NSW
    Given user has opened the 'mcc' link in a browser and creates 'Reprice_mcc_campaign_NSW' to save evidences
    When user provides "PPMCC01" and "2000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Total Plan' 'mcc' for 'NSW' state
  @DR21.9.5.campaign
  Scenario: Validate reprice data for mcc campaign for ACT
    Given user has opened the 'mcc' link in a browser and creates 'Reprice_mcc_campaign_ACT' to save evidences
    When user provides "PPMCC01" and "2600" and clicks on show me plan link
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Total Plan' 'mcc' for 'ACT' state
  @DR21.9.5.campaign
  Scenario: Validate reprice data for mcc campaign for SA
    Given user has opened the 'mcc' link in a browser and creates 'Reprice_mcc_campaign_SA' to save evidences
    When user provides "PPMCC01" and "5000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Total Plan' 'mcc' for 'SA' state
  @DR21.9.5.campaign
  Scenario: Validate reprice data for mcc campaign for QLD
    Given user has opened the 'mcc' link in a browser and creates 'Reprice_mcc_campaign_QLD' to save evidences
    When user provides "PPMCC01" and "4000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Total Plan' 'mcc' for 'QLD' state
  @DR21.9.5.campaign
  Scenario: Validate reprice data for mcdonalds campaign for NSW
    Given user has opened the 'mcdonalds' link in a browser and creates 'Reprice_mcdonalds_campaign_NSW' to save evidences
    When user provides "PPMAC01" and "2000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Total Plan' 'mcdonalds' for 'NSW' state
  @DR21.9.5.campaign
  Scenario: Validate reprice data for mcdonalds campaign for ACT
    Given user has opened the 'mcdonalds' link in a browser and creates 'Reprice_mcdonalds_campaign_ACT' to save evidences
    When user provides "PPMAC01" and "2600" and clicks on show me plan link
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Total Plan' 'mcdonalds' for 'ACT' state
  @DR21.9.5.campaign
  Scenario: Validate reprice data for mcdonalds campaign for SA
    Given user has opened the 'mcdonalds' link in a browser and creates 'Reprice_mcdonalds_campaign_SA' to save evidences
    When user provides "PPMAC01" and "5000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Total Plan' 'mcdonalds' for 'SA' state
  @DR21.9.5.campaign
  Scenario: Validate reprice data for mcdonalds campaign for QLD
    Given user has opened the 'mcdonalds' link in a browser and creates 'Reprice_mcdonalds_campaign_QLD' to save evidences
    When user provides "PPMAC01" and "4000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Total Plan' 'mcdonalds' for 'QLD' state
  @DR21.9.5.campaign
  Scenario: Validate reprice data for superrewards campaign for NSW
    Given user has opened the 'super-rewards' link in a browser and creates 'Reprice_super-rewards_campaign_NSW' to save evidences
    When user provides "2000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Total Plan' 'super-rewards' for 'NSW' state
  @DR21.9.5.campaign
  Scenario: Validate reprice data for superrewards campaign for ACT
    Given user has opened the 'super-rewards' link in a browser and creates 'Reprice_super-rewards_campaign_ACT' to save evidences
    When user provides "2600" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Total Plan' 'super-rewards' for 'ACT' state
  @DR21.9.5.campaign
  Scenario: Validate reprice data for superrewards campaign for SA
    Given user has opened the 'super-rewards' link in a browser and creates 'Reprice_super-rewards_campaign_SA' to save evidences
    When user provides "5000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Total Plan' 'super-rewards' for 'SA' state
  @DR21.9.5.campaign
  Scenario: Validate reprice data for superrewards campaign for QLD
    Given user has opened the 'super-rewards' link in a browser and creates 'Reprice_super-rewards_campaign_QLD' to save evidences
    When user provides "4000" for postcode and proceed to view the plans
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Total Plan' 'super-rewards' for 'QLD' state
  @DR21.9.5.campaign
  Scenario: Validate reprice data for nsw-seniors campaign for NSW
    Given user has opened the 'nsw-seniors' link in a browser and creates 'Reprice_nsw-seniors_campaign_NSW' to save evidences
    When user provides "1234" and "2516" and clicks on show me plan link
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Total Plan' 'nsw-seniors' for 'NSW' state
  @DR21.9.5.campaign
  Scenario: Validate reprice data for vic-seniors campaign for VIC
    Given user has opened the 'vic-seniors' link in a browser and creates 'Reprice_vic-seniors_campaign_VIC' to save evidences
    When user provides "1234" and "3000" and clicks on show me plan link
    Then user is presented with the plans
    And user validates the reprice pre-positioning disclaimer for 'Total Plan' 'vic-seniors' for 'VIC' state
