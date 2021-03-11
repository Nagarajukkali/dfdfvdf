@abtest
Feature: This feature is to test the AB test functionality for the sidebar on plans page

  Scenario Outline: Validate the AB test functionality for energy usage option in the sidebar
    Given user has opened AB Test Plans Page in a browser and creates '<folderName>' to save evidences
    And user validates details on plans page for '<customer_type>'
    And user validates cro refine options on plans page for '<customer_type>'
    When user clicks the '<Option>' option
    Then user validates the sidebar accordions
    When user clicks the 'Green Energy' accordion
    Then user validates the Energy Usage accordion is still expanded
    And user clicks the 'Green Energy' accordion
    And user clicks the 'Electricity' usage tooltip and validates the tooltip text
    And user clicks the 'Gas' usage tooltip and validates the tooltip text
    When user clicks the 'Electricity' 'Custom' usage field
    And user enters values for 'Electricity' custom usage field
    And user clicks the done button to close the sidebar
    Then user validates the color of the '<Option>' button
    Examples:
      |folderName               |customer_type |Option       |
      |E2E_Energy_Usage_ABTest  |RES           |Energy Usage |

  Scenario Outline: Validate the AB test functionality for Billing Period option in the sidebar
    Given user has opened AB Test Plans Page in a browser and creates '<folderName>' to save evidences
    And user validates details on plans page for '<customer_type>'
    And user validates cro refine options on plans page for '<customer_type>'
    When user clicks the '<Option>' option
    Then user validates the sidebar accordions
    When user clicks the 'Billing Period' accordion
    Then user validates the Billing Period section in the sidebar
    When user clicks the done button to close the sidebar
    Then user validates if the plans page loads yearly estimates
    And user validates the color of the 'More' button
    Examples:
      |folderName                 |customer_type |Option       |
      |E2E_Billing_Period_ABTest  |RES           |Energy Usage |

  Scenario Outline: Validate the AB test functionality for Green Energy option in the sidebar
    Given user has opened AB Test Plans Page in a browser and creates '<folderName>' to save evidences
    And user validates details on plans page for '<customer_type>'
    And user validates cro refine options on plans page for '<customer_type>'
    When user clicks the '<Option>' option
    Then user validates the Green Energy section in the sidebar
    When user clicks the done button to close the sidebar
    Then user validates if the green energy value is displayed on the plans page
    And user validates the color of the 'Add Green Energy' button
    Examples:
      |folderName               |customer_type |Option           |
      |E2E_Green_Energy_ABTest  |RES           |Add Green Energy |

  Scenario Outline: Validate the AB test functionality for Bill Upload option in the sidebar
    Given user has opened AB Test Plans Page in a browser and creates '<folderName>' to save evidences
    And user validates details on plans page for '<customer_type>'
    And user validates cro refine options on plans page for '<customer_type>'
    When user clicks the '<Option>' option
    And user clicks the upload bill accordion in the side bar
    Then user validates the Bill Upload section in the sidebar
    Examples:
      |folderName               |customer_type |Option  |
      |E2E_Bill_Upload_ABTest  |RES           |More    |
