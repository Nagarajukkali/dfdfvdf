const eaCheckoutDetailsPage=require('../pages/checkOutDetails.page');
const eaCheckoutReviewPage=require('../pages/checkoutReview.page');
import {BusinessType, CustomerStatus, directDebitType, PlanType, testFunction} from '../../global_methods/helper';
import {AustralianState, CustomerType} from '@ea/ea-commons-models';
const fileUtils=require('../../libs/FileUtils.js');
const Hashes=require('jshashes');


export class checkoutDetailsMethod{

    public static map=new Map();

    public static async provideDetailsInAboutMeSection(t,journey,firstName,lastName){
        if((await testFunction.getElementText(t, eaCheckoutDetailsPage.elements.titleDropdown)).includes('Please select')){
            await testFunction.click(t,eaCheckoutDetailsPage.elements.titleDrop);
            await testFunction.click(t,eaCheckoutDetailsPage.elements.titleTag);
        }
        await this.enterFirstName(t,firstName);
        await this.enterLastName(t,lastName);
        if(journey===CustomerType.RESIDENTIAL || journey==='Campaign'){
            await this.enterDOB(t);
        }
        console.log("Details has been provided in about me section");
    }
    public static async enterFirstName(t,firstName){
        firstName = firstName ? firstName : "test";
        await testFunction.clearAndEnterText(t, eaCheckoutDetailsPage.elements.firstName, firstName);
        console.log("First name entered");
    }
    public static async enterLastName(t,lastName){
      lastName = lastName ? lastName : "test";
      await testFunction.clearAndEnterText(t, eaCheckoutDetailsPage.elements.lastName, lastName);
      console.log("Last name entered");
    }

    public static async enterDOB(t){
      await testFunction.clearAndEnterText(t,eaCheckoutDetailsPage.elements.dobDay,'01');
      await testFunction.clearAndEnterText(t,eaCheckoutDetailsPage.elements.dobMonth,'01');
      await testFunction.clearAndEnterText(t,eaCheckoutDetailsPage.elements.dobYear,'1980');
      console.log("DOB entered");
    }

   public static getScenarioId(t){
     let MD5 = new Hashes.MD5;
     let scenarioId=MD5.hex(t.testRun.test.testFile.currentFixture.name+' '+t.testRun.test.name);
     return scenarioId;
   }

   public static getEmailWithScenario(t,email){
      let scenarioId=this.getScenarioId(t);
      this.map.set(scenarioId,email);
      return this.map;
   }

    public static async provideContactDetails(t){
        let phoneNumber="03"+testFunction.getRandomNumber(99999999);
        let emailAddress=testFunction.generateRandomText(10)+'@energyaustralia.com.au';
        phoneNumber=phoneNumber.padEnd(10,"0");
        await testFunction.clearAndEnterText(t,eaCheckoutDetailsPage.elements.email,emailAddress);
        let MD5 = new Hashes.MD5;
        let scenarioId=MD5.hex(t.testRun.test.testFile.currentFixture.name+' '+t.testRun.test.name);
        this.map.set(scenarioId,emailAddress);
        await testFunction.enterText(t,eaCheckoutDetailsPage.elements.phone,phoneNumber);
        console.log("Contact details provided");
        return emailAddress;
    }
    public static async checkoutIdentification(t,customerStatus,idType, medicareType){
        if(customerStatus===CustomerStatus.EXISTING){
            await this.checkoutExistingCustomerIdentification(t,idType);
        }
        else if(customerStatus===CustomerStatus.NEW){
          if(idType === "Medicare")
            await this.checkoutNewCustomerIdentification(t,idType, medicareType);
          else
            await this.checkoutNewCustomerIdentification(t,idType, "");
        }else {
          console.error('Please select a valid customer');
        }
    }

    public static async checkoutExistingCustomerIdentification(t,idType){
        switch (idType) {
            case 'Passport':
              await this.checkoutExistingCustomerPassportIdentification(t);
              break;
            case 'Driver License':
              await this.checkoutExistingCustomerDriverLicenseIdentification(t);
              break;
            case 'Medicare':
              await this.checkoutExistingCustomerMedicareIdentification(t);
              break;
            default:
              console.error('Please select a valid identification type');
      }
    }

