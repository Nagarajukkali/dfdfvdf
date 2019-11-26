import {checkoutCompleteMethod} from '../methods/checkoutCompletePage';
import {testFunction } from '../../global_methods/helper';
import { Then } from 'cucumber';

Then(/^user validates the welcome pack message for '(.*)' customer$/, async function(t,[customer]){
  await testFunction.waitForLoadingIconToClose();
  await checkoutCompleteMethod.verifyWelcomePackMessage(t,customer);
});



