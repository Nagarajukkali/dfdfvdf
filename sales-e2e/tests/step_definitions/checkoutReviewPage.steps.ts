import {checkoutReviewMethod} from '../methods/checkoutReviewPage';
import {testFunction } from '../../global_methods/helper';
import {When, Then } from 'cucumber';
import {FileUtils} from '../../libs/FileUtils'

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
      await checkoutReviewMethod.selectElecLSEquipment(t,data[0].EleclifeSupportDevices,fuelType);
    }
    if(testFunction.isGas(fuelType)){
      await checkoutReviewMethod.selectGasLSEquipment(t,data[0].GaslifeSupportDevices,fuelType);
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
Then(/^user validates plan details on review page for "([^"]*)"$/, async function (t, [campaignName], dataTable) {
  let numOfExpectedFeatures = await testFunction.getExpectedFeatureCount(dataTable.rows());
  dataTable = dataTable.hashes();
  let json = await FileUtils.getJSONfile(campaignName);
  await checkoutReviewMethod.validatePlanName(t, json, dataTable);
  await checkoutReviewMethod.validateFeatures(t, dataTable, json, numOfExpectedFeatures);
});
Then(/^identification verification pop up is displayed$/, async function (t) {
  await checkoutReviewMethod.verifyIDVPopup(t);
  await testFunction.takeScreenshot(t,'IDV_Popup');
});
When(/^user clicks on identification confirmation button$/, async function (t) {
  await checkoutReviewMethod.confirmIdentification(t);
});
When(/^user enters identification details on identification popup$/, async function (t) {
  await checkoutReviewMethod.provideIdDetails(t);
  await testFunction.takeScreenshot(t,'IDV_Popup');
});
