@E2E @newconnection
Feature:E2E scenario for new connection

  @deviceCheck @smoke
  Scenario Outline: Submit a quote for electricity new connection for residential customer
    Given user has opened the new connection website link in a browser and creates '<folderName>' to save evidences
    When user provides connection details
      | fuelType   | customerType | premiseType | state    | postcode |
      | <fuelType> | RES          | Single      | Victoria | 3008     |
    And user provides property details for electricity connection
      | customerType | optionForPoleInstallation | optionForOffPeakLoad |state |
      | BUS          | No                        | No                   |VIC   |
    And user provides property contacts
      | idType           | state |
      | Driver's Licence | VIC   |
    And user submit the request
    And user clicks on proceed to quote
    And user validates details on checkout details page
      | sourceSystem   | journey   | fuelType   |
      | <sourceSystem> | <journey> | <fuelType> |
    And user selects plans on checkout details page
      | fuelType   | planName   |
      | <fuelType> | Total Plan |
    And user provides dob and id details
      | customerStatus | idType   | medicareType |
      | New            | Medicare | green        |
    And user selects mailing address option
      | addressType   | otherAddress                           |
      | Other Address | 42 Brownlow Drive, POINT COOK VIC 3030 |
    And user selects "Post" billing preference option
    And user sends welcome pack through 'Email'
    And user opts for special offer
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |carbonNeutral|
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |N            |
    And user provides life support details on review page
      | lifeSupportOption | fuelType   | EleclifeSupportDevices |
      | Yes               | <fuelType> | Ele Other              |
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |

    Examples:
      | folderName          | fuelType | sourceSystem   | journey     | AAH | DD | customerType | newOrExisting |
      | E2E_New_Resi_NC_ELE | ELE      | New Connection | Plan Switch | NO  | No | RES          | New           |

  Scenario Outline: Submit a quote for gas new connection for residential customer
    Given user has opened the new connection website link in a browser and creates '<folderName>' to save evidences
    When user provides connection details
      | fuelType   | customerType | premiseType | state    | postcode | connectionType     |
      | <fuelType> | RES          | Single      | Victoria | 3008     | Meter Installation |
    And user provides property details for gas connection
      | optionForServiceLineInstallation | optionForSiteClearance | optionForSiteMarking |
      | Yes                              | Yes                    | Yes                  |
    And user selects appliances
    And user provides property contacts
      | fuelType   | idType           | state |
      | <fuelType> | Driver's Licence | VIC   |
    And user submit the request
    And user clicks on proceed to quote
    And user validates details on checkout details page
      | sourceSystem   | journey   | fuelType   |
      | <sourceSystem> | <journey> | <fuelType> |
    And user selects plans on checkout details page
      | fuelType   | planName   |
      | <fuelType> | Total Plan |
    And user provides dob and id details
      | customerStatus | idType   | medicareType |
      | New            | Medicare | yellow       |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user selects "Email" billing preference option
    And user sends welcome pack through 'Post'
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |carbonNeutral|
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |N            |
    And user provides life support details on review page
      | lifeSupportOption | fuelType   | GaslifeSupportDevices |
      | No                | <fuelType> | Gas Other             |
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |

    Examples:
      | folderName          | fuelType | sourceSystem   | journey     | AAH | DD | customerType | newOrExisting |
      | E2E_New_Resi_NC_GAS | GAS      | New Connection | Plan Switch | No  | No | RES          | New           |

  Scenario Outline: Submit a quote for electricity new connection for business customer
    Given user has opened the new connection website link in a browser and creates '<folderName>' to save evidences
    When user provides connection details
      | fuelType   | customerType | premiseType | state    | postcode |
      | <fuelType> | BUS          | Single      | Victoria | 3008     |
    And user provides property details for electricity connection
      | customerType | optionForPoleInstallation | optionForOffPeakLoad | optionForAMPS |state |
      | BUS          | No                        | No                   | Below         |VIC   |
    And user provides property contacts
      | idType           | state |
      | Driver's Licence | VIC   |
    And user submit the request
    And user clicks on proceed to quote
    And user validates details on checkout details page
      | sourceSystem   | journey   | fuelType   |
      | <sourceSystem> | <journey> | <fuelType> |
    And user selects plans on checkout details page
      | fuelType   | planName              |
      | <fuelType> | Total Plan - Business |
    And user provides dob and id details
      | customerStatus | idType   |
      | New            | Passport |
    And user provides business details
    And user selects mailing address option
      | addressType   | otherAddress                           |
      | Other Address | 320 Crown Street, SURRY HILLS NSW 2010 |
    And user selects "Post" billing preference option
    And user sends welcome pack through 'Email'
    And user opts for special offer
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user provides life support details on review page
      | lifeSupportOption | fuelType   | EleclifeSupportDevices                   |
      | Yes               | <fuelType> | Intermittent Peritoneal Dialysis Machine |
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    Examples:
      | folderName         | fuelType | sourceSystem   | journey     | AAH | DD | customerType | newOrExisting |
      | E2E_New_BUS_NC_ELE | ELE      | New Connection | Plan Switch | No  | No | BUS          | New           |

