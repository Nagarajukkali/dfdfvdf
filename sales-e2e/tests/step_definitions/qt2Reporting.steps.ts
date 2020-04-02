import {When} from "cucumber";
import {qt2Reporting} from '../methods/qt2Reporting';
import {Then} from 'cucumber'

When(/^user logs in to qt2 reporting using '(.*)' and '(.*)'$/, async function(t, [username, password]) {
  await qt2Reporting.loginToqt2Reporting(t,username,password);
});

When(/^user search quote on the basis of '(.*)'$/, async function (t,[option]) {
  await qt2Reporting.searchQuote(t,option);
});
Then(/^submitted quote is displayed$/, async function (t) {
  await qt2Reporting.verifySubmittedQuote(t);
});

Then(/^user validates all the details related to submitted quote$/, async function (t) {
  await qt2Reporting.validateQuoteDetails(t);
});
