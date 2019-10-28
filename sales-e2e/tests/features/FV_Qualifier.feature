@quotetool
Feature: Family violence scenarios for Quote tool journey
@smoke
  Scenario Outline: Verify family violence message is displayed to the end user which has flag as true
    Given user have opened the website link in a browser
    And user has navigated to '<customer_type>' plans page
    When user selects '<planName>' from '<customer_type>' plans page
    And user moves on to fill the qualifier

    Examples:
    | customer_type | modal_option   | fuelType | elecAccountNumber | gasAccountNumber | postcode | idType | idNumber  | planName   |
    | Residential   | verify account | Dual     | 7733720000        | 9923340000       | 2028     | dl     | 356142016 | Total      |

@smoke
  Scenario Outline: Verify a residential customer is able to submit quote via quote tool
    Given user have opened the website link in a browser
    And user has navigated to '<customer_type>' plans page
    When user clicks on the verify modal window on '<customer_type>' page
    And user clicks on '<modal_option>' from the modal
    Then user verifies if the verify account window is displayed as per the '<fuelType>' fueltype for '<customer_type>' customer
    When user provides 'Electricity' account number '<elec_accountNumber>'
    And user provides 'Gas' account number '<gas_accountNumber>'
    And user provides '<postcode>' for '<customer_type>' customer
    And user clicks on Next button after account number
    And User selects ID type '<idType>' and enters '<idNumber>'
    And user clicks on Next button after account number
    Then Usage data is displayed for 'fuelType'
    When user click show estimates on modal window
    Then User lands on plans page after verify account journey

    Examples:
    | customer_type | modal_option   | fuelType | elec_accountNumber | gas_accountNumber | postcode | idType | idNumber  |
    | Residential   | verify account | Dual     | 7733720000         | 9923340000        | 2028     | dl     | 356142016 |


