import {checkoutCompletePage} from '../methods/checkoutCompletePage';
import {testFuncs } from '../../global_methods/helper';
const helper  = testFuncs();
import {When, Then } from 'cucumber';

Then(/^user validates the welcome pack message for '(.*)' customer$/, async function(t,[customer]){
  await helper.waitForLoadingIconToClose();
  await checkoutCompletePage().verifyWelcomePackMessage(t,customer);
});



