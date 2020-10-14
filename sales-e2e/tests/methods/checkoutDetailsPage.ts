import {getTestCafeRC, width} from '../step_definitions/hooks';

const eaCheckoutDetailsPage=require('../pages/checkOutDetails.page');
const eaCheckoutReviewPage=require('../pages/checkoutReview.page');
import {
  BusinessType,
  CustomerStatus,
  directDebitType,
  PlanType,
  testFunction,
  cdeResponses,
  scrollTo, setAttribute
} from '../../global_methods/helper';
import {AustralianState, CustomerType} from '@ea/ea-commons-models';
const Hashes=require('jshashes');
import {myAccountMethod} from '../methods/myAccountPage';
import {ClientFunction} from 'testcafe';

export class checkoutDetailsMethod{

    public static map=new Map();

    public static async provideDetailsInAboutMeSection(t,journey,firstName,lastName,customerStatus){
        if((await testFunction.getElementText(t, eaCheckoutDetailsPage.elements.titleDropdown)).includes('Please select')){
            await t.wait(1000);
            await testFunction.click(t,eaCheckoutDetailsPage.elements.titleDrop);
            await t.wait(2000);
            let indexForTitle=testFunction.getRandomInt(0,4);
            await testFunction.click(t,eaCheckoutDetailsPage.elements.titleTag.nth(indexForTitle));
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
   }

    public static async provideContactDetails(t){
        let isValidatingUI = await testFunction.isValidatingUI();
        let phoneNumber = isValidatingUI ? "0444444444" : "03"+testFunction.getRandomNumber(99999999);
        let emailAddress = isValidatingUI ? "test@energyaustralia.com.au" : testFunction.generateRandomText(10)+'@energyaustralia.com.au';
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

    public static async checkoutExistingCustomerDriverLicenseIdentification(t, licenseNumber?: string){
      licenseNumber = licenseNumber ? licenseNumber : testFunction.getRandomNumber(999999);
      await testFunction.click(t,eaCheckoutDetailsPage.elements.idDrop);
      await testFunction.click(t,eaCheckoutDetailsPage.elements.idValueDriverLicense);
      await testFunction.click(t,eaCheckoutDetailsPage.elements.idNumber);
      await testFunction.clearAndEnterText(t,eaCheckoutDetailsPage.elements.idNumber,licenseNumber);
      console.log("Existing customer dl details provided");
    }

    public static async checkoutExistingCustomerMedicareIdentification(t){
      let medicareNo=testFunction.getRandomNumber(999999).padEnd(10,"0");
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
        await testFunction.isValidatingUI() ? await this.checkoutNewCustomerDriverLicenseIdentification(t, "testDL") : await this.checkoutNewCustomerDriverLicenseIdentification(t);
        break;
      case "Medicare":
        await this.checkoutNewCustomerMedicareIdentification(t, medicareType);
        break;
      default:
        console.error('Please select a valid ID type');
    }
  }

  public static async checkoutNewCustomerDriverLicenseIdentification(t, licenseNumber?: string){
    licenseNumber = licenseNumber ? licenseNumber : testFunction.getRandomNumber(999999);
    await testFunction.click(t,eaCheckoutDetailsPage.elements.idDrop);
    await testFunction.click(t,eaCheckoutDetailsPage.elements.idValueDriverLicense);
    await testFunction.click(t,eaCheckoutDetailsPage.elements.idLicenseNumber);
    await testFunction.clearAndEnterText(t,eaCheckoutDetailsPage.elements.idLicenseNumber,licenseNumber);
    await testFunction.click(t,eaCheckoutDetailsPage.elements.stateOfIssue);
    let indexForState=await testFunction.getRandomInt(0,7);
    await testFunction.click(t,eaCheckoutDetailsPage.elements.stateOfIssueDropdown.nth(indexForState));
    console.log("New customer dl details provided");
  }

  public static async checkoutNewCustomerPassportIdentification(t){
    let passportNo = await testFunction.isValidatingUI() ? "PPTest" : testFunction.getRandomNumber(999999);
    await testFunction.click(t,eaCheckoutDetailsPage.elements.idDrop);
    await testFunction.click(t,eaCheckoutDetailsPage.elements.idValuePassport);
    await testFunction.clearAndEnterText(t,eaCheckoutDetailsPage.elements.idPassportNumber,passportNo);
    await testFunction.clearAndEnterText(t,eaCheckoutDetailsPage.elements.idCountry,'Australia');
    console.log("New customer passport details provided");
  }

  public static async checkoutNewCustomerMedicareIdentification(t, medicareType){
    let medicareNo = await testFunction.isValidatingUI() ? "MedicareTest" : testFunction.getRandomNumber(9999999999).padEnd(10,"0");
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
    await t.wait(7000);
    await testFunction.click(t,eaCheckoutDetailsPage.elements.reviewYourOrderBtn);
    await testFunction.isElementVisible(t,eaCheckoutReviewPage.elements.reviewYourOfferTxt);
    console.log("Navigated to review page");
  }

  public static async clickOnNextBtn(t){
    await testFunction.click(t,eaCheckoutDetailsPage.elements.btnNext);
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
      businessType = businessType.toUpperCase();
      if(businessType===BusinessType.ABN){
        let ABN = await testFunction.isValidatingUI() ? "11111111111" : testFunction.getRandomNumber(99999999999);
        ABN = ABN.padEnd(11, "0");
        await t.wait(2000);
        await testFunction.click(t,eaCheckoutDetailsPage.elements.ABN);
        await testFunction.clearAndEnterText(t,eaCheckoutDetailsPage.elements.number_ABNACN,ABN);
      }
      else if(businessType===BusinessType.ACN){
        let ACN = await testFunction.isValidatingUI() ? "111111111" : testFunction.getRandomNumber(999999999);
        ACN = ACN.padEnd(9, "0");
        await t.wait(2000);
        await testFunction.click(t,eaCheckoutDetailsPage.elements.ACN);
        await testFunction.clearAndEnterText(t,eaCheckoutDetailsPage.elements.number_ABNACN,ACN);
      }else {
        console.error('ABN/ACN is not valid');
      }
      let businessName=this.getBusinessName(t.testRun.test.name);
      await testFunction.clearAndEnterText(t,eaCheckoutDetailsPage.elements.company,businessName);
      await t.wait(2000);
      let indexForBusinessType=testFunction.getRandomInt(0,9);
      let indexForAnZsicCode=testFunction.getRandomInt(0,17);
      if((await testFunction.getElementText(t,eaCheckoutDetailsPage.elements.businessType)).includes('Please select')){
        await testFunction.click(t,eaCheckoutDetailsPage.elements.businessType);
        await t.wait(2000);
        await testFunction.click(t,eaCheckoutDetailsPage.elements.businessTypeOption.nth(indexForBusinessType));
        await t.wait(2000);
      }
      if((await testFunction.getElementText(t,eaCheckoutDetailsPage.elements.anzsicCode)).includes('Please select')){
        await testFunction.click(t,eaCheckoutDetailsPage.elements.anzsicCode);
        await testFunction.click(t,eaCheckoutDetailsPage.elements.anzsicCodeOption.nth(indexForAnZsicCode));
      }
      console.log("Business details are provided");
  }

  public static async provideBusinessDetails_MA(t){
      await testFunction.click(t,eaCheckoutDetailsPage.elements.businessType);
      await t.wait(2000);
      await testFunction.click(t,eaCheckoutDetailsPage.elements.businessTypeOption);
      await t.wait(2000);
      await testFunction.click(t,eaCheckoutDetailsPage.elements.anzsicCode);
      await testFunction.click(t,eaCheckoutDetailsPage.elements.anzsicCodeOption);
  }

  public static getBusinessName(scenarioName){
    let businessName;
    let testName=scenarioName.toLowerCase();
    switch (true) {
      case testName.includes("accept with condition"):
        businessName="AcceptCond";
        break;
      case testName.includes("accept"):
        businessName="accept";
        break;
      case testName.includes("decline"):
        businessName="decline";
        break;
      case testName.includes("error"):
        businessName="error";
        break;
      default:
        businessName="NA";
    }
    return businessName;
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
    let indexForAccessLevel=testFunction.getRandomInt(0,2)
    if(testFunction.isTablet()){
      await testFunction.click(t,eaCheckoutDetailsPage.elements.slickDotsAAH.nth(indexForAccessLevel));
    }
    switch (indexForAccessLevel) {
      case 0:
        await testFunction.click(t, eaCheckoutDetailsPage.elements.aahPermissionLvl1);
        break;
      case 1:
        await testFunction.click(t, eaCheckoutDetailsPage.elements.aahPermissionLvl2);
        break;
      case 2:
        await testFunction.click(t, eaCheckoutDetailsPage.elements.aahPermissionLvl3);
        break;
      default:
        console.error("Invalid access level selected.");
    }
    console.log("AAH details provided");
  }

  public static async addDirectDebit(t, DDType) {
    await testFunction.click(t, eaCheckoutDetailsPage.elements.addDirectDebit);
    if(DDType === directDebitType.BANK_ACCOUNT) {
      await testFunction.clearAndEnterText(t, eaCheckoutDetailsPage.elements.tfBankAccountName, "AccountName_" + testFunction.generateRandomText(5));
      await testFunction.clearAndEnterText(t, eaCheckoutDetailsPage.elements.tfBsb, "123456");
      await testFunction.clearAndEnterText(t, eaCheckoutDetailsPage.elements.tfBankAccountNumber, testFunction.getRandomNumber(9999999999));
      await t.wait(3000);
      await testFunction.click(t, eaCheckoutDetailsPage.elements.cbBankAccountAgreeTermsAndCond);
      console.log("Bank details provided");
    } else if(DDType === directDebitType.CREDIT_CARD) {
      if(testFunction.isTablet()){
        console.log(eaCheckoutDetailsPage.elements.slickDotsDD.count);
        await testFunction.click(t,eaCheckoutDetailsPage.elements.slickDotsDD.nth(1));
      }
      else{
        await testFunction.click(t, eaCheckoutDetailsPage.elements.useCC);
      }
      await testFunction.clearAndEnterText(t, eaCheckoutDetailsPage.elements.tfCCName, "CCName_" + testFunction.generateRandomText(5));
      await testFunction.clearAndEnterText(t, eaCheckoutDetailsPage.elements.tfCCNumber, "4111111111111111");
      await testFunction.clearAndEnterText(t, eaCheckoutDetailsPage.elements.tfCCExpiryMonth, "01");
      await testFunction.clearAndEnterText(t, eaCheckoutDetailsPage.elements.tfCCExpiryYear, "30");
      await testFunction.click(t, eaCheckoutDetailsPage.elements.cbCCAgreeTermsAndCond);
      console.log("CC details provided");
    }

  }

  public static async disconnectionDetails(t,disconnectionOption){
    const eleDisconnectionError = await testFunction.sizeOfElement(t, eaCheckoutDetailsPage.elements.eleDisconnectionError);
    const gasDisconnectionError = await testFunction.sizeOfElement(t, eaCheckoutDetailsPage.elements.gasDisconnectionError);
    const gasDisconnectionCalendar = await testFunction.sizeOfElement(t, eaCheckoutDetailsPage.elements.gasDisconnectionCalendar);
    const eleDisconnectionCalendar = await testFunction.sizeOfElement(t, eaCheckoutDetailsPage.elements.eleDisconnectionCalendar);
    const renovationQuestionNo = await testFunction.sizeOfElement(t, eaCheckoutDetailsPage.elements.renovationNo);

    if (disconnectionOption === "Yes") {
      await testFunction.click(t,eaCheckoutDetailsPage.elements.rbDisconnectionYes);
      if(eleDisconnectionError === 0 && eleDisconnectionCalendar!==0){
        await testFunction.click(t,eaCheckoutDetailsPage.elements.rdbEleAccessRestrictionNo);
      }
      if(gasDisconnectionError === 0 && gasDisconnectionCalendar!==0){
        await testFunction.click(t,eaCheckoutDetailsPage.elements.rdbGasAccessRestrictionNo);
      }
      if (renovationQuestionNo !== 0) {
        await testFunction.click(t,eaCheckoutDetailsPage.elements.renovationNo);
      }
    } else if (disconnectionOption === "No") {
      await testFunction.click(t,eaCheckoutDetailsPage.elements.rbDisconnectionNo);
    } else {
      console.error("Disconnection is not chosen");
    }
  }

  public static async selectPlan(t, fuelType, planName){
    await testFunction.isElectricity(fuelType) ? await this.selectElePlan(t, planName) : await this.selectGasPlan(t, planName);
  }
  public static async selectElePlan(t,elePlan:String){
    let element = null;
    switch(elePlan){
      case PlanType.BASIC_HOME:
        element = eaCheckoutDetailsPage.elements.basicElePlan;
        break;
      case PlanType.BASIC_HOME_QLD:
        element=eaCheckoutDetailsPage.elements.basicQLDElePlan;
      case PlanType.NO_FRILLS:
        if(testFunction.isMobile()){
          await scrollTo(eaCheckoutDetailsPage.elements.basicResiElePlanFeatureTitle);
          await scrollTo(eaCheckoutDetailsPage.elements.basicResiElePlanRatesTitle);
          await setAttribute("div.hs-plan-slider",'class','hs-plan-slider');
          await testFunction.click(t,eaCheckoutDetailsPage.elements.sliderRight);
        }
        element = eaCheckoutDetailsPage.elements.noFrillsElePlan;
        break;
      case PlanType.TOTAL_PLAN:
        if(testFunction.isMobile()){
          await scrollTo(eaCheckoutDetailsPage.elements.basicResiElePlanRateSummary);
          await scrollTo(eaCheckoutDetailsPage.elements.basicResiElePlanFeatureTitle);
          await scrollTo(eaCheckoutDetailsPage.elements.basicResiElePlanRatesTitle);
          await setAttribute("div.hs-plan-slider",'class','hs-plan-slider');
          await testFunction.click(t,eaCheckoutDetailsPage.elements.sliderRight);
          await testFunction.click(t,eaCheckoutDetailsPage.elements.sliderRight);
        }
        if(testFunction.isTablet()){
          await scrollTo(eaCheckoutDetailsPage.elements.basicResiElePlanFeatureTitle);
          await scrollTo(eaCheckoutDetailsPage.elements.basicResiElePlanRatesTitle);
          await setAttribute("div.hs-plan-slider",'class','hs-plan-slider');
          await testFunction.click(t,eaCheckoutDetailsPage.elements.sliderRight);
        }
        element = eaCheckoutDetailsPage.elements.totalElePlan;
        break;
      case PlanType.TOTAL_PLAN_PLUS:
        if(testFunction.isMobile()){
          await scrollTo(eaCheckoutDetailsPage.elements.basicResiElePlanRateSummary);
          await scrollTo(eaCheckoutDetailsPage.elements.basicResiElePlanFeatureTitle);
          await scrollTo(eaCheckoutDetailsPage.elements.basicResiElePlanRatesTitle);
          // const setAttribute = ClientFunction(selector => {
          //   let element = document.querySelector(selector);
          //
          //   element.setAttribute('class', 'hs-plan-slider');
          // });
          await setAttribute("div.hs-plan-slider",'class','hs-plan-slider');
          await testFunction.click(t,eaCheckoutDetailsPage.elements.sliderRight);
          await testFunction.click(t,eaCheckoutDetailsPage.elements.sliderRight);
          await testFunction.click(t,eaCheckoutDetailsPage.elements.sliderRight);
        }
        if(testFunction.isTablet()){
          await scrollTo(eaCheckoutDetailsPage.elements.basicResiElePlanFeatureTitle);
          await scrollTo(eaCheckoutDetailsPage.elements.basicResiElePlanRatesTitle);
          await testFunction.click(t,eaCheckoutDetailsPage.elements.sliderRight);
          await testFunction.click(t,eaCheckoutDetailsPage.elements.sliderRight);
        }
        element = eaCheckoutDetailsPage.elements.totalPlanPlusEle;
        break;
      case PlanType.BASIC_BUSINESS:
        element = eaCheckoutDetailsPage.elements.basicEleBusiness;
        break;
      case PlanType.BASIC_BUSINESS_QLD:
        element = eaCheckoutDetailsPage.elements.basicQLDEleBusiness;
        break;
      case PlanType.NO_FRILLS_BUSINESS:
        element = eaCheckoutDetailsPage.elements.noFrillEleBusiness;
        break;
      case PlanType.TOTAL_BUSINESS:
        if(testFunction.isMobile()){
          await scrollTo(eaCheckoutDetailsPage.elements.basicBsmeElePlanFeatureTitle);
          await scrollTo(eaCheckoutDetailsPage.elements.basicBsmeElePlanRatesTitle);
          await setAttribute("div.hs-plan-slider",'class','hs-plan-slider');
          await testFunction.click(t,eaCheckoutDetailsPage.elements.sliderRight);
        }
        element = eaCheckoutDetailsPage.elements.totalElePlanBusiness;
        break;
      case PlanType.TOTAL_PLAN_PLUS_BUSINESS:
        if(testFunction.isMobile()){
          await scrollTo(eaCheckoutDetailsPage.elements.basicBsmeElePlanFeatureTitle);
          await scrollTo(eaCheckoutDetailsPage.elements.basicBsmeElePlanRatesTitle);
          await setAttribute("div.hs-plan-slider",'class','hs-plan-slider');
          await testFunction.click(t,eaCheckoutDetailsPage.elements.sliderRight);
          await testFunction.click(t,eaCheckoutDetailsPage.elements.sliderRight);
        }
        if(testFunction.isTablet()){
          await scrollTo(eaCheckoutDetailsPage.elements.basicBsmeElePlanFeatureTitle);
          await scrollTo(eaCheckoutDetailsPage.elements.basicBsmeElePlanRatesTitle);
          await setAttribute("div.hs-plan-slider",'class','hs-plan-slider');
          await testFunction.click(t,eaCheckoutDetailsPage.elements.sliderRight);
        }
        element = eaCheckoutDetailsPage.elements.totalPlanPlusEleBusiness;
        break;
      default:
        console.error("Invalid plan type");
        throw Error("Invalid plan type");
    }
    await testFunction.isElementVisible(t,eaCheckoutDetailsPage.elements.progressBar);
    let pageUrl = await testFunction.getPageURL();
    console.log(pageUrl);
    if(!pageUrl.includes("ref=move") && !pageUrl.includes("ref=nc") && !pageUrl.includes("ref=upsell")) {
      if(getTestCafeRC.browsers[0].includes('emulation')){
        await testFunction.assertText(t, element, "Switch");
      }
      else{
        await testFunction.assertText(t, element, "Switch to this plan");
      }
      await testFunction.click(t, element);
      await testFunction.assertText(t, element, "Selected");
    } else {
      await testFunction.isElementVisible(t,eaCheckoutDetailsPage.elements.plansExpand);
      await testFunction.click(t, element);
    }
  }
  public static async selectGasPlan(t,gasPlan:String){
    let element = null;
    switch(gasPlan){
      case PlanType.BASIC_HOME:
        element = eaCheckoutDetailsPage.elements.basicGasPlan;
        break;
      case PlanType.NO_FRILLS:
        if(testFunction.isMobile()){
          await scrollTo(eaCheckoutDetailsPage.elements.basicResiGasPlanFeatureTitle);
          await scrollTo(eaCheckoutDetailsPage.elements.basicResiGasPlanRatesTitle);
          await setAttribute("div.hs-plan-slider",'class','hs-plan-slider');
          await testFunction.click(t,eaCheckoutDetailsPage.elements.sliderRight);
        }
        element = eaCheckoutDetailsPage.elements.noFrillsGasPlan;
        break;
      case PlanType.TOTAL_PLAN:
        if(testFunction.isMobile()){
          await scrollTo(eaCheckoutDetailsPage.elements.basicResiGasPlanFeatureTitle);
          await scrollTo(eaCheckoutDetailsPage.elements.basicResiGasPlanRatesTitle);
          await setAttribute("div.hs-plan-slider",'class','hs-plan-slider');
          await testFunction.click(t,eaCheckoutDetailsPage.elements.sliderRight);
          await testFunction.click(t,eaCheckoutDetailsPage.elements.sliderRight);
        }
        if(testFunction.isTablet()){
          await scrollTo(eaCheckoutDetailsPage.elements.basicResiGasPlanFeatureTitle);
          await scrollTo(eaCheckoutDetailsPage.elements.basicResiGasPlanRatesTitle);
          await setAttribute("div.hs-plan-slider",'class','hs-plan-slider');
          await testFunction.click(t,eaCheckoutDetailsPage.elements.sliderRight);
        }
        element = eaCheckoutDetailsPage.elements.totalGasPlan;
        break;
      case PlanType.TOTAL_PLAN_PLUS:
        if(testFunction.isMobile()){
          await scrollTo(eaCheckoutDetailsPage.elements.basicResiGasPlanFeatureTitle);
          await scrollTo(eaCheckoutDetailsPage.elements.basicResiGasPlanRatesTitle);
          await setAttribute("div.hs-plan-slider",'class','hs-plan-slider');
          await testFunction.click(t,eaCheckoutDetailsPage.elements.sliderRight);
          await testFunction.click(t,eaCheckoutDetailsPage.elements.sliderRight);
          await testFunction.click(t,eaCheckoutDetailsPage.elements.sliderRight);
        }
        if(testFunction.isTablet()){
          await scrollTo(eaCheckoutDetailsPage.elements.basicResiGasPlanFeatureTitle);
          await scrollTo(eaCheckoutDetailsPage.elements.basicResiGasPlanRatesTitle);
          await setAttribute("div.hs-plan-slider",'class','hs-plan-slider');
          await testFunction.click(t,eaCheckoutDetailsPage.elements.sliderRight);
          await testFunction.click(t,eaCheckoutDetailsPage.elements.sliderRight);
        }
        element = eaCheckoutDetailsPage.elements.totalPlanPlusGas;
        break;
      case PlanType.BASIC_BUSINESS:
        element = eaCheckoutDetailsPage.elements.basicGasBusiness;
        break;
      case PlanType.NO_FRILLS_BUSINESS:
        element = eaCheckoutDetailsPage.elements.noFrillGasBusiness;
        break;
      case PlanType.TOTAL_BUSINESS:
        if(testFunction.isMobile()){
          await scrollTo(eaCheckoutDetailsPage.elements.basicBsmeGasPlanFeatureTitle);
          await scrollTo(eaCheckoutDetailsPage.elements.basicBsmeGasPlanRatesTitle);
          await setAttribute("div.hs-plan-slider",'class','hs-plan-slider');
          await testFunction.click(t,eaCheckoutDetailsPage.elements.sliderRight);
        }
        element = eaCheckoutDetailsPage.elements.totalGasPlanBusiness;
        break;
      case PlanType.TOTAL_PLAN_PLUS_BUSINESS:
        if(testFunction.isMobile()){
          await scrollTo(eaCheckoutDetailsPage.elements.basicBsmeGasPlanFeatureTitle);
          await scrollTo(eaCheckoutDetailsPage.elements.basicBsmeGasPlanRatesTitle);
          await setAttribute("div.hs-plan-slider",'class','hs-plan-slider');
          await testFunction.click(t,eaCheckoutDetailsPage.elements.sliderRight);
          await testFunction.click(t,eaCheckoutDetailsPage.elements.sliderRight);
        }
        if(testFunction.isTablet()){
          await scrollTo(eaCheckoutDetailsPage.elements.basicBsmeGasPlanFeatureTitle);
          await scrollTo(eaCheckoutDetailsPage.elements.basicBsmeGasPlanRatesTitle);
          await setAttribute("div.hs-plan-slider",'class','hs-plan-slider');
          await testFunction.click(t,eaCheckoutDetailsPage.elements.sliderRight);
        }
        element = eaCheckoutDetailsPage.elements.totalPlanPlusGasBusiness;
        break;
      default:
        console.error("Invalid plan type");
        throw Error("Invalid plan type");
    }
    await testFunction.isElementVisible(t,eaCheckoutDetailsPage.elements.progressBar);
    let pageUrl = await testFunction.getPageURL();
    console.log(pageUrl);
    if(!pageUrl.includes("ref=move") && !pageUrl.includes("ref=nc") && !pageUrl.includes("ref=upsell")) {
      if(getTestCafeRC.browsers[0].includes('emulation')){
        await testFunction.assertText(t, element, "Switch");
      }
      else{
        await testFunction.assertText(t, element, "Switch to this plan");
      }
      await testFunction.click(t, element);
      await testFunction.assertText(t, element, "Selected");
    } else {
      await testFunction.isElementVisible(t,eaCheckoutDetailsPage.elements.plansExpand);
      await testFunction.click(t, element);
    }
  }

  public static async selectCarbonNeutralOption(t){
      await testFunction.click(t,eaCheckoutDetailsPage.elements.chkboxCarbonNeutral);
  }

  public static async selectBillingPreference(t: any, option: string, otherAddress: string, finalBill: boolean = false) {
    switch (option) {
      case "Email":
        if(finalBill) {
          await testFunction.click(t, eaCheckoutDetailsPage.elements.rbFinalBillPrefEmail);
        }else {
          await testFunction.click(t, eaCheckoutDetailsPage.elements.rbBillPrefEmail);
        }
        break;
      case "Connection address":
        if(finalBill) {
          await testFunction.click(t, eaCheckoutDetailsPage.elements.rbFinalBillPrefConnectionAddress);
        }else {
          await testFunction.click(t, eaCheckoutDetailsPage.elements.rbBillPrefConnectionAddress);
        }
        break;
      case "Other address":
        if(finalBill) {
          await testFunction.click(t, eaCheckoutDetailsPage.elements.rbFinalBillPrefOtherAddress);
          await testFunction.clearAndEnterText(t, eaCheckoutDetailsPage.elements.tfFinalBillPrefOtherAddress, otherAddress);
          await t.wait(3000);
          await testFunction.click(t, eaCheckoutDetailsPage.elements.finalBillServiceAddressList);
          await t.wait(2000);
        }else {
          await testFunction.click(t, eaCheckoutDetailsPage.elements.rbBillPrefOtherAddress);
          await testFunction.clearAndEnterText(t, eaCheckoutDetailsPage.elements.tfBillPrefOtherAddress, otherAddress);
          await testFunction.isElementVisible(t,eaCheckoutDetailsPage.elements.serviceAddressList);
          await testFunction.clickElementFromList(t,eaCheckoutDetailsPage.elements.serviceAddressList,otherAddress);
          await t.wait(2000);
        }
        break;
      default:
        console.error("Invalid bill pref selected.");
    }
  }

  public static async addConcessionCardDetails(t) {
    await testFunction.click(t, eaCheckoutDetailsPage.elements.addConcession);
    await testFunction.click(t, eaCheckoutDetailsPage.elements.concessionCardTypeDropDown);
    await testFunction.click(t, eaCheckoutDetailsPage.elements.concessionCardTypeOption);
    await testFunction.clearAndEnterText(t, eaCheckoutDetailsPage.elements.tfConcessionCardNumber, "V123456");
    await testFunction.click(t, eaCheckoutDetailsPage.elements.cbConcessionAgreeTerms);
  }

  public static async enterDetailsToMockCDE(t, cdeResponse: string, customerType: string) {
    await this.enterFirstName(t, "test");
    await this.enterLastName(t, "test");
    await testFunction.clearAndEnterText(t, eaCheckoutDetailsPage.elements.email, "test@test.com");
    cdeResponse = cdeResponse.toLowerCase();
    this.enterLicenseNumber(t, customerType, cdeResponse);
  }

  public static async enterLicenseNumber(t, customerType, cdeResponse) {
    switch (cdeResponse) {
      case "accept":
        if(customerType === CustomerStatus.NEW) {
          await this.checkoutNewCustomerDriverLicenseIdentification(t, cdeResponses.ACCEPT);
        } else {
          await this.checkoutExistingCustomerDriverLicenseIdentification(t, cdeResponses.ACCEPT);
        }
        break;
      case "decline":
        if(customerType === CustomerStatus.NEW) {
          await this.checkoutNewCustomerDriverLicenseIdentification(t, cdeResponses.DECLINE);
        } else {
          await this.checkoutExistingCustomerDriverLicenseIdentification(t, cdeResponses.DECLINE);
        }
        break;
      case "retry":
        if(customerType === CustomerStatus.NEW) {
          await this.checkoutNewCustomerDriverLicenseIdentification(t, cdeResponses.RETRY);
        } else {
          await this.checkoutExistingCustomerDriverLicenseIdentification(t, cdeResponses.RETRY);
        }
        break;
      case "accept with condition":
        if(customerType === CustomerStatus.NEW) {
          await this.checkoutNewCustomerDriverLicenseIdentification(t, cdeResponses.ACCEPT_WITH_CONDITION);
        } else {
          await this.checkoutExistingCustomerDriverLicenseIdentification(t, cdeResponses.ACCEPT_WITH_CONDITION);
        }
        break;
      default:
        console.error("Invalid cde response passed.");
    }
  }

  public static async validateHeader(t, sourceSystem, journey) {
      journey = journey.toLowerCase();
    if(sourceSystem === "My Account") {
      await testFunction.isElementDisplayed(t, eaCheckoutDetailsPage.elements.pageTitleBlock);
      await testFunction.isElementDisplayed(t, eaCheckoutDetailsPage.elements.btnCloseText);
      let pageTitle = await testFunction.getElementText(t, eaCheckoutDetailsPage.elements.txtPageTitle);
      await testFunction.assertTextValue(t, await testFunction.getElementText(t, eaCheckoutDetailsPage.elements.btnCloseText), "Close");

      switch (journey) {
        case "plan switch" || "best offer":
          await testFunction.assertTextValue(t, pageTitle, "Compare and switch plans");
          break;
        case "move home":
          await testFunction.assertTextValue(t, pageTitle, "Move my service");
          break;
        case "upsell":
          await testFunction.assertTextValue(t, pageTitle, "Choose your plan");
          break;
        default:
          throw Error("Invalid journey.");
      }
    }else {
      let numOfElements = await testFunction.sizeOfElement(t, eaCheckoutDetailsPage.elements.pageTitleBlock);
      if(numOfElements == 0) {
        await testFunction.isElementAbsent(t, eaCheckoutDetailsPage.elements.pageTitleBlock);
      } else {
        await t.expect(await testFunction.isElementVisible(t, eaCheckoutDetailsPage.elements.pageTitleBlock)).eql(false);
      }

    }
    console.log("Header validation completed.");
  }

  public static async validateProgressbarAndSubheading(t, sourceSystem, journey, fuelType) {
    journey = journey.toLowerCase();
    let numOfCompletedIndicator = await testFunction.sizeOfElement(t, eaCheckoutDetailsPage.elements.progressBarProgressIndicatorCompleted);
    await t.expect(numOfCompletedIndicator).eql(0);
    await testFunction.isElementDisplayed(t, eaCheckoutDetailsPage.elements.progressBar);
    let subHeading = await testFunction.getElementText(t, eaCheckoutDetailsPage.elements.txtSubheading);
    let expected;
    if(sourceSystem === "My Account") {
      switch (journey) {
        case "plan switch" || "best offer":
          expected = await testFunction.isElectricity(fuelType) ? "Select a new electricity plan" : "Select a new gas plan";
          await testFunction.assertTextValue(t, subHeading, expected);
          break;
        case "move home":
          await testFunction.assertTextValue(t, subHeading, "Select your plans");
          break;
        case "upsell":
          await testFunction.assertTextValue(t, subHeading, "Add new plan");
          break;
        default:
          throw Error("Invalid journey.");
      }
    }else {
      let pageUrl = await testFunction.getPageURL();
      console.log(pageUrl);
      if(pageUrl.includes("ref=move") || pageUrl.includes("ref=nc")) {
        await testFunction.assertTextValue(t, subHeading, "Select your plans");
      }else {
        await testFunction.assertTextValue(t, subHeading, "Details");
      }
    }
    console.log("Progress bar And Subheading validation completed.");
  }

  public static async validateContactPrefSection(t) {
    await testFunction.isElementDisplayed(t, eaCheckoutDetailsPage.elements.contactPreference.disclaimer);
    let expectedDisclaimerText = "We are committed to providing you with the very best energy solution and service, and may contact you about this offer to see how we can assist. If you do not wish to be contacted click here.";
    let actualDisclaimerText = await testFunction.getElementText(t, eaCheckoutDetailsPage.elements.contactPreference.disclaimer);
    await testFunction.assertTextValue(t, actualDisclaimerText, expectedDisclaimerText);

    await testFunction.click(t, eaCheckoutDetailsPage.elements.contactPreference.linkClickHere);

    let expectedModalHeading = "Contact preference";
    let actualModalHeading = await testFunction.getElementText(t, eaCheckoutDetailsPage.elements.contactPreference.modalHeading);
    await testFunction.assertTextValue(t, actualModalHeading, expectedModalHeading);

    let expectedModalText = "I agree that EnergyAustralia may contact me about this quote.";
    let actualModalText = await testFunction.getElementText(t, eaCheckoutDetailsPage.elements.contactPreference.lblModalText);
    await testFunction.assertTextValue(t, actualModalText, expectedModalText);

    await testFunction.isElementDisplayed(t, eaCheckoutDetailsPage.elements.contactPreference.btnSubmit);
    await testFunction.isElementDisplayed(t, eaCheckoutDetailsPage.elements.contactPreference.btnClose);

    await testFunction.click(t, eaCheckoutDetailsPage.elements.contactPreference.btnSubmit);
    console.log("Validation completed for Contact Preferences section.");
  }

  public static async validateRefineBar(t, fuelType, sourceSystem) {
    if(sourceSystem === "My Account") {
      await testFunction.isElementDisplayed(t, eaCheckoutDetailsPage.elements.refineBar.main);
      await testFunction.isElementDisplayed(t, eaCheckoutDetailsPage.elements.refineBar.refinePeriod);
      if (await testFunction.isElectricity(fuelType)) {
        await testFunction.isElementDisplayed(t, eaCheckoutDetailsPage.elements.refineBar.eleUsage);
        await testFunction.isElementDisplayed(t, eaCheckoutDetailsPage.elements.refineBar.greenEnergy);
      }
      if (await testFunction.isGas(fuelType)) {
        await testFunction.isElementDisplayed(t, eaCheckoutDetailsPage.elements.refineBar.gasUsage);
      }
      console.log("Validation completed for refine bar.");
    } else {
      console.log("Refine bar validation on checkout details page is not applicable for non my account journeys.");
    }
  }

  public static async validateDisclaimer(t, sourceSystem, element, expectedText) {
    if(sourceSystem === "My Account") {
      await testFunction.isElementDisplayed(t, element);
      let actualText = await testFunction.getElementText(t, element);
      actualText = actualText.replace(" ", "");
      expectedText = expectedText.replace(" ", "");
      await testFunction.assertTextValue(t, actualText, expectedText);
    }
    console.log("Disclaimer validated successfully.");
  }

  public static async validateNavigationButtons(t, sourceSystem, journey) {
      console.log(sourceSystem);
      console.log(journey);
    if(sourceSystem.toLowerCase() === "my account" && journey.toLowerCase() !== "move home" && journey.toLowerCase() !== "upsell") {
      await testFunction.isElementDisplayed(t, eaCheckoutDetailsPage.elements.btnBack);
      await testFunction.isElementDisplayed(t, eaCheckoutDetailsPage.elements.btnNext);
      await testFunction.isElementAbsent(t, eaCheckoutDetailsPage.elements.reviewYourOrderBtn);
    } else {
      await testFunction.isElementAbsent(t, eaCheckoutDetailsPage.elements.btnBack);
      await testFunction.isElementAbsent(t, eaCheckoutDetailsPage.elements.btnNext);
      await testFunction.isElementDisplayed(t, eaCheckoutDetailsPage.elements.reviewYourOrderBtn);
    }
  }

  public static async validateCurrentPlanDetails(t){
    if(myAccountMethod.map.get('isCurrentPlanDisplayed_'+checkoutDetailsMethod.getScenarioId(t))){
      await testFunction.waitForElementToBeDisappeared(t,eaCheckoutDetailsPage.elements.eaSpinner);
      let itemsCount=await testFunction.sizeOfElement(t,eaCheckoutDetailsPage.elements.currentPlan.planDetailsSection);
      await testFunction.assertTextValue(t,itemsCount,4);
      await testFunction.isElementDisplayed(t,eaCheckoutDetailsPage.elements.currentPlan.planHeadingTitle);
      await testFunction.assertText(t,eaCheckoutDetailsPage.elements.currentPlan.planHeadingTitle,'Your Current Plan');
      await testFunction.assertText(t,eaCheckoutDetailsPage.elements.currentPlan.planHeadingFuel,'Electricity');
      await testFunction.isElementDisplayed(t,eaCheckoutDetailsPage.elements.currentPlan.planDetailsTitle);
      await testFunction.isElementDisplayed(t,eaCheckoutDetailsPage.elements.currentPlan.planEstimate);
      await testFunction.assertText(t,eaCheckoutDetailsPage.elements.currentPlan.planEstimate,myAccountMethod.map.get('estimatePeriod_'+checkoutDetailsMethod.getScenarioId(t)));
      await testFunction.isElementDisplayed(t,eaCheckoutDetailsPage.elements.currentPlan.planGSTDisclaimer);
      await testFunction.isElementDisplayed(t,eaCheckoutDetailsPage.elements.currentPlan.discounts);
      await testFunction.assertText(t,eaCheckoutDetailsPage.elements.currentPlan.discounts,myAccountMethod.map.get('discount_'+checkoutDetailsMethod.getScenarioId(t)));
      await testFunction.isElementDisplayed(t,eaCheckoutDetailsPage.elements.currentPlan.exitFees);
      await testFunction.assertText(t,eaCheckoutDetailsPage.elements.currentPlan.exitFees,myAccountMethod.map.get('exitFees_'+checkoutDetailsMethod.getScenarioId(t)));
      let pageUrl = await testFunction.getPageURL();
      if(pageUrl.includes('customerType=BUS')){
        await testFunction.assertText(t,eaCheckoutDetailsPage.elements.currentPlan.customerType,'Small business flat tariff');
      }
      else{
        await testFunction.assertText(t,eaCheckoutDetailsPage.elements.currentPlan.customerType,'Residential flat tariff');
      }
      await testFunction.click(t,eaCheckoutDetailsPage.elements.currentPlan.planEleRateAccordion);
      await testFunction.isElementDisplayed(t,eaCheckoutDetailsPage.elements.currentPlan.disclaimer);
      let expectedDisclaimer="Not all features or benefits of your plan are displayed. For further information on your plan details, rates, fees and charges, tariff type, benefits, including discounts please refer to your welcome pack or bill."
      await testFunction.assertText(t,eaCheckoutDetailsPage.elements.currentPlan.disclaimer,expectedDisclaimer);
      console.log("Validated Current Plan section.");
    }
    else{
      await testFunction.isElementAbsent(t,eaCheckoutDetailsPage.elements.currentPlan.planTable);
      console.log("Current plan table is not available.")
    }
  }

}
