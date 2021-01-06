@E2E @regressiondefects
Feature:This feature file is to add scenarios for regression defects
  @failed
    #raised a defect for this
  Scenario Outline: Verify New/Existing customer qualifier question should be displayed when verified customer's details get reset
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customer_type>' plans page
    Then user validates details on plans page for '<customer_type>'
    And user have selected fuel as "<fuelType>"
    When user clicks on the verify modal window on '<customer_type>' page
    And user verifies the account through verify account journey for residential customer
      |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |postcode |idType |idNumber |
      |RES          |verify account |8373520946       |2816302453       |3153     |dob    |01011980 |
    And user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects 'Non-Moving' for moving question on qualifier
    Then Address field is 'auto_populated'
    When user closes the qualifier
    And user closes the cart page
    And user reset the verified account
    And user selects '<planName>'
    And user moves on to fill the qualifier
    Then New/Existing customer qualifier question is displayed
    And user selects 'New' on qualifier
    And user selects 'Non-Moving' for moving question on qualifier
    Then Address field is 'blank'

  Examples:
    |folderName                      |customer_type |fuelType |planName  |
    |E2E_Reg_Reset_Verified_Account  |RES           |BOTH     |Total Plan|

  Scenario Outline: Verify Service address should be replaced by moving address when user provides moving address
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customer_type>' plans page
    Then user validates details on plans page for '<customer_type>'
    And user have selected fuel as "<fuelType>"
    When user clicks on the verify modal window on '<customer_type>' page
    And user verifies the account through verify account journey for residential customer
      |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |postcode |idType |idNumber |
      |RES          |verify account |2174217496       |8502057105       |3075     |dob    |05071969 |
    Then user verifies retrieved account details on plans page
      |address                 |NMI        |MIRN      |
      |7 Ella Ct LALOR VIC 3075|63052151664|5321275791|
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects 'Moving' for moving question on qualifier
    And user enters the address '<address>' on qualifier
    And user clicks on continue button after providing address
    And user closes the qualifier
    And user closes the cart page
    Then user verifies retrieved account details on plans page
      |address                              |NMI        |MIRN      |
      |271 Heatherhill Rd FRANKSTON VIC 3199|64075570879|5321574765|

    Examples:
      |folderName                              |customer_type |fuelType |planName       |address                                 |
      |E2E_Reg_MovingAddress_Verified_Account  |RES           |BOTH     |Total Plan Plus|271 Heatherhill Road, FRANKSTON VIC 3199|

  Scenario Outline: Verify quote submission for upsell fuel through move house page
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    When user has navigated to move house page
    And user enters '<movingAddress>' in address field and selects any available moving date
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |0058120000   |Postcode           |2018            |dl    |248508352|
    And user provides all other details on qualifier page
      |customerType|movingType|connectionAddress               |propertyType |solarOption|
      |RES         |NA        |5 Wilkies Street, BULLI NSW 2516|Renter       |No         |
    And user selects plans on checkout details page
      |fuelType |planName       |
      |GAS      |Total Plan Plus|
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus| firstName| lastName|idType        |
      |RES         |RES        |Existing      | test     |test     |Driver License|
    And user selects mailing address option
      |addressType       |otherAddress                              |
      |Connection Address|                                          |
    And user selects answer for property renovation question for '<state>'
    And user chooses "<optDisconnection>" for disconnection
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices|GaslifeSupportDevices|
      |Yes              |GAS     |                     |Gas Other            |
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |SWSR1-GN|5240924834|N                             |N                             |Y                      |OTHER                   |EMAIL        |

    Examples:
      |folderName           |fuelType|state|optDisconnection|movingAddress                   |
      |E2E_Upsell_MoveHouse |GAS     |NSW  |Yes             |5 Wilkies Street, BULLI NSW 2516|





