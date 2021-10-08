@nsw_remote_fdv_myaccount
Feature: This feature is to test the nsw remote meter behaviour of NSW remote meterfor My Account Journeys

  Scenario Outline: Verify the upsell scenario for my account profile nsw remote meter
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user navigates to my account login page
    When user logs in to my account using '<username>' and '<password>'
    And user clicks on compare plans button
    Then user validates the nsw remote meter risk on checkout

    Examples:
      |folderName             |username                      |password                                     |
      |MyAccount_Resi_NSW_FDV |NswRemotemeterUpsell@test.com |U2FsdGVkX19KDshsVuQ41GmzG8PmwOwD0BYmzk2y76o= |


  Scenario Outline: Verify the move house scenario for my account nsw remote meter
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user navigates to my account login page
    When user logs in to my account using '<username>' and '<password>'
    And user clicks on move home link for 'ELE'
    And user enters service address as '<address>'
    And user selects connection date
    And user clicks on lets get moving button
    Then relevant error message is presented for customers marked with NSW remote meter risk on plans page
    Examples:
      |folderName                      |address                             |username          |password                                     |
      |MyAccount_Resi_NSW_FDV_movehome |9 Diver Street, THE PONDS NSW 2769  |nsw_rm_fv@test.com |U2FsdGVkX1+3MyLorZu94Wagym+aqL+FRXYs4GSvHB0= |


