@sales
Feature: Residential customer end to end journey
  @avi
  Scenario: Verify a residential customer is able to submit quote via quote tool
    Given user have opened the website link in a browser
    And user has navigated to 'Residential' plans page
    When user clicks on the verify modal window on 'Residential' page
    And user click on 'verify account' from the modal
    #Then Verify Account modal window is displayed as per 'Dual' fueltype for 'Residential' customer
    #When user provides "electricity" account number "<Electricity Account No>"
    #And user provides "gas" account number "<Gas Account No>"
    #And user provides "<Postcode>" for verify account
    #And user clicks on Next button after account number
    #And User selects ID type "<ID Type>" and enters "<ID Value>"
    #And user clicks on Next button after account number
    #Then Usage data is displayed for "<fuelType>"
    #When user click show estimates on modal window
    #Then user validates if he/she lands on plans page after verify account journey


