#@NMIMIRNAddressValidation @E2E
Feature: This feature is to test the NMI, MIRN and address validation

  #Scenario Outline: verify the behaviour of plans page on entering '<NMIorMIRNorPostcodeType>'
    #Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    #And user has navigated to '<customerType>' plans page
    #And user enters '<NMIorMIRNorPostcodeValue>' in '<NMIorMIRNorPostcode>' field
    #Then plans page load according to the type of '<NMIorMIRNorPostcodeType>'

  Scenario Outline: verify the behaviour of plans page on entering postcode for Postcode on plans page
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customerType>' plans page
    When user enters the postcode "<Postcode>" on plans page
    Then plans page load according to the type of '<addressType>'

    Examples:
      | folderName                        | customerType | addressType            | Postcode | 
      | Resi_POSTCODE_NOT_SERVICED           | RES          | POSTCODE_NOT_SERVICED   | 4600     |            
      | Resi_STATE_NOT_SERVICED              | RES          | STATE_NOT_SERVICED      | 6000     |           
      #Extinct NMI
      #| Extinct_NMI_BLOCKED               | RES          | NMI_BLOCKED             | 6305132344               | NMI                 |
      #Parent embedded Network
      #Regression defect raised DG-25820
#      |Parent_Embedde_Network_NMI_BLOCKED|RES         |NMI_BLOCKED            |6305824268              |NMI                |
      #Child Embedded Network NMI
      #| Child_Embedde_Network_NMI_BLOCKED | RES          | NMI_BLOCKED             | 6305899601               | NMI                 |
      #CnI NMI
      #| CnI_NMI_BLOCKED                   | RES          | NMI_BLOCKED             | 7001182664               | NMI                 |
      #Invalid Customer type Resi NMI on Bus
      #| Bus_INVALID_CUSTOMER_TYPE         | BUS          | INVALID_CUSTOMER_TYPE   | 64075570879              | NMI                 |
       #Invalid Customer type Bus NMI on Resi
      #| Resi_INVALID_CUSTOMER_TYPE        | RES          | INVALID_CUSTOMER_TYPE   | 64073631673              | NMI                 |
      #Address where we don't supply gas
      #| GAS_NOT_SERVICED_NMI              | RES          | GAS_NOT_SERVICED        | 20015938669              | NMI                 |
      #Address where we don't supply electricity
      #|ELE_NOT_SERVICED_NMI             |RES         |ELE_NOT_SERVICED       |20015938669             |NMI                |
       #Regression defect raised DG-25820
