import { When } from 'cucumber';
import {testFunction} from '../../global_methods/helper';
import {Then} from 'cucumber'
import {billUploadMethod} from '../methods/billUploadPage';

When(/^user clicks on upload bill button$/, async function(t) {
  await testFunction.takeScreenshot(t,"bill_upload_page");
  await billUploadMethod.clickOnUploadBill(t);
});

When(/^user uploads the '(.*)' bill$/, async function (t,[bill]) {
  await billUploadMethod.uploadBill(t,bill);
  await testFunction.takeScreenshot(t,"bill_upload_page");
});

Then(/^recommendation details are displayed$/, async function (t) {
  await billUploadMethod.verifyRecommendationDetails(t);
});

When(/^user selects the recommended plan$/, async function (t) {
  await billUploadMethod.selectRecommendedPlan(t);
});
