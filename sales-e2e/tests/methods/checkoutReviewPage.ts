import {FUEL_TYPE_OPTIONS} from '@ea/ea-commons-models';
const eaCheckoutReviewPage=require('../pages/checkoutReview.page')
import {LSDevices, SelectionType, testFunction} from '../../global_methods/helper';


export class checkoutReviewMethod {
    public static async verifyLifeSupportSection(t) {
      await testFunction.isElementDisplayed(t, eaCheckoutReviewPage.elements.lifeSupportHeader);
      await testFunction.isElementDisplayed(t, eaCheckoutReviewPage.elements.lifeSupportDisclaimer);
    }

  public static async verifyLifeSupportQuestion(t, fuelType) {
      await testFunction.isElementDisplayed(t, eaCheckoutReviewPage.elements.lifeSupportQuestionSection);
      switch (fuelType) {
          case FUEL_TYPE_OPTIONS.BOTH:
              await testFunction.assertText(t, eaCheckoutReviewPage.elements.lifeSupportQuestion, "Is anyone at this property on life support?");
              break;
          case FUEL_TYPE_OPTIONS.ELE:
              await testFunction.assertText(t, eaCheckoutReviewPage.elements.lifeSupportQuestion, "Is anyone at this property on life support for electricity?");
              break;
          case FUEL_TYPE_OPTIONS.GAS:
              await testFunction.assertText(t, eaCheckoutReviewPage.elements.lifeSupportQuestion, "Is anyone at this property on life support for gas?");
              break;
      }
      await t.expect(eaCheckoutReviewPage.elements.lifeSupportQuestionYes.hasClass("ea-state-active"));
      await t.expect(eaCheckoutReviewPage.elements.lifeSupportQuestionNo.hasClass("ea-state-active"));
  }

  public static async answerLifeSupportQuestion(t,option) {
      if(option==="Yes")
        await testFunction.click(t,eaCheckoutReviewPage.elements.lifeSupportQuestionYes);
      else if(option==="No")
        await testFunction.click(t,eaCheckoutReviewPage.elements.lifeSupportQuestionNo);
      else {
        console.error("Invalid option selected.");
      }
  }

  public static async submitQuote(t){
      await testFunction.click(t, eaCheckoutReviewPage.elements.agreeAndConfirm);
  }

  public static async validatePresenceOfFuelAccordion(t,fuelType) {
      if(await testFunction.isElectricity(fuelType)) {
        await testFunction.isElementDisplayed(t,eaCheckoutReviewPage.elements.lifeSupportElec);
        await testFunction.isElementDisplayed(t,eaCheckoutReviewPage.elements.btnRegisterDeviceElec);
      }
      if(await testFunction.isGas(fuelType)) {
        await testFunction.isElementDisplayed(t,eaCheckoutReviewPage.elements.lifeSupportGas);
        await testFunction.isElementDisplayed(t,eaCheckoutReviewPage.elements.btnRegisterDeviceGas);
      }
  }

  public static async clickOnRegisterDeviceBtn(t, fuelType) {
    if(await testFunction.isElectricity(fuelType)) {
      await testFunction.click(t, eaCheckoutReviewPage.elements.btnRegisterDeviceElec);
    }
    if(await testFunction.isGas(fuelType)) {
      await testFunction.click(t, eaCheckoutReviewPage.elements.btnRegisterDeviceGas);
    }
  }

