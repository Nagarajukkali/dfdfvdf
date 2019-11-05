import {checkoutReviewPage} from '../methods/checkoutReviewPage';
import {testFuncs } from '../../global_methods/helper';
const helper  = testFuncs();
import {When, Then } from 'cucumber';

When(/^user provides life support details$/, async function(t,[],dataTable){
  let data = dataTable.hashes();
  await checkoutReviewPage().answerLifeSupportQuestion(t,data[0].lifeSupportOption);
  await helper.waitForLoadingIconToClose();
});

Then(/^user submits the quote$/, async function(t){
  await checkoutReviewPage().submitQuote(t);
});



