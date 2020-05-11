import {plansMethod, verifyAccountMethod,campaignMethod} from '../methods/plansPage';
import {selectionOptionModalWindowMethod } from '../methods/plansPage';
import {FileUtils} from '../../libs/FileUtils'
import {When, Then } from 'cucumber';
import {Given} from 'cucumber'
import {testFunction} from '../../global_methods/helper';

When(/^user clicks on the verify modal window on '(.*)' page$/, async function(t, [customerType]) {
      await plansMethod.clickPlansPageModal(t,customerType);
});

When(/^user clicks on '(.*)' from the modal$/, async function(t, [modalWindowValue]) {
    await selectionOptionModalWindowMethod.selectOptionsModalWindow(t, modalWindowValue);
});

Then(/^User lands on plans page after verify account journey$/, async t =>{
  await plansMethod.verifyVerifyAccountChangeButton(t);
});

When(/^user selects '(.*)'$/, async function(t, [planName]){
  await testFunction.takeScreenshot(t,'plans_page');
  await plansMethod.selectPlan(t, planName);
});

Given(/^user have selected fuel as "([^"]*)"$/, async function (t, [fuelType]) {
  await plansMethod.selectFuel(t, fuelType);
});
When(/^user verifies the account through verify account journey for residential customer$/, async function (t,[],dataTable) {
  let data = dataTable.hashes();
  await selectionOptionModalWindowMethod.selectOptionsModalWindow(t, data[0].modal_option);
  await testFunction.takeScreenshot(t,'verify_account_modal');
  if(data[0].elecAccountNumber)
    await verifyAccountMethod.provideAccountDetails(t,"ELE", data[0].elecAccountNumber);
  if(data[0].gasAccountNumber)
    await verifyAccountMethod.provideAccountDetails(t, "GAS", data[0].gasAccountNumber);
  await verifyAccountMethod.provideAccountInformation(t, data[0].postcode, data[0].customer_type);
  await testFunction.takeScreenshot(t,'verify_account_modal');
  await verifyAccountMethod.verifyAccountDetails(t);
  await verifyAccountMethod.provideIdentityDetails(t, data[0].idType, data[0].idNumber);
  await testFunction.takeScreenshot(t,'verify_account_modal');
  await verifyAccountMethod.verifyAccountDetails(t);
  await testFunction.takeScreenshot(t,'verify_account_modal');
  await verifyAccountMethod.showCostEstimates(t);
});
When(/^user verifies the account through verify account journey for business customer$/, async function (t,[],dataTable) {
  let data = dataTable.hashes();
  await selectionOptionModalWindowMethod.selectOptionsModalWindow(t, data[0].modal_option);
  await testFunction.takeScreenshot(t,'verify_account_modal');
  if(data[0].elecAccountNumber)
    await verifyAccountMethod.provideAccountDetails(t,"ELE", data[0].elecAccountNumber);
  if(data[0].gasAccountNumber)
    await verifyAccountMethod.provideAccountDetails(t, "GAS", data[0].gasAccountNumber);
  await verifyAccountMethod.provideAccountInformation(t, data[0].ABNOrACN, data[0].customer_type);
  await testFunction.takeScreenshot(t,'verify_account_modal');
  await verifyAccountMethod.verifyAccountDetails(t);
  await verifyAccountMethod.provideIdentityDetails(t, data[0].idType, data[0].idNumber);
  await testFunction.takeScreenshot(t,'verify_account_modal');
  await verifyAccountMethod.verifyAccountDetails(t);
  await testFunction.takeScreenshot(t,'verify_account_modal');
  await verifyAccountMethod.showCostEstimates(t);
});

When(/^user provides "([^"]*)" and clicks on show me plan link$/, async function (t,[postcode]) {
  await campaignMethod.enterPostcodeOnCampaign(t,postcode);
  await testFunction.takeScreenshot(t,'campaign_page');
});
When(/^user provides "([^"]*)" and "([^"]*)" and clicks on show me plan link$/, async function (t,[offerCode,postcode]) {
  await campaignMethod.enterOfferCodeAndPostcodeOnCampaign(t,offerCode,postcode);
  await testFunction.takeScreenshot(t,'campaign_page');
});

When(/^user clicks on Add plan button$/, async function (t) {
  await campaignMethod.addPlanOnCampaign(t)
});

Then(/^user verifies details of "([^"]*)" customer on plans page for "([^"]*)"$/, async function (t,[customerType,state]) {
  let JSONObj=await FileUtils.getJSONfile(customerType);
  console.log(JSONObj.TotalPlan.planHeading);
});

When(/^user provides postcode for "([^"]*)" and proceed to view the plans$/, async function (t, [state]) {
  await campaignMethod.enterPostcodeOnCampaign(t, state);
});
Then(/^user is presented with the plans$/, async function (t) {
  await plansMethod.validateThePlansAreLoaded(t);
});
Then(/^user validates the data on plans page for "([^"]*)"$/, async function (t, [campaignName], dataTable) {
  /*
  Example:

  And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |ELE      |Y                 |Y                       |Y                    |Y                                    |N                                |

  And user validates the data on plans page for "<campaign>"
      |fuelType |Feature_50Credit  |Feature_carbonNeutral   |Feature_peaceOfMind  |Feature_discountOffTotalEnergyBill   |Feature_noStandardConnectionFee  |
      |GAS      |Y                 |Y                       |Y                    |Y                                    |N                                |
   */
  dataTable = dataTable.hashes();
  let data = await FileUtils.getJSONfile(campaignName);
  await plansMethod.validatePlanHeading(t, data);
  await plansMethod.validateFeatures(t, dataTable, data);
});
Then(/^user validates "([^"]*)" discount to be "([^"]*)" percent$/, async function (t, [fuelType, expectedDiscount]) {
  /*
  Example:     And user validates "ELE" discount to be "16" percent
   */
  await plansMethod.validateDiscount(t, fuelType, expectedDiscount);
});
When(/^user provides "([^"]*)" for postcode and proceed to view the plans$/, async function (t, [postcode]) {
  await campaignMethod.enterPostcodeOnCampaign(t, postcode);
});
