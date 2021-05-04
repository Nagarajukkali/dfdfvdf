#@E2E
  #Disabling MA tests running from scheduled job due to un stability of MA
  #We will trigger thees tests manually in jenkins once/twice in a day
@myaccount
Feature: This feature is to test the My account scenarios for residential customers

  Scenario Outline: Verify the RESI Electricity Plan switch journey from My Account
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user navigates to my account login page
    When user logs in to my account using '<username>' and '<password>'
    And user clicks on view and change plan accordion for '<fuelType>'
    And user clicks on compare and switch plan button
    And user validates details on checkout details page
      | sourceSystem   | journey   | fuelType   |
      | <sourceSystem> | <journey> | <fuelType> |
    And user selects plans on checkout details page
      | fuelType   | planName        |
      | <fuelType> | Total Plan Plus |
    And user clicks on 'Next' button and navigates to review page
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    Then Life support section is displayed on Review page as per selected "<fuelType>" and verified "<fuelType>"
    When user selects carbon neutral option
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |

    Examples:
      | folderName                       | username        | password                                     | fuelType | sourceSystem | journey     | AAH | DD | customerType | newOrExisting |
      | E2E_MyAccount_Residential_ELE_PS | cntest@test.com | U2FsdGVkX182iIoesxsMa22cXNTbW/HS/QRoz2qSu34= | ELE      | My Account   | Plan switch | No  | No | RES          | Existing      |

  Scenario Outline: Verify the RESI Gas Plan switch journey from My Account
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user navigates to my account login page
    When user logs in to my account using '<username>' and '<password>'
    And user clicks on view and change plan accordion for '<fuelType>'
    And user clicks on compare and switch plan button
    And user validates details on checkout details page
      | sourceSystem   | journey   | fuelType   |
      | <sourceSystem> | <journey> | <fuelType> |
    And user selects plans on checkout details page
      | fuelType   | planName   |
      | <fuelType> | Total Plan |
    And user clicks on 'Next' button and navigates to review page
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    Then Life support section is displayed on Review page as per selected "<fuelType>" and verified "<fuelType>"
    When user selects carbon neutral option
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |

    Examples:
      | folderName                       | username        | password                                     | fuelType | sourceSystem | journey     | AAH | DD | customerType | newOrExisting |
      | E2E_MyAccount_Residential_GAS_PS | cntest@test.com | U2FsdGVkX182iIoesxsMa22cXNTbW/HS/QRoz2qSu34= | GAS      | My Account   | Plan switch | No  | No | RES          | Existing      |

  @deviceCheck
  Scenario Outline: Verify the RESI Move home journey from My Account
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user navigates to my account login page
    When user logs in to my account using '<username>' and '<password>'
    And user clicks on move home link for 'ELE'
    And user enters service address as '<address>'
    And user selects connection date
    And user clicks on lets get moving button
    And user validates details on checkout details page
      | sourceSystem | journey   | fuelType |
      | My Account   | Move Home | BOTH     |
    And user selects plans on checkout details page
      | fuelType | planName   |
      | ELE      | Total Plan |
    And user selects plans on checkout details page
      | fuelType | planName   |
      | GAS      | Total Plan |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user provides identification details
      | customerType | customerStatus | idType         |
      | RES          | Existing       | Driver License |
    And user opts for AAH and DD
      | optAAHOption | optDDOption | directDebitType |
      | No           | Yes         | Bank            |
    And user answers No for home improvements question
    And user chooses "<optDisconnection>" for disconnection
    And user selects final bill option
      | option        | otherAddress                               |
      | Other Address | 271 Heatherhill Road, FRANKSTON  VIC  3199 |
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      | sourceSystem | journey   | fuelType | AAH | DD  | customerType   | newOrExisting   |
      | My Account   | Move Home | BOTH     | No  | Yes | <customerType> | <newOrExisting> |
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices  | GaslifeSupportDevices        |
      | Yes               | BOTH     | Kidney Dialysis Machine | Medically Required Hot Water |
    When user selects carbon neutral option
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      | sourceSystem | journey   | fuelType | AAH | DD  | customerType   | newOrExisting   |
      | My Account   | Move Home | BOTH     | No  | Yes | <customerType> | <newOrExisting> |

    Examples:
      | folderName                         | address                                 | username                | password                                     | optDisconnection | customerType | newOrExisting |
      | E2E_MyAccount_Residential_MoveHome | 9 Rodier Street, BALLARAT EAST VIC 3350 | MissingID_RESI@test.com | U2FsdGVkX19pydLDPzviWcrNZ6PzbXoPRKv4Bjmqyug= | Yes              | RES          | Existing      |

  @deviceCheck
  Scenario Outline: Verify the RESI upsell journey from My Account
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user navigates to my account login page
    When user logs in to my account using '<username>' and '<password>'
    And user clicks on compare plans button
    And user validates details on checkout details page
      | sourceSystem   | journey   | fuelType   |
      | <sourceSystem> | <journey> | <fuelType> |
    And user selects plans on checkout details page
      | fuelType | planName        |
      | GAS      | Total Plan Plus |
    And user selects mailing address option
      | addressType   | otherAddress                           |
      | Other Address | 42 Brownlow Drive, POINT COOK VIC 3030 |
    And user opts for concession card
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user provides life support details on review page
      | lifeSupportOption | fuelType | GaslifeSupportDevices                              |
      | Yes               | GAS      | Medically Required Heating and/or Air Conditioning |
    When user selects carbon neutral option
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |

    Examples:
      | folderName                       | username          | password                                     | fuelType | sourceSystem | journey | AAH | DD | customerType | newOrExisting |
      | E2E_MyAccount_Residential_Upsell | upsell02@test.com | U2FsdGVkX18tkoy+x1GGxXg4gex2qBLzChEHNEvDZyE= | GAS      | My Account   | Upsell  | No  | No | RES          | Existing      |

  Scenario Outline: Verify the RESI Electricity Plan switch journey with current plan from My Account where ID details are missing
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user navigates to my account login page
    When user logs in to my account using '<username>' and '<password>'
    And user clicks on view and change plan accordion for '<fuelType>'
    And user clicks on compare and switch plan button
    And user validates details on checkout details page
      | sourceSystem   | journey   | fuelType   |
      | <sourceSystem> | <journey> | <fuelType> |
    And user selects plans on checkout details page
      | fuelType   | planName   |
      | <fuelType> | Total Plan |
    And user clicks on 'Next' button and navigates to review page
    And user provides missing identification details on review page
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user provides life support details on review page
      | lifeSupportOption | fuelType   | EleclifeSupportDevices      | GaslifeSupportDevices |
      | Yes               | <fuelType> | Ventilator For Life Support |                       |
    And user selects carbon neutral option
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |

    Examples:
      | folderName                                 | username                | password                                     | fuelType | sourceSystem | journey     | AAH | DD  | customerType | newOrExisting |
      | E2E_MyAccount_Residential_ELE_PS_MissingID | MissingID_RESI@test.com | U2FsdGVkX19pydLDPzviWcrNZ6PzbXoPRKv4Bjmqyug= | ELE      | My Account   | Plan switch | Yes | Yes | RES          | Existing      |

  @currentplan @deviceCheck  @failed
  Scenario Outline: Verify the RESI Electricity Plan switch journey with current plan having guaranteed discount from My Account
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user navigates to my account login page
    When user logs in to my account using '<username>' and '<password>'
    And user clicks on view and change plan accordion for '<fuelType>'
    And user clicks on compare and switch plan button
    And user validates details on checkout details page
      | sourceSystem   | journey   | fuelType   |
      | <sourceSystem> | <journey> | <fuelType> |
    And user selects plans on checkout details page
      | fuelType   | planName   |
      | <fuelType> | Total Plan |
    And user clicks on 'Next' button and navigates to review page
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user provides life support details on review page
      | lifeSupportOption | fuelType   | EleclifeSupportDevices      |
      | Yes               | <fuelType> | Ventilator For Life Support |
    And user selects carbon neutral option
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |

    Examples:
      | folderName                                | username     | password                                     | fuelType | sourceSystem | journey     | AAH | DD | customerType | newOrExisting |
      | E2E_MyAccount_Resi_ELE_PS_Current_Plan_GD | cp1@test.com | U2FsdGVkX19YPkVS1ABCAhv2r+1CGiV9MnvSGz52Qvw= | ELE      | My Account   | Plan switch | No  | No | RES          | Existing      |

  @currentplan
  Scenario Outline: Verify the RESI Electricity Plan switch journey with current plan having pay on time discount from My Account
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user navigates to my account login page
    When user logs in to my account using '<username>' and '<password>'
    And user clicks on view and change plan accordion for '<fuelType>'
    And user clicks on compare and switch plan button
    And user validates details on checkout details page
      | sourceSystem   | journey   | fuelType   |
      | <sourceSystem> | <journey> | <fuelType> |
    And user selects plans on checkout details page
      | fuelType   | planName   |
      | <fuelType> | Total Plan |
    And user clicks on 'Next' button and navigates to review page
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user provides life support details on review page
      | lifeSupportOption | fuelType   | EleclifeSupportDevices      |
      | Yes               | <fuelType> | Ventilator For Life Support |
    And user selects carbon neutral option
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |

    Examples:
      | folderName                                 | username               | password                                     | fuelType | sourceSystem | journey     | AAH | DD | customerType | newOrExisting |
      | E2E_MyAccount_Resi_ELE_PS_Current_Plan_PDD | currentplan03@test.com | U2FsdGVkX19pZVkiZ60o0iAFhXdDJs0/oxVAuNlMfyY= | ELE      | My Account   | Plan switch | No  | No | RES          | Existing      |

  @currentplan
  Scenario Outline: Verify the RESI Electricity Plan switch journey with current plan having no discount from My Account
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user navigates to my account login page
    When user logs in to my account using '<username>' and '<password>'
    And user clicks on view and change plan accordion for '<fuelType>'
    And user clicks on compare and switch plan button
    And user validates details on checkout details page
      | sourceSystem   | journey   | fuelType   |
      | <sourceSystem> | <journey> | <fuelType> |
    And user selects plans on checkout details page
      | fuelType   | planName   |
      | <fuelType> | Total Plan |
    And user clicks on 'Next' button and navigates to review page
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user provides life support details on review page
      | lifeSupportOption | fuelType   | EleclifeSupportDevices      |
      | Yes               | <fuelType> | Ventilator For Life Support |
    And user selects carbon neutral option
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |

    Examples:
      | folderName                                         | username                    | password                                     | fuelType | sourceSystem | journey     | AAH | DD  | customerType | newOrExisting |
      | E2E_MyAccount_Resi_ELE_PS_Current_Plan_No_Discount | nofrillsnodiscount@test.com | U2FsdGVkX1+VJgjPu6egPMpn4may0nOjl253Oh2CJmw= | ELE      | My Account   | Plan switch | No  | Yes | RES          | Existing      |

  @solar
  Scenario Outline: Verify the RESI VIC Electricity Plan switch journey with retail solar scheme
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user navigates to my account login page
    When user logs in to my account using '<username>' and '<password>'
    And user clicks on view and change plan accordion for '<fuelType>'
    And user clicks on compare and switch plan button
    And user validates details on checkout details page
      | sourceSystem   | journey   | fuelType   |
      | <sourceSystem> | <journey> | <fuelType> |
    Then user validates solar indicator on checkout details page
    And user validates solar government scheme disclaimer under solar buy back rates section
    When user selects plans on checkout details page
      | fuelType   | planName   |
      | <fuelType> | Total Plan |
    And user clicks on 'Next' button and navigates to review page
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   | solarSetup |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> | true       |
    And user selects "single_rate" solar tariff type for "VIC"
    And user provides life support details on review page
      | lifeSupportOption | fuelType   | EleclifeSupportDevices |
      | No                | <fuelType> |                        |
    And user selects carbon neutral option
    And user validates "single_rate" solar tariff type for "VIC" under electricity rates section
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |

    Examples:
      | folderName                                 | username                    | password                                     | fuelType | sourceSystem | journey     | AAH | DD | customerType | newOrExisting |
      | E2E_MyAccount_Resi_ELE_PS_VIC_Solar_Retail | resisolarvicretail@test.com | U2FsdGVkX19vMGhcMi/K5y0NKF1qthlio+wVMYFQxjQ= | ELE      | My Account   | Plan switch | No  | No | RES          | Existing      |

  @solar
  Scenario Outline: Verify the RESI NSW Electricity Plan switch journey with government solar scheme
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user navigates to my account login page
    When user logs in to my account using '<username>' and '<password>'
    And user clicks on view and change plan accordion for '<fuelType>'
    And user clicks on compare and switch plan button
    And user validates details on checkout details page
      | sourceSystem   | journey   | fuelType   |
      | <sourceSystem> | <journey> | <fuelType> |
    Then user validates solar indicator on checkout details page
    And user validates solar government scheme disclaimer under solar buy back rates section
    When user selects plans on checkout details page
      | fuelType   | planName        |
      | <fuelType> | Total Plan Plus |
    And user clicks on 'Next' button and navigates to review page
    And user provides missing identification details on review page
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   | solarSetup |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> | Yes        |
    And user provides life support details on review page
      | lifeSupportOption | fuelType   | EleclifeSupportDevices |
      | No                | <fuelType> |                        |
    And user selects carbon neutral option
    And user validates "single_rate" solar tariff type for "NSW" under electricity rates section
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |

    Examples:
      | folderName                                 | username                  | password                                     | fuelType | sourceSystem | journey     | AAH | DD  | customerType | newOrExisting |
      | E2E_MyAccount_Resi_ELE_PS_NSW_Solar_Retail | resisolarnswgovt@test.com | U2FsdGVkX1+XFCu2vgJXQNGsB/mec9xh7V1ac7VVOwc= | ELE      | My Account   | Plan switch | No  | Yes | RES          | Existing      |

  @solar
  Scenario Outline: Verify the RESI Move home journey from My Account with retail solar scheme
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user navigates to my account login page
    When user logs in to my account using '<username>' and '<password>'
    And user clicks on move home link for 'ELE'
    And user enters service address as '<address>'
    And user selects connection date
    And user clicks on lets get moving button
    And user validates details on checkout details page
      | sourceSystem | journey   | fuelType |
      | My Account   | Move Home | BOTH     |
    Then user validates solar indicator on checkout details page
    And user validates solar government scheme disclaimer under solar buy back rates section
    When user selects plans on checkout details page
      | fuelType | planName        |
      | ELE      | Total Plan Plus |
    And user selects plans on checkout details page
      | fuelType | planName        |
      | GAS      | Total Plan Plus |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user validates solar component on checkout details page when solar setup is "Yes"
    And user selects "time_of_use" solar tariff type for "VIC"
    And user answers No for home improvements question
    And user chooses "<optDisconnection>" for disconnection
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices  | GaslifeSupportDevices        |
      | Yes               | BOTH     | Kidney Dialysis Machine | Medically Required Hot Water |
    And user validates "time_of_use" solar tariff type for "VIC" under electricity rates section
    And user submits the quote
    Then user lands on checkout complete page

    Examples:
      | folderName                                       | address                         | username                    | password                                     | optDisconnection | customerType | newOrExisting |
      | E2E_MyAccount_Resi_ELE_MoveHome_VIC_Solar_Retail | 1 Avondale Road, LALOR VIC 3075 | resisolarvicretail@test.com | U2FsdGVkX19vMGhcMi/K5y0NKF1qthlio+wVMYFQxjQ= | No               | RES          | Existing      |


  @solar
  Scenario Outline: Verify the RESI upsell journey from My Account with retail solar scheme
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user navigates to my account login page
    When user logs in to my account using '<username>' and '<password>'
    And user clicks on compare plans button
    And user validates details on checkout details page
      | sourceSystem   | journey   | fuelType   |
      | <sourceSystem> | <journey> | <fuelType> |
    Then user validates solar indicator on checkout details page
    And user validates solar government scheme disclaimer under solar buy back rates section
    When user selects plans on checkout details page
      | fuelType | planName   |
      | ELE      | Total Plan |
    And user selects mailing address option
      | addressType   | otherAddress                           |
      | Other Address | 42 Brownlow Drive, POINT COOK VIC 3030 |
    And user validates solar component on checkout details page when solar setup is "Yes"
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices  |
      | Yes               | ELE      | Kidney Dialysis Machine |
    And user validates "single_rate" solar tariff type for "NSW" under electricity rates section
    And user submits the quote
    Then user lands on checkout complete page

    Examples:
      | folderName                                     | username                | password                                     | fuelType | sourceSystem | journey | AAH | DD | customerType | newOrExisting |
      | E2E_MyAccount_Resi_ELE_Upsell_VIC_Solar_Retail | solareleupsell@test.com | U2FsdGVkX19q7UocMUMUg8nNxiUpn3DHzsVAsx2DGRk= | ELE      | My Account   | Upsell  | No  | No | RES          | Existing      |

  @solar
  Scenario Outline: Verify error message displays on checkout details page for plan switch through My Account when solar tariff is missing in MSATS
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user navigates to my account login page
    When user logs in to my account using '<username>' and '<password>'
    And user clicks on view and change plan accordion for '<fuelType>'
    And user clicks on compare and switch plan button
    Then Error modal is displayed for "SOLAR_UNKNOWN"
    When user clicks on "go to overview" button
    Then user lands on "my account" page

    Examples:
      | folderName                          | username                | password                                     | fuelType |
      | E2E_MyAccount_Resi_PS_SOLAR_UNKNOWN | solarunknownps@test.com | U2FsdGVkX19Uf4/cssWQesblSuWt9P45dGln2S3UW28= | ELE      |

  @solar
  Scenario Outline: Verify error message displays on checkout details page for moving journey through My Account when solar tariff is missing in MSATS
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user navigates to my account login page
    When user logs in to my account using '<username>' and '<password>'
    And user clicks on move home link for '<fuelType>'
    And user enters service address as '<address>'
    And user selects connection date
    And user clicks on lets get moving button
    Then error message is displayed for missing solar tariff in MSATS
    When user selects plans on checkout details page
      | fuelType | planName   |
      | GAS      | Total Plan |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user provides identification details
      | customerType | customerStatus | idType         |
      | RES          | Existing       | Driver License |
    And user chooses "<optDisconnection>" for disconnection
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices | GaslifeSupportDevices |
      | No                | GAS      |                        |                       |
    And user submits the quote
    Then user lands on checkout complete page

    Examples:
      | folderName                                 | username                  | password                                     | fuelType | address                                 | optDisconnection |
      | E2E_MyAccount_Resi_MoveHouse_SOLAR_UNKNOWN | resisolarnswgovt@test.com | U2FsdGVkX1+XFCu2vgJXQNGsB/mec9xh7V1ac7VVOwc= | ELE      | 19 Willington Street, TURRELLA NSW 2205 | No               |

  @solar
  Scenario Outline: Verify error message displays on checkout details page for upsell through My Account when solar tariff is missing in MSATS
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user navigates to my account login page
    When user logs in to my account using '<username>' and '<password>'
    And user clicks on compare plans button
    Then Error modal is displayed for "SOLAR_UNKNOWN"
    When user clicks on "go to overview" button
    Then user lands on "my account" page

    Examples:
      | folderName                              | username                    | password                                     |
      | E2E_MyAccount_Resi_Upsell_SOLAR_UNKNOWN | solarunknownupsell@test.com | U2FsdGVkX1+zgiUAQwle19JZ8rSiW8eHxu6DgyGidJE= |

  @solar
  Scenario Outline: Verify error component displays on checkout details page for moving journey through My Account when MSATS is unable to detect the NMI
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user navigates to my account login page
    When user logs in to my account using '<username>' and '<password>'
    And user clicks on move home link for 'ELE'
    And user enters service address as '<address>'
    And user selects connection date
    And user clicks on lets get moving button
    And user clicks on add plan button
    And user validates details on checkout details page
      | sourceSystem | journey   | fuelType |
      | My Account   | Move Home | BOTH     |
    Then user validates solar government scheme disclaimer under solar buy back rates section
    When user selects plans on checkout details page
      | fuelType | planName        |
      | ELE      | Total Plan Plus |
    And user selects plans on checkout details page
      | fuelType | planName        |
      | GAS      | Total Plan Plus |
    And user selects mailing address option
      | addressType        | otherAddress |
      | Connection Address |              |
    And user validates solar component on checkout details page when solar setup is "unknown"
    And user chooses "<optDisconnection>" for disconnection
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices  | GaslifeSupportDevices        |
      | No                | BOTH     | Kidney Dialysis Machine | Medically Required Hot Water |
    And user submits the quote
    Then user lands on checkout complete page

    Examples:
      | folderName                                       | address                                  | username                    | password                                     | optDisconnection |
      | E2E_MyAccount_Resi_ELE_MoveHome_SolarUnDetermine | Unit 1 297 Dorset Road, CROYDON VIC 3136 | resisolarvicretail@test.com | U2FsdGVkX19vMGhcMi/K5y0NKF1qthlio+wVMYFQxjQ= | No               |

  # To test this scenario need to down MSATS endpoint
  # not feasible for automation
  # keeping it here just for tracking purpose
  @data-required
  Scenario Outline: Verify error component displays on checkout details page for upsell through My Account when MSATS endpoint is down
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user navigates to my account login page
    When user logs in to my account using '<username>' and '<password>'
    And user clicks on compare plans button
    And user validates details on checkout details page
      | sourceSystem   | journey   | fuelType   |
      | <sourceSystem> | <journey> | <fuelType> |
    And user selects plans on checkout details page
      | fuelType | planName   |
      | ELE      | Total Plan |
    And user selects mailing address option
      | addressType   | otherAddress                           |
      | Other Address | 42 Brownlow Drive, POINT COOK VIC 3030 |
    And user validates solar component on checkout details page when solar setup is "unknown"
    And user clicks on 'Review your order' button and navigates to review page
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |
    And user provides life support details on review page
      | lifeSupportOption | fuelType | EleclifeSupportDevices  |
      | Yes               | ELE      | Kidney Dialysis Machine |
    And user submits the quote
    Then user lands on checkout complete page

    Examples:
      | folderName                                     | username                | password                                     | fuelType | sourceSystem | journey | AAH | DD | customerType | newOrExisting |
      | E2E_MyAccount_Resi_ELE_Upsell_SolarUnDetermine | solareleupsell@test.com | U2FsdGVkX19q7UocMUMUg8nNxiUpn3DHzsVAsx2DGRk= | ELE      | My Account   | Upsell  | No  | No | RES          | Existing      |

  # To test this scenario need to down MSATS endpoint
  # not feasible for automation
  # keeping it here just for tracking purpose
  @data-required
  Scenario Outline: Verify error component displays on checkout review page for plan switch through My Account when MSATS endpoint is down
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user navigates to my account login page
    When user logs in to my account using '<username>' and '<password>'
    And user clicks on view and change plan accordion for '<fuelType>'
    And user clicks on compare and switch plan button
    And user validates details on checkout details page
      | sourceSystem   | journey   | fuelType   |
      | <sourceSystem> | <journey> | <fuelType> |
    And user selects plans on checkout details page
      | fuelType   | planName   |
      | <fuelType> | Total Plan |
    And user clicks on 'Next' button and navigates to review page
    And user validates details on checkout review page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   | solarSetup |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> | unknown    |
    And user provides life support details on review page
      | lifeSupportOption | fuelType   | EleclifeSupportDevices |
      | No                | <fuelType> |                        |
    And user selects carbon neutral option
    And user submits the quote
    Then user lands on checkout complete page
    And user validates details on checkout complete page
      | sourceSystem   | journey   | fuelType   | AAH   | DD   | customerType   | newOrExisting   |
      | <sourceSystem> | <journey> | <fuelType> | <AAH> | <DD> | <customerType> | <newOrExisting> |

    Examples:
      | folderName                                 | username                    | password                                     | fuelType | sourceSystem | journey     | AAH | DD | customerType | newOrExisting |
      | E2E_MyAccount_Resi_ELE_PS_VIC_Solar_Retail | resisolarvicretail@test.com | U2FsdGVkX19vMGhcMi/K5y0NKF1qthlio+wVMYFQxjQ= | ELE      | My Account   | Plan switch | No  | No | RES          | Existing      |
