
Feature: Scenarios to cover the data layer updates and analytics events trigger on plan page
  @analytics
  Scenario Outline: Validate the updated data layer for state and postcode on change of address/postcode
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    And user initiates the call to capture analytics events
    Then user validates the state and postcode of data layer is updated for the provided address
      | state | postcode |
      | NSW   | 2000     |
    When user selects "QLD" state from the state dropdown on plans page
    Then user validates the state and postcode of data layer is updated for the provided address
      | state | postcode |
      | QLD   | 4000     |
    When user enters the address "271 Heatherhill Road, FRANKSTON VIC 3199" on plans page
    Then user validates the state and postcode of data layer is updated for the provided address
      | state | postcode |
      | VIC   | 3199     |
    When user enters the postcode "5000" on plans page
    Then user validates the state and postcode of data layer is updated for the provided address
      | state | postcode |
      | SA    | 5000     |
    When user enters the address "21 Tarrant Crescent, DUNLOP ACT 2615" on plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user selects '<movingType>' for moving question on qualifier
    And user enters the address '74 Yillowra Street, AUBURN NSW 2144' on qualifier
    Then user validates the state and postcode of data layer is updated for the provided address
      | state | postcode |
      | NSW   | 2144     |
    And user closes the spy on datalayer

    Examples:
      | folderName                                  | planName   | customerStatus | movingType |
      | E2E_Analytics_Plans_Page_State_And_Postcode | Total Plan | New            | Non-Moving |
