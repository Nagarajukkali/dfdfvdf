import {checkoutCompleteMethod} from '../methods/checkoutCompletePage';
import {testFunction } from '../../global_methods/helper';
import { Then } from 'cucumber';

Then(/^user lands on checkout complete page$/, async function(t){
  await testFunction.waitForLoadingIconToClose();
  await checkoutCompleteMethod.verifyWelcomePackMessage(t);
  await testFunction.takeScreenshot(t,'checkout_complete_page');
});
Then(/^user downloads a pdf copy of plan details$/, async function (t) {
  await checkoutCompleteMethod.downloadPDF(t);
});

Then(/^Your application has been declined is displayed$/, async function (t) {
  await checkoutCompleteMethod.verifyApplicationDeclineMsg(t);
});
