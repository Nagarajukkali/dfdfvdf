import {cartsMethod} from './cartsPage';
import {BusinessType, CustomerStatus, IdType, Moving, Property, testFunction} from '../../global_methods/helper';
import {Selector} from "testcafe";
import {plansMethod} from './plansPage';
const { config }=require('../../resources/resource');
const validateAnalyticsEvent=config.validateAnalytics;

const eaQualifierPage = require('../pages/qualifier.page');

export class qualifierMethod {

  public static async selectCustomerStatus(t, customerStatus) {
    if(customerStatus.toLowerCase()===CustomerStatus.NEW.toLowerCase()){
        await testFunction.click(t,eaQualifierPage.elements.newCustomerBtn);
      if(validateAnalyticsEvent==='Y') {
        await plansMethod.validateComponentLibraryEvent(t, "qualifier_page", "new_customer_button");
      }
      }
    else if(customerStatus.toLowerCase()===CustomerStatus.EXISTING.toLowerCase()){
      await testFunction.click(t,eaQualifierPage.elements.existingCustomerBtn);
      if(validateAnalyticsEvent==='Y') {
        await plansMethod.validateComponentLibraryEvent(t, "qualifier_page", "existing_customer_button");
      }
    }
    else{
      console.error('customer status option is not selected.');
    }
    console.log(`${customerStatus} is selected`);
  }

  public static async openQualifier(t) {
    if (await testFunction.sizeOfElement(t, eaQualifierPage.elements.btnQualifierClose) > 0) {
      await testFunction.click(t, eaQualifierPage.elements.btnQualifierClose);
    }
    await cartsMethod.clickContinueCartsPage(t);
  }

  public static async verifyAccount(t, accountNumber, accountIdentityType, postcodeOrABNACN) {
    await testFunction.clearAndEnterText(t, eaQualifierPage.elements.accountNumber, accountNumber);
    switch (accountIdentityType) {
      case BusinessType.ABN:
        await testFunction.click(t, eaQualifierPage.elements.existingCustomerAbn);
        await testFunction.clearAndEnterText(t, eaQualifierPage.elements.abnAcnField, postcodeOrABNACN);
        await t.wait(2000);
        break;
      case BusinessType.ACN:
        await testFunction.click(t, eaQualifierPage.elements.existingCustomerAcn);
        await testFunction.clearAndEnterText(t, eaQualifierPage.elements.abnAcnField, postcodeOrABNACN);
        await t.wait(2000);
        break;
      case 'Postcode':
        await testFunction.clearAndEnterText(t, eaQualifierPage.elements.accountDetail, postcodeOrABNACN);
        await testFunction.isElementVisible(t, eaQualifierPage.elements.accountDetailValidate);
        break;
      default:
        console.log('account identity type is not valid');
    }
    await testFunction.takeScreenshot(t, "qualifier_page");//disabled UI Validation
    await testFunction.click(t, eaQualifierPage.elements.verifyAccountSubmit);
    await testFunction.waitForElementPropertyToBeChanged(t, eaQualifierPage.elements.verifyAccountSubmit, 'wg-processing', "false");
    if(validateAnalyticsEvent==='Y') {
      await plansMethod.validateComponentLibraryEvent(t, "qualifier_page", "verify_account_submit_button");
    }
    console.log("account is verified");
  }

  public static async selectIdTypeQualifier(t, itemToClick) {
    if (await testFunction.isElementExists(t, eaQualifierPage.elements.idTypeDropDown)) {
      let val = await testFunction.sizeOfElement(t, eaQualifierPage.elements.idTypeDropDown);
      if (val > 1) {
        await testFunction.click(t, eaQualifierPage.elements.idTypeSelectedOption);
        await testFunction.click(t, eaQualifierPage.elements.idTypeDropDown.withText(itemToClick));
        // await testFunction.click(t, itemToClick);
      }
    }
  }

