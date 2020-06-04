
Feature: This feature is to test the behaviour of existing customer accounts which are marked for Safety Flag through qualifier

# Following scenarios are considering both Elec and Gas having same Main Person
  #1
  Scenario Outline: Verify the blocker scenario for dual fuel resi account when SF 'Y' on main person
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects 'Existing' on qualifier
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |0159048044   |Postcode           |2216            |dob   |01011980|
    Then Relevant error message is presented for customers marked with safety flag on qualifier
    When user navigates back to account verification section and clears all the previously provided details
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |2171186191   |Postcode           |2216            |dob   |01011980|
    Then Relevant error message is presented for customers marked with safety flag on qualifier

  Examples:
    |folderName                       |planName|
    |Resi_Safety_Flag_Qualifier_Main_Y|Total Plan|

#2

  Scenario Outline: Verify the blocker scenario for dual fuel bsme account when SF 'Y' on main person
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'BUS' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects 'Existing' on qualifier
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |7195146334   |ABN                |19924798800     |dob   |01011980|
    Then Relevant error message is presented for customers marked with safety flag on qualifier
    When user navigates back to account verification section and clears all the previously provided details
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |3550989991   |ABN                |19924798800     |dob   |01011980|
    Then Relevant error message is presented for customers marked with safety flag on qualifier

    Examples:
      |folderName                      |planName      |
      |Bus_Safety_Flag_Qualifier_Main_Y|Total Business|
  #3
  Scenario Outline: Verify the blocker scenario for dual fuel resi account when SF 'P' on main person
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects 'Existing' on qualifier
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |5419576252   |Postcode           |3690            |dob   |01011980|
    Then Relevant error message is presented for customers marked with safety flag on qualifier
    When user navigates back to account verification section and clears all the previously provided details
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |2171999821   |Postcode           |3690            |dob   |01011980|
    Then Relevant error message is presented for customers marked with safety flag on qualifier

    Examples:
      |folderName                       |planName|
      |Resi_Safety_Flag_Qualifier_Main_P|Total Plan|
  #4
  Scenario Outline: Verify the blocker scenario for dual fuel bsme account when SF 'P' on main person
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'BUS' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects 'Existing' on qualifier
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |5082667531   |ABN                |11723776900     |dob   |01011980|
    Then Relevant error message is presented for customers marked with safety flag on qualifier
    When user navigates back to account verification section and clears all the previously provided details
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |3647287605   |ABN                |11723776900     |dob   |01011980|
    Then Relevant error message is presented for customers marked with safety flag on qualifier

    Examples:
      |folderName                      |planName|
      |Bus_Safety_Flag_Qualifier_Main_P|Total Business|

    #5
  Scenario Outline: Verify the blocker scenario for dual fuel resi account when SF 'Y' on financial responsible person
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects 'Existing' on qualifier
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |7755334016   |Postcode           |3056            |dob   |01011980|
    Then Relevant error message is presented for customers marked with safety flag on qualifier
    When user navigates back to account verification section and clears all the previously provided details
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |6376907157   |Postcode           |3056            |dob   |01011980|
    Then Relevant error message is presented for customers marked with safety flag on qualifier

    Examples:
      |folderName                     |planName|
      |Resi_Safety_Flag_Qualifier_FR_Y|Total Plan|

    #6
  Scenario Outline: Verify the blocker scenario for dual fuel bsme account when SF 'P' on financial responsible person
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'BUS' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects 'Existing' on qualifier
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |6415738140   |ABN                |18743496000     |dob   |01011980|
    Then Relevant error message is presented for customers marked with safety flag on qualifier
    When user navigates back to account verification section and clears all the previously provided details
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |0154814897   |ABN                |18743496000     |dob   |01011980|
    Then Relevant error message is presented for customers marked with safety flag on qualifier

    Examples:
      |folderName                    |planName|
      |Bus_Safety_Flag_Qualifier_FR_P|Total Business|

     #7
  @test
  Scenario Outline: Verify the blocker scenario for dual fuel resi account when SF 'P' on customer contact person
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects 'Existing' on qualifier
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |2682860548   |Postcode           |2763            |dob   |01011980|
    Then Relevant error message is presented for customers marked with safety flag on qualifier
    When user navigates back to account verification section and clears all the previously provided details
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |0003528068   |Postcode           |2763            |dob   |01011980|
    Then Relevant error message is presented for customers marked with safety flag on qualifier

    Examples:
      |folderName                     |planName|
      |Resi_Safety_Flag_Qualifier_CC_P|Total Plan|

    #8
  Scenario Outline: Verify the blocker scenario for dual fuel bsme account when SF 'Y' on customer contact person
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'BUS' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects 'Existing' on qualifier
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |2216351963   |ABN                |30561555500     |pin   |215415753|
    Then Relevant error message is presented for customers marked with safety flag on qualifier
    When user navigates back to account verification section and clears all the previously provided details
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |0313731866   |ABN                |30561555500     |pin   |215415753|
    Then Relevant error message is presented for customers marked with safety flag on qualifier

    Examples:
      |folderName                    |planName|
      |Bus_Safety_Flag_Qualifier_CC_Y|Total Business|

    #9
  Scenario Outline: Verify the blocker scenario for dual fuel resi account when SF 'Y' on executor
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects 'Existing' on qualifier
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |3112210333   |Postcode           |2125            |dob   |01011980|
    Then Relevant error message is presented for customers marked with safety flag on qualifier
    When user navigates back to account verification section and clears all the previously provided details
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |5800846491   |Postcode           |2125            |dob   |01011980|
    Then Relevant error message is presented for customers marked with safety flag on qualifier

    Examples:
      |folderName                       |planName|
      |Resi_Safety_Flag_Qualifier_exec_Y|Total Plan|

    #10
  Scenario Outline: Verify the blocker scenario for dual fuel bsme account when SF 'P' on trustee
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'BUS' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects 'Existing' on qualifier
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |5487290321   |ABN                |21153342200     |dob   |01011980|
    Then Relevant error message is presented for customers marked with safety flag on qualifier
    When user navigates back to account verification section and clears all the previously provided details
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |0493002682   |ABN                |21153342200     |dob   |01011980|
    Then Relevant error message is presented for customers marked with safety flag on qualifier

    Examples:
      |folderName                         |planName|
      |Bus_Safety_Flag_Qualifier_trustee_P|Total Business|

     #11
  @test
  Scenario Outline: Verify the non blocker scenario for dual fuel resi account when SF 'U' on main person
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects 'Existing' on qualifier
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |2740619832   |Postcode           |3150            |dob   |01011980|
    Then user can able to proceed further through qualifier
    When user navigates back to account verification section from moving question and clears all the previously provided details
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |9153365221   |Postcode           |3150            |dob   |01011980|
    Then user can able to proceed further through qualifier

    Examples:
      |folderName                       |planName|
      |Resi_Safety_Flag_Qualifier_Main_U|Total Plan|

    #12
  @test
  Scenario Outline: Verify the non blocker scenario for dual fuel bsme account when SF 'U' on main person
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'BUS' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects 'Existing' on qualifier
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |7809132000   |ABN                |20349240900     |dob   |01011980|
    Then user can able to proceed further through qualifier
    When user navigates back to account verification section from moving question and clears all the previously provided details
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |2585632000   |ABN                |20349240900     |dob   |01011980|
    Then user can able to proceed further through qualifier

    Examples:
      |folderName                      |planName|
      |Bus_Safety_Flag_Qualifier_Main_U|Total Business|

  #Following scenarios are considering both Elec and Gas having different main person
  #1
  Scenario Outline: Verify the blocker scenario for dual fuel resi account when SF 'Y' on gas main person
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customer_type>' plans page
    And user have selected fuel as "<fuelType>"
    When user clicks on the verify modal window on '<customer_type>' page
    And user provides below details for account verification on verify account modal window
      |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |postcode |idType|idNumber|
      |RES          |verify account |3072411876       |                 |3021     |dl    |DL456783 |
    Then user can able to proceed further through verify account
    When user navigates back to verify identity section
    And user navigates back to verify account section and clears all the previously provided details
    And user provides below details for account verification on verify account modal window
      |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |postcode |idType|idNumber|
      |RES          |               |                 |6257938603       |3021     |dl    |456892|
    Then Relevant error message is presented for customers marked with safety flag on verify account modal

    Examples:
      |folderName                     |customer_type |fuelType |
      |Resi_Safety_Flag_Qualifier_Main_Gas_Y|RES           |BOTH     |

    #2
  Scenario Outline: Verify the blocker scenario for dual fuel bsme account when SF 'P' on elec customer contact person
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customer_type>' plans page
    And user have selected fuel as "<fuelType>"
    When user clicks on the verify modal window on '<customer_type>' page
    And user provides below details for account verification on verify account modal window
      |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |ABNOrACN   |idType|idNumber|
      |BUS          |verify account |3859760000       |5367101000       |22021270900|pin   |43576872|
    Then Relevant error message is presented for customers marked with safety flag on verify account modal
    When user navigates back to verify account section and clears all the previously provided details
    And user provides below details for account verification on verify account modal window
      |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |ABNOrACN   |idType|idNumber|
      |BUS          |               |3859760000       |                 |22021270900|pin   |43576872|
    Then Relevant error message is presented for customers marked with safety flag on verify account modal
    When user navigates back to verify account section and clears all the previously provided details
    And user provides below details for account verification on verify account modal window
      |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |ABNOrACN |idType|idNumber|
      |BUS          |               |                 |5367101000       |22021270900|pin |43576872|
    Then user can able to proceed further through verify account

    Examples:
      |folderName                   |customer_type |fuelType |
      |Bus_Safety_Flag_Qualifier_CC_Elec_P|BUS           |BOTH     |

    #3
  Scenario Outline: Verify the blocker scenario for dual fuel resi account when SF 'P' on gas partner
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customer_type>' plans page
    And user have selected fuel as "<fuelType>"
    When user clicks on the verify modal window on '<customer_type>' page
    And user provides below details for account verification on verify account modal window
      |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |postcode |idType|idNumber|
      |RES          |verify account |0005041000       |4921480000       |2323     |dl    |DL346778|
    Then Relevant error message is presented for customers marked with safety flag on verify account modal
    When user navigates back to verify account section and clears all the previously provided details
    And user provides below details for account verification on verify account modal window
      |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |postcode |idType|idNumber|
      |RES          |               |0005041000       |                 |2323     |dl    |DL346778|
    Then user can able to proceed further through verify account
    When user navigates back to verify identity section
    And user navigates back to verify account section and clears all the previously provided details
    And user provides below details for account verification on verify account modal window
      |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |postcode |idType|idNumber|
      |RES          |               |                 |4921480000       |2323     |dl    |DL346778|
    Then Relevant error message is presented for customers marked with safety flag on verify account modal

    Examples:
      |folderName                        |customer_type |fuelType |
      |Resi_Safety_Flag_Qualifier_Partner_Gas_P|RES           |BOTH     |

    #4
  Scenario Outline: Verify the blocker scenario for dual fuel resi account when SF 'U' on any person
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customer_type>' plans page
    And user have selected fuel as "<fuelType>"
    When user clicks on the verify modal window on '<customer_type>' page
    And user provides below details for account verification on verify account modal window
      |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |postcode |idType|idNumber|
      |RES          |verify account |9681150000       |6475322000       |2075     |dob   |01011980|
    Then user can able to proceed further through verify account
    When user navigates back to verify identity section
    And user navigates back to verify account section and clears all the previously provided details
    And user provides below details for account verification on verify account modal window
      |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |postcode |idType|idNumber|
      |RES          |               |9681150000       |                 |2075     |dob   |01011980|
    Then user can able to proceed further through verify account
    When user navigates back to verify identity section
    And user navigates back to verify account section and clears all the previously provided details
    And user provides below details for account verification on verify account modal window
      |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |postcode |idType|idNumber|
      |RES          |               |                 |6475322000       |2075     |dob   |01011980|
    Then user can able to proceed further through verify account

    Examples:
      |folderName                      |customer_type |fuelType |
      |Resi_Safety_Flag_Qualifier_AnyPerson_U|RES           |BOTH     |

    #Following scenarios for single fuel accounts
    #1
  Scenario Outline: Verify the blocker scenario for single fuel resi account when SF 'Y' on elec main person
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customer_type>' plans page
    And user have selected fuel as "<fuelType>"
    When user clicks on the verify modal window on '<customer_type>' page
    And user provides below details for account verification on verify account modal window
      |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |postcode |idType|idNumber|
      |RES          |verify account |0003090000       |                 |2323     |dl    |202184033|
    Then Relevant error message is presented for customers marked with safety flag on verify account modal

    Examples:
      |folderName                            |customer_type |fuelType|
      |Resi_Safety_Flag_Qualifier_Single_Main_Ele_Y|RES           |ELE     |

    #2
  Scenario Outline: Verify the blocker scenario for single fuel bsme account when SF 'P' on elec associate person
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customer_type>' plans page
    And user have selected fuel as "<fuelType>"
    When user clicks on the verify modal window on '<customer_type>' page
    And user provides below details for account verification on verify account modal window
      |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |ABNOrACN   |idType|idNumber|
      |BUS          |verify account |1730907966       |                 |62969568900|dob   |01011980|
    Then Relevant error message is presented for customers marked with safety flag on verify account modal

    Examples:
      |folderName                                |customer_type |fuelType|
      |Bus_Safety_Flag_Qualifier_Single_Associate_Ele_P|BUS           |ELE     |

    #3
  Scenario Outline: Verify the blocker scenario for single fuel resi account when SF 'P' on gas spouse
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customer_type>' plans page
    And user have selected fuel as "<fuelType>"
    When user clicks on the verify modal window on '<customer_type>' page
    And user provides below details for account verification on verify account modal window
      |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |postcode |idType|idNumber|
      |RES          |verify account |                 |0000132158       |5161     |dob   |01011980|
    Then Relevant error message is presented for customers marked with safety flag on verify account modal

    Examples:
      |folderName                              |customer_type |fuelType|
      |Resi_Safety_Flag_Qualifier_Single_Spouse_Gas_P|RES           |GAS     |

     #4
  Scenario Outline: Verify the blocker scenario for single fuel bsme account when SF 'Y' on gas main person
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customer_type>' plans page
    And user have selected fuel as "<fuelType>"
    When user clicks on the verify modal window on '<customer_type>' page
    And user provides below details for account verification on verify account modal window
      |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |ABNOrACN   |idType|idNumber|
      |BUS          |verify account |                 |1912374634       |11211590600|pin   |546576588|
    Then Relevant error message is presented for customers marked with safety flag on verify account modal

    Examples:
      |folderName                           |customer_type |fuelType|
      |Bus_Safety_Flag_Qualifier_Single_Main_Gas_Y|BUS           |GAS     |

    #5
  Scenario Outline: Verify the blocker scenario for single fuel resi account when SF 'U' on elec any person
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customer_type>' plans page
    And user have selected fuel as "<fuelType>"
    When user clicks on the verify modal window on '<customer_type>' page
    And user provides below details for account verification on verify account modal window
      |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |postcode |idType|idNumber|
      |RES          |verify account |0009092000       |                 |2322     |dob   |01011980|
    Then user can able to proceed further through verify account

    Examples:
      |folderName                            |customer_type |fuelType|
      |Resi_Safety_Flag_Qualifier_Single_AnyP_Ele_U|RES           |ELE     |

    #6
  Scenario Outline: Verify the blocker scenario for single fuel bsme account when SF 'U' on gas any person
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customer_type>' plans page
    And user have selected fuel as "<fuelType>"
    When user clicks on the verify modal window on '<customer_type>' page
    And user provides below details for account verification on verify account modal window
      |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |ABNOrACN   |idType|idNumber|
      |BUS          |verify account |                 |8480418639       |13994073700|dl    |DL1567576|
    Then user can able to proceed further through verify account

    Examples:
      |folderName                           |customer_type |fuelType|
      |Bus_Safety_Flag_Qualifier_Single_AnyP_Gas_U|BUS           |GAS     |

    #Following scenarios for accounts having different levle of access on different level of persons
  #1
  Scenario Outline: Verify the blocker scenario for dual fuel resi account when SF 'U', 'P' and 'Y' on main person, customer contact person and financial responsible person respectively
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customer_type>' plans page
    And user have selected fuel as "<fuelType>"
    When user clicks on the verify modal window on '<customer_type>' page
    And user provides below details for account verification on verify account modal window
      |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |postcode |idType |idNumber |
      |RES          |verify account |6498303250       |9112659490       |3207     |dob    |01011980 |
    Then Relevant error message is presented for customers marked with safety flag on verify account modal

    Examples:
      |folderName                            |customer_type |fuelType |
      |Resi_Safety_Flag_Qualifier_At_Differnt_Level|RES           |BOTH     |

  #2
  Scenario Outline: Verify the blocker scenario for dual fuel bsme account when SF 'U', 'P' and 'Y' on financial responsible person, main person and customer contact person respectively
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customer_type>' plans page
    And user have selected fuel as "<fuelType>"
    When user clicks on the verify modal window on '<customer_type>' page
    And user provides below details for account verification on verify account modal window
      |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |ABNOrACN        |idType |idNumber |
      |BUS          |verify account |5008317914       |8065853620       |23617305400     |dob    |01011980 |
    Then Relevant error message is presented for customers marked with safety flag on verify account modal

    Examples:
      |folderName                           |customer_type |fuelType |
      |Bus_Safety_Flag_Qualifier_At_Differnt_Level|BUS           |BOTH     |






