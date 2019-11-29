import {checkoutCompleteMethod} from '../methods/checkoutCompletePage';
import {testFunction } from '../../global_methods/helper';
import { Then } from 'cucumber';

Then(/^user lands on checkout complete page$/, async function(t){
  await testFunction.waitForLoadingIconToClose();
  await checkoutCompleteMethod.verifyWelcomePackMessage(t);
});