    public static async checkoutExistingCustomerPassportIdentification(t){
        let passportNo=testFunction.getRandomNumber(999999);
        await testFunction.click(t,eaCheckoutDetailsPage.elements.idDrop);
        await testFunction.click(t,eaCheckoutDetailsPage.elements.idValuePassport);
        await testFunction.clearAndEnterText(t,eaCheckoutDetailsPage.elements.idNumber,passportNo);
        console.log("Existing customer passport details provided");
    }

    public static async checkoutExistingCustomerDriverLicenseIdentification(t){
      let dlNo=testFunction.getRandomNumber(999999);
      await testFunction.click(t,eaCheckoutDetailsPage.elements.idDrop);
      await testFunction.click(t,eaCheckoutDetailsPage.elements.idValueDriverLicense);
      await testFunction.click(t,eaCheckoutDetailsPage.elements.idNumber);
      await testFunction.clearAndEnterText(t,eaCheckoutDetailsPage.elements.idNumber,dlNo);
      console.log("Existing customer dl details provided");
    }

    public static async checkoutExistingCustomerMedicareIdentification(t){
      let medicareNo=testFunction.getRandomNumber(999999);
      await testFunction.click(t,eaCheckoutDetailsPage.elements.idDrop);
      await testFunction.click(t,eaCheckoutDetailsPage.elements.idValueMedicare);
      await testFunction.clearAndEnterText(t,eaCheckoutDetailsPage.elements.idNumber,medicareNo);
      console.log("Existing customer medicare details provided");
    }
    public static async checkoutNewCustomerIdentification(t,idType, medicareType){
    switch (idType) {
      case "Passport":
        await this.checkoutNewCustomerPassportIdentification(t);
        break;
      case "Driver License":
        await this.checkoutNewCustomerDriverLicenseIdentification(t);
        break;
      case "Medicare":
        await this.checkoutNewCustomerMedicareIdentification(t, medicareType);
        break;
      default:
        console.error('Please select a valid ID type');
    }
  }

  public static async checkoutNewCustomerDriverLicenseIdentification(t){
    let dlNo=testFunction.getRandomNumber(999999);
    await testFunction.click(t,eaCheckoutDetailsPage.elements.idDrop);
    await testFunction.click(t,eaCheckoutDetailsPage.elements.idValueDriverLicense);
    await testFunction.click(t,eaCheckoutDetailsPage.elements.idLicenseNumber);
    await testFunction.clearAndEnterText(t,eaCheckoutDetailsPage.elements.idLicenseNumber,dlNo);
    console.log("New customer dl details provided");
  }

  public static async checkoutNewCustomerPassportIdentification(t){
    let passportNo=testFunction.getRandomNumber(999999);
    await testFunction.click(t,eaCheckoutDetailsPage.elements.idDrop);
    await testFunction.click(t,eaCheckoutDetailsPage.elements.idValuePassport);
    await testFunction.clearAndEnterText(t,eaCheckoutDetailsPage.elements.idPassportNumber,passportNo);
    await testFunction.clearAndEnterText(t,eaCheckoutDetailsPage.elements.idCountry,'Australia');
    console.log("New customer passport details provided");
  }

