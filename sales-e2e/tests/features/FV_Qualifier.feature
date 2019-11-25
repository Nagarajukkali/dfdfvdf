@quotetool
Feature: Family violence scenarios for Quote tool journey
  @smoke
  Scenario Outline: Verify family violence message is displayed to the end user which has flag as true for residential customer
    Given user have opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customer_type>' plans page
    When user selects '<planName>' from '<customer_type>' plans page
    And user moves on to fill the qualifier
    And user selects '<customer>' and provides '<accountNumber>' '<accountIdentification>' '<accountIdentificationType>' and '<idType>' and '<idNumber>' for '<customer_type>' customer
    Then user is displayed with message to redirect to the dedicated team for assistance on qualifier
      |message|
      | We are currently unable to retrieve your information. Please call 133 466 (Monday – Friday, 8am – 8pm AEDT) |
    Examples:
    | customer_type | accountNumber | accountIdentification | idType | idNumber | planName  | customer |accountIdentificationType|folderName|
    | Residential   | 1020538159    | 3351                  | dob    | 01011980 | Total Plan| Existing |null|FV_Residential_Qualifier       |

  @smoke
  Scenario Outline: Verify family violence message is displayed to the end user which has flag as true for Business customer
    Given user have opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customer_type>' plans page
    When user selects '<planName>' from '<customer_type>' plans page
    And user moves on to fill the qualifier
    And user selects '<customer>' and provides '<accountNumber>' '<accountIdentification>' '<accountIdentificationType>' and '<idType>' and '<idNumber>' for '<customer_type>' customer
    Then user is displayed with message to redirect to the dedicated team for assistance on qualifier
      |message|
      | We are currently unable to retrieve your information. Please call 133 466 (Monday – Friday, 8am – 8pm AEDT) |
    Examples:
      | customer_type | accountNumber | accountIdentification | idType | idNumber | planName         | customer |accountIdentificationType|folderName|
      | Business      | 9600344079    | 383989431             | pin    | 288599840 | Total Business  | Existing |ACN                  | FV_Business_Qualifier |

  @smoke
  Scenario Outline: Verify a residential customer is able to submit quote via quote tool
    Given user have opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customer_type>' plans page
    When user selects '<planName>' from '<customer_type>' plans page
    And user moves on to fill the qualifier
    And user selects '<customer>' and provides '<accountNumber>' '<postcode>' '<accountIdentificationType>' and '<idType>' and '<idNumber>' for '<customer_type>' customer
    And user provides all details on qualifier page
      | connectionAddress               | movingType|propertyType|solarOption|
      | 5 Wilkies Street, BULLI NSW 2516|Moving     |Renter      |No         |
    And user provides all details for existing customer on checkout details page
      |customerType|firstName|lastName|identificationType|gasAccess|
      | Residential|test     |test    |Driver Licence    |No       |
    And user provides life support details
        |lifeSupportOption|
        |No               |

    Examples:
    | customer | customer_type | accountNumber |accountIdentificationType| postcode | idType | idNumber  |planName|folderName|
    | Existing | Residential   | 2702159138    |null              | 2516     | dob    | 12101958  |Total   |Residential_Qualifier|


