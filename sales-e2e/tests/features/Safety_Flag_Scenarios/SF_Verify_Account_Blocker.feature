@test
Feature: This feature is to test the behaviour of existing customer accounts which are marked for Safety Flag

  #1
  Scenario Outline: Verify the blocker scenario for dual fuel resi account when SF 'Y' on main person
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customer_type>' plans page
    And user have selected fuel as "<fuelType>"
    When user clicks on the verify modal window on '<customer_type>' page
    And user provides below details for account verification on verify account modal window
      |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |postcode |idType |idNumber |
      |RES          |verify account |0159048044       |2171186191       |2216     |dob    |01011980 |
    Then Relevant error message is presented for customers marked with safety flag

  Examples:
    |folderName                 |customer_type |fuelType |
    |E2E_Resi_Safety_Flag_Main_Y|RES           |BOTH     |
#2

  Scenario Outline: Verify the blocker scenario for dual fuel bsme account when SF 'Y' on main person
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customer_type>' plans page
    And user have selected fuel as "<fuelType>"
    When user clicks on the verify modal window on '<customer_type>' page
    And user provides below details for account verification on verify account modal window
      |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |ABNOrACN        |idType |idNumber |
      |BUS          |verify account |7195146334       |3550989991       |19924798800     |dob    |01011980 |
    Then Relevant error message is presented for customers marked with safety flag

    Examples:
      |folderName                |customer_type |fuelType |
      |E2E_Bus_Safety_Flag_Main_Y|BUS           |BOTH     |
  #3
  Scenario Outline: Verify the blocker scenario for dual fuel resi account when SF 'P' on main person
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customer_type>' plans page
    And user have selected fuel as "<fuelType>"
    When user clicks on the verify modal window on '<customer_type>' page
    And user provides below details for account verification on verify account modal window
      |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |postcode |idType |idNumber |
      |RES          |verify account |5419576252       |2171999821       |3690     |dob    |01011980 |
    Then Relevant error message is presented for customers marked with safety flag

    Examples:
      |folderName                 |customer_type |fuelType |
      |E2E_Resi_Safety_Flag_Main_P|RES           |BOTH     |
  #4
  Scenario Outline: Verify the blocker scenario for dual fuel bsme account when SF 'P' on main person
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customer_type>' plans page
    And user have selected fuel as "<fuelType>"
    When user clicks on the verify modal window on '<customer_type>' page
    And user provides below details for account verification on verify account modal window
      |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |ABNOrACN        |idType |idNumber |
      |BUS          |verify account |5082667531       |3647287605       |11723776900     |dob    |01011980 |
    Then Relevant error message is presented for customers marked with safety flag

    Examples:
      |folderName                |customer_type |fuelType |
      |E2E_Bus_Safety_Flag_Main_P|BUS           |BOTH     |

    #5
  Scenario Outline: Verify the blocker scenario for dual fuel resi account when SF 'Y' on financial responsible person
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customer_type>' plans page
    And user have selected fuel as "<fuelType>"
    When user clicks on the verify modal window on '<customer_type>' page
    And user provides below details for account verification on verify account modal window
      |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |postcode |idType |idNumber |
      |RES          |verify account |7755334016       |6376907157       |3056     |dob    |01011980 |
    Then Relevant error message is presented for customers marked with safety flag

    Examples:
      |folderName               |customer_type |fuelType |
      |E2E_Resi_Safety_Flag_FR_Y|RES           |BOTH     |

    #6
  Scenario Outline: Verify the blocker scenario for dual fuel bsme account when SF 'P' on financial responsible person
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customer_type>' plans page
    And user have selected fuel as "<fuelType>"
    When user clicks on the verify modal window on '<customer_type>' page
    And user provides below details for account verification on verify account modal window
      |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |ABNOrACN       |idType |idNumber |
      |BUS          |verify account |6415738140       |0154814897       |18743496000    |dob    |01011980 |
    Then Relevant error message is presented for customers marked with safety flag

    Examples:
      |folderName              |customer_type |fuelType |
      |E2E_Bus_Safety_Flag_FR_P|BUS           |BOTH     |

     #7
  Scenario Outline: Verify the blocker scenario for dual fuel resi account when SF 'P' on customer contact person
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customer_type>' plans page
    And user have selected fuel as "<fuelType>"
    When user clicks on the verify modal window on '<customer_type>' page
    And user provides below details for account verification on verify account modal window
      |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |postcode |idType |idNumber |
      |RES          |verify account |2682860548       |0003528068       |2763     |dl     |997273028|
    Then Relevant error message is presented for customers marked with safety flag

    Examples:
      |folderName               |customer_type |fuelType |
      |E2E_Resi_Safety_Flag_CC_P|RES           |BOTH     |

    #8
  Scenario Outline: Verify the blocker scenario for dual fuel bsme account when SF 'Y' on customer contact person
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customer_type>' plans page
    And user have selected fuel as "<fuelType>"
    When user clicks on the verify modal window on '<customer_type>' page
    And user provides below details for account verification on verify account modal window
      |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |ABNOrACN        |idType |idNumber |
      |BUS          |verify account |2216351963       |0313731866       |30561555500     |pin    |215415753|
    Then Relevant error message is presented for customers marked with safety flag

    Examples:
      |folderName              |customer_type |fuelType |
      |E2E_Bus_Safety_Flag_CC_Y|BUS           |BOTH     |

    #9
  Scenario Outline: Verify the blocker scenario for dual fuel resi account when SF 'Y' on executor
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customer_type>' plans page
    And user have selected fuel as "<fuelType>"
    When user clicks on the verify modal window on '<customer_type>' page
    And user provides below details for account verification on verify account modal window
      |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |postcode |idType |idNumber |
      |RES          |verify account |3112210333       |5800846491       |2125     |dob    |01011980|
    Then Relevant error message is presented for customers marked with safety flag

    Examples:
      |folderName                 |customer_type |fuelType |
      |E2E_Resi_Safety_Flag_exec_Y|RES           |BOTH     |

    #10
  Scenario Outline: Verify the blocker scenario for dual fuel bsme account when SF 'P' on trustee
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customer_type>' plans page
    And user have selected fuel as "<fuelType>"
    When user clicks on the verify modal window on '<customer_type>' page
    And user provides below details for account verification on verify account modal window
      |customer_type|modal_option   |elecAccountNumber|gasAccountNumber |ABNOrACN        |idType |idNumber |
      |BUS          |verify account |5487290321       |0493002682       |21153342200     |dob    |01011980 |
    Then Relevant error message is presented for customers marked with safety flag

    Examples:
      |folderName                   |customer_type |fuelType |
      |E2E_Bus_Safety_Flag_trustee_P|BUS           |BOTH     |