  public static async verifyIdentity(t, idType, idValue) {
    switch (idType) {
      case IdType.DOB:
        await testFunction.clearTextField(t, eaQualifierPage.elements.idTypeDOBValue);
        await testFunction.clearTextField(t, eaQualifierPage.elements.idTypeDOBMonthValue);
        await testFunction.clearTextField(t, eaQualifierPage.elements.idTypeDOBYearValue);
        await this.provideIdValue(t, idValue, eaQualifierPage.elements.idTypeDOBValue);
        break;
      case IdType.DL:
        await this.selectIdTypeQualifier(t, 'Driver Licence');
        await this.provideIdValue(t, idValue, eaQualifierPage.elements.idTypeValue);
        break;
      case IdType.PIN:
        await this.selectIdTypeQualifier(t, 'Pin');
        await this.provideIdValue(t, idValue, eaQualifierPage.elements.idTypeValue);
        break;
      case IdType.MEDICARE:
        await this.selectIdTypeQualifier(t, 'Medicare');
        await this.provideIdValue(t, idValue, eaQualifierPage.elements.idTypeValue);
        break;
      case IdType.PASSPORT:
        await this.selectIdTypeQualifier(t, 'Passport');
        await this.provideIdValue(t, idValue, eaQualifierPage.elements.idTypeValue);
        break;
      default:
        console.log('Invalid id type');
    }
    await testFunction.takeScreenshot(t, "qualifier_page");//disabled UI Validation
    await t.wait(1000);
    await testFunction.click(t, eaQualifierPage.elements.verifyIdentitySubmit);
    await testFunction.waitForLoadingIconToClose();
    await t.wait(3000);
    if(validateAnalyticsEvent==='Y') {
      await testFunction.isElementDisplayed(t,eaQualifierPage.elements.moving);
      await plansMethod.validateComponentLibraryEvent(t, "qualifier_page", "verify_account_submit_button");
      const personID = await t.eval(() => window.ead.user.crn);
      await t.expect(personID).notEql("");
      console.log("Existing customer person ID details are verified in analytics logs");
    }
    console.log("Existing customer ID details are verified");
  }

  public static async provideIdValue(t, idValue, inputField) {
    await testFunction.enterText(t, inputField, idValue);
  }

  public static async verifyFamilyViolenceMessage(t, value) {
    await testFunction.assertText(t, eaQualifierPage.elements.familyViolenceMessage, value);
  }

  public static async provideMovingType(t, movingType) {
    if(movingType===Moving.NON_MOVING){
        await testFunction.click(t,eaQualifierPage.elements.nonMoving);
      if(validateAnalyticsEvent==='Y'){
        await plansMethod.validateComponentLibraryEvent(t,"qualifier_page","non_moving_button");
      }
      }
      else if(movingType===Moving.MOVING){
        console.log("inside moving");
          await testFunction.click(t,eaQualifierPage.elements.moving);
      if(validateAnalyticsEvent==='Y'){
        await plansMethod.validateComponentLibraryEvent(t,"qualifier_page","moving_button");
      }
      }
      else{
        console.error('moving option is not selected.');
      }
    console.log(`${movingType} is selected`);
  }

