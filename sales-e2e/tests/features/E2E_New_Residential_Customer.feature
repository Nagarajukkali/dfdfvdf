Feature:E2E scenario for new residential moving and non moving customer

Scenario Outline: Submit a quote for new residential moving and non moving customer
Given user have opened the website link in a browser
And user has navigated to 'Residential' plans page
When user selects '<planName>' from 'Residential' plans page
And user moves on to fill the qualifier
And user provides all details on qualifier page for 'New' customer
| connectionAddress               | movingType|propertyType|solarOption|
| 5 Wilkies Street, BULLI NSW 2516|Moving     |Renter      |No         |
And user provides all details for 'New' 'Residential' customer on checkout details page
And user provides all details for existing customer on checkout details page
|customerType|firstName|lastName|identificationType|gasAccess|
| Residential|test     |test    |Driver Licence    |No       |
And user provides life support details
|lifeSupportOption|
|No               |

Examples:
| customer | customer_type | accountNumber |accountIdentificationType| postcode | idType | idNumber  |planName|
| Existing | Residential   | 2702159138    |null              | 2516     | dob    | 12101958  |Total   |
