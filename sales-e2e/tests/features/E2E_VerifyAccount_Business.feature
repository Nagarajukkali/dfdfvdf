@E2E
Feature: This feature is to test the verify account scenarios for existing business customers

  Scenario Outline: Submit a quote for existing non moving business customer with life support for both accounts through verify account
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customer_type>' plans page
    Then user validates details on plans page for '<customer_type>'
    And user have selected fuel as "<fuelType>"
    When user clicks on the verify modal window on '<customer_type>' page
    And user verifies the account through verify account journey for business customer
      |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |ABNOrACN     |idType |idNumber  |
      |BUS          |verify account |2870412120       |3231348465       |78538656400  |dob    |01011980  |
    And user selects '<planName>'
    And user moves on to fill the qualifier
    And user provides all other details on qualifier page for Existing customer
      |customerType|movingType |propertyType |solarOption  |
      |BUS         |Non-Moving |Owner        |No           |
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus|firstName|lastName|businessType |
      |BUS         |BUS        |Existing      |test     |test    |ABN          |
    And user validates details on checkout details page
      |sourceSystem   |journey    |fuelType   |
      |<sourceSystem> |<journey>  |<fuelType> |
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    Then Life support section is displayed on Review page as per selected "<fuelType>" and verified "<accountType>"
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    And user lands on checkout complete page
    And user validates details on checkout complete page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|BUSINESS    |PS       |SWSRB-EV|6305402728|N                             |N                             |Y                      |LSVFLS                  |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|BUSINESS    |PS       |SWSRB-GV|5323580662|N                             |N                             |Y                      |OTHER                   |EMAIL        |

    Examples:
      |folderName                               |customer_type |fuelType |planName                |accountType|sourceSystem   |journey      |AAH  |DD   |customerType |newOrExisting  |
      |E2E_VerifyAccount_Business_NonMoving     |BUS           |BOTH     |Total Plan Plus Business|BOTH       |Quote Tool     |Plan Switch  |No   |No   |BUS          |Existing       |


  Scenario Outline: Submit a quote for existing moving business customer through verify account
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customer_type>' plans page
    Then user validates details on plans page for '<customer_type>'
    And user have selected fuel as "<fuelType>"
    When user clicks on the verify modal window on '<customer_type>' page
    And user verifies the account through verify account journey for business customer
      |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |ABNOrACN   |idType |idNumber  |
      |BUS          |verify account |5802060000       |7745301000       |30179084300|dob    |01011980  |
    And user selects '<planName>'
    And user moves on to fill the qualifier
    And user provides all other details on qualifier page for Existing customer
      |customerType|movingType |connectionAddress                          |propertyType |solarOption  |
      |BUS         |Moving     |36 Gregory Street West, WENDOUREE VIC 3355 |Renter       |No           |
    And user provides all details on checkout details page
      |customerType|journey    |customerStatus|firstName|lastName|businessType   |
      |BUS         |BUS        |Existing      |test     |test    |ABN            |
    And user validates details on checkout details page
      |sourceSystem   |journey    |fuelType   |
      |<sourceSystem> |<journey>  |<fuelType> |
    And user selects answer for property renovation question for '<state>'
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices                        |GaslifeSupportDevices        |
      |Yes              |BOTH    |Chronic Positive Airways Pressure Respirator  |Medically Required Hot Water |
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      |sourceSystem   |journey    |fuelType   |AAH  |DD   |customerType   |newOrExisting  |
      |<sourceSystem> |<journey>  |<fuelType> |<AAH>|<DD> |<customerType> |<newOrExisting>|
    When user has opened the qt2 Reporting website link in a browser
    And user logs in to qt2 reporting
    And user search quote on the basis of 'Email'
    Then submitted quote is displayed
    And user validates all the details for 'ELE' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|NMI       |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |ELE     |VERBALLYACCEPTED|BUSINESS    |ENE      |TOPB-EV |6203822385|N                             |N                             |Y                      |LSCPAPR                 |EMAIL        |
    And user validates all the details for 'GAS' submitted quote
    And user validates below mandatory fields
      |fuelType|quoteStatus     |customerType|offerType|planCode|MIRN      |renovationsSinceDeenergisation|renovationsInProgressOrPlanned|customerWithLifeSupport|lifeSupportEquipmentType|billRouteType|
      |GAS     |VERBALLYACCEPTED|BUSINESS    |ENE      |TOPB-GV |5330956738|N                             |N                             |Y                      |GLSMRHW                 |EMAIL        |

    Examples:
      |folderName                               |customer_type |fuelType |planName        |state  |sourceSystem   |journey      |AAH  |DD   |customerType |newOrExisting  |
      |E2E_VerifyAccount_Business_Moving        |BUS           |BOTH     |Total Business  |VIC    |Quote Tool     |Move Home    |No   |No   |BUS          |Existing       |
