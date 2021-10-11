@nsw_remote_fdv
Feature: This feature is to test the behaviour of NSW remote meter with safety flag functionality

  Scenario: Verify the new address an existing customer with safety flay as U is moving is nsw remote meter risk for electricity for residential plans page
    Given user has opened the website link in a browser and creates 'Resi_NSW_Remote_Meter' to save evidences
    And user has navigated to 'RES' plans page
    And user enters the address "9 Diver Street, THE PONDS NSW 2769" on plans page
    When user selects 'Total Plan'
    And user moves on to fill the qualifier
    And user selects 'Existing' on qualifier
    And user verifies account on qualifier
    |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue  |
    |Existing      |9005968894   |Postcode           |2127            |dl    |368555831|
    Then relevant error message is presented for customers marked with NSW remote meter risk on qualifier
    And the verify identity section continue button has the text as "Continue with gas"
    And the details not handy link and verify identity dropdown is not visible
    When user closes the qualifier
    And user closes the cart page
    Then relevant error message is presented for customers marked with NSW remote meter risk on plans page

  Scenario: Verify the new address an existing customer with safety flay as U is moving is nsw remote meter risk for electricity for moving home page
    Given user has opened the website link in a browser and creates 'MoveHouse_NSW_Remote_Meter' to save evidences
    When user has navigated to move house page
    And user enters '9 Diver Street, THE PONDS NSW 2769' in address field and selects any available moving date
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue  |
      |Existing      |9005968894   |Postcode           |2127            |dl    |368555831|
    Then relevant error message is presented for customers marked with NSW remote meter risk on qualifier
    And the verify identity section continue button has the text as "Continue with gas"
    And the details not handy link and verify identity dropdown is not visible

  Scenario: Verify the new address an existing customer with safety flay as U is moving is nsw remote meter risk for electricity for Campaign page
    Given user has opened the 'offer' link in a browser and creates 'Campaign_NSW_Remote_Meter' to save evidences
    When user enters the address "9 Diver Street, THE PONDS NSW 2769" on campaign and click show me link
    And user clicks on Add plan button
    And user selects 'Existing' on qualifier
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue  |
      |Existing      |9005968894   |Postcode           |2127            |dl    |368555831|
    Then relevant error message is presented for customers marked with NSW remote meter risk on qualifier
    And the verify identity section continue button has the text as "Continue with gas"
    And the details not handy link and verify identity dropdown is not visible
    When user closes the qualifier
    And user closes the cart page
    Then relevant error message is presented for customers marked with NSW remote meter risk on plans page

  Scenario: Verify the new address on qualifier as an existing customer with safety flay as U is moving is nsw remote meter risk for electricity for residential plans page
    Given user has opened the website link in a browser and creates 'Resi_NSW_Remote_Meter_address_qualifier' to save evidences
    And user has navigated to 'RES' plans page
    When user selects 'Total Plan'
    And user moves on to fill the qualifier
    And user selects 'Existing' on qualifier
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue  |
      |Existing      |9005968894   |Postcode           |2127            |dl    |368555831|
    And user selects 'Moving' for moving question on qualifier
    And user enters the address '9 Diver Street, THE PONDS NSW 2769' on qualifier for NSW
    Then relevant error message is presented for customers marked with NSW remote meter risk on qualifier address component
    And the verify identity section continue button has the text as "Continue with gas" on address component
    When user closes the qualifier
    And user closes the cart page
    Then relevant error message is presented for customers marked with NSW remote meter risk on plans page

  Scenario: Verify the new address on qualifier as an existing customer with safety flay as U is moving is nsw remote meter risk for electricity for Campaign page
    Given user has opened the 'offer' link in a browser and creates 'Campaign_NSW_Remote_Meter_address_qualifier' to save evidences
    When user provides "2000" and clicks on show me plan link
    And user clicks on Add plan button
    And user selects 'Existing' on qualifier
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue  |
      |Existing      |9005968894   |Postcode           |2127            |dl    |368555831|
    And user selects 'Moving' for moving question on qualifier
    And user enters the address '9 Diver Street, THE PONDS NSW 2769' on qualifier for NSW
    Then relevant error message is presented for customers marked with NSW remote meter risk on qualifier address component
    And the verify identity section continue button has the text as "Continue with gas" on address component
    When user closes the qualifier
    And user closes the cart page
    Then relevant error message is presented for customers marked with NSW remote meter risk on plans page

  Scenario: Verify the new address on qualifier as an existing customer with safety flay as Y on main person is moving is nsw remote meter risk for electricity for residential plans page
    Given user has opened the website link in a browser and creates 'Resi_NSW_Remote_Meter_FDV' to save evidences
    And user has navigated to 'RES' plans page
    And user enters the address "9 Diver Street, THE PONDS NSW 2769" on plans page
    When user selects 'Total Plan'
    And user moves on to fill the qualifier
    And user selects 'Existing' on qualifier
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |0159048044   |Postcode           |2216            |dob   |01011980|
    Then Relevant error message is presented for customers marked with safety flag on qualifier

  Scenario: Verify the new address on qualifier as an existing customer with safety flay as Y on main person is moving is nsw remote meter risk for electricity for residential plans page with no address
    Given user has opened the website link in a browser and creates 'Resi_NSW_Remote_Meter_FDV_noaddress' to save evidences
    And user has navigated to 'RES' plans page
    When user selects 'Total Plan'
    And user moves on to fill the qualifier
    And user selects 'Existing' on qualifier
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |0159048044   |Postcode           |2216            |dob   |01011980|
    Then Relevant error message is presented for customers marked with safety flag on qualifier

  Scenario Outline: Verify the new address on qualifier as an existing customer with safety flay as U and verifying account on plans page is moving is nsw remote meter risk for electricity for residential plans page
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customer_type>' plans page
    Then user validates details on plans page for '<customer_type>'
    And user have selected fuel as "<fuelType>"
    When user clicks on the verify modal window on '<customer_type>' page
    And user verifies the account through verify account journey for residential customer
      | customer_type | modal_option   | elecAccountNumber | gasAccountNumber | postcode | idType | idNumber |
      | RES           | verify account |  0046527875       | 1933957264       | 2143     | dl    | 597386600 |
    And user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects 'Moving' for moving question on qualifier
    And user enters the address '9 Diver Street, THE PONDS NSW 2769' on qualifier for NSW
    Then relevant error message is presented for customers marked with NSW remote meter risk on qualifier address component
    And the verify identity section continue button has the text as "Continue with gas" on address component
    When user closes the qualifier
    And user closes the cart page
    Then relevant error message is presented for customers marked with NSW remote meter risk on plans page

    Examples:
      | folderName            | customer_type | fuelType | planName  |
      | VerifyAccount_NSW_FDV | RES           | BOTH     | No Frills |

  Scenario: Verify the nsw remote meter risk for single fuel when address in provided on qualifier page
    Given user has opened the website link in a browser and creates 'Resi_NSW_Remote_Meter_Elec_Only' to save evidences
    And user has navigated to 'RES' plans page
    And user have selected fuel as "ELE"
    When user selects 'Total Plan'
    And user moves on to fill the qualifier
    And user selects 'Existing' on qualifier
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue  |
      |Existing      |9005968894   |Postcode           |2127            |dl    |368555831|
    And user selects 'Moving' for moving question on qualifier
    And user enters the address '9 Diver Street, THE PONDS NSW 2769' on qualifier for NSW
    Then relevant error message is presented for customers marked with NSW remote meter risk on qualifier address component
    And the verify identity section continue button has the text as "Continue with gas" on address component
    When user closes the qualifier
    And user closes the cart page
    Then relevant error message is presented for customers marked with NSW remote meter risk on plans page

  Scenario: Verify the nsw remote meter risk for single fuel when address in provided on plans page
    Given user has opened the website link in a browser and creates 'Resi_NSW_Remote_Meter_Elec_Only' to save evidences
    And user has navigated to 'RES' plans page
    And user enters the address "9 Diver Street, THE PONDS NSW 2769" on plans page
    And user have selected fuel as "ELE"
    When user selects 'Total Plan'
    And user moves on to fill the qualifier
    And user selects 'Existing' on qualifier
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue  |
      |Existing      |9005968894   |Postcode           |2127            |dl    |368555831|
    Then relevant error message is presented for customers marked with NSW remote meter risk on qualifier
    And the verify identity section continue button has the text as "Continue with gas" is not visible
    And the details not handy link and verify identity dropdown is not visible
    When user closes the qualifier
    And user closes the cart page
    Then relevant error message is presented for customers marked with NSW remote meter risk on plans page
