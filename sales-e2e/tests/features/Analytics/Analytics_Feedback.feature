@feedbackanalytics @21.10.4.analytics
Feature: Scenarios to cover the data layer updates and analytics events trigger for feedback analytics

  Scenario Outline: Validate the product review analytics on checkout complete page
    Given user has opened the website link in a browser and creates 'E2E_Analytics_PRODUCT_REVIEW' to save evidences
    And user has navigated to 'RES' plans page
    And user initiates the call to capture analytics events
    When user selects 'Total Plan'
    Then user validates the 'plans_page' 'Total_Select_Plan_Button' event
    When user closes the cart page
    Then user validates the 'cart_page' 'close_button' event
    When user selects 'No Frills'
    Then user validates the 'plans_page' 'NoFrills_Select_Plan_Button' event
    When user moves on to fill the qualifier
    #Then user validates the 'cart_page' 'continue_button' event
    And user selects 'New' on qualifier
    And user provides all other details on qualifier page
    |customerType|connectionAddress                | movingType|propertyType|
    |RES         |3 River Drive, ATHELSTONE SA 5076|Non-Moving |Renter      |
    And user validates details on checkout details page
      | sourceSystem   | journey   | fuelType   |
      | Quote Tool | Plan Switch| BOTH |
    And user captures the browser url and provides the url for "?feedbackType=PRODUCT_REVIEW&"
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType   |
      | RES          | RES     | New            | test      | test     | Passport |
    And user selects mailing address option
      | addressType   | otherAddress                           |
      | Other Address | 42 Brownlow Drive, POINT COOK VIC 3030 |
    And user opts for AAH and DD
      | optAAHOption | optDDOption | directDebitType |
      | No           | Yes         | Bank            |
    And user selects "Email" billing preference option
    And user sends welcome pack through 'Email'
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices                              |
      | No               |      |               |  |
    And user selects carbon neutral option
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user verify the analytics for feedback section for "PRODUCT_REVIEW"
    And user closes the spy on datalayer

    Examples:
      | fuelType | sourceSystem | journey     | AAH | DD  | customerType | newOrExisting |
      | BOTH     | Quote Tool   | Plan Switch | No  | Yes | RES          | New           |

  Scenario Outline: Validate the NPS review analytics on checkout complete page
    Given user has opened the website link in a browser and creates 'E2E_Analytics_PRODUCT_REVIEW' to save evidences
    And user has navigated to 'RES' plans page
    And user initiates the call to capture analytics events
    When user selects 'Total Plan'
    Then user validates the 'plans_page' 'Total_Select_Plan_Button' event
    When user closes the cart page
    Then user validates the 'cart_page' 'close_button' event
    When user selects 'No Frills'
    Then user validates the 'plans_page' 'NoFrills_Select_Plan_Button' event
    When user moves on to fill the qualifier
    #Then user validates the 'cart_page' 'continue_button' event
    And user selects 'New' on qualifier
    And user provides all other details on qualifier page
      |customerType|connectionAddress                | movingType|propertyType|
      |RES         |3 River Drive, ATHELSTONE SA 5076|Non-Moving |Renter      |
    And user validates details on checkout details page
      | sourceSystem   | journey   | fuelType   |
      | Quote Tool | Plan Switch| BOTH |
    And user captures the browser url and provides the url for "?feedbackType=NPS&"
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType   |
      | RES          | RES     | New            | test      | test     | Passport |
    And user selects mailing address option
      | addressType   | otherAddress                           |
      | Other Address | 42 Brownlow Drive, POINT COOK VIC 3030 |
    And user opts for AAH and DD
      | optAAHOption | optDDOption | directDebitType |
      | No           | Yes         | Bank            |
    And user selects "Email" billing preference option
    And user sends welcome pack through 'Email'
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices                              |
      | No               |      |             |  |
    And user selects carbon neutral option
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user verify the analytics for feedback section for "NPS_FEEDBACK"
    And user closes the spy on datalayer

    Examples:
      | fuelType | sourceSystem | journey     | AAH | DD  | customerType | newOrExisting |
      | BOTH     | Quote Tool   | Plan Switch | No  | Yes | RES          | New           |

  Scenario Outline: Validate the google review analytics on checkout complete page
    Given user has opened the website link in a browser and creates 'E2E_Analytics_PRODUCT_REVIEW' to save evidences
    And user has navigated to 'RES' plans page
    And user initiates the call to capture analytics events
    When user selects 'Total Plan'
    Then user validates the 'plans_page' 'Total_Select_Plan_Button' event
    When user closes the cart page
    Then user validates the 'cart_page' 'close_button' event
    When user selects 'No Frills'
    Then user validates the 'plans_page' 'NoFrills_Select_Plan_Button' event
    When user moves on to fill the qualifier
    #Then user validates the 'cart_page' 'continue_button' event
    And user selects 'New' on qualifier
    And user provides all other details on qualifier page
      |customerType|connectionAddress                | movingType|propertyType|
      |RES         |3 River Drive, ATHELSTONE SA 5076|Non-Moving |Renter      |
    And user validates details on checkout details page
      | sourceSystem   | journey   | fuelType   |
      | Quote Tool | Plan Switch| BOTH |
    And user captures the browser url and provides the url for "?feedbackType=GOOGLE_REVIEWS&"
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType   |
      | RES          | RES     | New            | test      | test     | Passport |
    And user selects mailing address option
      | addressType   | otherAddress                           |
      | Other Address | 42 Brownlow Drive, POINT COOK VIC 3030 |
    And user opts for AAH and DD
      | optAAHOption | optDDOption | directDebitType |
      | No           | Yes         | Bank            |
    And user selects "Email" billing preference option
    And user sends welcome pack through 'Email'
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices                              |
      | No               |      |              |  |
    And user selects carbon neutral option
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user verify the analytics for feedback section for "GOOGLE_REVIEW"
    And user closes the spy on datalayer

    Examples:
      | fuelType | sourceSystem | journey     | AAH | DD  | customerType | newOrExisting |
      | BOTH     | Quote Tool   | Plan Switch | No  | Yes | RES          | New           |

  Scenario Outline: Validate the trust pilot review analytics on checkout complete page
    Given user has opened the website link in a browser and creates 'E2E_Analytics_TrustPilot_REVIEW' to save evidences
    And user has navigated to 'RES' plans page
    And user initiates the call to capture analytics events
    When user selects 'Total Plan'
    Then user validates the 'plans_page' 'Total_Select_Plan_Button' event
    When user closes the cart page
    Then user validates the 'cart_page' 'close_button' event
    When user selects 'No Frills'
    Then user validates the 'plans_page' 'NoFrills_Select_Plan_Button' event
    When user moves on to fill the qualifier
    #Then user validates the 'cart_page' 'continue_button' event
    And user selects 'New' on qualifier
    And user provides all other details on qualifier page
      |customerType|connectionAddress                | movingType|propertyType|
      |RES         |3 River Drive, ATHELSTONE SA 5076|Non-Moving |Renter      |
    And user validates details on checkout details page
      | sourceSystem   | journey   | fuelType   |
      | Quote Tool | Plan Switch| BOTH |
    And user captures the browser url and provides the url for "?feedbackType=TRUSTPILOT&"
    And user provides all details on checkout details page
      | customerType | journey | customerStatus | firstName | lastName | idType   |
      | RES          | RES     | New            | test      | test     | Passport |
    And user selects mailing address option
      | addressType   | otherAddress                           |
      | Other Address | 42 Brownlow Drive, POINT COOK VIC 3030 |
    And user opts for AAH and DD
      | optAAHOption | optDDOption | directDebitType |
      | No           | Yes         | Bank            |
    And user selects "Email" billing preference option
    And user sends welcome pack through 'Email'
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices                              |
      | No               |      |               |  |
    And user selects carbon neutral option
    And user verifies selected plan details for '<fuelType>'
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user verify the analytics for feedback section for "TRUSTPILOT"
    And user closes the spy on datalayer

    Examples:
      | fuelType | sourceSystem | journey     | AAH | DD  | customerType | newOrExisting |
      | BOTH     | Quote Tool   | Plan Switch | No  | Yes | RES          | New           |
