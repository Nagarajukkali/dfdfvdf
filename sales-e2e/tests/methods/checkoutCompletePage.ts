import {CustomerStatus, testFunction} from '../../global_methods/helper';
const eaCheckoutCompletePage = require('../pages/checkoutComplete.page')

export class checkoutCompleteMethod {
  public static async verifyWelcomePackMessage(t) {
    await testFunction.isElementDisplayed(t, eaCheckoutCompletePage.elements.lblWelcomeText);
  }
}