  public static async provideAddress(t, address) {
    const actualAddress = Selector(() => document.getElementById("connection-address-auto-input"));
    const actualAddressText = await actualAddress().value;
    const expectedAddressText = testFunction.formatAddress(address);
    if (actualAddressText.toLowerCase() !== expectedAddressText.toLowerCase()) {
      await testFunction.clearAndEnterText(t, eaQualifierPage.elements.serviceAddress, address);
      await t.wait(2000);
      await testFunction.isElementVisible(t, eaQualifierPage.elements.serviceAddressList);
      await testFunction.clickElementFromList(t, eaQualifierPage.elements.serviceAddressList, address);
      // if((await testFunction.sizeOfElement(t,eaQualifierPage.elements.addressLoadingIcon))>0)
      //   await testFunction.isElementVisible(t, eaQualifierPage.elements.addressLoadingIcon);
      await testFunction.waitForLoadingIconToClose();
      await t.wait(3000);
      if (await testFunction.sizeOfElement(t, eaQualifierPage.elements.planSelectionPopup) > 0) {
        await testFunction.click(t, eaQualifierPage.elements.planSelectionPopup);
      }
    }
    if ((await testFunction.sizeOfElement(t, eaQualifierPage.elements.solarDetectionErrorLink) > 0) && validateAnalyticsEvent==='Y') {
      await testFunction.click(t,eaQualifierPage.elements.solarDetectionErrorLink);
      await t.closeWindow();
      await plansMethod.validateComponentLibraryEvent(t, "qualifier_page", "solar_detection_error_link");
    }
    let continuebutton =await testFunction.getElementText(t, eaQualifierPage.elements.addressContinue);
    await testFunction.click(t, eaQualifierPage.elements.addressContinue);
    if(validateAnalyticsEvent==='Y'){
      if(continuebutton.includes('Continue')){
        await plansMethod.validateComponentLibraryEvent(t,"qualifier_page","address_continue_button");
      }else{
        await plansMethod.validateComponentLibraryEvent(t,"qualifier_page","address_continue_no_solar_button");
      }
    }
    console.log(`${address} is provided`);
  }

  public static async enterAddress(t, address) {
    await testFunction.clearAndEnterText(t, eaQualifierPage.elements.serviceAddress, address);
    await testFunction.isElementVisible(t, eaQualifierPage.elements.serviceAddressList);
    await testFunction.clickElementFromList(t, eaQualifierPage.elements.serviceAddressList, address);
    //await testFunction.isElementVisible(t, eaQualifierPage.elements.addressLoadingIcon);
    await testFunction.waitForLoadingIconToClose();
    await t.wait(3000);
    console.log(`${address} is provided`);
  }

  public static async clickOnContinueAddress(t) {
    await testFunction.click(t, eaQualifierPage.elements.addressContinue);
  }

  public static async selectDateFromCalendar(t,) {
    const dateValue = await testFunction.selectDateFromCalendar(t, eaQualifierPage.elements.calendarTable);
  }

  public static async selectDateFromCalendarAnalyticsEvent(t,movingType) {
    const dateValue = await testFunction.selectDateFromCalendar(t, eaQualifierPage.elements.calendarTable);
    if(validateAnalyticsEvent==='Y'){
      const movingstatus = await t.eval(() => window.ead.productInfo.movingHouse);
      const movingDate = await t.eval(() => window.ead.productInfo.moveInDate);
      if(movingType===Moving.MOVING){
        console
        await t.expect(movingstatus).eql("yes");
        await t.expect(movingDate).contains(dateValue);
      }else if(movingType===Moving.NON_MOVING){
        await t.expect(movingstatus).eql("no");
        await t.expect(movingDate).contains("");
      }
      console.log("Moving status and Moving date analytics validated");
    }

  }

  public static async selectPropertyType(t,propertyType){
    if(propertyType ===Property.OWNER){
      await testFunction.click(t,eaQualifierPage.elements.owner);
      if(validateAnalyticsEvent==='Y') {
        const customerPropertyRelationship = await t.eval(() => window.ead.user.tenancyType);
        await t.expect(customerPropertyRelationship).eql("owner");
      }
    }
    else if(propertyType ===Property.RENTER){
      await testFunction.click(t,eaQualifierPage.elements.renter);
      if(validateAnalyticsEvent==='Y') {
        const customerPropertyRelationship = await t.eval(() => window.ead.user.tenancyType);
        await t.expect(customerPropertyRelationship).eql("renter");
      }
    }
    else{
      console.error('Property type is not selected');
    }
    console.log('Property type and Property Analytics is validated successfully');
  }

