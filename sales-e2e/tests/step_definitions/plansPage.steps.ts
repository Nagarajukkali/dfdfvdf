import {plansMethod, verifyAccountMethod,campaignMethod} from '../methods/plansPage';
import {selectionOptionModalWindowMethod } from '../methods/plansPage';
import {FileUtils} from '../../libs/FileUtils'
import {When, Then } from 'cucumber';
import {Given} from 'cucumber'
const EaHomePage = require('../pages/energy-australia-home.page');
import {PlanType, testFunction} from '../../global_methods/helper';
import {AustralianState, CustomerType} from '@ea/ea-commons-models';
const { config }=require('../../resources/resource');
const interceptNetworkRequest=config.interceptNetworkRequest;
import {Workbook} from 'exceljs';

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
  await testFunction.takeScreenshot(t, 'plans_page');//disabled UI Validation
  await plansMethod.selectPlan(t, planName);
});

Given(/^user have selected fuel as "([^"]*)"$/, async function (t, [fuelType]) {
  await plansMethod.selectFuel(t, fuelType);
});

When(/^user verifies the account through verify account journey for residential customer$/, async function (t,[],dataTable) {
  let data = dataTable.hashes();
  await testFunction.takeScreenshot(t, 'verify_account_main');//disabled UI Validation
  await selectionOptionModalWindowMethod.selectOptionsModalWindow(t, data[0].modal_option);
  await testFunction.takeScreenshot(t, 'verify_account_modal');//disabled UI Validation
  if(data[0].elecAccountNumber)
    await verifyAccountMethod.provideAccountDetails(t,"ELE", data[0].elecAccountNumber);
  if(data[0].gasAccountNumber)
    await verifyAccountMethod.provideAccountDetails(t, "GAS", data[0].gasAccountNumber);
  await verifyAccountMethod.provideAccountInformation(t, data[0].postcode, data[0].customer_type);
  await testFunction.takeScreenshot(t, 'verify_account_modal_with_data');//disabled UI Validation
  await verifyAccountMethod.verifyAccountDetails(t);
  await verifyAccountMethod.provideIdentityDetails(t, data[0].idType, data[0].idNumber)
  await testFunction.takeScreenshot(t, 'verify_account_modal_id_with_data');//disabled UI Validation
  //await testFunction.captureNetworkCall(t,'/qt2/app/account/retrieve');
  await verifyAccountMethod.verifyAccountDetails(t);
  //await testFunction.validateNetworkCall(t);
  await testFunction.takeScreenshot(t, 'verify_account_modal_final');//disabled UI Validation
  await verifyAccountMethod.showCostEstimates(t);
});

When(/^user verifies the account through verify account journey for business customer$/, async function (t,[],dataTable) {
  let data = dataTable.hashes();
  await testFunction.takeScreenshot(t, 'verify_account_main');//disabled UI Validation
  await selectionOptionModalWindowMethod.selectOptionsModalWindow(t, data[0].modal_option);
  await testFunction.takeScreenshot(t, 'verify_account_modal');//disabled UI Validation
  if(data[0].elecAccountNumber)
    await verifyAccountMethod.provideAccountDetails(t,"ELE", data[0].elecAccountNumber);
  if(data[0].gasAccountNumber)
    await verifyAccountMethod.provideAccountDetails(t, "GAS", data[0].gasAccountNumber);
  await verifyAccountMethod.provideAccountInformation(t, data[0].ABNOrACN, data[0].customer_type);
  await testFunction.takeScreenshot(t, 'verify_account_modal_with_data');//disabled UI Validation
  await verifyAccountMethod.verifyAccountDetails(t);
  await verifyAccountMethod.provideIdentityDetails(t, data[0].idType, data[0].idNumber);
  await testFunction.takeScreenshot(t, 'verify_account_modal_id_with_data');//disabled UI Validation
  await verifyAccountMethod.verifyAccountDetails(t);
  await testFunction.takeScreenshot(t, 'verify_account_modal_final');//disabled UI Validation
  await verifyAccountMethod.showCostEstimates(t);
});