  public static async checkoutNewCustomerMedicareIdentification(t, medicareType){
    let medicareNo = testFunction.getRandomNumber(9999999999);
    await testFunction.click(t,eaCheckoutDetailsPage.elements.idDrop);
    await testFunction.click(t,eaCheckoutDetailsPage.elements.idValueMedicare);
    if(medicareType.toLowerCase() === "green") {
      await testFunction.click(t, eaCheckoutDetailsPage.elements.medicareColorGreen);
      await testFunction.clearAndEnterText(t, eaCheckoutDetailsPage.elements.idMedicareValidMM, '01');
      await testFunction.clearAndEnterText(t, eaCheckoutDetailsPage.elements.idMedicareValidYYYY, '2025');
    } else {
      if(medicareType.toLowerCase() === "blue") {
        await testFunction.click(t, eaCheckoutDetailsPage.elements.medicareColorBlue);
      }else if(medicareType.toLowerCase() === "yellow") {
        await testFunction.click(t, eaCheckoutDetailsPage.elements.medicareColorYellow);
      }
      await testFunction.clearAndEnterText(t,eaCheckoutDetailsPage.elements.idMedicareValidDD,'01');
      await testFunction.clearAndEnterText(t,eaCheckoutDetailsPage.elements.idMedicareValidMM,'01');
      await testFunction.clearAndEnterText(t,eaCheckoutDetailsPage.elements.idMedicareValidYY,'25');
    }
    await testFunction.clearAndEnterText(t,eaCheckoutDetailsPage.elements.idMedicareNumber,medicareNo);
    await testFunction.clearAndEnterText(t,eaCheckoutDetailsPage.elements.idMedicareRef,'1');

    console.log("New customer medicare details provided");
  }

  public static async clickOnReviewYourOrderBtn(t){
    await testFunction.waitForLoadingIconToClose();
    await t.wait(5000);
    await testFunction.click(t,eaCheckoutDetailsPage.elements.reviewYourOrderBtn);
    await testFunction.isElementVisible(t,eaCheckoutReviewPage.elements.reviewYourOfferTxt);
    console.log("Navigated to review page");
  }

  public static async accessRestriction(t,electricityAccess:String,gasAccess){
      if(electricityAccess==='No'){
        await testFunction.click(t, eaCheckoutDetailsPage.elements.electricityAccessNo);
      }
      if(gasAccess==='No'){
        await testFunction.click(t, eaCheckoutDetailsPage.elements.gasAccessNo);
      }
      console.log("Access restriction option is selected");
  }
  public static async propertyRenovationNo(t,state){
      if(state===AustralianState.VIC){
        await testFunction.click(t,eaCheckoutDetailsPage.elements.prevHomeImproveNo);
        await testFunction.click(t,eaCheckoutDetailsPage.elements.planHomeImproveNo);
        console.log("Property renovation option is selected");
      }
  }
  public static async provideBusinessDetails(t,businessType){
      if(businessType===BusinessType.ABN){
        let ABN=testFunction.getRandomNumber(99999999999);
        ABN = ABN.padEnd(11, "0");
        await testFunction.click(t,eaCheckoutDetailsPage.elements.ABN);
        await testFunction.clearAndEnterText(t,eaCheckoutDetailsPage.elements.number_ABNACN,ABN);
      }
      else if(businessType===BusinessType.ACN){
        let ACN=testFunction.getRandomNumber(999999999);
        ACN = ACN.padEnd(9, "0");
        await testFunction.click(t,eaCheckoutDetailsPage.elements.ACN);
        await testFunction.clearAndEnterText(t,eaCheckoutDetailsPage.elements.number_ABNACN,ACN);
      }else {
        console.error('ABN/ACN is not valid');
      }
      await testFunction.clearAndEnterText(t,eaCheckoutDetailsPage.elements.company,'NA');
      if((await testFunction.getElementText(t,eaCheckoutDetailsPage.elements.businessType)).includes('Please select')){
        await testFunction.click(t,eaCheckoutDetailsPage.elements.businessType);
        await t.wait(2000);
        await testFunction.click(t,eaCheckoutDetailsPage.elements.businessTypeOption);
        await t.wait(2000);
      }
      if((await testFunction.getElementText(t,eaCheckoutDetailsPage.elements.anzsicCode)).includes('Please select')){
        await testFunction.click(t,eaCheckoutDetailsPage.elements.anzsicCode);
        await testFunction.click(t,eaCheckoutDetailsPage.elements.anzsicCodeOption);
      }
      console.log("Business details are provided");
  }

