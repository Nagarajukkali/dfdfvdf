@E2E
Feature: This feature is to test the verify account scenarios for existing residential customers

  Scenario Outline: Non moving residential customer
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customer_type>' plans page
    And User have selected fuel as "<fuelType>"
    When user clicks on the verify modal window on '<customer_type>' page
    And user verifies the account through verify account journey for residential customer
      |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |postcode |idType |idNumber |
      |RES          |verify account |8373520946       |2816302453       |3153     |dob    |01011980 |
    And user selects '<planName>'
    And user moves on to fill the qualifier
    And user provides all other details on qualifier page for Existing customer
      |customerType|movingType |propertyType |solarOption  |
      |RES         |Non-Moving |Owner        |No           |
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus|firstName|lastName|idType        |
      |RES         |RES        |Existing      |test     |test    |Driver License|
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                    |GaslifeSupportDevices  |
      |Yes              |BOTH    |Intermittent Peritoneal Dialysis Machine  |Gas Other              |
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting using '<username>' and '<password>'
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |PS       |SWSRH-EV|6305325960|N                             |N                             |Y                      |LSIPDM                  |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |PS       |SWSRH-GV|5310602455|N                             |N                             |Y                      |OTHER                   |EMAIL        |

    Examples:
      |folderName                               |customer_type |fuelType |planName       |username|password                                    |
      |E2E_VerifyAccount_Residential_NonMoving  |RES           |BOTH     |Total Plan Plus|abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|

  Scenario Outline: Moving residential customer
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customer_type>' plans page
    And User have selected fuel as "<fuelType>"
    When user clicks on the verify modal window on '<customer_type>' page
    And user verifies the account through verify account journey for residential customer
      |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |postcode |idType |idNumber |
      |RES          |verify account |7810021000       |3720611000       |3672     |dob    |01011980 |
    And user selects '<planName>'
    And user moves on to fill the qualifier
    And user provides all other details on qualifier page for Existing customer
      |customerType|movingType |connectionAddress                          |propertyType |solarOption  |
      |RES         |Moving     |271 Heatherhill Road, FRANKSTON VIC 3199   |Renter       |No           |
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus|firstName|lastName|idType    |
      |RES         |RES        |Existing      |test     |test    |Passport  |
    And user selects answer for property renovation question for '<state>'
    And user chooses "<optDisconnection>" for disconnection
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                        |GaslifeSupportDevices        |
      |Yes              |BOTH    |Chronic Positive Airways Pressure Respirator  |Medically Required Hot Water |
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting using '<username>' and '<password>'
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |RCPP-EV |6407557087|N                             |N                             |Y                      |LSCPAPR                 |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|RESIDENTIAL |ENE      |RCPP-GV |5321574765|N                             |N                             |Y                      |GLSMRHW                 |EMAIL        |

    Examples:
      |folderName                               |customer_type |fuelType |planName    |optDisconnection |state  |username|password                                    |
      |E2E_VerifyAccount_Residential_Moving     |RES           |BOTH     |No Frills   |No               |VIC    |abhar   |U2FsdGVkX1/CgD/zs39CmMNBuuIWC13OQnlQ58nm3+Y=|
