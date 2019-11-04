@quotetool
Feature: Family violence scenarios for Verify Account journey
  @smoke
  Scenario Outline: Verify family violence message is displayed to the end user which has flag as true for Residential Customer
    Given user have opened the website link in a browser
    And user has navigated to '<customer_type>' plans page
    When user clicks on the verify modal window on '<customer_type>' page
    And user clicks on '<modal_option>' from the modal
    Then user verifies if the verify account window is displayed as per the '<fuelType>' fueltype for '<customer_type>' customer
    When user provides 'Electricity' account number '<elecAccountNumber>'
    And user provides '<accountVerification>' for '<customer_type>' customer
    And user clicks on Next button after account number
    And User selects ID type '<idType>' and enters '<idNumber>'
    And user clicks on Next button after account number
    Then user is displayed with message to redirect to the dedicated team for assistance
    |message|
    | We are currently unable to retrieve your information. Please call 133 466 (Monday – Friday, 8am – 8pm AEDT) |
    Examples:
    | customer_type | modal_option  | fuelType | elecAccountNumber |accountVerification | idType | idNumber |
    | Residential   | verify account| Dual     | 1020538159        |3351     | dob    | 01011980            |

  @smoke
  Scenario Outline: Verify family violence message is displayed to the end user which has flag as true for Business Customer
    Given user have opened the website link in a browser
    And user has navigated to '<customer_type>' plans page
    When user clicks on the verify modal window on '<customer_type>' page
    And user clicks on '<modal_option>' from the modal
    Then user verifies if the verify account window is displayed as per the '<fuelType>' fueltype for '<customer_type>' customer
    When user provides 'Electricity' account number '<elecAccountNumber>'
    And user provides '<accountVerification>' for '<customer_type>' customer
    And user clicks on Next button after account number
    And User selects ID type '<idType>' and enters '<idNumber>'
    And user clicks on Next button after account number
    Then user is displayed with message to redirect to the dedicated team for assistance
      |message|
      | We are currently unable to retrieve your information. Please call 133 466 (Monday – Friday, 8am – 8pm AEDT) |

    Examples:
      | customer_type | modal_option  | fuelType | elecAccountNumber |accountVerification | idType | idNumber |
      | Business      | verify account| Dual     | 1973600000        |8666392000          | dob    | 01011980 |

  @smoke
  Scenario Outline: Verify a residential customer is able to submit quote via quote tool
    Given user have opened the website link in a browser
    And user has navigated to '<customer_type>' plans page
    When user clicks on the verify modal window on '<customer_type>' page
    And user clicks on '<modal_option>' from the modal
    Then user verifies if the verify account window is displayed as per the '<fuelType>' fueltype for '<customer_type>' customer
    When user provides 'Electricity' account number '<elecAccountNumber>'
    And user provides 'Gas' account number '<gasAccountNumber>'
    And user provides '<postcode>' for '<customer_type>' customer
    And user clicks on Next button after account number
    And User selects ID type '<idType>' and enters '<idNumber>'
    And user clicks on Next button after account number
    Then Usage data is displayed for '<fuelType>'
    When user click show estimates on modal window
    Then User lands on plans page after verify account journey
    When user selects '<planName>' from '<customer_type>' plans page
    And user moves on to fill the qualifier
    And user provides all details on qualifier page
      | connectionAddress               | movingType|propertyType|solarOption|
      | 5 Wilkies Street, BULLI NSW 2516|Moving     |Renter      |No         |
    And user provides all details for existing customer on checkout details page
      |customerType|firstName|lastName|identificationType|gasAccess|electricityAccess|
      | Residential|test     |test    |Driver Licence    |No       |No               |
    And user provides life support details
      |lifeSupportOption|
      |No               |

    Examples:
    | customer_type | modal_option   | fuelType | elecAccountNumber | gasAccountNumber | postcode | idType | idNumber  | planName   |
    | Residential   | verify account | Dual     | 7733720000        | 9923340000       | 2028     | dl     | 356142016 | Total      |




