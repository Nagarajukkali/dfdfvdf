import {CustomerType, FUEL_TYPE_OPTIONS} from '@ea/ea-commons-models';
import {testFunction} from '../../global_methods/helper';

const eaMyAccount = require('../pages/myAccount.page');

const eaNewConnectionPage = require('../pages/newConnection.page');

export class newConnectionMethod {

  public static async selectFuel(t, fuelType) {
    if (fuelType === FUEL_TYPE_OPTIONS.ELE.value) {
      await testFunction.click(t, eaNewConnectionPage.elements.btnSelectEle);
    } else if (fuelType === FUEL_TYPE_OPTIONS.GAS.value) {
      await testFunction.click(t, eaNewConnectionPage.elements.btnSelectGas);
    }
  }

  public static async selectProperty(t, customerType) {
    if (customerType === CustomerType.RESIDENTIAL) {
      await testFunction.click(t, eaNewConnectionPage.elements.btnSelectResidential);
    } else if (customerType === CustomerType.BUSINESS) {
      await testFunction.click(t, eaNewConnectionPage.elements.btnSelectCommercial);
    }
  }

  public static async selectPremise(t, premiseType) {
    if (premiseType === 'Single') {
      await testFunction.click(t, eaNewConnectionPage.elements.btnSelectSinglePremise);
    } else if (premiseType === 'Unit Development') {
      await testFunction.click(t, eaNewConnectionPage.elements.btnSelectUnitDevpremise);
    }
  }

  public static async enterPropertyDetails(t, state, postcode) {
    await testFunction.clearAndEnterText(t, eaNewConnectionPage.elements.txtLotNo, testFunction.getRandomNumber(100));
    await testFunction.clearAndEnterText(t, eaNewConnectionPage.elements.txtStreetNo, testFunction.getRandomNumber(100));
    await testFunction.clearAndEnterText(t, eaNewConnectionPage.elements.txtStreetName, testFunction.generateRandomText(5));
    await testFunction.clearAndEnterText(t, eaNewConnectionPage.elements.txtSuburb, testFunction.generateRandomText(5));
    await this.selectStateFromDropdown(t, state);
    await testFunction.clearAndEnterText(t, eaNewConnectionPage.elements.txtPostcode, postcode);
  }

  public static async enterDistributorDetails(t, state, distributor) {
    if (state=== 'NSW') {
      await testFunction.click(t, eaNewConnectionPage.elements.btnNext);
      switch (distributor) {
        case "Ausgrid":
          await testFunction.click(t, eaNewConnectionPage.elements.inputDistributorAusgrid);
          break;
        case "Essential":
          await testFunction.click(t, eaNewConnectionPage.elements.inputDistributorEssential);
          await testFunction.clearAndEnterText(t, eaNewConnectionPage.elements.txtLotNo, testFunction.getRandomNumber(100));
          break;
        case "Endeavour":
          await testFunction.click(t, eaNewConnectionPage.elements.inputDistributorEndeavour);
          await testFunction.clearAndEnterText(t, eaNewConnectionPage.elements.txtLotNo, testFunction.getRandomNumber(100));
          break;
        case "Unknown":
          await testFunction.click(t, eaNewConnectionPage.elements.inputDistributorUnknown);
          await testFunction.clearAndEnterText(t, eaNewConnectionPage.elements.txtLotNo, testFunction.getRandomNumber(100));
          break;
      }
    await testFunction.clearAndEnterText(t, eaNewConnectionPage.elements.txtNMI, "61021362139");
    await testFunction.clearAndEnterText(t, eaNewConnectionPage.elements.txtDPId, testFunction.getRandomNumber(100));
    await testFunction.isElementDisplayed(t, eaNewConnectionPage.elements.inputInstallingPoleNo);
  }
  }