#  With Electricity Sign Up
#  If users pricing zone is Jemena or United Energy and customer has eTariffModifier of "EXTRA_APPLIANCES" then block
#  If users pricing zone is CitiPower or Power Corp and customer has offpeak loads then block

  Scenario Outline: Verify an error message is displayed for pricing zone Jemena or United energy when off peak load selected
    Given user has opened the new connection website link in a browser and creates '<folderName>' to save evidences
    When user provides connection details
      | fuelType   | customerType | premiseType | state    | postcode |
      | <fuelType> | RES          | Single      | Victoria | 3019     |
    And user provides property details for electricity connection
      | customerType | optionForPoleInstallation | optionForOffPeakLoad |state |
      | RES          | No                        | Yes                  |VIC   |
    And user provides property contacts
      | idType           | state |
      | Driver's Licence | VIC   |
    And user submit the request
    And user clicks on proceed to quote
    Then Error modal is displayed for "UNSUPPORTED_METER_TYPE"
    When user clicks on "go to plans" button
    Then user lands on "plans" page

    Examples:
      | folderName                                   | fuelType |
      | E2E_New_Resi_NC_Error_Unsupported_Meter_Type | ELE      |

#    When new connection and no plans existing for customers connection address then show message
  Scenario Outline: Verify an error message is displayed for an address where we don't provide energy
    Given user has opened the new connection website link in a browser and creates '<folderName>' to save evidences
    When user provides connection details
      | fuelType   | customerType | premiseType | state    | postcode |
      | <fuelType> | RES          | Single      | Victoria | 3100     |
    And user provides property details for electricity connection
      | customerType | optionForPoleInstallation | optionForOffPeakLoad |state |
      | RES          | No                        | Yes                  |VIC   |
    And user provides property contacts
      | idType           | state |
      | Driver's Licence | VIC   |
    And user submit the request
    And user clicks on proceed to quote
    Then Error modal is displayed for "ENERGY_NOT_SERVICED"
    When user clicks on "go to plans" button
    Then user lands on "plans" page

    Examples:
      | folderName                              | fuelType |
      | E2E_New_Resi_NC_Error_Energy_Not_Supply | ELE      |

  Scenario Outline: Submit a quote for electricity new connection for <state> distributor <distributor> residential customer
    Given user has opened the new connection website link in a browser and creates '<folderName>' to save evidences
    When user provides connection details
      | fuelType   | customerType  | premiseType | state           | postcode |
      | <fuelType> | <customerType>| Single      | New South Wales | 2000     |
    And user provides distributor details for electricity connection
      | distributor  |state   |
      | <distributor>|<state> |
    And user provides property details for electricity connection
      | customerType  | optionForPoleInstallation | optionForOffPeakLoad |optionForAMPS |
      | <customerType>| No                        | No                   |Below         |
    And user provides property supply type and phase for electricity connection
      | supplyType  |supplyPhases  |meterPhases  |ctDetails  |state   |
      | <supplyType>|<supplyPhases>|<meterPhases>|<ctDetails>|<state> |
    And user select applicant type and provides applicant and electrician details
      | applicantType   | state  |
      | <applicantType> | <state>|
    And user provides Level2 Accredited Service Provider details
      | applicantType   | state  |
      | <applicantType> | <state>|
    And user provides account setup and mailing details
      | idType           | state  |
      | Driver's Licence | <state>|
    And user submit the request
    And user clicks on proceed to quote
    And user validates details on checkout details page
      | sourceSystem   | journey   | fuelType   |
      | <sourceSystem> | <journey> | <fuelType> |
    And user selects plans on checkout details page
      | fuelType   | planName   |
      | <fuelType> | Total Plan |
    And user provides dob and id details
      | customerStatus | idType   | medicareType |
      | New            | Medicare | green        |
    And user selects mailing address option
      | addressType   | otherAddress                           |
      | Other Address | 42 Brownlow Drive, POINT COOK VIC 3030 |
    And user selects "Post" billing preference option
    And user sends welcome pack through 'Email'
    And user opts for special offer
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |carbonNeutral|
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |N            |
    And user provides life support details on review page
      | lifeSupportOption | fuelType   | EleclifeSupportDevices |
      | Yes               | <fuelType> | Ele Other              |
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |

    Examples:
      | folderName                        | fuelType | sourceSystem   | journey     | AAH | DD | customerType | newOrExisting |distributor|state|supplyType|supplyPhases|meterPhases|ctDetails|applicantType|
      | E2E_New_Resi_NC_NSW_Ausgrid_ELE   | ELE      | New Connection | Plan Switch | NO  | No | RES          | New           |  Ausgrid  | NSW |Overhead  |One         |One        |Yes      |Electrician  |
      | E2E_New_Resi_NC_NSW_Essential_ELE | ELE      | New Connection | Plan Switch | NO  | No | RES          | New           |  Essential| NSW |Underground|Two        |Two        |No      |Builder  |
