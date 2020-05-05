import { testFunction} from '../../global_methods/helper';
const eaCheckoutCompletePage = require('../pages/checkoutComplete.page')

export class checkoutCompleteMethod {
  public static async verifyWelcomePackMessage(t) {
    await testFunction.isElementDisplayed(t, eaCheckoutCompletePage.elements.lblWhatHappensNowText);
  }

  public static async downloadPDF(t){
    await testFunction.click(t,eaCheckoutCompletePage.elements.btnDownloadPDF);
  }
}
