@analyticstest
Feature: Analytics Events for Solar panel validation on plans page

  Scenario Outline: Validate Analytics event for solar panels as Yes
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    And user validates details on plans page for 'RES'
    And user initiates the call to capture analytics events
    When user enters the address "61 Cleveland Avenue, CROMER NSW 2099" on plans page
    Then user validates the data layer is updated for solar
    And user closes the spy on datalayer

    Examples:
      |folderName               |
      |E2E_Analytics_Solar_Yes  |

  Scenario Outline: Validate Analytics event for solar panels as No
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    And user validates details on plans page for 'RES'
    And user initiates the call to capture analytics events
    When user enters the address "271 Heatherhill Road, FRANKSTON VIC 3199" on plans page
    Then user validates the data layer is updated for solar
    And user closes the spy on datalayer

    Examples:
      |folderName               |
      |E2E_Analytics_Solar_No|
