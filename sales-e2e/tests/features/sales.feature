@quotetool
Feature: Residential customer end to end journey
  @smoke
  Scenario: Verify a residential customer is able to submit quote via quote tool
    Given user have opened the website link in a browser
    And user has navigated to 'Residential' plans page
    When user clicks on the verify modal window on 'Residential' page
    And user clicks on 'verify account' from the modal
    Then user verifies if the verify account window is displayed as per the 'Dual' fueltype for 'Residential' customer
    When user provides 'Electricity' account number '2702159138'
    And user provides 'Gas' account number '5134624952'
    And user provides '2516' for 'Residential' customer
    And user clicks on Next button after account number
    And User selects ID type 'dob' and enters '03101958'
    And user clicks on Next button after account number
    Then Usage data is displayed for 'Dual'
    When user click show estimates on modal window
    Then User lands on plans page after verify account journey


