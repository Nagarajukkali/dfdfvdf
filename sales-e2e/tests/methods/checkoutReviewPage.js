const eaCheckoutReviewPage = require('../pages/checkoutReview.page')
import {testFuncs } from '../../global_methods/helper';
const helper  = testFuncs();

export function checkoutReviewPage() {
    async function verifyLifeSupportSection() {
        await helper.isElementDisplayed(eaCheckoutReviewPage.elements.lifeSupportHeader);
        await helper.isElementDisplayed(eaCheckoutReviewPage.elements.lifeSupportDisclaimer);
    }

    async function verifyLifeSupportQuestion(fuelType) {
        await helper.isElementDisplayed(eaCheckoutReviewPage.elements.lifeSupportQuestionSection);
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
        if(ReusableComponents.isElectricity(fuelType)) {
          assertTrue("Validating presence of Electricity LS accordion", isElementPresent(Review_LifeSupportPage.lifeSupportElec));
          assertTrue("Validating presence of Register device button for Electricity.", isElementPresent(Review_LifeSupportPage.btnRegisterDeviceElec));
        }
        if(ReusableComponents.isGas(fuelType)) {
          assertTrue("Validating presence of Gas LS accordion", isElementPresent(Review_LifeSupportPage.lifeSupportGas));
          assertTrue("Validating presence of Register device button for Gas.", isElementPresent(Review_LifeSupportPage.btnRegisterDeviceGas));
        }
    }
}
