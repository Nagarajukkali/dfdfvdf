import {CustomerType, FUEL_TYPE_OPTIONS} from '@ea/ea-commons-models';

const eaNewConnectionPage=require('../pages/newConnection.page');
import {BusinessType, CustomerStatus, IdType, Moving, Property, Solar, testFunction} from '../../global_methods/helper';

export class newConnectionMethod{

  public static async selectFuel(t,fuelType) {
    if (fuelType===FUEL_TYPE_OPTIONS.ELE.value) {
    await testFunction.click(t,eaNewConnectionPage.elements.btnSelectEle);
    }
    else if (fuelType===FUEL_TYPE_OPTIONS.GAS.value) {
      await testFunction.click(t,eaNewConnectionPage.elements.btnSelectGas);
    }
  }

  public static async selectProperty(t,customerType) {
    if (customerType===CustomerType.RESIDENTIAL) {
      await testFunction.click(t,eaNewConnectionPage.elements.btnSelectResidential);
    }
    else if (customerType===CustomerType.BUSINESS) {
      await testFunction.click(t,eaNewConnectionPage.elements.btnSelectCommercial);
    }
  }

  public static async selectPremise(t,premiseType) {
    if (premiseType==='Single') {
      await testFunction.click(t,eaNewConnectionPage.elements.btnSelectSinglePremise);
    }
    else if (premiseType==='Unit Development') {
      await testFunction.click(t,eaNewConnectionPage.elements.btnSelectUnitDevpremise);
    }
  }

  public static async enterPropertyDetails(t,state,postcode) {
    await testFunction.clearAndEnterText(t,eaNewConnectionPage.elements.txtLotNo,testFunction.getRandomNumber(100));
    await testFunction.clearAndEnterText(t,eaNewConnectionPage.elements.txtStreetNo,testFunction.getRandomNumber(100));
    await testFunction.clearAndEnterText(t,eaNewConnectionPage.elements.txtStreetName,testFunction.generateRandomText(5));
    await testFunction.clearAndEnterText(t,eaNewConnectionPage.elements.txtSuburb,testFunction.generateRandomText(5));
    await this.selectStateFromDropdown(t,state);
    await testFunction.clearAndEnterText(t,eaNewConnectionPage.elements.txtPostcode,postcode);
  }

  public static async selectStateFromDropdown(t,state){
    await testFunction.click(t,eaNewConnectionPage.elements.listActiveState);
    await testFunction.click(t,eaNewConnectionPage.elements.selectStateFromDropdown.withText(state));
  }

  public static async proceedToStep2(t) {
    await testFunction.click(t,eaNewConnectionPage.elements.btnProceedToStep2);
  }

  public static async selectOptionForPoleInstallation(t,option) {
    if(option==='No') await testFunction.click(t,eaNewConnectionPage.elements.inputInstallingPoleNo);
    else if(option==='Yes') await testFunction.click(t,eaNewConnectionPage.elements.inputInstallingPoleYes);
  }

  public static async selectOptionForServiceLineInstallation(t,option) {
    if(option==='No') await testFunction.click(t,eaNewConnectionPage.elements.inputServicelineInstallNo);
    else if(option==='Yes') await testFunction.click(t,eaNewConnectionPage.elements.inputServicelineInstallYes);
  }

  public static async selectOptionForSiteClear(t,option) {
    if(option==='No') await testFunction.click(t,eaNewConnectionPage.elements.inputSiteClearNo);
    else if(option==='Yes') await testFunction.click(t,eaNewConnectionPage.elements.inputSiteClearYes);
  }

  public static async selectOptionForSiteMarked(t,option) {
    if(option==='No') await testFunction.click(t,eaNewConnectionPage.elements.inputSiteMarkedNo);
    else if(option==='Yes') await testFunction.click(t,eaNewConnectionPage.elements.inputSiteMarkedYes);
  }

  public static async selectOptionForAMPS(t,option) {
    if(option==='Below') await testFunction.click(t,eaNewConnectionPage.elements.inputBelowAMPS);
    else if(option==='Above') await testFunction.click(t,eaNewConnectionPage.elements.inputAboveAMPS);
  }

  public static async selectOptionForOffPeakLoad(t,option) {
    if(option==='No') await testFunction.click(t,eaNewConnectionPage.elements.inputPeakLoadNo);
    else if(option==='Yes') await testFunction.click(t,eaNewConnectionPage.elements.inputPeakLoadYes);
  }

  public static async proceedToStep3(t) {
    await testFunction.click(t,eaNewConnectionPage.elements.btnProceedToStep3);
    await testFunction.isElementDisplayed(t,eaNewConnectionPage.elements.applicantTitleActive);
  }

  public static async proceedToStep4(t) {
    await testFunction.click(t,eaNewConnectionPage.elements.btnProceedToStep4);
    await testFunction.isElementDisplayed(t,eaNewConnectionPage.elements.plumberTitleActive);
  }


