import {checkoutReviewMethod} from '../methods/checkoutReviewPage';
import {testFunction } from '../../global_methods/helper';
import {When, Then } from 'cucumber';

When(/^user provides life support details$/, async function(t,[],dataTable){
  let data=dataTable.hashes();
  await checkoutReviewMethod.answerLifeSupportQuestion(t,data[0].lifeSupportOption);
  await testFunction.waitForLoadingIconToClose();
});

Then(/^user submits the quote$/, async function(t){
  await checkoutReviewMethod.submitQuote(t);
});



