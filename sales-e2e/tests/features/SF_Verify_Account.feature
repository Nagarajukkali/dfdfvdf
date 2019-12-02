@quotetool
Feature: Safety Flag scenarios for Verify Account journey
  @smoke
  Scenario Outline: Verify Safety Flag message is displayed to the end user which has flag as true for Residential Customer
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customer_type>' plans page
    When user clicks on the verify modal window on '<customer_type>' page
    And user clicks on '<modal_option>' from the modal
    And user verifies if the verify account window is displayed as per the '<fuelType>' fueltype for '<customer_type>' customer
    And user provides 'ELE' account number '<elecAccountNumber>'
    And user provides '<accountVerification>' for '<customer_type>' customer
    And user clicks on Next button after account number
    And User selects ID type '<idType>' and enters '<idNumber>'
    And user clicks on Next button after account number
    Then user is displayed with message to redirect to the dedicated team for assistance
    |message|
    | We are currently unable to retrieve your information. Please call 133 466 (Monday – Friday, 8am – 8pm AEDT) |
    Examples:
    | customer_type | modal_option  | fuelType | elecAccountNumber |accountVerification | idType | idNumber |folderName|
    | RES   | verify account| BOTH     | 1020538159        |3351     | dob    | 01011980            |SF_Residential_VerifyAccount|

  @smoke
  Scenario Outline: Verify Safety Flag message is displayed to the end user which has flag as true for Business Customer
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customer_type>' plans page
    When user clicks on the verify modal window on '<customer_type>' page
    And user clicks on '<modal_option>' from the modal
    And user verifies if the verify account window is displayed as per the '<fuelType>' fueltype for '<customer_type>' customer
    And user provides 'Electricity' account number '<elecAccountNumber>'
    And user provides '<accountVerification>' for '<customer_type>' customer
    And user clicks on Next button after account number
    And User selects ID type '<idType>' and enters '<idNumber>'
    And user clicks on Next button after account number
    Then user is displayed with message to redirect to the dedicated team for assistance
      |message|
      | We are currently unable to retrieve your information. Please call 133 466 (Monday – Friday, 8am – 8pm AEDT) |

    Examples:
      | customer_type | modal_option  | fuelType | elecAccountNumber |accountVerification | idType | idNumber  |folderName|
      | Business      | verify account| Dual     | 9600344079        |383989431           | pin    | 288599840 |SF_Business_VerifyAccount|

  @smoke
  Scenario Outline: Verify a residential customer is able to submit quote via quote tool when safety flag is set to false
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customer_type>' plans page
    When user clicks on the verify modal window on '<customer_type>' page
    And user clicks on '<modal_option>' from the modal
    And user verifies if the verify account window is displayed as per the '<fuelType>' fueltype for '<customer_type>' customer
    And user provides 'Electricity' account number '<elecAccountNumber>'
    And user provides 'Gas' account number '<gasAccountNumber>'
    And user provides '<postcode>' for '<customer_type>' customer
    And user clicks on Next button after account number
    And User selects ID type '<idType>' and enters '<idNumber>'
    And user clicks on Next button after account number
    And Usage data is displayed for '<fuelType>'
    And user click show estimates on modal window
    And User lands on plans page after verify account journey
    And user selects '<planName>'
    And user moves on to fill the qualifier
    Then user provides all details on qualifier page
      | connectionAddress               | movingType|propertyType|solarOption|
      | 5 Wilkies Street, BULLI NSW 2516|Moving     |Renter      |No         |
    And user provides all details for existing customer on checkout details page
      |customerType|firstName|lastName|identificationType|gasAccess|electricityAccess|
      | Residential|test     |test    |Driver Licence    |No       |No               |
    And user provides life support details
      |lifeSupportOption|
      |No               |

    Examples:
    | customer_type | modal_option   | fuelType | elecAccountNumber | gasAccountNumber | postcode | idType | idNumber  | planName   |folderName|
    | Residential   | verify account | Dual     | 7733720000        | 9923340000       | 2028     | dl     | 356142016 | Total      |Residential_VerifyAccount|




