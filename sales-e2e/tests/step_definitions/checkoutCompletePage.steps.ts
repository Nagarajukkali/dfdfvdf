import {checkoutCompleteMethod} from '../methods/checkoutCompletePage';
import {testFunction } from '../../global_methods/helper';
import { Then } from 'cucumber';
import {fetchBrowser, getDateTime, screenshotFolder} from './hooks';

Then(/^user lands on checkout complete page$/, async function(t){
  await testFunction.waitForLoadingIconToClose();
  await checkoutCompleteMethod.verifyWelcomePackMessage(t);
  await t.takeScreenshot(`../${await fetchBrowser()}/${await screenshotFolder}/checkout_complete_page_${await getDateTime()}.png`);
});
