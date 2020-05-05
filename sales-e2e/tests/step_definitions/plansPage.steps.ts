import {plansMethod, verifyAccountMethod,campaignMethod} from '../methods/plansPage';
import {selectionOptionModalWindowMethod } from '../methods/plansPage';
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
  await testFunction.takeScreenshot(t,'Plans_Page');
  await plansMethod.selectPlan(t, planName);
});

Given(/^user have selected fuel as "([^"]*)"$/, async function (t, [fuelType]) {
  await plansMethod.selectFuel(t, fuelType);
});
When(/^user verifies the account through verify account journey for residential customer$/, async function (t,[],dataTable) {
  let data = dataTable.hashes();
  await selectionOptionModalWindowMethod.selectOptionsModalWindow(t, data[0].modal_option);
  await testFunction.takeScreenshot(t,'Verify_Account_Modal');
  if(data[0].elecAccountNumber)
    await verifyAccountMethod.provideAccountDetails(t,"ELE", data[0].elecAccountNumber);
  if(data[0].gasAccountNumber)
    await verifyAccountMethod.provideAccountDetails(t, "GAS", data[0].gasAccountNumber);
  await verifyAccountMethod.provideAccountInformation(t, data[0].postcode, data[0].customer_type);
  await testFunction.takeScreenshot(t,'Verify_Account_Modal');
  await verifyAccountMethod.verifyAccountDetails(t);
  await verifyAccountMethod.provideIdentityDetails(t, data[0].idType, data[0].idNumber);
  await testFunction.takeScreenshot(t,'Verify_Account_Modal');
  await verifyAccountMethod.verifyAccountDetails(t);
  await testFunction.takeScreenshot(t,'Verify_Account_Modal');
  await verifyAccountMethod.showCostEstimates(t);
});
When(/^user verifies the account through verify account journey for business customer$/, async function (t,[],dataTable) {
  let data = dataTable.hashes();
  await selectionOptionModalWindowMethod.selectOptionsModalWindow(t, data[0].modal_option);
  if(data[0].elecAccountNumber)
    await verifyAccountMethod.provideAccountDetails(t,"ELE", data[0].elecAccountNumber);
  if(data[0].gasAccountNumber)
    await verifyAccountMethod.provideAccountDetails(t, "GAS", data[0].gasAccountNumber);
  await verifyAccountMethod.provideAccountInformation(t, data[0].ABNOrACN, data[0].customer_type);
  await verifyAccountMethod.verifyAccountDetails(t);
  await verifyAccountMethod.provideIdentityDetails(t, data[0].idType, data[0].idNumber);
  await verifyAccountMethod.verifyAccountDetails(t);
  await verifyAccountMethod.showCostEstimates(t);
});
When(/^user provides postcode and clicks on show me plan link$/, async function (t,[postcode]) {
  await testFunction.takeScreenshot(t,'campaign_page');
  await campaignMethod.enterPostcodeOnCampaign(t,postcode);
  await testFunction.takeScreenshot(t,'campaign_page');
});
When(/^user provides "([^"]*)" and clicks on show me plan link$/, async function (t,[postcode]) {
  await testFunction.takeScreenshot(t,'campaign_page');
  await campaignMethod.enterPostcodeOnCampaign(t,postcode);
  await testFunction.takeScreenshot(t,'campaign_page');
});
When(/^user provides "([^"]*)" and "([^"]*)" and clicks on show me plan link$/, async function (t,[offerCode,postcode]) {
  await testFunction.takeScreenshot(t,'campaign_page');
  await campaignMethod.enterOfferCodeAndPostcodeOnCampaign(t,offerCode,postcode);
  await testFunction.takeScreenshot(t,'campaign_page');
});
When(/^user clicks on Add plan button$/, async function (t) {
  await campaignMethod.addPlanOnCampaign(t)
});
