const eaCheckoutReviewPage = require('../pages/checkoutReview.page')
import {FuelType,testFuncs } from '../../global_methods/helper';
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
            case fuelType.ELEC:
                await helper.assertText(t, eaCheckoutReviewPage.elements.lifeSupportQuestion, "Is anyone at this property on life support for electricity?");
                break;
            case fuelType.GAS:
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

  return{
    validatePresenceOfFuelAccordion,
    answerLifeSupportQuestion,
    verifyLifeSupportQuestion,
    submitQuote,
  };
}
