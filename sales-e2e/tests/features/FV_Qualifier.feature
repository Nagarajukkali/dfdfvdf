@quotetool
Feature: Family violence scenarios for Quote tool journey
@smoke
  Scenario Outline: Verify family violence message is displayed to the end user which has flag as true
    Given user have opened the website link in a browser
    And user has navigated to '<customer_type>' plans page
    When user selects '<planName>' from '<customer_type>' plans page
    And user moves on to fill the qualifier
    And user selects '<customer>' and provides '<accountNumber>' '<postcode>' and '<idType>' and '<idNumber>'
    Then user is displayed with '<message>' to redirect to the dedicated team for assistance on qualifier
    Examples:
    | customer_type | accountNumber | postcode | idType | idNumber | planName | customer |message |
    | Residential   | 1020538159    | 3351     | dob    | 01011980 | Total    | Existing |We are currently unable to retrieve your information. Please call 133 466 (Monday – Friday, 8am – 8pm AEDT) |
@avi
  Scenario Outline: Verify a residential customer is able to submit quote via quote tool
    Given user have opened the website link in a browser
    And user has navigated to '<customer_type>' plans page
    When user selects '<planName>' from '<customer_type>' plans page
    And user moves on to fill the qualifier
    And user selects '<customer>' and provides '<elec_accountNumber>' '<postcode>' and '<idType>' and '<idNumber>'
    And user provides all details on qualifier page
      | connectionAddress               | movingType|propertyType|solarOption|
      | 5 Wilkies Street, BULLI NSW 2516|Moving     |Renter      |No         |
    And user provides all details for existing customer on checkout details page
      |customerType|firstName|lastName|identificationType|
      | Residential|test     |test    |Driver Licence    |
    Examples:
    | customer | customer_type | elec_accountNumber | postcode | idType | idNumber  |planName|
    | Existing | Residential   | 2702159138         | 2516     | dob    | 12101958  |Total   |