  public static async enterSupplyType(t, supplyType) {
    console.log("supplyType:"+supplyType);
    await testFunction.assertText(t,eaNewConnectionPage.elements.lblPropertySupplyType,"Property Supply Type");
      switch (supplyType) {
        case "Overhead":
          await testFunction.click(t, eaNewConnectionPage.elements.inputSupplyTypeOverhead);
          break;
        case "Underground":
          await testFunction.click(t, eaNewConnectionPage.elements.inputSupplyTypeUnderground);
          break;
        case "Overhead_Underground":
          await testFunction.click(t, eaNewConnectionPage.elements.inputSupplyTypeMix);
          break;
      }
    }
  public static async enterSupplyPhases(t, supplyPhases) {
    console.log("supplyPhases:"+supplyPhases);
    switch (supplyPhases) {
      case "One":
        await testFunction.click(t, eaNewConnectionPage.elements.inputSupplyPhaseOne);
        break;
      case "Two":
        await testFunction.click(t, eaNewConnectionPage.elements.inputSupplyPhaseTwo);
        break;
      case "Three":
        await testFunction.click(t, eaNewConnectionPage.elements.inputSupplyPhaseThree);
        break;
    }
  }
  public static async enterMeterPhases(t, meterPhases) {
    console.log("meterPhases:"+meterPhases);
    switch (meterPhases) {
      case "One":
        await testFunction.click(t, eaNewConnectionPage.elements.inputMeterPhaseOne);
        break;
      case "Two":
        await testFunction.click(t, eaNewConnectionPage.elements.inputMeterPhaseTwo);
        break;
      case "Three":
        await testFunction.click(t, eaNewConnectionPage.elements.inputMeterPhaseThree);
        break;
    }
  }
  public static async enterCTDetails(t, ctDetails) {
    console.log("ctDetails:"+ctDetails);
    switch (ctDetails) {
      case "Yes":
        await testFunction.click(t, eaNewConnectionPage.elements.inputCTYes);
        break;
      case "No":
        await testFunction.click(t, eaNewConnectionPage.elements.inputCTNo);
        break;
    }
    await testFunction.clearAndEnterText(t, eaNewConnectionPage.elements.txtMaxDemandOfInstallation, testFunction.getRandomNumber(25));
    await testFunction.clearAndEnterText(t, eaNewConnectionPage.elements.txtMaxDemandOfTotalSite, "250");
    await testFunction.clearAndEnterText(t, eaNewConnectionPage.elements.txtAdditionalComments, "Additional comments test.");
  }
  public static async selectStateFromDropdown(t, state) {
    await testFunction.click(t, eaNewConnectionPage.elements.listActiveState);
    await testFunction.click(t, eaNewConnectionPage.elements.selectStateFromDropdown.withText(state));
  }

  public static async proceedToStep2(t) {
    await testFunction.click(t, eaNewConnectionPage.elements.btnNext);
    await testFunction.isElementDisplayed(t, eaNewConnectionPage.elements.inputInstallingPoleNo);
  }

  public static async selectOptionForPoleInstallation(t, option) {
    if (option === 'No') {
      await testFunction.click(t, eaNewConnectionPage.elements.inputInstallingPoleNo);
    } else if (option === 'Yes') {
      await testFunction.click(t, eaNewConnectionPage.elements.inputInstallingPoleYes);
    }
  }

  public static async selectOptionForServiceLineInstallation(t, option) {
    if (option === 'No') {
      await testFunction.click(t, eaNewConnectionPage.elements.inputServicelineInstallNo);
    } else if (option === 'Yes') {
      await testFunction.click(t, eaNewConnectionPage.elements.inputServicelineInstallYes);
    }
  }

  public static async selectOptionForSiteClear(t, option) {
    if (option === 'No') {
      await testFunction.click(t, eaNewConnectionPage.elements.inputSiteClearNo);
    } else if (option === 'Yes') {
      await testFunction.click(t, eaNewConnectionPage.elements.inputSiteClearYes);
    }
  }

  public static async selectOptionForSiteMarked(t, option) {
    if (option === 'No') {
      await testFunction.click(t, eaNewConnectionPage.elements.inputSiteMarkedNo);
    } else if (option === 'Yes') {
      await testFunction.click(t, eaNewConnectionPage.elements.inputSiteMarkedYes);
    }
  }

  public static async selectOptionForAMPS(t, option,state) {
    console.log("selectOptionForAMPS"+option);
    if (state === "VIC") {
      if (option === 'Below') {
        await testFunction.isElementExists(t, eaNewConnectionPage.elements.inputBelowAMPS);
        await testFunction.click(t, eaNewConnectionPage.elements.inputVicBelowAMPS);
      } else if (option === 'Above') {
        await testFunction.click(t, eaNewConnectionPage.elements.inputVicAboveAMPS);
      }
    }else {
      if (option === 'Below') {
        await testFunction.isElementExists(t, eaNewConnectionPage.elements.inputBelowAMPS);
        await testFunction.click(t, eaNewConnectionPage.elements.inputBelowAMPS);
      } else if (option === 'Above') {
        await testFunction.click(t, eaNewConnectionPage.elements.inputAboveAMPS);
      }
    }
  }

