@ctp
Feature: Click to Pay - Pay your bill via sms
  @smoke
  Scenario Outline: View and pay the bill using the click to pay app via website
    Given I have opened the website link in a browser
    And I enter valid account number and '<amountToPay>' in Payment details section
    And I enter valid '<creditCard>' information in Payment method section
    When I click 'Pay now' button
    Then I see the success message 'Your payment has been successful'
    And I see the relevant payment receipt details

    Examples:
      | amountToPay | creditCard |
      | 80          | Mastercard |
      | 150         | Visa       |
      | 1           | Amex       |

  @smoke
  Scenario: View and pay the bill using the click to pay link loaded via sms
    Given I have opened the link provided in the sms in a browser
    And I see the account number and amount to pay prefilled correctly
    And I enter valid 'Amex' information in Payment method section
    When I click 'Pay now' button
    And I see the spinner
    Then I see the success message 'Your payment has been successful'
    And I see the relevant payment receipt details

  @smoke
  Scenario: Send the receipt to email address
    Given I have opened the link provided in the sms in a browser
    And I enter valid 'Visa' information in Payment method section
    And I click 'Pay now' button
    Then I see the success message 'Your payment has been successful'
    And I enter a valid email address
    When I click 'Send receipt' button
    Then I see the email success message 'Your receipt has been sent to'

  Scenario Outline: Whats next buttons
    Given I have opened the link provided in the sms in a browser
    And I enter valid '<creditCard>' information in Payment method section
    And I click 'Pay now' button
    When I click '<whatNext>' button
    Then I am on 'myaccount' page

    Examples:
      | creditCard | whatNext            |
      | Mastercard | Review my plan      |
      | Visa       | Set up direct debit |
      | Amex       | Sign up to ebilling |


