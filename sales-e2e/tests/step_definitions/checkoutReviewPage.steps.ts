import {checkoutReviewMethod} from '../methods/checkoutReviewPage';
import {testFunction} from '../../global_methods/helper';
import {Given, Then, When} from 'cucumber';
import {FileUtils} from '../../libs/FileUtils';
import {checkoutDetailsMethod} from '../methods/checkoutDetailsPage';
import {plansMethod} from '../methods/plansPage';
import {FuelType} from '@ea/ea-commons-models';

const { config }=require('../../resources/resource');
const validateAnalyticsEvent=config.validateAnalytics;

When(/^user provides life support details$/, async function (t, [], dataTable) {
  let data = dataTable.hashes();
  await checkoutReviewMethod.answerLifeSupportQuestion(t, data[0].lifeSupportOption);
  await testFunction.waitForLoadingIconToClose();
});

Then(/^user submits the quote$/, async function (t) {
  await testFunction.takeScreenshot(t, 'checkout_review_page');
  await checkoutReviewMethod.submitQuote(t);
});

When(/^user provides life support details on review page$/, async function (t, [], dataTable) {
  let data = dataTable.hashes();
  let fuelType = data[0].fuelType;
  let lifeSupportOption = data[0].lifeSupportOption;
  await checkoutReviewMethod.answerLifeSupportQuestion(t, lifeSupportOption);
  if (lifeSupportOption === 'Yes') {
    await checkoutReviewMethod.clickOnRegisterDeviceBtn(t, fuelType);
    if(validateAnalyticsEvent==='Y') {
      await plansMethod.validateComponentLibraryEvent(t, "review_page", "lifesupport_register");
    }
    if (testFunction.isElectricity(fuelType)) {
      await checkoutReviewMethod.selectElecLSEquipment(t, data[0].EleclifeSupportDevices, fuelType);
    }
    if (testFunction.isGas(fuelType)) {
      await checkoutReviewMethod.selectGasLSEquipment(t, data[0].GaslifeSupportDevices, fuelType);
    }
  }
});
Then(/^Life support section is displayed on Review page as per selected "([^"]*)" and verified "([^"]*)"$/, async function (t, [fuelType, accountType]) {
  await checkoutReviewMethod.verifyLifeSupportSection(t);
  await checkoutReviewMethod.verifyExistingLifeSupportDetails(t, fuelType, accountType);
});
Then(/^user verifies selected plan details for '(.*)'$/, async function (t, [fuelType]) {
  await checkoutReviewMethod.getDiscount(t, fuelType);
});
Then(/^user validates plan details on review page for "([^"]*)"$/, async function (t, [campaignName], dataTable) {
  let numOfExpectedFeatures = await testFunction.getExpectedFeatureCount(dataTable.rows());
  dataTable = dataTable.hashes();
  let json = await FileUtils.getJSONfile(campaignName);
  await checkoutReviewMethod.validatePlanName(t, json, dataTable);
  await checkoutReviewMethod.validateFeatures(t, dataTable, json, numOfExpectedFeatures);
});
Then(/^user validates plan details on review page for "([^"]*)" plan$/, async function (t, [campaignName], dataTable) {
  let numOfExpectedFeatures = await testFunction.getExpectedFeatureCount(dataTable.rows());
  dataTable = dataTable.hashes();
  let json = await FileUtils.getJSONfile(campaignName);
  if (campaignName !== 'solarmax') {
    await checkoutReviewMethod.validatePlanName(t, json, dataTable);  
  }
  await checkoutReviewMethod.validateFeatures(t, dataTable, json, numOfExpectedFeatures);
});
Then(/^identification verification pop up is displayed$/, async function (t) {
  await checkoutReviewMethod.verifyIDVPopup(t);
  await testFunction.takeScreenshot(t, 'IDV_Popup');//disabled UI Validation
});
When(/^user clicks on identification confirmation button$/, async function (t) {
  await checkoutReviewMethod.confirmIdentification(t);
});
When(/^user enters identification details on identification popup$/, async function (t) {
  await checkoutReviewMethod.provideIdDetails(t);
  await testFunction.takeScreenshot(t, 'IDV_Popup');//disabled UI Validation
});
When(/^user validates details on checkout review page$/, async function (t, [], dataTable) {
  /*
  |sourceSystem |journey    |fuelType |AAH  |DD |
   */
  let params = dataTable.hashes();
  let sourceSystem = params[0].sourceSystem;
  let journey = params[0].journey;
  let fuelType = params[0].fuelType;
  let aah = params[0].AAH;
  let dd = params[0].DD;
  let customerType = params[0].customerType;
  let isNewCustomer = params[0].newOrExisting.toLowerCase() === "new";
  let isMoving = journey.toLowerCase() === "move home";
  let solarSetup = params[0].solarSetup;
  await checkoutDetailsMethod.validateHeader(t, sourceSystem, journey);
  await checkoutReviewMethod.validateProgressbarAndSubheading(t);
  await checkoutReviewMethod.validateConnectionDetails(t, journey, fuelType);
  await checkoutReviewMethod.validateAccountHoldersSection(t, sourceSystem, journey, aah);
  await checkoutReviewMethod.validateBillingAndPaymentPrefSection(t, sourceSystem, journey, dd);
  await checkoutReviewMethod.validateFeesAndChargesSection(t);
  await checkoutReviewMethod.validateNavigationButtons(t);
  //await checkoutReviewMethod.validateGeneralStateDisclaimer(t, customerType, isNewCustomer, isMoving);
  if (solarSetup !== undefined) {
    await checkoutReviewMethod.validateSolarComponent(t, solarSetup);
  }
  console.log("Checkout Review page validated successfully for " + sourceSystem + " " + journey + " journey.");
});