  public static async selectOptionForOffPeakLoad(t, option) {
    if (option === 'No') {
      await testFunction.click(t, eaNewConnectionPage.elements.inputPeakLoadNo);
    } else if (option === 'Yes') {
      await testFunction.click(t, eaNewConnectionPage.elements.inputPeakLoadYes);
      await testFunction.click(t, eaNewConnectionPage.elements.offPeakLoadType.withText("Pool Pump"));
    }
  }

  public static async proceedToStep3(t) {
    await testFunction.click(t, eaNewConnectionPage.elements.btnNext);
    await testFunction.isElementDisplayed(t, eaNewConnectionPage.elements.applicantTitleActive);
  }

  public static async proceedToStep4(t) {
    await testFunction.click(t, eaNewConnectionPage.elements.btnNext);
    await testFunction.isElementDisplayed(t, eaNewConnectionPage.elements.plumberTitleActive);
  }


  public static async applicantDetails(t, idType, state) {
    await testFunction.click(t, eaNewConnectionPage.elements.applicantTitleActive);
    await testFunction.isElementVisible(t, eaNewConnectionPage.elements.applicantTitle);
    await testFunction.click(t, eaNewConnectionPage.elements.applicantTitle);
    await testFunction.clearAndEnterText(t, eaNewConnectionPage.elements.txtFirstname, testFunction.generateRandomText(5));
    await testFunction.clearAndEnterText(t, eaNewConnectionPage.elements.txtLastname, testFunction.generateRandomText(5));
    await testFunction.clearAndEnterText(t, eaNewConnectionPage.elements.txtMobileNo, ("03" + testFunction.getRandomNumber(99999999)).padEnd(10, "0"));
    await testFunction.clearAndEnterText(t, eaNewConnectionPage.elements.txtEmail, testFunction.generateRandomText(5) + "@gmail.com");
    await testFunction.click(t, eaNewConnectionPage.elements.inputSameAsApplicant);
    await testFunction.clearAndEnterText(t, eaNewConnectionPage.elements.txtDOB, "01011980");
    await this.selectId(t, idType, state);
    await testFunction.click(t, eaNewConnectionPage.elements.inputSameAsSiteAddress);
  }
  public static async applicantTypeAndDetails(t, applicantType,state) {
    switch (applicantType) {
      case "EndUser":
      await testFunction.click(t, eaNewConnectionPage.elements.inputApplicantTypeEndUser);
      break;
      case "Electrician":
        await testFunction.click(t, eaNewConnectionPage.elements.inputApplicantTypeElectrician);
        await testFunction.clearAndEnterText(t, eaNewConnectionPage.elements.txtApplicantBusinessName, testFunction.generateRandomText(5));
        await testFunction.click(t, eaNewConnectionPage.elements.inputApplicantBusinessIDABN);
        await testFunction.clearAndEnterText(t, eaNewConnectionPage.elements.txtApplicantABN, (testFunction.getRandomNumber(99999999)).padEnd(11, "0"));
        await testFunction.clearAndEnterText(t, eaNewConnectionPage.elements.txtApplicantLicenceNo, ("GM" +testFunction.getRandomNumber(99999999)).padEnd(5, "0"));
        break;
      case "Builder":
        await testFunction.click(t, eaNewConnectionPage.elements.inputApplicantTypeBuilder);
        await testFunction.clearAndEnterText(t, eaNewConnectionPage.elements.txtApplicantBusinessName, testFunction.generateRandomText(5));
        await testFunction.click(t, eaNewConnectionPage.elements.inputApplicantBusinessIDACN);
        await testFunction.clearAndEnterText(t, eaNewConnectionPage.elements.txtApplicantACN, (testFunction.getRandomNumber(99999999)).padEnd(9, "0"));
        break;
      case "Other":
        await testFunction.click(t, eaNewConnectionPage.elements.inputApplicantTypeOther);
        break;
    }
    await testFunction.click(t, eaNewConnectionPage.elements.applicantTitleActive);
    await testFunction.isElementVisible(t, eaNewConnectionPage.elements.applicantTitle);
    await testFunction.click(t, eaNewConnectionPage.elements.applicantTitle);
    await testFunction.clearAndEnterText(t, eaNewConnectionPage.elements.txtFirstname, testFunction.generateRandomText(5));
    await testFunction.clearAndEnterText(t, eaNewConnectionPage.elements.txtLastname, testFunction.generateRandomText(5));
    await testFunction.clearAndEnterText(t, eaNewConnectionPage.elements.txtMobileNo, ("04" + testFunction.getRandomNumber(99999999)).padEnd(10, "0"));
    await testFunction.clearAndEnterText(t, eaNewConnectionPage.elements.txtAltPhoneNo, ("03" + testFunction.getRandomNumber(99999999)).padEnd(10, "0"));
    await testFunction.clearAndEnterText(t, eaNewConnectionPage.elements.txtEmail, testFunction.generateRandomText(5) + "@gmail.com");
    if(applicantType!=='Electrician'){
      await this.enterElectricianDetails(t, state);
    }
  }