  public static async validateErrorMessageForBlockerAccounts(t) {
    await testFunction.waitForElementToBeAppeared(t, eaQualifierPage.elements.safetyFlagMsgOnQualifier);
    let expectedErrorMessage = "We are currently unable to retrieve your information. Please call 133 466 (Monday – Friday, 8am – 8pm AEST)";
    await testFunction.assertText(t, eaQualifierPage.elements.safetyFlagMsgOnQualifier, expectedErrorMessage);
  }

  public static async navigateBackToAccountVerification(t) {
    await testFunction.click(t, eaQualifierPage.elements.btnBackOnQualifier);
    await testFunction.clearTextField(t, eaQualifierPage.elements.accountNumber);
    if (await testFunction.isElementVisible(t, eaQualifierPage.elements.accountDetail)) {
      await testFunction.clearTextField(t, eaQualifierPage.elements.accountDetail);
    }
    if (await testFunction.isElementVisible(t, eaQualifierPage.elements.abnAcnField)) {
      await testFunction.clearTextField(t, eaQualifierPage.elements.abnAcnField);
    }
  }

  public static async navigateBackFromMovingQuestion(t) {
    await testFunction.click(t, eaQualifierPage.elements.btnBackOnQualifier);
    await testFunction.click(t, eaQualifierPage.elements.existingCustomerBtn);
    await testFunction.clearTextField(t, eaQualifierPage.elements.accountNumber);
    if (await testFunction.isElementVisible(t, eaQualifierPage.elements.abnAcnField)) {
      await testFunction.clearTextField(t, eaQualifierPage.elements.abnAcnField);
    }
    if (await testFunction.isElementVisible(t, eaQualifierPage.elements.accountDetail)) {
      await testFunction.clearTextField(t, eaQualifierPage.elements.accountDetail);
    }
  }

  public static async verifySuccessfulAccountVerification(t) {
    await testFunction.waitForElementToBeAppeared(t, eaQualifierPage.elements.nonMoving);
    await testFunction.isElementDisplayed(t, eaQualifierPage.elements.nonMoving);
  }

  public static async verifyLookupOnQualifier(t, addressType) {
    let headingOnModal, errorMessage;
    switch (addressType) {
      case "ELE_NOT_SERVICED":
        errorMessage = "we only supply gas, so we've removed the electricity plan from your quote.";
        await testFunction.assertText(t, eaQualifierPage.elements.txtAddressNotServiced, errorMessage);
        break;
      case "GAS_NOT_SERVICED":
        errorMessage = "we only supply electricity, so we've removed the gas plan from your quote.";
        await testFunction.assertText(t, eaQualifierPage.elements.txtAddressNotServiced, errorMessage);
        break;
      case "ADDRESS_NOT_SERVICED":
        errorMessage = "Unfortunately we don't supply energy to this address. For more information please call us on";
        await testFunction.assertText(t, eaQualifierPage.elements.txtAddressNotServiced, errorMessage);
        break;
      case "NSW_REMOTE_METER":
        errorMessage = "This electricity meter has been remotely disconnected and can't be reconnected by us (you need a retailer that can remotely connect meters).";
        await testFunction.waitForElementToBeAppeared(t, eaQualifierPage.elements.txtInvalidMeterType);
        await testFunction.assertText(t, eaQualifierPage.elements.txtInvalidMeterType, errorMessage);
        break;
      case "PLAN_NOT_AVAILABLE":
        headingOnModal = "Plan Unavailable";
        await testFunction.assertText(t, eaQualifierPage.elements.headingOnChangePlanSelectionModal, headingOnModal);
        break;
      case "INVALID_CUSTOMER_TYPE":
        headingOnModal = "Meter detected";
        await testFunction.assertText(t, eaQualifierPage.elements.headingOnChangePlanSelectionModal, headingOnModal);
        break;
      case "INVALID_METER_TYPE":
        let invalidMeterTypeMessage = "We’re unable to sign you up online for Electricity because of the meter type detected at this address.";
        await testFunction.assertText(t, eaQualifierPage.elements.txtInvalidMeterType, invalidMeterTypeMessage);
        break;
      default:
        throw Error("Invalid Error Code");
    }
  }


}