When(/^user provides missing identification details on review page$/, async function (t, [idType]) {
  await checkoutReviewMethod.missingCustomerIdentificationDetails(t);
});

When(/^user provides business details on review page$/, async function (t, [], dataTable) {
  let data = dataTable.hashes();
  let isCustomerContactPersonMissing = data[0].isCustomerContactPersonMissing;
  let isABNACNMissing = data[0].isABNACNMissing;
  if (isCustomerContactPersonMissing === "Yes") {
    await checkoutReviewMethod.provideMissingCustomerContactPersonDetails(t);
  }
  if (isABNACNMissing === "Yes") {
    await checkoutReviewMethod.provideMissingABNACNDetails(t);
  }
  await checkoutReviewMethod.enterBusinessDetails(t);
});
When(/^user validates disclaimer on review page for "([^"]*)"$/, async function (t, [campaignName], dataTable) {
  dataTable = dataTable.hashes();
  let data = await FileUtils.getJSONfile(campaignName);
  await plansMethod.validateDisclaimer(t, dataTable, data);
  console.log("Validation completed for disclaimers on review page.");
});
Given(/^user validates source code$/, async function (t, [], dataTable) {
  let expectedEleSourceCode, expectedGasSourceCode;
  let data = dataTable.hashes();
  let fuelType = data[0].fuelType;
  switch (fuelType) {
    case FuelType.BOTH:
      expectedEleSourceCode = checkoutDetailsMethod.map.get('ele source code_' + checkoutDetailsMethod.getScenarioId(t));
      await testFunction.assertTextValue(t, data[0].eleSourceCode, expectedEleSourceCode);
      expectedGasSourceCode = checkoutDetailsMethod.map.get('gas source code_' + checkoutDetailsMethod.getScenarioId(t));
      await testFunction.assertTextValue(t, data[0].gasSourceCode, expectedGasSourceCode);
      break;
    case FuelType.ELE:
      expectedEleSourceCode = checkoutDetailsMethod.map.get('ele source code_' + checkoutDetailsMethod.getScenarioId(t));
      await testFunction.assertTextValue(t, data[0].eleSourceCode, expectedEleSourceCode);
      break;
    case FuelType.GAS:
      expectedGasSourceCode = checkoutDetailsMethod.map.get('gas source code_' + checkoutDetailsMethod.getScenarioId(t));
      await testFunction.assertTextValue(t, data[0].gasSourceCode, expectedGasSourceCode);
      break;
    default:
      throw Error("Invalid fuel type");
  }
  console.log("Validation completed for source code.");
});
When(/^user selects "([^"]*)" solar tariff type for "([^"]*)"$/, async function (t, [solarTariffType, state]) {
  await checkoutReviewMethod.selectSolarTariff(t, solarTariffType, state);
});
When(/^user validates "([^"]*)" solar tariff type for "([^"]*)" under electricity rates section$/, async function (t, [tariffType, state]) {
  await checkoutReviewMethod.validateSolarFeedInTariffUnderRates(t, tariffType, state);

});

When(/^user validates the reprice pre-positioning disclaimer for '(.*)' on '(.*)' review page$/, async function (t, [plan, journey]) {
  await checkoutReviewMethod.validateRepricePrePositioningTextPlansPage(t, plan, journey);
});