  public static async validateLifeSupportDeviceList(t, fuelType) {
    if(await testFunction.isElectricity(fuelType)) {
      await testFunction.isElementDisplayed(t, eaCheckoutReviewPage.elements.cbEleDevice_LSCNSPE);
      await testFunction.assertText(t, eaCheckoutReviewPage.elements.cbEleDevice_LSCNSPE, LSDevices.ELE_LSCNSPE);

      await testFunction.isElementDisplayed(t, eaCheckoutReviewPage.elements.cbEleDevice_LSCPAPR);
      await testFunction.assertText(t, eaCheckoutReviewPage.elements.cbEleDevice_LSCPAPR, LSDevices.ELE_LSCPAPR);

      await testFunction.isElementDisplayed(t, eaCheckoutReviewPage.elements.cbEleDevice_LSIPDM);
      await testFunction.assertText(t, eaCheckoutReviewPage.elements.cbEleDevice_LSIPDM, LSDevices.ELE_LSIPDM);

      await testFunction.isElementDisplayed(t, eaCheckoutReviewPage.elements.cbEleDevice_LSKDM);
      await testFunction.assertText(t, eaCheckoutReviewPage.elements.cbEleDevice_LSKDM, LSDevices.ELE_LSKDM);

      await testFunction.isElementDisplayed(t, eaCheckoutReviewPage.elements.cbEleDevice_LSOC);
      await testFunction.assertText(t, eaCheckoutReviewPage.elements.cbEleDevice_LSOC, LSDevices.ELE_LSOC);

      await testFunction.isElementDisplayed(t, eaCheckoutReviewPage.elements.cbEleDevice_LSVFLS);
      await testFunction.assertText(t, eaCheckoutReviewPage.elements.cbEleDevice_LSVFLS, LSDevices.ELE_LSVFLS);

      await testFunction.isElementDisplayed(t, eaCheckoutReviewPage.elements.cbEleDevice_OTHER);
      await testFunction.assertText(t, eaCheckoutReviewPage.elements.cbEleDevice_OTHER, LSDevices.ELE_OTHER);
    }
    if(await testFunction.isGas(fuelType)) {
      await testFunction.isElementDisplayed(t, eaCheckoutReviewPage.elements.cbGasDevice_GLSMRHAC);
      await testFunction.assertText(t, eaCheckoutReviewPage.elements.cbGasDevice_GLSMRHAC, LSDevices.GAS_GLSMRHAC);

      await testFunction.isElementDisplayed(t, eaCheckoutReviewPage.elements.cbGasDevice_GLSMRHW);
      await testFunction.assertText(t, eaCheckoutReviewPage.elements.cbGasDevice_GLSMRHW, LSDevices.GAS_GLSMRHW);

      await testFunction.isElementDisplayed(t, eaCheckoutReviewPage.elements.cbGasDevice_OTHER);
      await testFunction.assertText(t, eaCheckoutReviewPage.elements.cbGasDevice_OTHER, LSDevices.GAS_OTHER);
    }
  }

  public static async clickOtherCheckbox(t, selection, fuelType) {
    if(await testFunction.isElectricity(fuelType)) {
      if(selection ===SelectionType.CHECK) {
        while (!((await testFunction.getElementAttribute(t, eaCheckoutReviewPage.elements.cbEleDevice_OTHER, "class")).includes("ea-state-checked")))
          await testFunction.click(t, eaCheckoutReviewPage.elements.cbEleDevice_OTHER);
      }else {
        while ((await testFunction.getElementAttribute(t, eaCheckoutReviewPage.elements.cbEleDevice_OTHER, "class")).includes("ea-state-checked"))
          await testFunction.click(t, eaCheckoutReviewPage.elements.cbEleDevice_OTHER);
      }
    }
    if(await testFunction.isGas(fuelType)) {
      if(selection ===SelectionType.CHECK) {
        while (!((await testFunction.getElementAttribute(t, eaCheckoutReviewPage.elements.cbGasDevice_OTHER, "class")).includes("ea-state-checked")))
          await testFunction.click(t, eaCheckoutReviewPage.elements.cbGasDevice_OTHER);
      }else {
        while ((await testFunction.getElementAttribute(t, eaCheckoutReviewPage.elements.cbGasDevice_OTHER, "class")).includes("ea-state-checked"))
          await testFunction.click(t, eaCheckoutReviewPage.elements.cbGasDevice_OTHER);
      }
    }
  }

  public static async validatePresenceOfOtherTextfield(t, fuelType) {
    if(await testFunction.isElectricity(fuelType)) {
      await testFunction.isElementDisplayed(t, eaCheckoutReviewPage.elements.tfOtherEquipmentDetailsElec);
    }
    if(await testFunction.isGas(fuelType)) {
      await testFunction.isElementDisplayed(t, eaCheckoutReviewPage.elements.tfOtherEquipmentDetailsGas);
    }
  }

  public static async validateOtherFieldPlaceholder(t, expectedPlaceholder, fuelType) {
    if(await testFunction.isElectricity(fuelType)) {
      await t.expect(testFunction.getElementAttribute(t, eaCheckoutReviewPage.elements.tfOtherEquipmentDetailsElec, "placeholder")).contains(expectedPlaceholder);
    }
    if(await testFunction.isGas(fuelType)) {
      await t.expect(testFunction.getElementAttribute(t, eaCheckoutReviewPage.elements.tfOtherEquipmentDetailsGas, "placeholder")).contains(expectedPlaceholder);
    }
  }

