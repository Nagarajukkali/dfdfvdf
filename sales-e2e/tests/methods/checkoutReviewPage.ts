const eaCheckoutReviewPage = require('../pages/checkoutReview.page')
import {FuelType, LSDevices, SelectionType, testFuncs} from '../../global_methods/helper';
const helper  = testFuncs();

export function checkoutReviewPage() {
    async function verifyLifeSupportSection(t) {
      await helper.isElementDisplayed(t, eaCheckoutReviewPage.elements.lifeSupportHeader);
      await helper.isElementDisplayed(t, eaCheckoutReviewPage.elements.lifeSupportDisclaimer);
    }

  async function verifyLifeSupportQuestion(t, fuelType) {
      await helper.isElementDisplayed(t, eaCheckoutReviewPage.elements.lifeSupportQuestionSection);
      switch (fuelType) {
          case FuelType.DUAL:
              await helper.assertText(t, eaCheckoutReviewPage.elements.lifeSupportQuestion, "Is anyone at this property on life support?");
              break;
          case FuelType.ELECTRICITY:
              await helper.assertText(t, eaCheckoutReviewPage.elements.lifeSupportQuestion, "Is anyone at this property on life support for electricity?");
              break;
          case FuelType.GAS:
              await helper.assertText(t, eaCheckoutReviewPage.elements.lifeSupportQuestion, "Is anyone at this property on life support for gas?");
              break;
      }
      await t.expect(eaCheckoutReviewPage.elements.lifeSupportQuestionYes.hasClass("ea-state-active"));
      await t.expect(eaCheckoutReviewPage.elements.lifeSupportQuestionNo.hasClass("ea-state-active"));
  }

  async function answerLifeSupportQuestion(t,option) {
      if(option==="Yes")
        await helper.click(t,eaCheckoutReviewPage.elements.rbLifeSupportYes);
      else if(option==="No")
        await helper.click(t,eaCheckoutReviewPage.elements.rbLifeSupportNo);
      else {
        console.log("Invalid option selected.");
        /*fail(String.format("Expected Life Support answer to be 'yes' or 'no', not '%s'.", option));*/
      }
  }

  async function submitQuote(t){
      await helper.click(t, eaCheckoutReviewPage.elements.agreeAndConfirm);
  }

  async function validatePresenceOfFuelAccordion(t,fuelType) {
      if(fuelType === FuelType.ELECTRICITY || fuelType === FuelType.DUAL) {
        await helper.isElementDisplayed(t,eaCheckoutReviewPage.elements.lifeSupportElec);
        await helper.isElementDisplayed(t,eaCheckoutReviewPage.elements.btnRegisterDeviceElec);
      }
      if(fuelType === FuelType.GAS || fuelType === FuelType.DUAL) {
        await helper.isElementDisplayed(t,eaCheckoutReviewPage.elements.lifeSupportGas);
        await helper.isElementDisplayed(t,eaCheckoutReviewPage.elements.btnRegisterDeviceGas);
      }
  }

  async function clickOnRegisterDeviceBtn(t, fuelType) {
    if(fuelType === FuelType.ELECTRICITY || fuelType === FuelType.DUAL) {
      await helper.click(t, eaCheckoutReviewPage.elements.btnRegisterDeviceElec);
    }
    if(fuelType === FuelType.GAS || fuelType === FuelType.DUAL) {
      await helper.click(t, eaCheckoutReviewPage.elements.btnRegisterDeviceGas);
    }
  }

  async function validateLifeSupportDeviceList(t, fuelType) {
    if(fuelType === FuelType.ELECTRICITY || fuelType === FuelType.DUAL) {
      await helper.isElementDisplayed(t, eaCheckoutReviewPage.elements.cbEleDevice_LSCNSPE);
      await helper.assertText(t, eaCheckoutReviewPage.elements.cbEleDevice_LSCNSPE, LSDevices.ELE_LSCNSPE);

      await helper.isElementDisplayed(t, eaCheckoutReviewPage.elements.cbEleDevice_LSCPAPR);
      await helper.assertText(t, eaCheckoutReviewPage.elements.cbEleDevice_LSCPAPR, LSDevices.ELE_LSCPAPR);

      await helper.isElementDisplayed(t, eaCheckoutReviewPage.elements.cbEleDevice_LSIPDM);
      await helper.assertText(t, eaCheckoutReviewPage.elements.cbEleDevice_LSIPDM, LSDevices.ELE_LSIPDM);

      await helper.isElementDisplayed(t, eaCheckoutReviewPage.elements.cbEleDevice_LSKDM);
      await helper.assertText(t, eaCheckoutReviewPage.elements.cbEleDevice_LSKDM, LSDevices.ELE_LSKDM);

      await helper.isElementDisplayed(t, eaCheckoutReviewPage.elements.cbEleDevice_LSOC);
      await helper.assertText(t, eaCheckoutReviewPage.elements.cbEleDevice_LSOC, LSDevices.ELE_LSOC);

      await helper.isElementDisplayed(t, eaCheckoutReviewPage.elements.cbEleDevice_LSVFLS);
      await helper.assertText(t, eaCheckoutReviewPage.elements.cbEleDevice_LSVFLS, LSDevices.ELE_LSVFLS);

      await helper.isElementDisplayed(t, eaCheckoutReviewPage.elements.cbEleDevice_OTHER);
      await helper.assertText(t, eaCheckoutReviewPage.elements.cbEleDevice_OTHER, LSDevices.ELE_OTHER);
    }
    if(fuelType === FuelType.GAS || fuelType === FuelType.DUAL) {
      await helper.isElementDisplayed(t, eaCheckoutReviewPage.elements.cbGasDevice_GLSMRHAC);
      await helper.assertText(t, eaCheckoutReviewPage.elements.cbGasDevice_GLSMRHAC, LSDevices.GAS_GLSMRHAC);

      await helper.isElementDisplayed(t, eaCheckoutReviewPage.elements.cbGasDevice_GLSMRHW);
      await helper.assertText(t, eaCheckoutReviewPage.elements.cbGasDevice_GLSMRHW, LSDevices.GAS_GLSMRHW);

      await helper.isElementDisplayed(t, eaCheckoutReviewPage.elements.cbGasDevice_OTHER);
      await helper.assertText(t, eaCheckoutReviewPage.elements.cbGasDevice_OTHER, LSDevices.GAS_OTHER);
    }
  }

  async function clickOtherCheckbox(t, selection, fuelType) {
    if(fuelType === FuelType.ELECTRICITY || fuelType === FuelType.DUAL) {
      if(selection === SelectionType.CHECK) {
        while (!((await helper.getElementAttribute(t, eaCheckoutReviewPage.elements.cbEleDevice_OTHER, "class")).includes("ea-state-checked")))
          await helper.click(t, eaCheckoutReviewPage.elements.cbEleDevice_OTHER);
      }else {
        while ((await helper.getElementAttribute(t, eaCheckoutReviewPage.elements.cbEleDevice_OTHER, "class")).includes("ea-state-checked"))
          await helper.click(t, eaCheckoutReviewPage.elements.cbEleDevice_OTHER);
      }
    }
    if(fuelType === FuelType.GAS || fuelType === FuelType.DUAL) {
      if(selection === SelectionType.CHECK) {
        while (!((await helper.getElementAttribute(t, eaCheckoutReviewPage.elements.cbGasDevice_OTHER, "class")).includes("ea-state-checked")))
          await helper.click(t, eaCheckoutReviewPage.elements.cbGasDevice_OTHER);
      }else {
        while ((await helper.getElementAttribute(t, eaCheckoutReviewPage.elements.cbGasDevice_OTHER, "class")).includes("ea-state-checked"))
          await helper.click(t, eaCheckoutReviewPage.elements.cbGasDevice_OTHER);
      }
    }
  }

  async function validatePresenceOfOtherTextfield(t, fuelType) {
    if(fuelType === FuelType.ELECTRICITY || fuelType === FuelType.DUAL) {
      await helper.isElementDisplayed(t, eaCheckoutReviewPage.elements.tfOtherEquipmentDetailsElec);
    }
    if(fuelType === FuelType.GAS || fuelType === FuelType.DUAL) {
      await helper.isElementDisplayed(t, eaCheckoutReviewPage.elements.tfOtherEquipmentDetailsGas);
    }
  }

  return{
    validatePresenceOfFuelAccordion,
    answerLifeSupportQuestion,
    verifyLifeSupportQuestion,
    submitQuote,
    clickOnRegisterDeviceBtn,
    validateLifeSupportDeviceList,
    clickOtherCheckbox
  };
}
