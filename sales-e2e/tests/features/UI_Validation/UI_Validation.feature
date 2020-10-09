@UIValidation
Feature: This feature validates UI of the quote tool application

  Scenario Outline: Validating <customer_type> plans page
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    When user has navigated to '<customer_type>' plans page
    And user enters '2000' in 'POSTCODE' field
    Then user validates '<customer_type>' plans page's UI

    Examples:
      |folderName         |customer_type  |
      |UI_RESI_PlansPage  |RES            |
      |UI_BSME_PlansPage  |BUS            |

  Scenario Outline: Validating verify account modal on <customer_type> plans page
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    When user has navigated to '<customer_type>' plans page
    And user enters '3000' in 'POSTCODE' field
    Then user validates verify account journey's UI for '<customer_type>' plans page

    Examples:
      |folderName             |customer_type  |
      |UI_RESI_VerifyAccount  |RES            |
      |UI_BSME_VerifyAccount  |BUS            |

  Scenario Outline: Validating verify account modal on campaign page
    Given user has opened the 'offer' link in a browser and creates '<folderName>' to save evidences
    When user provides "3000" and clicks on show me plan link
    Then user validates verify account journey's UI for '<customer_type>' plans page

    Examples:
      |folderName                       |customer_type  |
      |UI_CAMPAIGN_RESI_VerifyAccount   |RES            |

  Scenario Outline: Validating Qualifier UI via <customer_type> plans page for "<customerStatus>" customers
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    When user has navigated to '<customer_type>' plans page
    And user enters '3000' in 'POSTCODE' field
    And user have selected fuel as "BOTH"
    And user selects '<planName>'
    And user moves on to fill the qualifier
    Then user validates qualifier for "<customerStatus>" "<customer_type>" customers

    Examples:
      |folderName                   |customer_type  |planName       |customerStatus |
      |UI_RESI_QUALIFIER_NEW        |RES            |Total Plan     |new            |
      |UI_BSME_QUALIFIER_NEW        |BUS            |Basic Business |new            |
      |UI_RESI_QUALIFIER_EXISTING   |RES            |Basic Home     |existing       |
      |UI_BSME_QUALIFIER_EXISTING   |BUS            |Total Plan - Business |existing       |

  Scenario Outline: Validating Checkout journey's UI via <customer_type> plans page
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    When user has navigated to '<customer_type>' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user provides all other details on qualifier page
      |customerType     |connectionAddress   |movingType |propertyType |solarOption  |
      |<customer_type>  |<connectionAddress> |Non-Moving |Renter       |No           |
    And user validates details on checkout details page
      |sourceSystem   |journey      |fuelType   |
      |Quote Tool     |Plan Switch  |BOTH       |
    And user "expand" optional detail sections on checkout details page for '<customer_type>'
      |AAH    |DD   |Concession |
      |Yes    |Yes  |Yes        |
    Then user validates 'checkout details' page UI
    When user provides all details on checkout details page
      |customerType     |journey          |customerStatus   |firstName|lastName |idType         |businessType |
      |<customer_type>  |<customer_type>  |<customerStatus> |test     |test     |Driver License |ABN          |
    And user "collapse" optional detail sections on checkout details page for '<customer_type>'
      |AAH    |DD   |Concession |
      |Yes    |Yes  |Yes        |
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices|GaslifeSupportDevices  |
      |Yes              |BOTH    |Ele Other             |Gas Other              |
    Then user validates 'checkout review' page UI
    And user submits the quote
    Then user lands on checkout complete page

    Examples:
      |folderName         |customer_type  |customerStatus |planName       |connectionAddress                            |
      |UI_RESI_CHECKOUT   |RES            |New            |Total Plan     |42 Brownlow Drive, POINT COOK VIC 3030       |
      |UI_BSME_CHECKOUT   |BUS            |New            |Basic Business |36 Gregory Street West, WENDOUREE VIC 3355   |