#      |NMI_NOT_FOUND                     |RES         |NMI_NOT_FOUND          |6435787996              |NMI                |
#      |MIRN_NOT_FOUND                    |BUS         |MIRN_NOT_FOUND         |5467868933              |MIRN               |
      #|NMI_ADDRESS_NOT_SERVICED          |RES         |ADDRESS_NOT_SERVICED   |6102633815              |NMI                |
      #| Valid_NMI                         | RES          | SUCCESS                 | 6407557087               | NMI                 |
      #| Valid_MIRN                        | RES          | SUCCESS                 | 5321574765               | MIRN                |


  Scenario Outline: verify the behaviour of lookup call when we provide '<addressType>' address on qualifier
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customerType>' plans page
    When user selects '<planName>'
    And user moves on to fill the qualifier
    And user selects '<customerStatus>' on qualifier
    And user selects '<movingType>' for moving question on qualifier
    And user enters the address '<address>' on qualifier
    Then relevant popup displays for provided '<addressType>'

    Examples:
      | folderName                         | customerType | planName              | customerStatus | movingType | address                                  | addressType           |
    #Invalid Customer type Business Address on Resi page
      #| Address_Resi_INVALID_CUSTOMER_TYPE | RES          | Total Plan            | New            | Non-Moving | 12 Atherton Road, OAKLEIGH VIC 3166      | INVALID_CUSTOMER_TYPE |
    #Invalid Customer type Resi Address on Business page
      #| Address_Bus_INVALID_CUSTOMER_TYPE  | BUS          | Total Plan - Business | New            | Non-Moving | 271 Heatherhill Road, FRANKSTON VIC 3199 | INVALID_CUSTOMER_TYPE |
    #Address where we don't provide energy
      #| ADDRESS_NOT_SERVICED               | RES          | Total Plan            | New            | Non-Moving | 48 East Bagdad Road, BAGDAD TAS 7030     | ADDRESS_NOT_SERVICED  |
    #Address where we don't provide electricity
    #|ELE_NOT_SERVICED_ADDRESS        |RES         |Total Plan    |New           |Non-Moving|48 East Bagdad Road, BAGDAD TAS 7030    |ELE_NOT_SERVICED     |
    #Address where we don't provide gas
     #| GAS_NOT_SERVICED_ADDRESS           | RES          | Total Plan            | New            | Non-Moving | 27 Munnell Street, GULARGAMBONE NSW 2828 | GAS_NOT_SERVICED      |
    #Address having meter type which we don't allow
      #| Address_INVALID_METER_TYPE         | RES          | Total Plan            | New            | Non-Moving | 23-29 Bourke Street, MELBOURNE VIC 3000  | INVALID_METER_TYPE    |
    #Address where selected plan is not available
      #| Address_PLAN_NOT_AVAILABLE         | RES          | Total Plan            | New            | Non-Moving | 12 Abattoir Lane, AVOCA VIC 3467         | PLAN_NOT_AVAILABLE    |
    #NSW Remote meter which is remotely disconnected
      | Address_NSW_REMOTE_METER      | RES          | Total Plan            | New            | Moving| 1 Amblecote Place, TAHMOOR NSW 2573         | NSW_REMOTE_METER     |

  Scenario Outline: verify the behaviour of campaign page on entering '<NMIorMIRNorPostcodeType>' where we don't offer that campaign
    Given user has opened the '<campaign>' link in a browser and creates '<folderName>' to save evidences
    When user provides "1234" and "<postcode>" and clicks on show me plan link
    Then plans page load according to the type of '<NMIorMIRNorPostcodeType>'

    Examples:
      | folderName            | campaign | NMIorMIRNorPostcodeType | postcode |
      | CAMPAIGN_NOT_SERVICED | nsw-seniors  | CAMPAIGN_NOT_SERVICED   | 3000     |


  Scenario Outline: verify the behaviour of plans page on entering '<addressType>' 
    Given user has opened the website link in a browser and creates '<folderName>' to save evidences
    And user has navigated to '<customerType>' plans page
    When user enters the address "<address>" on plans page
    Then plans page load according to the type of '<addressType>'

    Examples:
      | folderName                         | customerType   | address                   | addressType      |
    #Invalid Customer type Business Address on Resi page
      | Address_Resi_INVALID_CUSTOMER_TYPE | RES          | 12 Atherton Road, OAKLEIGH VIC 3166      | INVALID_CUSTOMER_TYPE | 
    #Invalid Customer type Resi Address on Business page
      | Address_Bus_INVALID_CUSTOMER_TYPE  | BUS          | 271 Heatherhill Road, FRANKSTON VIC 3199 | INVALID_CUSTOMER_TYPE | 
    #Address where we don't provide energy
      | ADDRESS_NOT_SERVICED               | RES          | 48 East Bagdad Road, BAGDAD TAS 7030     | ADDRESS_NOT_SERVICED  | 
    #Address where we don't provide electricity
    #|ELE_NOT_SERVICED_ADDRESS        |RES         |48 East Bagdad Road, BAGDAD TAS 7030    |ELE_NOT_SERVICED     | Address |
    #Address where we don't provide gas
      | GAS_NOT_SERVICED_ADDRESS           | RES          | 27 Munnell Street, GULARGAMBONE NSW 2828 | GAS_NOT_SERVICED      | 
    #Address having meter type which we don't allow
      | Address_NMI_BLOCKED        | RES          | 23-29 Bourke Street, MELBOURNE VIC 3000  | NMI_BLOCKED     | 
    #Address where selected plan is not available
      | Address_Valid            | RES          | 12 Abattoir Lane, AVOCA VIC 3467        | SUCCESS    | 
    #NSW Remote meter which is remotely disconnected
      | Address_NSW_REMOTE_METER           | RES         | 1 Amblecote Place, TAHMOOR NSW 2573          | NSW_REMOTE_METER     | 


