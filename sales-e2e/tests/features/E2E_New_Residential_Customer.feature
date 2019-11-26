Feature:E2E scenario for new residential moving and non moving customer
@test
Scenario Outline: Submit a quote for new residential moving and non moving customer
Given user has opened the website link in a browser and creates '<folderName>' to save evidences
And user has navigated to 'RES' plans page
When user selects '<planName>' from 'RES' plans page
And user moves on to fill the qualifier
And user provides all details on qualifier page for 'New' customer
| connectionAddress               | movingType|propertyType|solarOption|
| 5 Wilkies Street, BULLI NSW 2516|Moving     |Renter      |No         |
And user provides all details for 'New' 'Residential' customer on checkout details page

Examples:
|planName|folderName            |
|Total Plan  |E2E_New_Resi_NonMoving|