  public static async enterElectricianDetails(t, state) {
    if(state!=='VIC'){
      await testFunction.clearAndEnterText(t, eaNewConnectionPage.elements.txtElectricianFirstname, testFunction.generateRandomText(5));
      await testFunction.clearAndEnterText(t, eaNewConnectionPage.elements.txtElectricianLastname, testFunction.generateRandomText(5));
      await testFunction.clearAndEnterText(t, eaNewConnectionPage.elements.txtElectricianMobileNo, ("04" + testFunction.getRandomNumber(99999999)).padEnd(10, "0"));
      await testFunction.clearAndEnterText(t, eaNewConnectionPage.elements.txtElectricianAltPhoneNo, ("03" + testFunction.getRandomNumber(99999999)).padEnd(10, "0"));
      await testFunction.clearAndEnterText(t, eaNewConnectionPage.elements.txtElectricianEmail, testFunction.generateRandomText(5) + "@gmail.com");
      await testFunction.clearAndEnterText(t, eaNewConnectionPage.elements.txtElectricianLicenceNo, ("GM" +testFunction.getRandomNumber(99999999)).padEnd(5, "0"));
      await testFunction.clearAndEnterText(t, eaNewConnectionPage.elements.txtElectricianBusinessName, testFunction.generateRandomText(5));
      await testFunction.click(t, eaNewConnectionPage.elements.inputElectricianBusinessIDABN);
      await testFunction.clearAndEnterText(t, eaNewConnectionPage.elements.txtElectricianABN, (testFunction.getRandomNumber(99999999)).padEnd(11, "0"));
    }
  }
  public static async enterLevel2ASPDetails(t,state) {
    if(state==='NSW'){
      await testFunction.clearAndEnterText(t, eaNewConnectionPage.elements.txtASPFirstname, testFunction.generateRandomText(5));
      await testFunction.clearAndEnterText(t, eaNewConnectionPage.elements.txtASPLastname, testFunction.generateRandomText(5));
      await testFunction.clearAndEnterText(t, eaNewConnectionPage.elements.txtASPLicenceNo, ("GM" +testFunction.getRandomNumber(99999999)).padEnd(5, "0"));
      await testFunction.clearAndEnterText(t, eaNewConnectionPage.elements.txtASPMobileNo, ("04" + testFunction.getRandomNumber(99999999)).padEnd(10, "0"));
      await testFunction.clearAndEnterText(t, eaNewConnectionPage.elements.txtASPBusinessName, testFunction.generateRandomText(5));
      await testFunction.click(t, eaNewConnectionPage.elements.inputASPVectorMeteringYes);
      await testFunction.click(t, eaNewConnectionPage.elements.inputASPCompleteMeterInstallYes);
    }
  }
  public static async selectOptionForPaperwork(t,optionForPaperwork) {
    if(optionForPaperwork==='Yes'){
      await testFunction.click(t, eaNewConnectionPage.elements.inputDistributorPaperWorkYes);
      await testFunction.clearAndEnterText(t, eaNewConnectionPage.elements.txtRexIdEWRNo, (testFunction.getRandomNumber(99999999)).padEnd(10, "0"));
    }else if (optionForPaperwork==='No'){
      await testFunction.click(t, eaNewConnectionPage.elements.inputDistributorPaperWorkYes);
    }
  }
  public static async accountSetupAndMailingDetails(t, idType,state) {
    await testFunction.click(t, eaNewConnectionPage.elements.inputSameAsApplicant);
    await testFunction.clearAndEnterText(t, eaNewConnectionPage.elements.txtDOB, "01011980");
    await this.selectId(t, idType, state);
    await testFunction.click(t, eaNewConnectionPage.elements.inputSameAsSiteAddress);
  }
  public static async selectId(t, idType, state) {
    await testFunction.click(t, eaNewConnectionPage.elements.applicantIdTypeActive);
    switch (idType) {
      case "Driver's Licence":
        await testFunction.isElementVisible(t, eaNewConnectionPage.elements.idTypeDl);
        await testFunction.click(t, eaNewConnectionPage.elements.idTypeDl);
        break;
      case "Medicare":
        await testFunction.isElementVisible(t, eaNewConnectionPage.elements.idTypeMedicare);
        await testFunction.click(t, eaNewConnectionPage.elements.idTypeMedicare);
        break;
      case "Passport":
        await testFunction.isElementVisible(t, eaNewConnectionPage.elements.idTypePassport);
        await testFunction.click(t, eaNewConnectionPage.elements.idTypePassport);
        break;
    }
    await testFunction.clearAndEnterText(t, eaNewConnectionPage.elements.txtIdNo, testFunction.getRandomNumber(99999));
    await testFunction.click(t, eaNewConnectionPage.elements.applicantIdStateActive);
    switch (state) {
      case "VIC":
        await testFunction.isElementVisible(t, eaNewConnectionPage.elements.idStateVIC);
        await testFunction.click(t, eaNewConnectionPage.elements.idStateVIC);
        break;
      case "NSW":
        await testFunction.isElementVisible(t, eaNewConnectionPage.elements.idStateNSW);
        await testFunction.click(t, eaNewConnectionPage.elements.idStateNSW);
        break;
      case "SA":
        await testFunction.isElementVisible(t, eaNewConnectionPage.elements.idStateSA);
        await testFunction.click(t, eaNewConnectionPage.elements.idStateSA);
        break;
      case "QLD":
        await testFunction.isElementVisible(t, eaNewConnectionPage.elements.idStateQLD);
        await testFunction.click(t, eaNewConnectionPage.elements.idStateQLD);
        break;
      case "TAS":
        await testFunction.isElementVisible(t, eaNewConnectionPage.elements.idStateTAS);
        await testFunction.click(t, eaNewConnectionPage.elements.idStateTAS);
        break;
      case "ACT":
        await testFunction.isElementVisible(t, eaNewConnectionPage.elements.idStateACT);
        await testFunction.click(t, eaNewConnectionPage.elements.idStateACT);
        break;
      case "WA":
        await testFunction.isElementVisible(t, eaNewConnectionPage.elements.idStateWA);
        await testFunction.click(t, eaNewConnectionPage.elements.idStateWA);
        break;
      case "NT":
        await testFunction.isElementVisible(t, eaNewConnectionPage.elements.idStateNT);
        await testFunction.click(t, eaNewConnectionPage.elements.idStateNT);
        break;
      case "International":
        await testFunction.isElementVisible(t, eaNewConnectionPage.elements.idStateInternational);
        await testFunction.click(t, eaNewConnectionPage.elements.idStateInternational);
        break;
      default:
        console.error("State is invalid");
    }

  }