When(/^user provides "([^"]*)" and clicks on show me plan link$/, async function (t,[postcode]) {
  await campaignMethod.enterPostcodeOnCampaign(t,postcode);
  await testFunction.takeScreenshot(t, 'campaign_page');//disabled UI Validation
});
When(/^user provides "([^"]*)" and "([^"]*)" and clicks on show me plan link$/, async function (t,[offerCode,postcode]) {
  await campaignMethod.enterOfferCodeAndPostcodeOnCampaign(t,offerCode,postcode);
  await testFunction.takeScreenshot(t, 'campaign_page');//disabled UI Validation
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
  await plansMethod.validatePlanHeading(t, dataTable, data);
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
When(/^user provides below details for account verification on verify account modal window$/, async function (t,[],dataTable) {
  let data = dataTable.hashes();
  let modalWindowOption=data[0].modal_option
  if(modalWindowOption.length!==0){
    await selectionOptionModalWindowMethod.selectOptionsModalWindow(t, data[0].modal_option);
    await testFunction.takeScreenshot(t, 'verify_account_modal');//disabled UI Validation
  }
  if(data[0].elecAccountNumber)
    await verifyAccountMethod.provideAccountDetails(t,"ELE", data[0].elecAccountNumber);
  if(data[0].gasAccountNumber)
    await verifyAccountMethod.provideAccountDetails(t, "GAS", data[0].gasAccountNumber);
  if(data[0].customer_type===CustomerType.RESIDENTIAL)
    await verifyAccountMethod.provideAccountInformation(t, data[0].postcode, data[0].customer_type);
  if(data[0].customer_type===CustomerType.BUSINESS)
    await verifyAccountMethod.provideAccountInformation(t, data[0].ABNOrACN, data[0].customer_type);
  await testFunction.takeScreenshot(t, 'verify_account_modal');//disabled UI Validation
  await verifyAccountMethod.verifyAccountDetails(t);
  await verifyAccountMethod.provideIdentityDetails(t, data[0].idType, data[0].idNumber);
  await testFunction.takeScreenshot(t, 'verify_account_modal');//disabled UI Validation
  await verifyAccountMethod.verifyAccountDetails(t);
});
Then(/^Relevant error message is presented for customers marked with safety flag on verify account modal$/, async function (t) {
  await verifyAccountMethod.validateErrorMessageForBlockerAccounts(t);
  await testFunction.takeScreenshot(t, 'verify_account_modal');//disabled UI Validation
});
Then(/^user can able to proceed further through verify account$/, async function (t) {
  await verifyAccountMethod.verifySuccessfulAccountVerification(t)
  await testFunction.takeScreenshot(t, 'verify_account_modal');//disabled UI Validation
});
When(/^user navigates back to verify identity section$/, async function (t) {
  await verifyAccountMethod.navigateBackToVerifyIdentity(t);
});
When(/^user navigates back to verify account section and clears all the previously provided details$/, async function (t) {
  await verifyAccountMethod.navigateBackToVerifyAccount(t);
});
Given(/^user enters '(.*)' in '(.*)' field$/, async function (t,[NMIIorMIRNorPostcodeValue,NMIorMIRNorPostcode]) {
  if(interceptNetworkRequest==='Y'){
    await testFunction.captureNetworkCall(t,'/qt2/app/v1/offers/lookup');
  }
  await plansMethod.enterNMIorMIRNorPostcode(t,NMIIorMIRNorPostcodeValue,NMIorMIRNorPostcode);
});
Then(/^plans page load according to the type of '(.*)'$/, async function (t,[NMIorMIRNType]) {
  await plansMethod.verifyNMIorMIRNLookup(t,NMIorMIRNType);
  await testFunction.takeScreenshot(t, 'plans_page');//disabled UI Validation

});
Then(/^user validates details on plans page for '(.*)'$/, async function (t, [customerType]) {
  await plansMethod.validateGeneralStateDisclaimer(t, customerType);
});
Then(/^user validates disclaimer on plans page for "([^"]*)"$/, async function (t,[campaignName],dataTable) {
  dataTable = dataTable.hashes();
  let data = await FileUtils.getJSONfile(campaignName);
  await plansMethod.validateDisclaimer(t,dataTable,data);
  console.log("Validation completed for disclaimers on plans page.");
});