#      can Commented below to reduce the regression test execution time
      | E2E_New_Resi_NC_NSW_Endeavour_ELE | ELE      | New Connection | Plan Switch | NO  | No | RES          | New           |  Endeavour| NSW |Overhead_Underground|Three|Three   |Yes      |EndUser  |
      | E2E_New_Resi_NC_NSW_Unknown_ELE   | ELE      | New Connection | Plan Switch | NO  | No | RES          | New           |  Unknown  | NSW |Overhead   |One        |Two        |No      |Other  |


  Scenario Outline: Submit a quote for electricity new connection for <state> distributor <distributor> business customer
    Given user has opened the new connection website link in a browser and creates '<folderName>' to save evidences
    When user provides connection details
      | fuelType   | customerType  | premiseType | state           | postcode |
      | <fuelType> | <customerType>| Single      | New South Wales | 2000     |
    And user provides distributor details for electricity connection
      | distributor  |state   |
      | <distributor>|<state> |
    And user provides property details for electricity connection
      | customerType  | optionForPoleInstallation | optionForOffPeakLoad |optionForAMPS |
      | <customerType>| No                        | No                   |Below         |
    And user provides property supply type and phase for electricity connection
      | supplyType  |supplyPhases  |meterPhases  |ctDetails  |state   |
      | <supplyType>|<supplyPhases>|<meterPhases>|<ctDetails>|<state> |
    And user select applicant type and provides applicant and electrician details
      | applicantType   | state  |customerType|
      | <applicantType> | <state>|BUS         |
    And user provides Level2 Accredited Service Provider details
      | applicantType   | state  |customerType|
      | <applicantType> | <state>|BUS         |
    And user provides account setup and mailing details
      | idType           | state  |
      | Driver's Licence | <state>|
    And user submit the request
    And user clicks on proceed to quote
    And user validates details on checkout details page
      | sourceSystem   | journey   | fuelType   |
      | <sourceSystem> | <journey> | <fuelType> |
    And user selects plans on checkout details page
      | fuelType   | planName              |
      | <fuelType> | Total Plan - Business |
    And user provides dob and id details
      | customerStatus | idType   |
      | New            | Passport |
    And user provides business details
    And user selects mailing address option
      | addressType   | otherAddress                           |
      | Other Address | 320 Crown Street, SURRY HILLS NSW 2010 |
    And user selects "Post" billing preference option
    And user sends welcome pack through 'Email'
    And user opts for special offer
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |carbonNeutral|
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |N            |
    And user provides life support details on review page
      | lifeSupportOption | fuelType   | EleclifeSupportDevices |
      | Yes               | <fuelType> | Ele Other              |
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |

    Examples:
      | folderName                        | fuelType | sourceSystem   | journey     | AAH | DD | customerType | newOrExisting |distributor|state|supplyType|supplyPhases|meterPhases|ctDetails|applicantType|
      | E2E_New_Bus_NC_NSW_Ausgrid_ELE   | ELE      | New Connection | Plan Switch | NO  | No | BUS          | New           |  Ausgrid  | NSW |Overhead  |One         |One        |Yes      |Electrician  |
      | E2E_New_Bus_NC_NSW_Unknown_ELE   | ELE      | New Connection | Plan Switch | NO  | No | BUS          | New           |  Unknown  | NSW |Overhead   |One        |Two        |No      |Other  |