  public static async plumberDetails(t) {
    await testFunction.click(t, eaNewConnectionPage.elements.plumberTitleActive);
    await testFunction.isElementVisible(t, eaNewConnectionPage.elements.plumberTitle);
    await testFunction.click(t, eaNewConnectionPage.elements.plumberTitle);
    await testFunction.clearAndEnterText(t, eaNewConnectionPage.elements.txtPlumberFirstname, testFunction.generateRandomText(5));
    await testFunction.clearAndEnterText(t, eaNewConnectionPage.elements.txtPlumberLastname, testFunction.generateRandomText(5));
    await testFunction.clearAndEnterText(t, eaNewConnectionPage.elements.txtPlumberMobileNo, ("02" + testFunction.getRandomNumber(99999999)).padEnd(10, "0"));
    await testFunction.clearAndEnterText(t, eaNewConnectionPage.elements.txtPlumberLandline, ("04" + testFunction.getRandomNumber(99999999)).padEnd(10, "0"));
    await testFunction.clearAndEnterText(t, eaNewConnectionPage.elements.txtPlumberEmail, testFunction.generateRandomText(5) + "@gmail.com");
    await testFunction.clearAndEnterText(t, eaNewConnectionPage.elements.txtPlumberLicenseNumber, testFunction.getRandomNumber(99999));
    await testFunction.clearAndEnterText(t, eaNewConnectionPage.elements.txtPlumberComplianceNumber, testFunction.getRandomNumber(99999));
    await testFunction.clearAndEnterText(t, eaNewConnectionPage.elements.txtPlumberESVNo, testFunction.getRandomNumber(99999));
  }