  public static async validateMaxLengthForOtherEquipmentsTextfield(t, expectedMaxLength, fuelType) {
    let randomText=await testFunction.generateRandomText(expectedMaxLength + 1);
    if(await testFunction.isElectricity(fuelType)) {
      await t.typeText(eaCheckoutReviewPage.elements.tfOtherEquipmentDetailsElec, randomText);
      /*for(let i=0 ; i < randomText.length ; i++) {
        sendkeys(Review_LifeSupportPage.tfOtherEquipmentDetailsElec, String.valueOf(randomText.charAt(i)));
      }*/
      await t.expect(eaCheckoutReviewPage.elements.tfOtherEquipmentDetailsElec.length).eql(expectedMaxLength);
    }
    if(await testFunction.isGas(fuelType)) {
      await t.typeText(eaCheckoutReviewPage.elements.tfOtherEquipmentDetailsGas, randomText);
      /*for(let i=0 ; i < randomText.length ; i++) {
        sendkeys(Review_LifeSupportPage.tfOtherEquipmentDetailsGas, String.valueOf(randomText.charAt(i)));
      }*/
      await t.expect(eaCheckoutReviewPage.elements.tfOtherEquipmentDetailsGas.length).eql(expectedMaxLength);
    }
  }

  public static async validateAbsenceOfOtherTextarea(t, fuelType) {
    if(await testFunction.isElectricity(fuelType)) {
      await testFunction.isElementAbsent(t, eaCheckoutReviewPage.elements.tfOtherEquipmentDetailsElec);
    }
    if(await testFunction.isGas(fuelType)) {
      await testFunction.isElementAbsent(t, eaCheckoutReviewPage.elements.tfOtherEquipmentDetailsGas);
    }
  }

  public static async validateReappearenceOfTextfieldWithPrefilledData(t, fuelType) {
    if(await testFunction.isElectricity(fuelType)) {
      await testFunction.isElementDisplayed(t, eaCheckoutReviewPage.elements.tfOtherEquipmentDetailsElec);
      await t.expect(eaCheckoutReviewPage.elements.tfOtherEquipmentDetailsElec.length).notEql(0);
    }
    if(await testFunction.isGas(fuelType)) {
      await testFunction.isElementDisplayed(t, eaCheckoutReviewPage.elements.tfOtherEquipmentDetailsGas);
      await t.expect(eaCheckoutReviewPage.elements.tfOtherEquipmentDetailsGas.length).notEql(0);
    }
  }

  public static async validateTheSelectedOptionAndAbsenceOfFuelAccordions(t, expectedSelection, fuelType) {
    let classValue;
    if(expectedSelection ==="yes") {
      classValue=await testFunction.getElementAttribute(t, eaCheckoutReviewPage.elements.lifeSupportQuestionYes, "class");
    }
    else {
      classValue=await testFunction.getElementAttribute(t, eaCheckoutReviewPage.elements.lifeSupportQuestionNo, "class");
    }
    await classValue.include("ea-state-active").ok();

    if(await testFunction.isElectricity(fuelType))
      await testFunction.isElementAbsent(t, eaCheckoutReviewPage.elements.lifeSupportElec);
    if(await testFunction.isGas(fuelType))
      await testFunction.isElementAbsent(t, eaCheckoutReviewPage.elements.lifeSupportGas);
  }

  public static async validatePresenceOfGenericLSError(t, expectedError) {
    await testFunction.isElementDisplayed(t, eaCheckoutReviewPage.elements.lblGenericError);
    await testFunction.assertText(t, eaCheckoutReviewPage.elements.lblGenericError, expectedError);
  }

  public static async validatePresenceOfErrorMessageUnderneathOtherTextarea(t, expectedError, fuelType) {
    if(await testFunction.isElectricity(fuelType)) {
      await testFunction.isElementDisplayed(t, eaCheckoutReviewPage.elements.lblElecOtherFieldError);
      await testFunction.assertText(t, eaCheckoutReviewPage.elements.lblElecOtherFieldError, expectedError);
    }
    if(await testFunction.isGas(fuelType)) {
      await testFunction.isElementDisplayed(t, eaCheckoutReviewPage.elements.lblGasOtherFieldError);
      await testFunction.assertText(t, eaCheckoutReviewPage.elements.lblGasOtherFieldError, expectedError);
    }
  }

