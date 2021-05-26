@checkoutdetailsanalytics @analytics

Feature: Scenarios to cover the data layer updates and analytics events trigger on checkout details page

  Scenario: Validate Analytics event for contact preference on checkout details page
    Given user has opened the website link in a browser and creates 'E2E_Analytics_Resi_Checkout_Details_Contact_Preference' to save evidences
    And user has navigated to 'RES' plans page
    And user initiates the call to capture analytics events
    When user selects 'Total Plan'
    And user moves on to fill the qualifier
    And user selects 'New' on qualifier
    And user provides all other details on qualifier page
      | customerType | connectionAddress                      | movingType | propertyType |
      | RES          | 42 Brownlow Drive, POINT COOK VIC 3030 | Moving     | Renter       |
    Then user validates details on checkout details page
      | sourceSystem   | journey   | fuelType   | solarSetup |
      | Quote Tool     | Move Home | BOTH       | Yes        |
    And user closes the spy on datalayer
