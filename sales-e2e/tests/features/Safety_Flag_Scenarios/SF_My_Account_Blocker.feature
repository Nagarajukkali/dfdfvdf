Feature: This feature is to test the behaviour of existing customer accounts which are marked for Safety Flag as U/P through My Account

# Following scenarios are considering when account has partial restriction
  #1
  @safetyflag
  Scenario Outline: Verify the plan switch scenario for dual fuel resi account when SF 'P' on main person through My Account
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user navigates to my account login page
    When user logs in to my account using '<username>' and '<password>'
    And user clicks on view and change plan accordion for 'ELE'
    And user clicks on compare and switch plan button
    And user selects No for solar question and confirm
    And user selects plans on checkout details page
      |elePlan        |gasPlan   |
      |Total Plan Plus|Total Plan|
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices   |GaslifeSupportDevices         |
      |No               |        |                         |                              |
    And user submits the quote
    Then user lands on checkout complete page

    Examples:
      |folderName                      |username                         |password                                     |
      |MyAccount_Resi_Safety_Flag_PS_P |resipartialrestriction1@test.com |U2FsdGVkX1+zgEObraigzcY3oiKno5DPe6oX/2dUosk= |

    #2
  @safetyflag
  Scenario Outline: Verify the move house scenario for dual fuel resi account when SF 'P' on main person through My Account
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user navigates to my account login page
    When user logs in to my account using '<username>' and '<password>'
    And user clicks on move home link for 'ELE'
    And user enters service address as '<address>'
    And user selects connection date
    And user selects No for solar question on moving service page
    And user clicks on lets get moving button
    And user selects plans on checkout details page
      |elePlan        |gasPlan   |
      |Total Plan Plus|Total Plan|
    And user answers No for home improvements question
    And user chooses "<optDisconnection>" for disconnection
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices   |GaslifeSupportDevices         |
      |Yes              |BOTH    |Kidney Dialysis Machine  |Medically Required Hot Water  |
    When user selects carbon neutral option
    And user submits the quote
    Then user lands on checkout complete page

    Examples:
      |folderName                            |address                                  |username                         |password                                     |optDisconnection|
      |MyAccount_Resi_Safety_Flag_MoveHome_P |9 Rodier Street, BALLARAT EAST VIC 3350  |resipartialrestriction1@test.com |U2FsdGVkX1+zgEObraigzcY3oiKno5DPe6oX/2dUosk= |No              |

    #3
  @safetyflag
  Scenario Outline: Verify the plan switch scenario for dual fuel bsme account when SF 'P' on main person through My Account
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user navigates to my account login page
    When user logs in to my account using '<username>' and '<password>'
    And user clicks on view and change plan accordion for 'ELE'
    And user clicks on compare and switch plan button
    And user selects No for solar question and confirm
    And user selects plans on checkout details page
      |elePlan         |gasPlan        |
      |Total Business  |Basic Business |
    And user provides business details for My Account journey
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption  |fuelType |EleclifeSupportDevices  |GaslifeSupportDevices|
      |No                |BOTH     |Oxygen Concentrator    |Gas Other             |
    And user submits the quote
    Then user lands on checkout complete page

    Examples:
      |folderName                     |username                         |password                                     |
      |MyAccount_Bus_Safety_Flag_PS_P |bsmepartialrestriction1@test.com |U2FsdGVkX1+Tb64Cohu77YWIdW26BGb1qSUOW+SW1Gg= |

    # Following scenarios are considering when account has no restriction
    #4
  @safetyflag
  Scenario Outline: Verify the plan switch scenario for dual fuel resi account when SF 'U' on main person through My Account
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user navigates to my account login page
    When user logs in to my account using '<username>' and '<password>'
    And user clicks on view and change plan accordion for 'ELE'
    And user clicks on compare and switch plan button
    And user selects No for solar question and confirm
    And user selects plans on checkout details page
      |elePlan        |gasPlan   |
      |Total Plan Plus|Total Plan|
    And user provides identification details
      |customerType|customerStatus|idType        |
      |RES         |Existing      |Driver License|
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption|fuelType|EleclifeSupportDevices   |GaslifeSupportDevices         |
      |No               |        |                         |                              |
    When user selects carbon neutral option
    And user submits the quote
    Then user lands on checkout complete page

    Examples:
      |folderName                      |username                    |password                                     |
      |MyAccount_Resi_Safety_Flag_PS_U |resinorestriction1@test.com |U2FsdGVkX1+smXIPPc+xwkrX0TEHbjHb5/lJBEblCdQ= |

    #5
  Scenario Outline: Verify the plan switch scenario for dual fuel bsme account when SF 'U' on main person through My Account
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user navigates to my account login page
    When user logs in to my account using '<username>' and '<password>'
    And user clicks on view and change plan accordion for 'ELE'
    And user clicks on compare and switch plan button
    And user selects No for solar question and confirm
    And user selects plans on checkout details page
      |elePlan         |
      |Total Business  |
    And user provides business details for My Account journey
    And user clicks on 'Review your order' button and navigates to review page
    And user provides life support details on review page
      |lifeSupportOption  |fuelType |EleclifeSupportDevices  |GaslifeSupportDevices|
      |No                |BOTH     |Oxygen Concentrator    |Gas Other             |
    And user submits the quote
    Then user lands on checkout complete page

    Examples:
      |folderName                     |username                    |password                                     |
      |MyAccount_Bus_Safety_Flag_PS_U |bsmenorestriction1@test.com |U2FsdGVkX1+SbE5crS8pGXKi9NLvhDGCsyKgQdZ3AL8= |
