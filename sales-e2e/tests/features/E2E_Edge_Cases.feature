@E2E @edgecases @E2E-Resi
Feature:This feature file is to cover all the edge cases

  Scenario Outline: Verify the behaviour of the application when the customer try to resume the expired quote
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                      | movingType | propertyType |
      | RES          | 42 Brownlow Drive, POINT COOK VIC 3030 | Moving     | Renter       |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType         | medicareType |
      | RES          | RES     | New            | test      | test     | Driver License |              |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user selects "single_rate" solar tariff type for "VIC"
    And user selects answer for property renovation question for '<state>'
    And user saves the quote url
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                |          |                        |                       |
    And user submits the quote
    Then user lands on checkout complete page
    When user navigate back to plans page
    And user hits the saved quote url
    Then Error modal is displayed for "EXPIRED_QUOTE"
    When user clicks on "go to plans" button
    Then user lands on "plans" page
    Examples:
      | customerStatus | planName   | folderName        | state |
      | New            | Flexi Plan | E2E_EXPIRED_QUOTE | VIC   |

  Scenario Outline: Verify the behaviour of the application when the customer try to hit the quote which doesn't exist
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user hits the quote url which doesn't exist
    Then Error modal is displayed for "QUOTE_NOT_EXIST"
    When user clicks on "go to plans" button
    Then user lands on "plans" page

    Examples:
      | folderName          |
      | E2E_QUOTE_NOT_EXIST |