  public static async addAAHDetails(t) {
    let fName = "FNAME" + testFunction.generateRandomText(5);
    let lName = "LNAME" + testFunction.generateRandomText(5);
    let email = testFunction.generateRandomText(5) + "@test.com";
    await testFunction.click(t, eaCheckoutDetailsPage.elements.addAAH);
    await testFunction.clearAndEnterText(t, eaCheckoutDetailsPage.elements.aahFirstName, fName);
    await testFunction.clearAndEnterText(t, eaCheckoutDetailsPage.elements.aahLastName, lName);
    await testFunction.clearAndEnterText(t, eaCheckoutDetailsPage.elements.aahEmail, email);
    await t.wait(2000);
    await testFunction.click(t, eaCheckoutDetailsPage.elements.aahPermissionLvl2);
    console.log("AAH details provided");
  }

  public static async addDirectDebit(t, DDType) {
    await testFunction.click(t, eaCheckoutDetailsPage.elements.addDirectDebit);
    if(DDType === directDebitType.BANK_ACCOUNT) {
      await testFunction.clearAndEnterText(t, eaCheckoutDetailsPage.elements.tfBankAccountName, "AccountName_" + testFunction.generateRandomText(5));
      await testFunction.clearAndEnterText(t, eaCheckoutDetailsPage.elements.tfBsb, testFunction.getRandomNumber(999999));
      await testFunction.clearAndEnterText(t, eaCheckoutDetailsPage.elements.tfBankAccountNumber, testFunction.getRandomNumber(9999999999));
      await t.wait(3000);
      await testFunction.click(t, eaCheckoutDetailsPage.elements.cbBankAccountAgreeTermsAndCond);
      console.log("Bank details provided");
    } else if(DDType === directDebitType.CREDIT_CARD) {
      await testFunction.click(t, eaCheckoutDetailsPage.elements.useCC);
      await testFunction.clearAndEnterText(t, eaCheckoutDetailsPage.elements.tfCCName, "CCName_" + testFunction.generateRandomText(5));
      await testFunction.clearAndEnterText(t, eaCheckoutDetailsPage.elements.tfCCNumber, "4111111111111111");
      await testFunction.clearAndEnterText(t, eaCheckoutDetailsPage.elements.tfCCExpiryMonth, "01");
      await testFunction.clearAndEnterText(t, eaCheckoutDetailsPage.elements.tfCCExpiryYear, "30");
      await testFunction.click(t, eaCheckoutDetailsPage.elements.cbCCAgreeTermsAndCond);
      console.log("CC details provided");
    }

  }

  public static async disconnectionDetails(t,disconnectionOption){
      if(disconnectionOption==='Yes') {
        if(!(await testFunction.isElementVisible(t, eaCheckoutDetailsPage.elements.disconnectionCalendarError))){
          await testFunction.click(t,eaCheckoutDetailsPage.elements.rdbEleDisconnectionYes);
          await testFunction.click(t,eaCheckoutDetailsPage.elements.rdbEleAccessRestrictionNo);
          await testFunction.click(t,eaCheckoutDetailsPage.elements.rdbGasAccessRestrictionNo);
          await testFunction.click(t,eaCheckoutDetailsPage.elements.renovationNo);
        }
        else if(await testFunction.isElementVisible(t,eaCheckoutDetailsPage.elements.disconnectionCalendarError)) {
          let errorMsg = await testFunction.getElementText(t, eaCheckoutDetailsPage.elements.disconnectionCalendarError);
          if (errorMsg.includes("Electricity Account")) {
            await testFunction.click(t, eaCheckoutDetailsPage.elements.rdbEleDisconnectionYes);
            await testFunction.click(t, eaCheckoutDetailsPage.elements.rdbGasAccessRestrictionNo);
          } else if (errorMsg.includes("Gas Account")) {
            await testFunction.click(t, eaCheckoutDetailsPage.elements.rdbEleDisconnectionYes);
            await testFunction.click(t, eaCheckoutDetailsPage.elements.rdbEleAccessRestrictionNo);
          }
      }
        else{
          console.error("disconnection has some issues");
        }
      }
      else if(disconnectionOption==='No'){
        await testFunction.click(t,eaCheckoutDetailsPage.elements.rdbEleDisconnectionNo);
      }
      else{
        console.error("Disconnection is not chosen")
      }
  }