  public static async applicantDetails(t,idType,state) {
    await testFunction.click(t,eaNewConnectionPage.elements.applicantTitleActive);
    await testFunction.isElementVisible(t,eaNewConnectionPage.elements.applicantTitle);
    await testFunction.click(t,eaNewConnectionPage.elements.applicantTitle);
    await testFunction.clearAndEnterText(t,eaNewConnectionPage.elements.txtFirstname,testFunction.generateRandomText(5));
    await testFunction.clearAndEnterText(t,eaNewConnectionPage.elements.txtLastname,testFunction.generateRandomText(5));
    await testFunction.clearAndEnterText(t,eaNewConnectionPage.elements.txtMobileNo,("03"+testFunction.getRandomNumber(99999999)).padEnd(10,"0"));
    await testFunction.clearAndEnterText(t,eaNewConnectionPage.elements.txtEmail,testFunction.generateRandomText(5)+"@gmail.com");
    await testFunction.click(t,eaNewConnectionPage.elements.inputSameAsApplicant);
    await testFunction.clearAndEnterText(t,eaNewConnectionPage.elements.txtDOB_dd,"01");
    await testFunction.clearAndEnterText(t,eaNewConnectionPage.elements.txtDOB_mm,"01");
    await testFunction.clearAndEnterText(t,eaNewConnectionPage.elements.txtDOB_yyyy,"1980");
    await this.selectId(t,idType,state);
    await testFunction.click(t,eaNewConnectionPage.elements.inputSameasSiteAddress);
  }

  public static async selectId(t,idType,state){
    await testFunction.click(t,eaNewConnectionPage.elements.applicantIdTypeActive);
    await testFunction.isElementVisible(t,eaNewConnectionPage.elements.idType);
    await testFunction.click(t,eaNewConnectionPage.elements.idType.withText(idType));
    await testFunction.clearAndEnterText(t,eaNewConnectionPage.elements.txtIdNo,testFunction.getRandomNumber(99999));
    await testFunction.click(t,eaNewConnectionPage.elements.applicantIdStateActive);
    await testFunction.isElementVisible(t,eaNewConnectionPage.elements.idState);
    await testFunction.click(t,eaNewConnectionPage.elements.idState.withText(state));
  }

  public static async plumberDetails(t) {
    await testFunction.click(t,eaNewConnectionPage.elements.plumberTitleActive);
    await testFunction.isElementVisible(t,eaNewConnectionPage.elements.plumberTitle);
    await testFunction.click(t,eaNewConnectionPage.elements.plumberTitle);
    await testFunction.clearAndEnterText(t,eaNewConnectionPage.elements.txtPlumberFirstname,testFunction.generateRandomText(5));
    await testFunction.clearAndEnterText(t,eaNewConnectionPage.elements.txtPlumberLastname,testFunction.generateRandomText(5));
    await testFunction.clearAndEnterText(t,eaNewConnectionPage.elements.txtPlumberMobileNo,("02"+testFunction.getRandomNumber(99999999)).padEnd(10,"0"));
    await testFunction.clearAndEnterText(t,eaNewConnectionPage.elements.txtPlumberLandline,("04"+testFunction.getRandomNumber(99999999)).padEnd(10,"0"));
    await testFunction.clearAndEnterText(t,eaNewConnectionPage.elements.txtPlumberEmail,testFunction.generateRandomText(5)+"@gmail.com");
    await testFunction.clearAndEnterText(t,eaNewConnectionPage.elements.txtPlumberLicenseNumber,testFunction.getRandomNumber(99999));
    await testFunction.clearAndEnterText(t,eaNewConnectionPage.elements.txtPlumberComplianceNumber,testFunction.getRandomNumber(99999));
    await testFunction.clearAndEnterText(t,eaNewConnectionPage.elements.txtPlumberESVNo,testFunction.getRandomNumber(99999));
  }

  public static async acceptTnCAndSubmit(t) {
    await testFunction.click(t,eaNewConnectionPage.elements.acceptTermsAndConds);
    await testFunction.isElementVisible(t,eaNewConnectionPage.elements.submitForm);
    await testFunction.click(t,eaNewConnectionPage.elements.submitForm);
    await testFunction.isElementDisplayed(t,eaNewConnectionPage.elements.btnProceedToQuote);
  }

  public static async navigateToQuoteTool(t) {
    await testFunction.click(t,eaNewConnectionPage.elements.btnProceedToQuote);
    await testFunction.isElementVisible(t,eaNewConnectionPage.elements.connectionDetailSection);
  }

  public static async selectConnectionType(t,connectionType) {
    if(connectionType==='Service Line Installation') await testFunction.click(t,eaNewConnectionPage.elements.connectionType_ServiceLineInstall);
    else if(connectionType==='Meter Installation') await testFunction.click(t,eaNewConnectionPage.elements.connectionType_MeterInstall);
  }

  public static async selectAppliancesFromList(t) {
    await testFunction.clearAndEnterText(t,eaNewConnectionPage.elements.hotWaterField,"1");
  }

}