  public static async acceptTnCAndSubmit(t) {
    await testFunction.click(t, eaNewConnectionPage.elements.acceptTermsAndConds);
    await testFunction.isElementVisible(t, eaNewConnectionPage.elements.submitForm);
    await testFunction.takeScreenshot(t, "new_connections_step3");//disabled UI Validation
    await testFunction.click(t, eaNewConnectionPage.elements.submitForm);
    await testFunction.isElementDisplayed(t, eaNewConnectionPage.elements.btnProceedToQuote);
  }

  public static async navigateToQuoteTool(t) {
    await testFunction.click(t, eaNewConnectionPage.elements.btnProceedToQuote);
    if ((await testFunction.sizeOfElement(t, eaNewConnectionPage.elements.connectionDetailSection) > 0)) {
      await testFunction.isElementVisible(t, eaNewConnectionPage.elements.connectionDetailSection);
    }
  }

  public static async selectConnectionType(t, connectionType) {
    if (connectionType === 'Service Line Installation') {
      await testFunction.click(t, eaNewConnectionPage.elements.connectionType_ServiceLineInstall);
    } else if (connectionType === 'Meter Installation') {
      await testFunction.click(t, eaNewConnectionPage.elements.connectionType_MeterInstall);
    }
  }

  public static async selectAppliancesFromList(t) {
    await testFunction.clearAndEnterText(t, eaNewConnectionPage.elements.hotWaterField, "1");
  }

  public static async validateErrorMessage(t, errorType) {
    let expectedErrorText, errorMessageHeading;
    await testFunction.waitForElementToBeAppeared(t, eaNewConnectionPage.elements.txtErrorModal);
    await testFunction.isElementDisplayed(t, eaNewConnectionPage.elements.txtErrorModal);
    switch (errorType) {
      case "UNSUPPORTED_METER_TYPE":
        errorMessageHeading = "Sorry, there was a problem loading the page";
        expectedErrorText = "We are unable to complete this quote online as we are unable to determine your meter type. Please call the New Connection team on 1300 137 473 to complete your new connection quote.";
        break;
      case "ENERGY_NOT_SERVICED":
        errorMessageHeading = "Sorry, there was a problem loading the page";
        expectedErrorText = "There are no current electricity market offers in your area at this time, please refer to our Energy Price Fact Sheets to see if a standing offer is available in your region or contact us on 1800 818 378.";
        break;
      case "EXPIRED_QUOTE":
        errorMessageHeading = "Sorry, there was a problem loading the page";
        expectedErrorText = "The quote for this address has expired. You can return to the Plans Page to start a new quote.";
        break;
      case "QUOTE_NOT_EXIST":
        errorMessageHeading = "Sorry, there was a problem loading the page";
        expectedErrorText = "We are unable to retrieve this quote, as some plan information might have changed since it was generated and may no longer be accurate. You can return to the Plans Page to restart this quote.";
        break;
      case "SOLAR_UNKNOWN":
        errorMessageHeading = "We have detected an issue with this address";
        expectedErrorText = "We have detected an issue with the electricity meter at this address. Please contact us so one of our customer support agents can solve this error.";
        await testFunction.click(t, eaNewConnectionPage.elements.txtErrorModal.find("a"));
        const url = await testFunction.getPageURL();
        await t.expect(url).contains("contact-us");
        await testFunction.takeScreenshot(t, "Contact_Us");
        await t.closeWindow();
        break;
      default:
        console.error("Unexpected error");
    }
    await testFunction.assertText(t, eaNewConnectionPage.elements.errorModalHeader, errorMessageHeading);
    await testFunction.assertText(t, eaNewConnectionPage.elements.txtErrorModal, expectedErrorText);
    await testFunction.takeScreenshot(t, "Error_" + errorType);

  }

  public static async goToPlansPage(t) {
    await testFunction.click(t, eaNewConnectionPage.elements.goToButtonOnErrorModal);
  }

  public static async isPlansPageDisplayed(t, expectedPage) {
    if (expectedPage === "plans") {
      await testFunction.isElementVisible(t, eaNewConnectionPage.elements.plansTable);
      await testFunction.takeScreenshot(t, "plans_page");
    } else if (expectedPage === "my account") {
      await testFunction.waitForElementToBeAppeared(t, eaMyAccount.elements.eaSpinner);
      await testFunction.waitForElementToBeDisappeared(t, eaMyAccount.elements.eaSpinner);
      await testFunction.isElementDisplayed(t, eaMyAccount.elements.eleViewAndChangePlan);
      await testFunction.takeScreenshot(t, "dashboard");
    }

  }

}
