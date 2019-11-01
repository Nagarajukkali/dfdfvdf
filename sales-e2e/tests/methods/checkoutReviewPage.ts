const eaCheckoutReviewPage = require('../pages/checkoutReview.page')
import {testFuncs } from '../../global_methods/helper';
const helper  = testFuncs();

export function checkoutReviewPage() {
    async function verifyLifeSupportSection(t) {
        await helper.isElementDisplayed(t, eaCheckoutReviewPage.elements.lifeSupportHeader);
        await helper.isElementDisplayed(t, eaCheckoutReviewPage.elements.lifeSupportDisclaimer);
    }

    async function verifyLifeSupportQuestion(t, fuelType) {
        await helper.isElementDisplayed(t, eaCheckoutReviewPage.elements.lifeSupportQuestionSection);
        switch (fuelType) {
            case helper.fuelType.DUEL:
                await helper.assertText(t, eaCheckoutReviewPage.elements.lifeSupportQuestion, "Is anyone at this property on life support?");
                break;
            case helper.fuelType.ELEC:
                await helper.assertText(t, eaCheckoutReviewPage.elements.lifeSupportQuestion, "Is anyone at this property on life support for electricity?");
                break;
            case helper.fuelType.GAS:
                await helper.assertText(t, eaCheckoutReviewPage.elements.lifeSupportQuestion, "Is anyone at this property on life support for gas?");
                break;
        }
        await t.expect(eaCheckoutReviewPage.elements.lifeSupportQuestionYes.hasClass("ea-state-active"));
        await t.expect(eaCheckoutReviewPage.elements.lifeSupportQuestionNo.hasClass("ea-state-active"));
    }

    async function answerLifeSupportQuestion(option) {
        if(option==="yes")
          await helper.click(eaCheckoutReviewPage.elements.rbLifeSupportYes);
        else if(option==="no")
          await helper.click(eaCheckoutReviewPage.elements.rbLifeSupportNo);
        else {
          console.log("Invalid option selected.");
          fail(String.format("Expected Life Support answer to be 'yes' or 'no', not '%s'.", option));
        }
    }

    async function validatePresenceOfFuelAccordion(fuelType) {
        if(await helper.isElectricity(fuelType)) {
          helper.isElementPresent(eaCheckoutReviewPage.elements.lifeSupportElec);
          helper.isElementPresent(eaCheckoutReviewPage.elements.btnRegisterDeviceElec);
        }
        if(await helper.isGas(fuelType)) {
          helper.isElementPresent(eaCheckoutReviewPage.elements.lifeSupportGas);
          helper.isElementPresent(eaCheckoutReviewPage.elements.btnRegisterDeviceGas);
        }
    }
}
