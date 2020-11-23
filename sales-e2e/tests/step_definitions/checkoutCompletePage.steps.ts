import {checkoutCompleteMethod} from '../methods/checkoutCompletePage';
import {testFunction } from '../../global_methods/helper';
import { Then } from 'cucumber';
import {checkoutDetailsMethod} from '../methods/checkoutDetailsPage';
import {checkoutReviewMethod} from '../methods/checkoutReviewPage';
import {getPackage} from './hooks';
import {When} from 'cucumber'

Then(/^user lands on checkout complete page$/, async function(t){
  await testFunction.waitForLoadingIconToClose();
  await checkoutCompleteMethod.verifyWelcomePackMessage(t);
  await testFunction.takeScreenshot(t, 'checkout_complete_page');
});
Then(/^user downloads a pdf copy of plan details$/, async function (t) {
  await checkoutCompleteMethod.downloadPDF(t);
});

Then(/^Your application has been declined is displayed$/, async function (t) {
  await checkoutCompleteMethod.verifyApplicationDeclineMsg(t);
});
Then(/^user validates details on checkout complete page$/, async function (t,[],dataTable) {
  /*
    |sourceSystem |journey    |fuelType |AAH  |DD |customerType |newOrExisting  |
     */
  let params = dataTable.hashes();
  let sourceSystem = params[0].sourceSystem;
  let journey = params[0].journey;
  let fuelType = params[0].fuelType;
  let aah = params[0].AAH;
  let dd = params[0].DD;
  let customerType = params[0].customerType;
  let newOrExisting = params[0].newOrExisting;

  await checkoutDetailsMethod.validateHeader(t, sourceSystem, journey);
  await checkoutCompleteMethod.validateProgressbarAndSubheading(t, sourceSystem, journey, customerType, newOrExisting);
  await checkoutCompleteMethod.validateApplicationAcceptedSection(t);
  await checkoutCompleteMethod.validateSelectedPlanSection(t, fuelType);
  await checkoutReviewMethod.validateAccountHoldersSection(t, sourceSystem, journey, aah);
  await checkoutReviewMethod.validateBillingAndPaymentPrefSection(t, sourceSystem, journey, dd);
  await checkoutCompleteMethod.validateDownloadPDFSection(t);
  await checkoutCompleteMethod.validateFeedbackForm(t);
  await checkoutCompleteMethod.validateIntroducingMABanner(t, sourceSystem);
  await checkoutCompleteMethod.validateNavigationButton(t, sourceSystem);
  if(getPackage.config.env.includes("preprod")){
    await checkoutCompleteMethod.validatePowerResponseSection(t,customerType,fuelType);
  }
  console.log("Checkout Complete page validated successfully for "+sourceSystem+" "+journey+" journey.");
});
When(/^user navigate back to plans page$/, async function (t) {
  await checkoutCompleteMethod.navigateBackToPlansPage(t);
});
