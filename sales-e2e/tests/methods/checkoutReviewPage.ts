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
      if(await helper.isElectricity(fuelType)) {
        await helper.isElementDisplayed(t,eaCheckoutReviewPage.elements.lifeSupportElec);
        await helper.isElementDisplayed(t,eaCheckoutReviewPage.elements.btnRegisterDeviceElec);
      }
      if(await helper.isGas(fuelType)) {
        await helper.isElementDisplayed(t,eaCheckoutReviewPage.elements.lifeSupportGas);
        await helper.isElementDisplayed(t,eaCheckoutReviewPage.elements.btnRegisterDeviceGas);
      }
  }

  async function clickOnRegisterDeviceBtn(t, fuelType) {
    if(await helper.isElectricity(fuelType)) {
      await helper.click(t, eaCheckoutReviewPage.elements.btnRegisterDeviceElec);
    }
    if(await helper.isGas(fuelType)) {
      await helper.click(t, eaCheckoutReviewPage.elements.btnRegisterDeviceGas);
    }
  }

  async function validateLifeSupportDeviceList(t, fuelType) {
    if(await helper.isElectricity(fuelType)) {
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
    if(await helper.isGas(fuelType)) {
      await helper.isElementDisplayed(t, eaCheckoutReviewPage.elements.cbGasDevice_GLSMRHAC);
      await helper.assertText(t, eaCheckoutReviewPage.elements.cbGasDevice_GLSMRHAC, LSDevices.GAS_GLSMRHAC);

      await helper.isElementDisplayed(t, eaCheckoutReviewPage.elements.cbGasDevice_GLSMRHW);
      await helper.assertText(t, eaCheckoutReviewPage.elements.cbGasDevice_GLSMRHW, LSDevices.GAS_GLSMRHW);

      await helper.isElementDisplayed(t, eaCheckoutReviewPage.elements.cbGasDevice_OTHER);
      await helper.assertText(t, eaCheckoutReviewPage.elements.cbGasDevice_OTHER, LSDevices.GAS_OTHER);
    }
  }

  async function clickOtherCheckbox(t, selection, fuelType) {
    if(await helper.isElectricity(fuelType)) {
      if(selection === SelectionType.CHECK) {
        while (!((await helper.getElementAttribute(t, eaCheckoutReviewPage.elements.cbEleDevice_OTHER, "class")).includes("ea-state-checked")))
          await helper.click(t, eaCheckoutReviewPage.elements.cbEleDevice_OTHER);
      }else {
        while ((await helper.getElementAttribute(t, eaCheckoutReviewPage.elements.cbEleDevice_OTHER, "class")).includes("ea-state-checked"))
          await helper.click(t, eaCheckoutReviewPage.elements.cbEleDevice_OTHER);
      }
    }
    if(await helper.isGas(fuelType)) {
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
    if(await helper.isElectricity(fuelType)) {
      await helper.isElementDisplayed(t, eaCheckoutReviewPage.elements.tfOtherEquipmentDetailsElec);
    }
    if(await helper.isGas(fuelType)) {
      await helper.isElementDisplayed(t, eaCheckoutReviewPage.elements.tfOtherEquipmentDetailsGas);
    }
  }

  async function validateOtherFieldPlaceholder(t, expectedPlaceholder, fuelType) {
    if(await helper.isElectricity(fuelType)) {
      await t.expect(helper.getElementAttribute(t, eaCheckoutReviewPage.elements.tfOtherEquipmentDetailsElec, "placeholder")).contains(expectedPlaceholder);
    }
    if(await helper.isGas(fuelType)) {
      await t.expect(helper.getElementAttribute(t, eaCheckoutReviewPage.elements.tfOtherEquipmentDetailsGas, "placeholder")).contains(expectedPlaceholder);
    }
  }

  async function validateMaxLengthForOtherEquipmentsTextfield(t, expectedMaxLength, fuelType) {
    let randomText = await helper.generateRandomText(expectedMaxLength + 1);
    if(await helper.isElectricity(fuelType)) {
      await t.typeText(eaCheckoutReviewPage.elements.tfOtherEquipmentDetailsElec, randomText);
      /*for(let i=0 ; i < randomText.length ; i++) {
        sendkeys(Review_LifeSupportPage.tfOtherEquipmentDetailsElec, String.valueOf(randomText.charAt(i)));
      }*/
      await t.expect(eaCheckoutReviewPage.elements.tfOtherEquipmentDetailsElec.length).eql(expectedMaxLength);
    }
    if(await helper.isGas(fuelType)) {
      await t.typeText(eaCheckoutReviewPage.elements.tfOtherEquipmentDetailsGas, randomText);
      /*for(let i=0 ; i < randomText.length ; i++) {
        sendkeys(Review_LifeSupportPage.tfOtherEquipmentDetailsGas, String.valueOf(randomText.charAt(i)));
      }*/
      await t.expect(eaCheckoutReviewPage.elements.tfOtherEquipmentDetailsGas.length).eql(expectedMaxLength);
    }
  }

  async function validateAbsenceOfOtherTextarea(t, fuelType) {
    if(await helper.isElectricity(fuelType)) {
      await helper.isElementAbsent(t, eaCheckoutReviewPage.elements.tfOtherEquipmentDetailsElec);
    }
    if(await helper.isGas(fuelType)) {
      await helper.isElementAbsent(t, eaCheckoutReviewPage.elements.tfOtherEquipmentDetailsGas);
    }
  }

  async function validateReappearenceOfTextfieldWithPrefilledData(t, fuelType) {
    if(await helper.isElectricity(fuelType)) {
      await helper.isElementDisplayed(t, eaCheckoutReviewPage.elements.tfOtherEquipmentDetailsElec);
      await t.expect(eaCheckoutReviewPage.elements.tfOtherEquipmentDetailsElec.length).notEql(0);
    }
    if(await helper.isGas(fuelType)) {
      await helper.isElementDisplayed(t, eaCheckoutReviewPage.elements.tfOtherEquipmentDetailsGas);
      await t.expect(eaCheckoutReviewPage.elements.tfOtherEquipmentDetailsGas.length).notEql(0);
    }
  }

  async function validateTheSelectedOptionAndAbsenceOfFuelAccordions(t, expectedSelection, fuelType) {
    let classValue;
    if(expectedSelection === "yes") {
      classValue = await helper.getElementAttribute(t, eaCheckoutReviewPage.elements.rbLifeSupportYes, "class");
    }
    else {
      classValue = await helper.getElementAttribute(t, eaCheckoutReviewPage.elements.rbLifeSupportNo, "class");
    }
    await classValue.include("ea-state-active").ok();

    if(await helper.isElectricity(fuelType))
      await helper.isElementAbsent(t, eaCheckoutReviewPage.elements.lifeSupportElec);
    if(await helper.isGas(fuelType))
      await helper.isElementAbsent(t, eaCheckoutReviewPage.elements.lifeSupportGas);
  }

  async function validatePresenceOfGenericLSError(t, expectedError) {
    await helper.isElementDisplayed(t, eaCheckoutReviewPage.elements.lblGenericError);
    await helper.assertText(t, eaCheckoutReviewPage.elements.lblGenericError, expectedError);
  }

  async function validatePresenceOfErrorMessageUnderneathOtherTextarea(t, expectedError, fuelType) {
    if(await helper.isElectricity(fuelType)) {
      await helper.isElementDisplayed(t, eaCheckoutReviewPage.elements.lblElecOtherFieldError);
      await helper.assertText(t, eaCheckoutReviewPage.elements.lblElecOtherFieldError, expectedError);
    }
    if(await helper.isGas(fuelType)) {
      await helper.isElementDisplayed(t, eaCheckoutReviewPage.elements.lblGasOtherFieldError);
      await helper.assertText(t, eaCheckoutReviewPage.elements.lblGasOtherFieldError, expectedError);
    }
  }

  async function selectLSDevice(t, webElement) {
    let tryCount = 0;
    do{
      await helper.click(t, webElement);
      tryCount++;
      if(tryCount > 5)
        break;
    }while (!((await helper.getElementAttribute(t, webElement, "class")).includes("ea-state-checked")));
  }

  async function selectLSEquipment(t, equipmentName, fuelType) {
    if(await helper.isElectricity(fuelType)) {
      switch (equipmentName) {
        case LSDevices.ELE_LSCNSPE:
          await selectLSDevice(t, eaCheckoutReviewPage.elements.cbEleDevice_LSCNSPE);
          break;
        case LSDevices.ELE_LSCPAPR:
          await selectLSDevice(t, eaCheckoutReviewPage.elements.cbEleDevice_LSCPAPR);
          break;
        case LSDevices.ELE_LSIPDM:
          await selectLSDevice(t, eaCheckoutReviewPage.elements.cbEleDevice_LSIPDM);
          break;
        case LSDevices.ELE_LSKDM:
          await selectLSDevice(t, eaCheckoutReviewPage.elements.cbEleDevice_LSKDM);
          break;
        case LSDevices.ELE_LSOC:
          await selectLSDevice(t, eaCheckoutReviewPage.elements.cbEleDevice_LSOC);
          break;
        case LSDevices.ELE_LSVFLS:
          await selectLSDevice(t, eaCheckoutReviewPage.elements.cbEleDevice_LSVFLS);
          break;
        case LSDevices.ELE_OTHER:
          await selectLSDevice(t, eaCheckoutReviewPage.elements.cbEleDevice_OTHER);
          await helper.clearAndEnterText(t, eaCheckoutReviewPage.elements.cbEleDevice_OTHER, "Sample Other electricity device.");
          /*break;
        default:
          LOG.info("Invalid Electricity Equipment.");*/
      }
    }
    if(await helper.isGas(fuelType)) {
      switch (equipmentName) {
        case "Medically Required Heating and/or Air Conditioning":
          await selectLSDevice(t, eaCheckoutReviewPage.elements.cbGasDevice_GLSMRHAC);
          break;
        case "Medically Required Hot Water":
          await selectLSDevice(t, eaCheckoutReviewPage.elements.cbGasDevice_GLSMRHW);
          break;
        case "Other":
          await selectLSDevice(t, eaCheckoutReviewPage.elements.cbGasDevice_OTHER);
          await helper.clearAndEnterText(t, eaCheckoutReviewPage.elements.cbGasDevice_OTHER, "Sample Other gas device.");
          /*break;
        default:
          LOG.info("Invalid Gas Equipment.");*/
      }
    }
  }

  async function validateAbsenceOfFuelAccordion(t, fuelType) {
    if(await helper.isElectricity(fuelType))
      await helper.isElementAbsent(t, eaCheckoutReviewPage.elements.lifeSupportElec);
    if(await helper.isGas(fuelType))
      await helper.isElementAbsent(t, eaCheckoutReviewPage.elements.lifeSupportGas);
  }

  async function clickCancelCTA(t, fuelType) {
    if(await helper.isElectricity(fuelType))
      await helper.click(t, eaCheckoutReviewPage.elements.btnCancelElec);
    if(await helper.isGas(fuelType))
      await helper.click(t, eaCheckoutReviewPage.elements.btnCancelGas);
  }

  async function validatePresenceOfRegisterDeviceCTA(t, fuelType) {
    if(await helper.isElectricity(fuelType))
      await helper.isElementDisplayed(t, eaCheckoutReviewPage.elements.btnRegisterDeviceElec);
    if(await helper.isGas(fuelType))
      await helper.isElementDisplayed(t, eaCheckoutReviewPage.elements.btnRegisterDeviceGas);
  }

  return{
    validatePresenceOfFuelAccordion,
    answerLifeSupportQuestion,
    verifyLifeSupportQuestion,
    submitQuote,
    clickOnRegisterDeviceBtn,
    validateLifeSupportDeviceList,
    clickOtherCheckbox,
    validatePresenceOfOtherTextfield,
    validateOtherFieldPlaceholder,
    validateMaxLengthForOtherEquipmentsTextfield,
    validateAbsenceOfOtherTextarea,
    validateReappearenceOfTextfieldWithPrefilledData,
    validateTheSelectedOptionAndAbsenceOfFuelAccordions,
    validatePresenceOfGenericLSError,
    validatePresenceOfErrorMessageUnderneathOtherTextarea,
    selectLSEquipment,
    validateAbsenceOfFuelAccordion,
    validatePresenceOfRegisterDeviceCTA
  };
}