Then(/^user validates verify account journey's UI for '(.*)' plans page$/, async function (t, [customerType]) {
  await plansMethod.clickPlansPageModal(t,customerType);
  await testFunction.compareImages(t, customerType + "_CTA_MODAL_MAIN");
  await selectionOptionModalWindowMethod.selectOptionsModalWindow(t, "enter usage");
  await testFunction.compareImages(t, customerType + "_MODAL_ENTER_USAGE");
  await testFunction.click(t, EaHomePage.elements.modalBack);
  await selectionOptionModalWindowMethod.selectOptionsModalWindow(t, "verify account");
  await testFunction.compareImages(t, customerType + "_MODAL_VERIFY_ACCOUNT");
  await verifyAccountMethod.enterSampleAccountDetails(t, customerType);
  await verifyAccountMethod.verifyAccountDetails(t);
  await testFunction.compareImages(t, customerType + "_MODAL_VERIFY_IDENTITY");
  await verifyAccountMethod.provideIdentityDetails(t, config.sampleResiAccount.idType, config.sampleResiAccount.idValue);
  await verifyAccountMethod.verifyAccountDetails(t);
  await testFunction.compareImages(t, customerType + "_MODAL_VERIFY_ACCOUNT_FINAL");
});

Then(/^user validates '(.*)' plans page's UI$/, async function (t, [customerType]) {
  await testFunction.compareImages(t, customerType + "_PLANS_PAGE");
});

Then(/^user validates reference price for '(.*)'$/, async function (t,[planName]) {
  if(interceptNetworkRequest==='Y'){
    let rewardCreditCondition,baseCreditCondition,baseSourceCode,rewardSourceCode,state;
    let jsonObj=await testFunction.validateNetworkCall(t);
    state=jsonObj.state;
    let excludedPlans=(planName!==PlanType.BASIC_BUSINESS && planName!==PlanType.BASIC_HOME && planName!==PlanType.BASIC_HOME_QLD && planName!==PlanType.BASIC_BUSINESS_QLD);
    if(excludedPlans){
      let plans = jsonObj.electricity.plans;
      plans.forEach(function myFunction(plan){
        if(planName.toLowerCase() === plan.name.toLowerCase()){
          let rewardsCount= plan.rewards.length
          if(rewardsCount>0){
            rewardCreditCondition = plan.rewards[0].planReward.creditCondition;
            rewardSourceCode = plan.rewards[0].planReward.sourceCode;
          }
          baseCreditCondition = plan.benchmark.creditCondition;
          baseSourceCode = plan.sourceCode;
          // break;
        }
      });
      if(state!==AustralianState.ACT) {
        await plansMethod.validateComparisonStatement(t, baseCreditCondition, rewardCreditCondition, planName);
        console.log("Validated Comparison Statement");
      }
    }
  }
});

