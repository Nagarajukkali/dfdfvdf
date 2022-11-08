@E2E @regressiondefects @E2E-Resi
Feature:This feature file is to add scenarios for regression defects

  Scenario Outline: Verify New/Existing customer qualifier question should be displayed when verified customer's details get reset
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customer_type>' plans page
    Then user validates details on plans page for '<customer_type>'
    And user have selected fuel as "<fuelType>"
    When user clicks on the verify modal window on '<customer_type>' page
    And user verifies the account through verify account journey for residential customer
      | customer_type | modal_option   | elecAccountNumber | gasAccountNumber | postcode | idType | idNumber |
      | RES           | verify account | 8146713614        | 4931329359       | 3218     | dob    | 01011980 |
    And user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects 'Non-Moving' for moving question on qualifier
    Then Address field is 'auto_populated'
    When user refresh the qualifier
    And user reset the verified account
    And user selects '<planName1>'
    And user moves on to fill the qualifier
    Then New/Existing customer qualifier question is displayed
    And user selects 'New' on qualifier
    And user selects 'Non-Moving' for moving question on qualifier
    Then Address field is 'blank'

    Examples:
      | folderName                     | customer_type | fuelType | planName     | planName1  |
      | E2E_Reg_Reset_Verified_Account | RES           | BOTH     | Balance Plan | Flexi Plan |

  Scenario Outline: Verify Service address should be replaced by moving address when user provides moving address
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customer_type>' plans page
    Then user validates details on plans page for '<customer_type>'
    And user have selected fuel as "<fuelType>"
    When user clicks on the verify modal window on '<customer_type>' page
    And user verifies the account through verify account journey for residential customer
      | customer_type | modal_option   | elecAccountNumber | gasAccountNumber | postcode | idType | idNumber |
      | RES           | verify account | 8777791000        |                  | 2761     | dob    | 01011980 |
    Then user verifies retrieved account details on plans page
      | address                         | NMI         | MIRN       |
      | 1 Chesham Pl, PLUMPTON NSW 2761 | 43102057838 | 5240151444 |
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user provides all other details on qualifier page
      | customerType | movingType | connectionAddress                        | propertyType |
      | RES          | Moving     | 271 Heatherhill Road, FRANKSTON VIC 3199 | Renter       |
    Then user validates the connection address on checkout page
      | address                                |
      | 271 Heatherhill Rd, FRANKSTON VIC 3199 |

    Examples:
      | folderName                             | customer_type | fuelType | planName   | address                                  |
      | E2E_Reg_MovingAddress_Verified_Account | RES           | BOTH     | Flexi Plan | 271 Heatherhill Road, FRANKSTON VIC 3199 |
  #No data
  @data-required @failed
  Scenario Outline: Verify quote submission for upsell fuel through move house page
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    When user has navigated to move house page
    And user enters '<movingAddress>' in address field and selects any available moving date
    And user verifies account on qualifier
      | customerStatus | accountNumber | accountIdentityType | postcodeOrABNACN | idType | idValue  |
      | Existing       | 2383080000    | Postcode            | 2229             | dob    | 10091943 |
    And user provides all other details on qualifier page
      | customerType | movingType | connectionAddress                | propertyType |
      | RES          | NA         | 5 Wilkies Street, BULLI NSW 2516 | Renter       |
    And user selects plans on checkout details page
      | fuelType | planName   |
      | GAS      | Flexi Plan |
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType         |
      | RES          | RES     | Existing       | test      | test     | Driver License |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user selects answer for property renovation question for '<state>'
    And user chooses "<optDisconnection>" for disconnection
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | Yes               | GAS      |                        | Gas Other             |
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      | fuelType | quoteStatus      | customerType | offerType | planCode | MIRN       | renovationsSinceDeenergisation | renovationsInProgressOrPlanned | customerWithLifeSupport | lifeSupportEquipmentType | billRouteType |
      | GAS      | VERBALLYACCEPTED | RESIDENTIAL  | ENE       | TOPH-GN  | 5240924834 | N                              | N                              | Y                       | OTHER                    | EMAIL         |

    Examples:
      | folderName           | fuelType | state | optDisconnection | movingAddress                    |
      | E2E_Upsell_MoveHouse | GAS      | NSW   | Yes              | 5 Wilkies Street, BULLI NSW 2516 |