  public static async selectPlan(t,elePlan,gasPlan){
      await testFunction.isElementVisible(t,eaCheckoutDetailsPage.elements.plansExpand);
      if(elePlan){
        await this.selectElePlan(t,elePlan);
      }
      if(gasPlan){
        await this.selectGasPlan(t,gasPlan);
      }
  }
  public static async selectElePlan(t,elePlan:String){
    switch(elePlan){
      case PlanType.BASIC_HOME:
        await testFunction.click(t,eaCheckoutDetailsPage.elements.basicElePlan);
        break;
      case PlanType.NO_FRILLS:
        await testFunction.click(t,eaCheckoutDetailsPage.elements.noFrillsElePlan);
        break;
      case PlanType.TOTAL_PLAN:
        await testFunction.click(t,eaCheckoutDetailsPage.elements.totalElePlan);
        break;
      case PlanType.TOTAL_PLAN_PLUS:
        await testFunction.click(t,eaCheckoutDetailsPage.elements.totalPlanPlusEle);
        break;
      case PlanType.BASIC_BUSINESS:
        await testFunction.click(t,eaCheckoutDetailsPage.elements.basicEleBusiness);
        break;
      case PlanType.NO_FRILLS_BUSINESS:
        await testFunction.click(t,eaCheckoutDetailsPage.elements.noFrillEleBusiness);
        break;
      case PlanType.TOTAL_BUSINESS:
        await testFunction.click(t,eaCheckoutDetailsPage.elements.totalElePlanBusiness);
        break;
      case PlanType.TOTAL_PLAN_PLUS_BUSINESS:
        await testFunction.click(t,eaCheckoutDetailsPage.elements.totalPlanPlusEleBusiness);
        break;
      default:
        console.error("Invalid plan type");
    }
  }
  public static async selectGasPlan(t,gasPlan:String){
    switch(gasPlan){
      case PlanType.BASIC_HOME:
        await testFunction.click(t,eaCheckoutDetailsPage.elements.basicGasPlan);
        break;
      case PlanType.NO_FRILLS:
        await testFunction.click(t,eaCheckoutDetailsPage.elements.noFrillsGasPlan);
        break;
      case PlanType.TOTAL_PLAN:
        await testFunction.click(t,eaCheckoutDetailsPage.elements.totalGasPlan);
        break;
      case PlanType.TOTAL_PLAN_PLUS:
        await testFunction.click(t,eaCheckoutDetailsPage.elements.totalPlanPlusGas);
        break;
      case PlanType.BASIC_BUSINESS:
        await testFunction.click(t,eaCheckoutDetailsPage.elements.basicGasBusiness);
        break;
      case PlanType.NO_FRILLS_BUSINESS:
        await testFunction.click(t,eaCheckoutDetailsPage.elements.noFrillGasBusiness);
        break;
      case PlanType.TOTAL_BUSINESS:
        await testFunction.click(t,eaCheckoutDetailsPage.elements.totalGasPlanBusiness);
        break;
      case PlanType.TOTAL_PLAN_PLUS_BUSINESS:
        await testFunction.click(t,eaCheckoutDetailsPage.elements.totalPlanPlusGasBusiness);
        break;
      default:
        console.error("Invalid plan type");
    }
  }
  public static async selectCarbonNeutralOption(t){
      await testFunction.click(t,eaCheckoutDetailsPage.elements.chkboxCarbonNeutral);
  }

  public static async selectBillingPreference(t: any, option: string, otherAddress: string) {
    switch (option) {
      case "Email":
        await testFunction.click(t, eaCheckoutDetailsPage.elements.rbBillPrefEmail);
        break;
      case "Connection address":
        await testFunction.click(t, eaCheckoutDetailsPage.elements.rbBillPrefConnectionAddress);
        break;
      case "Other address":
        await testFunction.click(t, eaCheckoutDetailsPage.elements.rbBillPrefOtherAddress);
        await testFunction.clearAndEnterText(t, eaCheckoutDetailsPage.elements.tfBillPrefOtherAddress, otherAddress);
        await t.wait(3000);
        await testFunction.click(t, eaCheckoutDetailsPage.elements.serviceAddressList);
        await t.wait(2000);
        break;
      default:
        console.error("Invalid bill pref selected.");
    }
  }
}
