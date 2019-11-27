@E2E
Feature: Safety flag scenarios for Quote tool journey
  Scenario Outline: Verify safety flag message is displayed to the end user which has flag as true for residential customer
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customer_type>' plans page
    When user selects '<planName>' from '<customer_type>' plans page
    And user moves on to fill the qualifier
    And user verifies his account on qualifier
    |customerStatus|accountNumber|postcodeOrABNACN|accountIdentityType|idType|idValue|
    |Existing      |1020538159   |3351            |Postcode           |dob   |01011980|
    Then user is displayed with message to redirect to the dedicated team for assistance on qualifier
      |message|
      | We are currently unable to retrieve your information. Please call 133 466 (Monday – Friday, 8am – 8pm AEDT) |
    Examples:
    | customer_type | planName  |folderName|
    | RES           | Total Plan |SF_Residential_Qualifier|

  Scenario Outline: Verify safety flag message is displayed to the end user which has flag as true for Business customer
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customer_type>' plans page
    When user selects '<planName>' from '<customer_type>' plans page
    And user moves on to fill the qualifier
    And user verifies his account on qualifier
    |customerStatus|accountNumber|postcodeOrABNACN|accountIdentityType|idType|idValue  |
    |Existing      |9600344079   |383989431       |ACN                |pin   |288599840|
    Then user is displayed with message to redirect to the dedicated team for assistance on qualifier
      |message|
      | We are currently unable to retrieve your information. Please call 133 466 (Monday – Friday, 8am – 8pm AEDT) |
    Examples:
      | customer_type |planName        |folderName|
      | BUS           |Total Business  |SF_Business_Qualifier|

  Scenario Outline: Verify a residential customer is able to submit quote via quote tool when safety flag is set to false
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customer_type>' plans page
    When user selects '<planName>' from '<customer_type>' plans page
    And user moves on to fill the qualifier
    And user verifies his account on qualifier
    |customerStatus|accountNumber|postcodeOrABNACN|accountIdentityType|idType|idValue |
    |Existing      |2702159138   |2516            |ACN                |dob   |12101958|
    And user provides all details on qualifier page
      | connectionAddress               | movingType|propertyType|solarOption|
      | 5 Wilkies Street, BULLI NSW 2516|Moving     |Renter      |No         |
    And user provides all details on checkout details page for Residential customer
      |journey    |customerStatus| firstName| lastName|idType        |
      |RES        |Existing      | test     |test     |Driver License|
    And user provides life support details
        |lifeSupportOption|
        |No               |

    Examples:
    | customer_type |planName  |folderName|
    | Residential   |Total Plan|Residential_Qualifier|


