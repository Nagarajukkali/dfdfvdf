import {checkoutReviewMethod} from '../methods/checkoutReviewPage';
import {testFunction } from '../../global_methods/helper';
import {When, Then } from 'cucumber';

When(/^user provides life support details$/, async function(t,[],dataTable){
  let data=dataTable.hashes();
  await checkoutReviewMethod.answerLifeSupportQuestion(t,data[0].lifeSupportOption);
  await testFunction.waitForLoadingIconToClose();
});

Then(/^user submits the quote$/, async function(t){
  await testFunction.takeScreenshot(t,'checkout_review_page');
  await checkoutReviewMethod.submitQuote(t);
});

When(/^user provides life support details on review page$/, async function (t,[],dataTable) {
  let data=dataTable.hashes();
  let fuelType=data[0].fuelType;
  let lifeSupportOption=data[0].lifeSupportOption;
  await checkoutReviewMethod.answerLifeSupportQuestion(t,lifeSupportOption);
  if(lifeSupportOption==='Yes'){
    await checkoutReviewMethod.clickOnRegisterDeviceBtn(t,fuelType);
    if(testFunction.isElectricity(fuelType)){
      await checkoutReviewMethod.selectLSEquipment(t,data[0].EleclifeSupportDevices,fuelType);
    }
    if(testFunction.isGas(fuelType)){
      await checkoutReviewMethod.selectLSEquipment(t,data[0].GaslifeSupportDevices,fuelType);
    }
  }
});
Then(/^Life support section is displayed on Review page as per selected "([^"]*)" and verified "([^"]*)"$/, async function (t,[fuelType,accountType]) {
  await checkoutReviewMethod.verifyLifeSupportSection(t);
  await checkoutReviewMethod.verifyExistingLifeSupportDetails(t,fuelType,accountType);
});
Then(/^user verifies selected plan details for '(.*)'$/, async  function(t,[fuelType]) {
  await checkoutReviewMethod.getDiscount(t,fuelType);
});
