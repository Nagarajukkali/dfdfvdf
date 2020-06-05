@safetyflag
Feature: This feature is to test the behaviour of existing customer accounts which are marked for Safety Flag through qualifier

# Following scenarios are considering both Elec and Gas having same Main Person
  #1
  Scenario Outline: Verify the blocker scenario for dual fuel resi account when SF 'Y' on main person through campaign
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "2000" and clicks on show me plan link
    And user clicks on Add plan button
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
    |folderName                                |campaign|
    |Resi_Safety_Flag_Qualifier_Main_Y_Campaign|offer|

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
  Scenario Outline: Verify the blocker scenario for dual fuel resi account when SF 'P' on main person through bill uploader
    Given user has opened the bill uploader website link in a browser and creates '<folderName>' to save evidences
    When user clicks on upload bill button
    And user uploads the '<billName>' bill
    And user selects the recommended plan
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
      |folderName                                  |billName|
      |Resi_Safety_Flag_Qualifier_Main_P_billUpload|Bill.pdf|
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
    And user has navigated to 'RES' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects 'Existing' on qualifier
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |3072411876   |Postcode           |3021            |dl    |DL456783|
    Then user can able to proceed further through qualifier
    When user navigates back to account verification section from moving question and clears all the previously provided details
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue|
      |Existing      |6257938603   |Postcode           |3021            |dl    |456892|
    Then Relevant error message is presented for customers marked with safety flag on qualifier

    Examples:
      |folderName                           |planName|
      |Resi_Safety_Flag_Qualifier_Main_Gas_Y|Total Plan|

    #2
  Scenario Outline: Verify the blocker scenario for dual fuel bsme account when SF 'P' on elec customer contact person
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'BUS' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects 'Existing' on qualifier
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |3859760000   |ABN                |22021270900     |pin   |43576872|
    Then Relevant error message is presented for customers marked with safety flag on qualifier
    When user navigates back to account verification section and clears all the previously provided details
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |5367101000   |ABN                |22021270900     |pin   |43576872|
    Then user can able to proceed further through qualifier

    Examples:
      |folderName                         |planName|
      |Bus_Safety_Flag_Qualifier_CC_Elec_P|Total Business|

    #3
  Scenario Outline: Verify the blocker scenario for dual fuel resi account when SF 'P' on gas partner
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects 'Existing' on qualifier
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |0005041000   |Postcode           |2323            |dl    |DL346778|
    Then user can able to proceed further through qualifier
    When user navigates back to account verification section from moving question and clears all the previously provided details
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue|
      |Existing      |4921480000   |Postcode           |2323            |dl    |DL346778|
    Then Relevant error message is presented for customers marked with safety flag on qualifier

    Examples:
      |folderName                              |planName|
      |Resi_Safety_Flag_Qualifier_Partner_Gas_P|Total Plan|

    #4
  Scenario Outline: Verify the blocker scenario for dual fuel resi account when SF 'U' on any person
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects 'Existing' on qualifier
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |9681150000   |Postcode           |2075            |dob   |01011980|
    Then user can able to proceed further through qualifier
    When user navigates back to account verification section from moving question and clears all the previously provided details
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |6475322000   |Postcode           |2075            |dob   |01011980|
    Then user can able to proceed further through qualifier

    Examples:
      |folderName                            |planName|
      |Resi_Safety_Flag_Qualifier_AnyPerson_U|Total Plan|

    #Following scenarios for single fuel accounts
    #1

  Scenario Outline: Verify the blocker scenario for single fuel resi account when SF 'Y' on elec main person through move house
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    When user has navigated to move house page
    And user enters '<movingAddress>' in address field and selects any available moving date
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |0003090000   |Postcode           |2323            |dob   |01011980|
    Then Relevant error message is presented for customers marked with safety flag on qualifier

    Examples:
      |folderName                                            |movingAddress|
      |Resi_Safety_Flag_Qualifier_Single_Main_Ele_Y_MoveHouse|5 Wilkies Street, BULLI NSW 2516|

    #2
  Scenario Outline: Verify the blocker scenario for single fuel bsme account when SF 'P' on elec associate person
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'BUS' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects 'Existing' on qualifier
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |1730907966   |ABN                |62969568900     |dob   |01011980|
    Then Relevant error message is presented for customers marked with safety flag on qualifier

    Examples:
      |folderName                                      |planName|
      |Bus_Safety_Flag_Qualifier_Single_Associate_Ele_P|Basic Business|

    #3
  Scenario Outline: Verify the blocker scenario for single fuel resi account when SF 'P' on gas spouse
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects 'Existing' on qualifier
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |0000132158   |Postcode           |5161            |dob   |01011980|
    Then Relevant error message is presented for customers marked with safety flag on qualifier

    Examples:
      |folderName                                    |planName|
      |Resi_Safety_Flag_Qualifier_Single_Spouse_Gas_P|Total Plan|

     #4
  Scenario Outline: Verify the blocker scenario for single fuel bsme account when SF 'Y' on gas main person
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'BUS' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects 'Existing' on qualifier
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |1912374634   |ABN                |11211590600     |pin   |546576588|
    Then Relevant error message is presented for customers marked with safety flag on qualifier

    Examples:
      |folderName                                 |planName|
      |Bus_Safety_Flag_Qualifier_Single_Main_Gas_Y|Total Business|

    #5
  Scenario Outline: Verify the blocker scenario for single fuel resi account when SF 'U' on elec any person
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects 'Existing' on qualifier
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |0009092000   |Postcode           |2322            |dob   |01011980|
    Then user can able to proceed further through qualifier

    Examples:
      |folderName                                  |planName|
      |Resi_Safety_Flag_Qualifier_Single_AnyP_Ele_U|Total Plan|

    #6
  Scenario Outline: Verify the blocker scenario for single fuel bsme account when SF 'U' on gas any person
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'BUS' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects 'Existing' on qualifier
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |8480418639   |ABN                |13994073700     |dl   |DL1567576|
    Then user can able to proceed further through qualifier

    Examples:
      |folderName                                 |planName|
      |Bus_Safety_Flag_Qualifier_Single_AnyP_Gas_U|Total Business|

    #Following scenarios for accounts having different levle of access on different level of persons
  #1
  Scenario Outline: Verify the blocker scenario for dual fuel resi account when SF 'U', 'P' and 'Y' on main person, customer contact person and financial responsible person respectively
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'RES' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects 'Existing' on qualifier
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |6498303250    |Postcode           |3207            |dob   |01011980|
    Then Relevant error message is presented for customers marked with safety flag on qualifier
    When user navigates back to account verification section and clears all the previously provided details
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |9112659490   |Postcode           |3207            |dob   |01011980|
    Then Relevant error message is presented for customers marked with safety flag on qualifier

    Examples:
      |folderName                                  |planName|
      |Resi_Safety_Flag_Qualifier_At_Differnt_Level|Total Plan|

  #2
  Scenario Outline: Verify the blocker scenario for dual fuel bsme account when SF 'U', 'P' and 'Y' on financial responsible person, main person and customer contact person respectively
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to 'BUS' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects 'Existing' on qualifier
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |5008317914   |ABN                |23617305400     |dob   |01011980|
    Then Relevant error message is presented for customers marked with safety flag on qualifier
    When user navigates back to account verification section and clears all the previously provided details
    And user verifies account on qualifier
      |customerStatus|accountNumber|accountIdentityType|postcodeOrABNACN|idType|idValue |
      |Existing      |8065853620   |ABN                |23617305400     |dob   |01011980|
    Then Relevant error message is presented for customers marked with safety flag on qualifier

    Examples:
      |folderName                                 |planName|
      |Bus_Safety_Flag_Qualifier_At_Differnt_Level|Total Business|






