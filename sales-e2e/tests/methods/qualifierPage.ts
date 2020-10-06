import {cartsMethod} from './cartsPage';
const eaQualifierPage=require('../pages/qualifier.page');
import {BusinessType, CustomerStatus, IdType, Moving, Property, Solar, testFunction} from '../../global_methods/helper';

export class qualifierMethod{

  public static async selectCustomerStatus(t, customerStatus) {
    if(customerStatus.toLowerCase()===CustomerStatus.NEW.toLowerCase()){
        await testFunction.click(t,eaQualifierPage.elements.newCustomerBtn);
      }
    else if(customerStatus.toLowerCase()===CustomerStatus.EXISTING.toLowerCase()){
      await testFunction.click(t,eaQualifierPage.elements.existingCustomerBtn);
    }
    else{
      console.error('customer status option is not selected.');
    }
    console.log(`${customerStatus} is selected`);
    }

    public static async openQualifier(t){
    if(await testFunction.sizeOfElement(t,eaQualifierPage.elements.btnQualifierClose)>0){
      await testFunction.click(t,eaQualifierPage.elements.btnQualifierClose);
    }
    await cartsMethod.clickContinueCartsPage(t);
    }

    public static async verifyAccount(t,accountNumber,accountIdentityType,postcodeOrABNACN){
      await testFunction.clearAndEnterText(t, eaQualifierPage.elements.accountNumber, accountNumber);
      switch(accountIdentityType){
        case BusinessType.ABN:
          await testFunction.click(t,eaQualifierPage.elements.existingCustomerAbn);
          await testFunction.clearAndEnterText(t, eaQualifierPage.elements.abnAcnField, postcodeOrABNACN);
          await t.wait(2000);
          break;
        case BusinessType.ACN:
          await testFunction.click(t,eaQualifierPage.elements.existingCustomerAcn);
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
      await testFunction.waitForElementPropertyToBeChanged(t,eaQualifierPage.elements.verifyAccountSubmit,'wg-processing',"false");
      console.log("account is verified")
    }
    public static async selectIdTypeQualifier(t, itemToClick) {
    if(await testFunction.isElementExists(t,eaQualifierPage.elements.idTypeDropDown)){
      let val =await testFunction.sizeOfElement(t, eaQualifierPage.elements.idTypeDropDown);
      if(val>1) {
        await testFunction.click(t, eaQualifierPage.elements.idTypeSelectedOption);
        await testFunction.click(t,eaQualifierPage.elements.idTypeDropDown.withText(itemToClick))
        // await testFunction.click(t, itemToClick);
      }
    }
    }
    public static async verifyIdentity(t,idType,idValue){
      switch(idType){
        case IdType.DOB:
          await testFunction.clearTextField(t,eaQualifierPage.elements.idTypeDOBValue);
          await testFunction.clearTextField(t,eaQualifierPage.elements.idTypeDOBMonthValue);
          await testFunction.clearTextField(t,eaQualifierPage.elements.idTypeDOBYearValue);
          await this.provideIdValue(t, idValue,eaQualifierPage.elements.idTypeDOBValue);
          break;
        case IdType.DL:
          await this.selectIdTypeQualifier(t, 'Drivers licence');
          await this.provideIdValue(t, idValue,eaQualifierPage.elements.idTypeValue);
          break;
        case IdType.PIN:
          await this.selectIdTypeQualifier(t, 'Pin');
          await this.provideIdValue(t, idValue,eaQualifierPage.elements.idTypeValue);
          break;
        case IdType.MEDICARE:
          await this.selectIdTypeQualifier(t, 'Medicare');
          await this.provideIdValue(t, idValue,eaQualifierPage.elements.idTypeValue);
          break;
        case IdType.PASSPORT:
          await this.selectIdTypeQualifier(t, 'Passport');
          await this.provideIdValue(t, idValue,eaQualifierPage.elements.idTypeValue);
          break;
        default:
          console.log('Invalid id type');
      }
      await testFunction.takeScreenshot(t, "qualifier_page");//disabled UI Validation
      await t.wait(1000);
      await testFunction.click(t, eaQualifierPage.elements.verifyIdentitySubmit);
      await testFunction.waitForLoadingIconToClose();
      await t.wait(3000);
      console.log("Existing customer ID details are verified");
    }

    public static async provideIdValue(t,idValue, inputField) {
      await testFunction.enterText(t,inputField, idValue);
    }

  public static async verifyFamilyViolenceMessage(t, value){
    await testFunction.assertText(t, eaQualifierPage.elements.familyViolenceMessage, value);
  }

  public static async provideMovingType(t, movingType) {
    if(movingType===Moving.NON_MOVING){
        await testFunction.click(t,eaQualifierPage.elements.nonMoving);
      }
      else if(movingType===Moving.MOVING){
        console.log("inside moving")
          await testFunction.click(t,eaQualifierPage.elements.moving);
      }
      else{
        console.error('moving option is not selected.');
      }
    console.log(`${movingType} is selected`);
  }

  public static async provideAddress(t, address) {
      await testFunction.clearAndEnterText(t,eaQualifierPage.elements.serviceAddress,address);
      await testFunction.isElementVisible(t,eaQualifierPage.elements.serviceAddressList);
      await testFunction.clickElementFromList(t,eaQualifierPage.elements.serviceAddressList,address);
      // if((await testFunction.sizeOfElement(t,eaQualifierPage.elements.addressLoadingIcon))>0)
      //   await testFunction.isElementVisible(t, eaQualifierPage.elements.addressLoadingIcon);
      await testFunction.waitForLoadingIconToClose();
      await t.wait(3000);
      if(await testFunction.sizeOfElement(t,eaQualifierPage.elements.planSelectionPopup)>0){
        await testFunction.click(t,eaQualifierPage.elements.planSelectionPopup);
      }
      await testFunction.click(t, eaQualifierPage.elements.addressContinue);
      console.log(`${address} is provided`);
  }

  public static async enterAddress(t, address) {
    await testFunction.clearAndEnterText(t,eaQualifierPage.elements.serviceAddress,address);
    await testFunction.isElementVisible(t,eaQualifierPage.elements.serviceAddressList);
    await testFunction.clickElementFromList(t,eaQualifierPage.elements.serviceAddressList,address);
    //await testFunction.isElementVisible(t, eaQualifierPage.elements.addressLoadingIcon);
    await testFunction.waitForLoadingIconToClose();
    await t.wait(3000);
    console.log(`${address} is provided`);
  }

  public static async clickOnContinueAddress(t){
    await testFunction.click(t, eaQualifierPage.elements.addressContinue);
  }

  public static async selectDateFromCalendar(t){
    await testFunction.selectDateFromCalendar(t,eaQualifierPage.elements.calendarTable);
  }
  public static async selectPropertyType(t,propertyType){
    if(propertyType ===Property.OWNER){
      await testFunction.click(t,eaQualifierPage.elements.owner);
    }
    else if(propertyType ===Property.RENTER){
      await testFunction.click(t,eaQualifierPage.elements.renter);
    }
    else{
      console.error('Property type is not selected');
    }
  }
  public static async selectSolarOption(t,solarOpt){
    if(solarOpt===Solar.YES){
      await testFunction.click(t,eaQualifierPage.elements.solarYes);
    }
    else if(solarOpt===Solar.NO){
      await testFunction.click(t,eaQualifierPage.elements.solarNo);
    }
    else{
      console.error('Solar option is not selected');
    }
  }

  public static  async validateErrorMessageForBlockerAccounts(t){
    await testFunction.waitForElementToBeAppeared(t,eaQualifierPage.elements.safetyFlagMsgOnQualifier);
    let expectedErrorMessage = "We are currently unable to retrieve your information. Please call 133 466 (Monday – Friday, 8am – 8pm AEST)";
    await testFunction.assertText(t,eaQualifierPage.elements.safetyFlagMsgOnQualifier,expectedErrorMessage);
  }

  public static  async navigateBackToAccountVerification(t){
    await testFunction.click(t,eaQualifierPage.elements.btnBackOnQualifier);
    await testFunction.clearTextField(t,eaQualifierPage.elements.accountNumber);
    if(await testFunction.isElementVisible(t,eaQualifierPage.elements.accountDetail))
      await testFunction.clearTextField(t,eaQualifierPage.elements.accountDetail);
    if(await testFunction.isElementVisible(t,eaQualifierPage.elements.abnAcnField))
      await testFunction.clearTextField(t,eaQualifierPage.elements.abnAcnField);
  }

  public static  async navigateBackFromMovingQuestion(t){
    await testFunction.click(t,eaQualifierPage.elements.btnBackOnQualifier);
    await testFunction.click(t,eaQualifierPage.elements.existingCustomerBtn);
    await testFunction.clearTextField(t,eaQualifierPage.elements.accountNumber);
    if(await testFunction.isElementVisible(t,eaQualifierPage.elements.abnAcnField))
      await testFunction.clearTextField(t,eaQualifierPage.elements.abnAcnField);
    if(await testFunction.isElementVisible(t,eaQualifierPage.elements.accountDetail))
      await testFunction.clearTextField(t,eaQualifierPage.elements.accountDetail);
  }

  public static async verifySuccessfulAccountVerification(t) {
    await testFunction.waitForElementToBeAppeared(t,eaQualifierPage.elements.nonMoving);
    await testFunction.isElementDisplayed(t,eaQualifierPage.elements.nonMoving);
  }

  public static async verifyLookupOnQualifier(t,addressType){
    let headingOnModal,errorMessage;
    switch (addressType) {
      case "ELE_NOT_SERVICED":
        errorMessage="we only supply gas, so we've removed the electricity plan from your quote.";
        await testFunction.assertText(t,eaQualifierPage.elements.txtAddressNotServiced,errorMessage);
        break;
      case "GAS_NOT_SERVICED":
        errorMessage="we only supply electricity, so we've removed the gas plan from your quote.";
        await testFunction.assertText(t,eaQualifierPage.elements.txtAddressNotServiced,errorMessage);
        break;
      case "ADDRESS_NOT_SERVICED":
        errorMessage="Unfortunately we don't supply energy to this address. For more information please call us on";
        await testFunction.assertText(t,eaQualifierPage.elements.txtAddressNotServiced,errorMessage);
        break;
      case "PLAN_NOT_AVAILABLE":
        headingOnModal="Plan Unavailable";
        await testFunction.assertText(t,eaQualifierPage.elements.headingOnChangePlanSelectionModal,headingOnModal);
        break;
      case "INVALID_CUSTOMER_TYPE":
        headingOnModal="Meter detected";
        await testFunction.assertText(t,eaQualifierPage.elements.headingOnChangePlanSelectionModal,headingOnModal);
        break;
      case "INVALID_METER_TYPE":
        let invalidMeterTypeMessage="We’re unable to sign you up online for Electricity because of the meter type detected at this address."
        await testFunction.assertText(t,eaQualifierPage.elements.txtInvalidMeterType,invalidMeterTypeMessage);
        break;
      default:
        throw Error("Invalid Error Code");
    }
  }



}