#      Can Commented below to reduce the regression test execution time
      | E2E_New_Bus_NC_NSW_Essential_ELE | ELE      | New Connection | Plan Switch | NO  | No | BUS          | New           |  Essential| NSW |Underground|Two        |Two        |No      |Builder  |
      | E2E_New_Bus_NC_NSW_Endeavour_ELE | ELE      | New Connection | Plan Switch | NO  | No | BUS          | New           |  Endeavour| NSW |Overhead_Underground|Three|Three   |Yes      |EndUser  |



  Scenario Outline: Submit a quote for electricity new connection for ACT residential customer
    Given user has opened the new connection website link in a browser and creates '<folderName>' to save evidences
    When user provides connection details
      | fuelType   | customerType  | premiseType | state                        | postcode |
      | <fuelType> | <customerType>| Single      | Australian Capital Territory | 2600     |
    And user provides property details for electricity connection
      | customerType  | optionForPoleInstallation | optionForOffPeakLoad |optionForAMPS |
      | <customerType>| No                        | No                   |Below         |
    And user provides property supply type and phase for electricity connection
      | supplyType  |supplyPhases  |meterPhases  |ctDetails  |state   |
      | <supplyType>|<supplyPhases>|<meterPhases>|<ctDetails>|<state> |
    And user select applicant type and provides applicant and electrician details
      | applicantType   | state  |
      | <applicantType> | <state>|
    And user provides account setup and mailing details
      | idType           | state  |
      | Driver's Licence | <state>|
    And user submit the request
    And user clicks on proceed to quote
    And user validates details on checkout details page
      | sourceSystem   | journey   | fuelType   |
      | <sourceSystem> | <journey> | <fuelType> |
    And user selects plans on checkout details page
      | fuelType   | planName   |
      | <fuelType> | Total Plan |
    And user provides dob and id details
      | customerStatus | idType   | medicareType |
      | New            | Medicare | green        |
    And user selects mailing address option
      | addressType   | otherAddress                         |
      | Other Address | 21 Tarrant Crescent, DUNLOP ACT 2615 |
    And user selects "Post" billing preference option
    And user sends welcome pack through 'Email'
    And user opts for special offer
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |carbonNeutral|
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |N            |
    And user provides life support details on review page
      | lifeSupportOption | fuelType   | EleclifeSupportDevices |
      | Yes               | <fuelType> | Ele Other              |
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |

    Examples:
      | folderName                | fuelType | sourceSystem   | journey     | AAH | DD | customerType | newOrExisting |state|supplyType|supplyPhases|meterPhases|ctDetails|applicantType|
      | E2E_New_Resi_NC_ACT_ELE   | ELE      | New Connection | Plan Switch | NO  | No | RES          | New           | ACT |Overhead  |One         |One        |Yes      |Electrician  |


  Scenario Outline: Submit a quote for electricity new connection for SA residential customer
    Given user has opened the new connection website link in a browser and creates '<folderName>' to save evidences
    When user provides connection details
      | fuelType   | customerType  | premiseType | state           | postcode |
      | <fuelType> | <customerType>| Single      | South Australia | 5000     |
    And user provides property details for electricity connection
      | customerType  | optionForPoleInstallation | optionForOffPeakLoad |optionForAMPS |optionForPaperwork |state  |
      | <customerType>| No                        | No                   |Below         |Yes                |<state>|
    And user provides property supply type and phase for electricity connection
      | supplyType  |supplyPhases  |meterPhases  |ctDetails  |state   |
      | <supplyType>|<supplyPhases>|<meterPhases>|<ctDetails>|<state> |
    And user select applicant type and provides applicant and electrician details
      | applicantType   | state  |
      | <applicantType> | <state>|
    And user provides account setup and mailing details
      | idType           | state  |
      | Driver's Licence | <state>|
    And user submit the request
    And user clicks on proceed to quote
    And user validates details on checkout details page
      | sourceSystem   | journey   | fuelType   |
      | <sourceSystem> | <journey> | <fuelType> |
    And user selects plans on checkout details page
      | fuelType   | planName   |
      | <fuelType> | Total Plan |
    And user provides dob and id details
      | customerStatus | idType   | medicareType |
      | New            | Medicare | green        |
    And user selects mailing address option
      | addressType   | otherAddress                         |
      | Other Address | 21 Tarrant Crescent, DUNLOP ACT 2615 |
    And user selects "Post" billing preference option
    And user sends welcome pack through 'Email'
    And user opts for special offer
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |carbonNeutral|
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |N            |
    And user provides life support details on review page
      | lifeSupportOption | fuelType   | EleclifeSupportDevices |
      | Yes               | <fuelType> | Ele Other              |
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |

    Examples:
      | folderName                | fuelType | sourceSystem   | journey     | AAH | DD | customerType | newOrExisting |state|supplyType|supplyPhases|meterPhases|ctDetails|applicantType|
      | E2E_New_Resi_NC_SA_ELE   | ELE      | New Connection | Plan Switch | NO  | No | RES          | New           | SA |Underground  |One         |One        |Yes      |Electrician  |


  Scenario Outline: Submit a quote for electricity new connection for QLD residential customer
    Given user has opened the new connection website link in a browser and creates '<folderName>' to save evidences
    When user provides connection details
      | fuelType   | customerType  | premiseType | state      | postcode |
      | <fuelType> | <customerType>| Single      | Queensland | 4000     |
    And user provides property details for electricity connection
      | customerType  | optionForPoleInstallation | optionForOffPeakLoad |optionForAMPS |optionForPaperwork |state  |
      | <customerType>| No                        | No                   |Below         |Yes                 |<state>|
    And user provides property supply type and phase for electricity connection
      | supplyType  |supplyPhases  |meterPhases  |ctDetails  |state   |
      | <supplyType>|<supplyPhases>|<meterPhases>|<ctDetails>|<state> |
    And user select applicant type and provides applicant and electrician details
      | applicantType   | state  |
      | <applicantType> | <state>|
    And user provides account setup and mailing details
      | idType           | state  |
      | Driver's Licence | <state>|
    And user submit the request
    And user clicks on proceed to quote
    And user validates details on checkout details page
      | sourceSystem   | journey   | fuelType   |
      | <sourceSystem> | <journey> | <fuelType> |
    And user selects plans on checkout details page
      | fuelType   | planName   |
      | <fuelType> | Total Plan |
    And user provides dob and id details
      | customerStatus | idType   | medicareType |
      | New            | Medicare | green        |
    And user selects mailing address option
      | addressType   | otherAddress                         |
      | Other Address | 21 Tarrant Crescent, DUNLOP ACT 2615 |
    And user selects "Post" billing preference option
    And user sends welcome pack through 'Email'
    And user opts for special offer
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |carbonNeutral|
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |N            |
    And user provides life support details on review page
      | lifeSupportOption | fuelType   | EleclifeSupportDevices |
      | Yes               | <fuelType> | Ele Other              |
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |

    Examples:
      | folderName                | fuelType | sourceSystem   | journey     | AAH | DD | customerType | newOrExisting |state|supplyType|supplyPhases|meterPhases|ctDetails|applicantType|
      | E2E_New_Resi_NC_QLD_ELE   | ELE      | New Connection | Plan Switch | NO  | No | RES          | New           | QLD |Overhead  |One         |One        |Yes      |Electrician  |