  public static async selectLSDevice(t, webElement) {
    let tryCount=0;
    do{
      await testFunction.click(t, webElement);
      tryCount++;
      if(tryCount > 5)
        break;
    }while (!((await testFunction.getElementAttribute(t, webElement, "class")).includes("ea-state-checked")));
  }

  public static async selectLSEquipment(t, equipmentName, fuelType) {
    if(await testFunction.isElectricity(fuelType)) {
      switch (equipmentName) {
        case LSDevices.ELE_LSCNSPE:
          await this.selectLSDevice(t, eaCheckoutReviewPage.elements.cbEleDevice_LSCNSPE);
          break;
        case LSDevices.ELE_LSCPAPR:
          await this.selectLSDevice(t, eaCheckoutReviewPage.elements.cbEleDevice_LSCPAPR);
          break;
        case LSDevices.ELE_LSIPDM:
          await this.selectLSDevice(t, eaCheckoutReviewPage.elements.cbEleDevice_LSIPDM);
          break;
        case LSDevices.ELE_LSKDM:
          await this.selectLSDevice(t, eaCheckoutReviewPage.elements.cbEleDevice_LSKDM);
          break;
        case LSDevices.ELE_LSOC:
          await this.selectLSDevice(t, eaCheckoutReviewPage.elements.cbEleDevice_LSOC);
          break;
        case LSDevices.ELE_LSVFLS:
          await this.selectLSDevice(t, eaCheckoutReviewPage.elements.cbEleDevice_LSVFLS);
          break;
        case LSDevices.ELE_OTHER:
          await this.selectLSDevice(t, eaCheckoutReviewPage.elements.cbEleDevice_OTHER);
          await testFunction.clearAndEnterText(t, eaCheckoutReviewPage.elements.tfOtherEquipmentDetailsElec, "Sample Other electricity device.");
          break;
        default:
          console.log("Invalid Electricity Equipment.");
      }
    }
    if(await testFunction.isGas(fuelType)) {
      switch (equipmentName) {
        case LSDevices.GAS_GLSMRHAC:
          await this.selectLSDevice(t, eaCheckoutReviewPage.elements.cbGasDevice_GLSMRHAC);
          break;
        case LSDevices.GAS_GLSMRHW:
          await this.selectLSDevice(t, eaCheckoutReviewPage.elements.cbGasDevice_GLSMRHW);
          break;
        case LSDevices.GAS_OTHER:
          await this.selectLSDevice(t, eaCheckoutReviewPage.elements.cbGasDevice_OTHER);
          await testFunction.clearAndEnterText(t, eaCheckoutReviewPage.elements.tfOtherEquipmentDetailsGas, "Sample Other gas device.");
          break;
        default:
          console.log("Invalid Gas Equipment.");
      }
    }
  }

  public static async validateAbsenceOfFuelAccordion(t, fuelType) {
    if(await testFunction.isElectricity(fuelType))
      await testFunction.isElementAbsent(t, eaCheckoutReviewPage.elements.lifeSupportElec);
    if(await testFunction.isGas(fuelType))
      await testFunction.isElementAbsent(t, eaCheckoutReviewPage.elements.lifeSupportGas);
  }

  public static async clickCancelCTA(t, fuelType) {
    if(await testFunction.isElectricity(fuelType))
      await testFunction.click(t, eaCheckoutReviewPage.elements.btnCancelElec);
    if(await testFunction.isGas(fuelType))
      await testFunction.click(t, eaCheckoutReviewPage.elements.btnCancelGas);
  }

  public static async validatePresenceOfRegisterDeviceCTA(t, fuelType) {
    if(await testFunction.isElectricity(fuelType))
      await testFunction.isElementDisplayed(t, eaCheckoutReviewPage.elements.btnRegisterDeviceElec);
    if(await testFunction.isGas(fuelType))
      await testFunction.isElementDisplayed(t, eaCheckoutReviewPage.elements.btnRegisterDeviceGas);
  }

}