Then(/^user enters NMI and validate reference price for "([^"]*)"$/, async function (t, [expectedCustomerType]) {
  await testFunction.click(t,EaHomePage.elements.refinePeriod);
  await testFunction.click(t,EaHomePage.elements.refinePeriodDropdown.withText("Yearly"));
  const workbook = new Workbook();
  //await workbook.xlsx.readFile('/Users/ravipandey/Desktop/Reference_Price_Test_Data.xlsx');
  await workbook.xlsx.readFile(`${process.cwd()}/resources/Reprice_Data/Reference_Price_Test_Data.xlsx`);
  const worksheet=workbook.getWorksheet(1);
  const rowCount=worksheet.actualRowCount
  for(let i=2;i<rowCount;i++){
    let row=worksheet.getRow(i);
    let actualCustomerType=row.getCell(3).value.toString();
    let eleUsage=row.getCell(4).value.toString();
    let customUsage;
    let planName=row.getCell(7).value.toString();
    let estimatedCost=Math.round(Number(row.getCell(9).value));
    let benchmarkUsage=Math.round(Number(row.getCell(10).value));
    let referencePrice=Math.round(Number(row.getCell(11).value));
    let percentageDiff=Math.round(Number(((referencePrice-estimatedCost)/referencePrice)*100));
    let NMI=row.getCell(12).value.toString();
    let state=row.getCell(13).value.toString();
    if(eleUsage==='Average Usage'){
      customUsage=(benchmarkUsage/365).toFixed(2);
    }
    if(eleUsage==='Custom'){
      customUsage=row.getCell(6).value.toString();
    }
    if(actualCustomerType===expectedCustomerType){
      await plansMethod.enterNMIorMIRNorPostcode(t,NMI,'NMI');
      await testFunction.waitForElementToBeDisappeared(t,EaHomePage.elements.eaSpinner);
      await t.wait(5000);
      if(eleUsage==='Average Usage' || eleUsage==='Custom'){
        if((await testFunction.sizeOfElement(t,EaHomePage.elements.refineEleUsageActiveOption))===0){
          await testFunction.click(t,EaHomePage.elements.refineEleUsage);
          await testFunction.click(t,EaHomePage.elements.refineEleUsageDropdown.withText('Custom'));
        }
        await testFunction.clearTextField(t,EaHomePage.elements.refineEleUsageActiveOption);
        await testFunction.enterText(t,EaHomePage.elements.refineEleUsageActiveOption,customUsage);
      }
      else{
        await testFunction.click(t,EaHomePage.elements.refineEleUsage);
        await testFunction.click(t,EaHomePage.elements.refineEleUsageDropdown.withText(eleUsage));
      }
      await t.wait(2000);
        if(referencePrice!==0){
          await plansMethod.validateReferencePrice(t,estimatedCost,referencePrice,percentageDiff,state,actualCustomerType);
        }
      }

    }
});

Then(/^user enters NMI and validate estimated cost for "([^"]*)"$/, async function (t, [expectedCustomerType]) {
  await testFunction.click(t,EaHomePage.elements.refinePeriod);
  await testFunction.click(t,EaHomePage.elements.refinePeriodDropdown.withText("Yearly"));
  const workbook = new Workbook();
  //await workbook.xlsx.readFile('/Users/ravipandey/Desktop/Estimated_Cost_Test_Data.xlsx');
  await workbook.xlsx.readFile(`${process.cwd()}/resources/Reprice_Data/Estimated_Cost_Test_Data.xlsx`);
  const worksheet=workbook.getWorksheet(1);
  const rowCount=worksheet.actualRowCount
  for(let i=2;i<rowCount;i++){
    let row=worksheet.getRow(i);
    let actualCustomerType=row.getCell(3).value.toString();
    let eleUsage=row.getCell(4).value.toString();
    let customUsage;
    let planName=row.getCell(7).value.toString();
    let estimatedCost=Math.round(Number(row.getCell(9).value));
    let NMI=row.getCell(12).value.toString();
    let state=row.getCell(13).value.toString();
    if(eleUsage==='Custom'){
      customUsage=row.getCell(6).value.toString();
    }
    if(actualCustomerType===expectedCustomerType){
      await plansMethod.enterNMIorMIRNorPostcode(t,NMI,'NMI');
      await testFunction.waitForElementToBeDisappeared(t,EaHomePage.elements.eaSpinner);
      await t.wait(5000);
      if(eleUsage==='Custom'){
        if((await testFunction.sizeOfElement(t,EaHomePage.elements.refineEleUsageActiveOption))===0){
          await testFunction.click(t,EaHomePage.elements.refineEleUsage);
          await testFunction.click(t,EaHomePage.elements.refineEleUsageDropdown.withText('Custom'));
        }
        await testFunction.clearTextField(t,EaHomePage.elements.refineEleUsageActiveOption);
        await testFunction.enterText(t,EaHomePage.elements.refineEleUsageActiveOption,customUsage);
      }
      else{
        await testFunction.click(t,EaHomePage.elements.refineEleUsage);
        await testFunction.click(t,EaHomePage.elements.refineEleUsageDropdown.withText(eleUsage));
      }
      await t.wait(2000);
      await plansMethod.validateEstimatedCost(t,planName,estimatedCost,actualCustomerType,state);
    }
  }
});
