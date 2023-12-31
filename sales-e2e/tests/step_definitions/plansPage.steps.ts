import {campaignMethod, plansMethod, selectionOptionModalWindowMethod, verifyAccountMethod} from '../methods/plansPage';
import {FileUtils} from '../../libs/FileUtils';
import {Given, Then, When} from '@cucumber/cucumber';
import {PlanType, testFunction} from '../../global_methods/helper';
import {AustralianState, CustomerType} from '@ea/ea-commons-models';
import {Workbook} from 'exceljs';
import { Console } from 'console';
import {qualifierMethod} from "../methods/qualifierPage";

const EaHomePage = require('../pages/energy-australia-home.page');
const {config} = require('../../resources/resource');
const interceptNetworkRequest = config.interceptNetworkRequest;

When(/^user clicks on the verify modal window on '(.*)' page$/, async function (t, [customerType]) {
  await plansMethod.clickPlansPageModal(t, customerType);
});

When(/^user closes the refine modal$/, async function (t, []) {
  await verifyAccountMethod.closeRefineModal(t);
});

When(/^user clicks on best electricity offer link$/, async function (t, []) {
  await testFunction.click(t,EaHomePage.elements.bestElectricityOfferLink);
});

When(/^user clicks on reference price disclaimer link$/, async function (t, []) {
  await testFunction.click(t,EaHomePage.elements.referencePriceDisclaimerLink);
});

When(/^user clicks on solar disclaimer link$/, async function (t, []) {
  await testFunction.click(t,EaHomePage.elements.solarDisclaimerLink);
});

When(/^user clicks on carbon neutral disclaimer link$/, async function (t, []) {
  await testFunction.click(t,EaHomePage.elements.carbonNeutralDisclaimerLink);
});

When(/^user clicks on '(.*)' from the modal$/, async function (t, [modalWindowValue]) {
  await selectionOptionModalWindowMethod.selectOptionsModalWindow(t, modalWindowValue);
});

Then(/^User lands on plans page after verify account journey$/, async t => {
  await plansMethod.verifyVerifyAccountChangeButton(t);
});

When(/^user selects '(.*)'$/, async function (t, [planName]) {
  await testFunction.takeScreenshot(t, 'plans_page');//disabled UI Validation
  await plansMethod.selectPlan(t, planName);
});

Given(/^user have selected fuel as "([^"]*)"$/, async function (t, [fuelType]) {
  await plansMethod.selectFuel(t, fuelType);
});
Then(/^relevant error message is presented for customers marked with NSW remote meter risk on plans page$/, async function (t) {
  await plansMethod.validateErrorMessageForNSWRemoteMeterRiskAccountsPlansPage(t);
});
When(/^user verifies the account through verify account journey for residential customer$/, async function (t, [], dataTable) {
  let data = dataTable.hashes();
  await testFunction.takeScreenshot(t, 'verify_account_main');//disabled UI Validation
  await selectionOptionModalWindowMethod.selectOptionsModalWindow(t, data[0].modal_option);
  await testFunction.takeScreenshot(t, 'verify_account_modal');//disabled UI Validation
  if (data[0].elecAccountNumber) {
    await verifyAccountMethod.provideAccountDetails(t, "ELE", data[0].elecAccountNumber);
  }
  if (data[0].gasAccountNumber) {
    await verifyAccountMethod.provideAccountDetails(t, "GAS", data[0].gasAccountNumber);
  }
  await verifyAccountMethod.provideAccountInformation(t, data[0].postcode, data[0].customer_type);
  await testFunction.takeScreenshot(t, 'verify_account_modal_with_data');//disabled UI Validation
  await verifyAccountMethod.verifyAccountDetails(t);
  await verifyAccountMethod.provideIdentityDetails(t, data[0].idType, data[0].idNumber);
  await testFunction.takeScreenshot(t, 'verify_account_modal_id_with_data');//disabled UI Validation
  //await testFunction.captureNetworkCall(t,'/qt2/app/account/retrieve');
  await verifyAccountMethod.verifyAccountDetailsIdentity(t);
  //await testFunction.validateNetworkCall(t);
  await testFunction.takeScreenshot(t, 'verify_account_modal_final');//disabled UI Validation
  await verifyAccountMethod.showCostEstimates(t);
});

When(/^user verifies the account through verify account journey for business customer$/, async function (t, [], dataTable) {
  let data = dataTable.hashes();
  await testFunction.takeScreenshot(t, 'verify_account_main');//disabled UI Validation
  await selectionOptionModalWindowMethod.selectOptionsModalWindow(t, data[0].modal_option);
  await testFunction.takeScreenshot(t, 'verify_account_modal');//disabled UI Validation
  if (data[0].elecAccountNumber) {
    await verifyAccountMethod.provideAccountDetails(t, "ELE", data[0].elecAccountNumber);
  }
  if (data[0].gasAccountNumber) {
    await verifyAccountMethod.provideAccountDetails(t, "GAS", data[0].gasAccountNumber);
  }
  await verifyAccountMethod.provideAccountInformation(t, data[0].ABNOrACN, data[0].customer_type);
  await testFunction.takeScreenshot(t, 'verify_account_modal_with_data');//disabled UI Validation
  await verifyAccountMethod.verifyAccountDetails(t);
  await verifyAccountMethod.provideIdentityDetails(t, data[0].idType, data[0].idNumber);
  await testFunction.takeScreenshot(t, 'verify_account_modal_id_with_data');//disabled UI Validation
  await verifyAccountMethod.verifyAccountDetails(t);
  await testFunction.takeScreenshot(t, 'verify_account_modal_final');//disabled UI Validation
  await verifyAccountMethod.showCostEstimates(t);
});

When(/^user provides "([^"]*)" and clicks on show me plan link$/, async function (t, [postcode]) {
  await campaignMethod.enterPostcodeOnCampaign(t, postcode);
  await testFunction.takeScreenshot(t, 'campaign_page');//disabled UI Validation
});
When(/^user provides "([^"]*)" and "([^"]*)" and clicks on show me plan link$/, async function (t, [offerCode, postcode]) {
  await campaignMethod.enterOfferCodeAndPostcodeOnCampaign(t, offerCode, postcode);
  await testFunction.takeScreenshot(t, 'campaign_page');//disabled UI Validation
});
When(/^user provides email "([^"]*)" and "([^"]*)" and clicks on show me plan link$/, async function (t, [email, postcode]) {
  await campaignMethod.enterEmailAndPostcodeOnCampaign(t, email, postcode);
  await testFunction.takeScreenshot(t, 'campaign_page');//disabled UI Validation
});
When(/^user provides email "([^"]*)" employee id "([^"]*)" and "([^"]*)" and clicks on show me plan link$/, async function (t, [email, employeeId, postcode]) {
  await campaignMethod.enterEmailEmployeeidAndPostcodeOnCampaign(t, email, employeeId, postcode);
  await testFunction.takeScreenshot(t, 'campaign_page');//disabled UI Validation
});
When(/^user clicks on Add plan button$/, async function (t) {
  await campaignMethod.addPlanOnCampaign(t);
  await testFunction.takeScreenshot(t, 'after clicking add plan button');//disabled UI Validation
});
When(/^user clicks on Select plan button$/, async function (t) {
  await campaignMethod.selectPlanOnCampaign(t);
  await testFunction.takeScreenshot(t, 'after clicking add plan button');//disabled UI Validation
});
When(/^user clicks on Select plans button$/, async function (t) {
  await campaignMethod.selectPlansOnCampaign(t);
  await testFunction.takeScreenshot(t, 'after clicking add plan button');//disabled UI Validation
});

Then(/^user verifies details of "([^"]*)" customer on plans page for "([^"]*)"$/, async function (t, [customerType, state]) {
  let JSONObj = await FileUtils.getJSONfile(customerType);
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
  //await testFunction.takeScreenshot(t, 'validated plan heading');//disabled UI Validation
  await plansMethod.validateFeatures(t, dataTable, data);
  //await testFunction.takeScreenshot(t, 'validated feature text for plans');//disabled UI Validation
  console.log("feature validated");
});
Then(/^user validates "([^"]*)" discount to be "([^"]*)" percent$/, async function (t, [fuelType, expectedDiscount]) {
  /*
  Example:     And user validates "ELE" discount to be "16" percent
   */
  await plansMethod.validateDiscount(t, fuelType, expectedDiscount);
  //await testFunction.takeScreenshot(t, 'validating discount'+fuelType);//disabled UI Validation
});
Then(/^user validates "([^"]*)" discount to be "([^"]*)" percent for "([^"]*)" plan$/, async function (t, [fuelType, expectedDiscount,planName]) {
  /*
  Example:     And user validates "ELE" discount to be "16" percent
   */
  await plansMethod.validateDiscountPlansPage(t, fuelType, expectedDiscount, planName);
  //await testFunction.takeScreenshot(t, 'validating discount'+fuelType);//disabled UI Validation
});
When(/^user provides "([^"]*)" for postcode and proceed to view the plans$/, async function (t, [postcode]) {
  await campaignMethod.enterPostcodeOnCampaign(t, postcode);
  await testFunction.takeScreenshot(t, 'providing postcode');//disabled UI Validation
});
When(/^user provides below details for account verification on verify account modal window$/, async function (t, [], dataTable) {
  let data = dataTable.hashes();
  let modalWindowOption = data[0].modal_option;
  if (modalWindowOption.length !== 0) {
    await selectionOptionModalWindowMethod.selectOptionsModalWindow(t, data[0].modal_option);
    await testFunction.takeScreenshot(t, 'verify_account_modal');//disabled UI Validation
  }
  if (data[0].elecAccountNumber) {
    await verifyAccountMethod.provideAccountDetails(t, "ELE", data[0].elecAccountNumber);
  }
  if (data[0].gasAccountNumber) {
    await verifyAccountMethod.provideAccountDetails(t, "GAS", data[0].gasAccountNumber);
  }
  if (data[0].customer_type === CustomerType.RESIDENTIAL) {
    await verifyAccountMethod.provideAccountInformation(t, data[0].postcode, data[0].customer_type);
  }
  if (data[0].customer_type === CustomerType.BUSINESS) {
    await verifyAccountMethod.provideAccountInformation(t, data[0].ABNOrACN, data[0].customer_type);
  }
  await testFunction.takeScreenshot(t, 'verify_account_modal');//disabled UI Validation
  await verifyAccountMethod.verifyAccountDetails(t);
  await verifyAccountMethod.provideIdentityDetails(t, data[0].idType, data[0].idNumber);
  await testFunction.takeScreenshot(t, 'verify_account_modal');//disabled UI Validation
  await verifyAccountMethod.verifyAccountDetails(t);
});
When(/^user verifies the account through verify account journey with invalid postcide for residential customer$/, async function (t, [], dataTable) {
  let data = dataTable.hashes();
  let modalWindowOption = data[0].modal_option;
  if (modalWindowOption.length !== 0) {
    await selectionOptionModalWindowMethod.selectOptionsModalWindow(t, data[0].modal_option);
    await testFunction.takeScreenshot(t, 'verify_account_modal');//disabled UI Validation
  }
  if (data[0].elecAccountNumber) {
    await verifyAccountMethod.provideAccountDetails(t, "ELE", data[0].elecAccountNumber);
  }
  if (data[0].gasAccountNumber) {
    await verifyAccountMethod.provideAccountDetails(t, "GAS", data[0].gasAccountNumber);
  }
  if (data[0].customer_type === CustomerType.RESIDENTIAL) {
    await verifyAccountMethod.provideAccountInformation(t, data[0].postcode, data[0].customer_type);
  }
  await testFunction.takeScreenshot(t, 'verify_account_modal');//disabled UI Validation
  await verifyAccountMethod.verifyAccountDetails(t);
});
Then(/^Relevant error message is presented for customers marked with safety flag on verify account modal$/, async function (t) {
  await verifyAccountMethod.validateErrorMessageForBlockerAccounts(t);
  await testFunction.takeScreenshot(t, 'verify_account_modal');//disabled UI Validation
});
Then(/^user can able to proceed further through verify account$/, async function (t) {
  await verifyAccountMethod.verifySuccessfulAccountVerification(t);
  await testFunction.takeScreenshot(t, 'verify_account_modal');//disabled UI Validation
});
When(/^user navigates back to verify identity section$/, async function (t) {
  await verifyAccountMethod.navigateBackToVerifyIdentity(t);
});
When(/^user navigates back to verify account section and clears all the previously provided details$/, async function (t) {
  await verifyAccountMethod.navigateBackToVerifyAccount(t);
});
Given(/^user enters '(.*)' in '(.*)' field$/, async function (t, [NMIIorMIRNorPostcodeValue, NMIorMIRNorPostcode]) {
  if (interceptNetworkRequest === 'Y') {
    await testFunction.captureNetworkCall(t, '/qt2/app/v1/offers/lookup');
  }
  await plansMethod.enterNMIorMIRNorPostcode(t, NMIIorMIRNorPostcodeValue, NMIorMIRNorPostcode);
});
Then(/^plans page load according to the type of '(.*)'$/, async function (t, [addressType]) {
  await plansMethod.verifyAddressLookup(t, addressType);
  await testFunction.takeScreenshot(t, 'plans_page');//disabled UI Validation
});
Then(/^plans page load according to the type of '(.*)' on plans page$/, async function (t, [NMIorMIRNType]) {
  await plansMethod.verifyNMIorMIRNLookupMessage(t, NMIorMIRNType);
  await testFunction.takeScreenshot(t, 'plans_page');//disabled UI Validation
});
Then(/^user validates details on plans page for '(.*)'$/, async function (t, [customerType]) {
  //await plansMethod.validateGeneralStateDisclaimer(t, customerType);
  //await plansMethod.validateSolarGovernmentSchemeDisclaimer(t);
  await testFunction.takeScreenshot(t, 'ABTest_plans_page');
});
Then(/^user validates disclaimer on plans page for "([^"]*)"$/, async function (t, [campaignName], dataTable) {
  dataTable = dataTable.hashes();
  let data = await FileUtils.getJSONfile(campaignName);
  await plansMethod.validateDisclaimer(t, dataTable, data);
  //await testFunction.takeScreenshot(t, 'validated disclaimers for the plans page');//disabled UI Validation
  console.log("Validation completed for disclaimers on campaign page.");
});

Then(/^user validates disclaimer on plans page for "([^"]*)" plan$/, async function (t, [campaignName], dataTable) {
  dataTable = dataTable.hashes();
  let data = await FileUtils.getJSONfile(campaignName);
  await plansMethod.validateDisclaimerPlansPage(t, dataTable, data);
  //await testFunction.takeScreenshot(t, 'validated disclaimers for the plans page');//disabled UI Validation
  console.log("Validation completed for disclaimers on plans page.");
});
Given(/^user validates disclaimer on review page for "([^"]*)" plan$/, async function (t, [campaignName], dataTable) {
  dataTable = dataTable.hashes();
  let data = await FileUtils.getJSONfile(campaignName);
  await plansMethod.validateDisclaimerPlansPage(t, dataTable, data);
  //await testFunction.takeScreenshot(t, 'validated disclaimers for the plans page');//disabled UI Validation
  console.log("Validation completed for disclaimers on review page.");
});
Then(/^user validates verify account journey's UI for '(.*)' plans page$/, async function (t, [customerType]) {
  await plansMethod.clickPlansPageModal(t, customerType);
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

Then(/^user validates reference price for '(.*)'$/, async function (t, [planName]) {
  if (interceptNetworkRequest === 'Y') {
    let rewardCreditCondition, baseCreditCondition, baseSourceCode, rewardSourceCode, state;
    let jsonObj = await testFunction.validateNetworkCall(t);
    state = jsonObj.state;
    let excludedPlans = (planName !== PlanType.BASIC_BUSINESS && planName !== PlanType.BASIC_HOME && planName !== PlanType.BASIC_HOME_QLD && planName !== PlanType.BASIC_BUSINESS_QLD);
    if (excludedPlans) {
      let plans = jsonObj.electricity.plans;
      plans.forEach(function myFunction(plan) {
        if (planName.toLowerCase() === plan.name.toLowerCase()) {
          let rewardsCount = plan.rewards.length;
          if (rewardsCount > 0) {
            rewardCreditCondition = plan.rewards[0].planReward.creditCondition;
            rewardSourceCode = plan.rewards[0].planReward.sourceCode;
          }
          baseCreditCondition = plan.benchmark.creditCondition;
          baseSourceCode = plan.sourceCode;
          // break;
        }
      });
      if (state !== AustralianState.ACT) {
        await plansMethod.validateComparisonStatement(t, baseCreditCondition, rewardCreditCondition, planName);
        console.log("Validated Comparison Statement");
      }
    }
  }
});


Then(/^user enters NMI and validate reference price for "([^"]*)"$/, async function (t, [expectedCustomerType]) {
  await testFunction.click(t, EaHomePage.elements.refinePeriod);
  await testFunction.click(t, EaHomePage.elements.refinePeriodDropdown.withText("Yearly"));
  const workbook = new Workbook();
  await workbook.xlsx.readFile(`${process.cwd()}/resources/Reprice_Data/Reference_Price_Test_Data.xlsx`);
  const worksheet = workbook.getWorksheet(1);
  const rowCount = worksheet.actualRowCount;
  for (let i = 2; i < rowCount; i++) {
    let row = worksheet.getRow(i);
    let actualCustomerType = row.getCell(3).value.toString();
    let eleUsage = row.getCell(4).value.toString();
    let customUsage;
    let planName = row.getCell(7).value.toString();
    let estimatedCost = Math.round(Number(row.getCell(9).value));
    let benchmarkUsage = Math.round(Number(row.getCell(10).value));
    let referencePrice = Math.round(Number(row.getCell(11).value));
    let percentageDiff = Math.round(Number(((referencePrice - estimatedCost) / referencePrice) * 100));
    let NMI = row.getCell(12).value.toString();
    let state = row.getCell(13).value.toString();
    if (eleUsage === 'Average Usage') {
      customUsage = (benchmarkUsage / 365).toFixed(2);
    }
    if (eleUsage === 'Custom') {
      customUsage = row.getCell(6).value.toString();
    }
    if (actualCustomerType === expectedCustomerType) {
      await plansMethod.enterNMIorMIRNorPostcode(t, NMI, 'NMI');
      await testFunction.waitForElementToBeDisappeared(t, EaHomePage.elements.eaSpinner);
      await t.wait(5000);
      if (eleUsage === 'Average Usage' || eleUsage === 'Custom') {
        if ((await testFunction.sizeOfElement(t, EaHomePage.elements.refineEleUsageActiveOption)) === 0) {
          await testFunction.click(t, EaHomePage.elements.refineEleUsage);
          await testFunction.click(t, EaHomePage.elements.refineEleUsageDropdown.withText('Custom'));
        }
        await testFunction.clearTextField(t, EaHomePage.elements.refineEleUsageActiveOption);
        await testFunction.enterText(t, EaHomePage.elements.refineEleUsageActiveOption, customUsage);
      } else {
        await testFunction.click(t, EaHomePage.elements.refineEleUsage);
        await testFunction.click(t, EaHomePage.elements.refineEleUsageDropdown.withText(eleUsage));
      }
      await t.wait(2000);
      if (referencePrice !== 0) {
        await plansMethod.validateReferencePrice(t, estimatedCost, referencePrice, percentageDiff, state, actualCustomerType);
        await testFunction.takeScreenshot(t, "Reference_Price_" + NMI);
        console.log("Reference price validated for NMI: " + NMI);
      }
    }

  }
});

Then(/^user enters NMI and validate estimated cost for "([^"]*)"$/, async function (t, [expectedCustomerType]) {
  await testFunction.click(t, EaHomePage.elements.refinePeriod);
  await testFunction.click(t, EaHomePage.elements.refinePeriodDropdown.withText("Yearly"));
  const workbook = new Workbook();
  await workbook.xlsx.readFile(`${process.cwd()}/resources/Reprice_Data/Estimated_Cost_Test_Data.xlsx`);
  const worksheet = workbook.getWorksheet(1);
  const rowCount = worksheet.actualRowCount;
  for (let i = 2; i < rowCount; i++) {
    let row = worksheet.getRow(i);
    let actualCustomerType = row.getCell(3).value.toString();
    let eleUsage = row.getCell(4).value.toString();
    let customUsage, noFrillsPlanName, noFrillsEstimatedCost;
    let basicPlanName = row.getCell(7).value.toString();
    let basicEstimatedCost = Number(row.getCell(8).value);
    if (actualCustomerType === CustomerType.RESIDENTIAL) {
      noFrillsPlanName = row.getCell(9).value.toString();
      noFrillsEstimatedCost = Number(row.getCell(10).value);
    }
    let totalPlanName = row.getCell(11).value.toString();
    let totalEstimatedCost = Number(row.getCell(12).value);
    let NMI = row.getCell(15).value.toString();
    let state = row.getCell(16).value.toString();
    if (eleUsage === 'Custom') {
      customUsage = row.getCell(5).value.toString();
    }
    if (actualCustomerType === expectedCustomerType) {
      await plansMethod.enterNMIorMIRNorPostcode(t, NMI, 'NMI');
      await testFunction.waitForElementToBeAppeared(t, EaHomePage.elements.eaSpinner);
      await testFunction.waitForElementToBeDisappeared(t, EaHomePage.elements.eaSpinner);
      await t.wait(5000);
      if (eleUsage === 'Custom') {
        if ((await testFunction.sizeOfElement(t, EaHomePage.elements.refineEleUsageActiveOption)) === 0) {
          await testFunction.click(t, EaHomePage.elements.refineEleUsage);
          await testFunction.click(t, EaHomePage.elements.refineEleUsageDropdown.withText('Custom'));
        }
        await testFunction.clearTextField(t, EaHomePage.elements.refineEleUsageActiveOption);
        await testFunction.enterText(t, EaHomePage.elements.refineEleUsageActiveOption, customUsage);
      } else {
        await testFunction.click(t, EaHomePage.elements.refineEleUsage);
        await testFunction.click(t, EaHomePage.elements.refineEleUsageDropdown.withText(eleUsage));
      }
      await t.wait(2000);
      await plansMethod.validateEstimatedCost(t, basicPlanName, basicEstimatedCost, actualCustomerType, state);
      await plansMethod.validateEstimatedCost(t, totalPlanName, totalEstimatedCost, actualCustomerType, state);
      if (expectedCustomerType === CustomerType.RESIDENTIAL) {
        await plansMethod.validateEstimatedCost(t, noFrillsPlanName, noFrillsEstimatedCost, actualCustomerType, state);
      }
      await testFunction.takeScreenshot(t, "Estimated_Cost_" + NMI);
      console.log("Estimated cost validated for NMI: " + NMI);
    }
  }
});

Then(/^user enters NMI and validate estimated cost in best offer tool output file for "([^"]*)"$/, async function (t, [expectedCustomerType]) {
  await testFunction.click(t, EaHomePage.elements.refinePeriod);
  await testFunction.click(t, EaHomePage.elements.refinePeriodDropdown.withText("Yearly"));
  const workbook = new Workbook();
  await workbook.xlsx.readFile(`${process.cwd()}/resources/Reprice_Data/Best_Offer_Tool_Estimate_Calculation.xlsx`);
  const worksheet = workbook.getWorksheet(1);
  const rowCount = worksheet.actualRowCount;
  for (let i = 2; i < rowCount; i++) {
    let row = worksheet.getRow(i);
    let actualCustomerType = row.getCell(3).value.toString().substring(0, 3);
    let customUsage = row.getCell(9).value.toString();
    let planName = row.getCell(8).value.toString();
    let estimatedCost = Math.round(Number(row.getCell(10).value));
    let NMI = row.getCell(2).value.toString();
    let state = row.getCell(4).value.toString();
    let percentageDiff = row.getCell(11).value.toString();
    let benchmarkUsage = row.getCell(13).value.toString();
    if (actualCustomerType === expectedCustomerType) {
      await plansMethod.enterNMIorMIRNorPostcode(t, NMI, 'NMI');
      await testFunction.waitForElementToBeDisappeared(t, EaHomePage.elements.eaSpinner);
      await t.wait(5000);
      if ((await testFunction.sizeOfElement(t, EaHomePage.elements.refineEleUsageActiveOption)) === 0) {
        await testFunction.click(t, EaHomePage.elements.refineEleUsage);
        await testFunction.click(t, EaHomePage.elements.refineEleUsageDropdown.withText('Custom'));
      }
      await testFunction.clearTextField(t, EaHomePage.elements.refineEleUsageActiveOption);
      await testFunction.enterText(t, EaHomePage.elements.refineEleUsageActiveOption, customUsage);
      await t.wait(2000);
      await plansMethod.validateBestOfferEstimatedCost(t, planName, estimatedCost, percentageDiff, benchmarkUsage);
      await testFunction.takeScreenshot(t, "Estimated_Cost_" + NMI);
      console.log("Estimated cost validated for NMI: " + NMI);
    }
  }
});

Then(/^user enters address and validate estimated cost for '(.*)' and '(.*)'$/, async function (t, parameters) {
  let expectedCustomerType = parameters[0];
  let expectedFuelType = parameters[1];
  const workbook = new Workbook();
  await workbook.xlsx.readFile(`${process.cwd()}/resources/Reprice_Data/EstimatedCost_PVT_TestData.xlsx`);
  let worksheet;
  if (expectedCustomerType === 'BUS' && expectedFuelType === 'ELE') {
    worksheet = workbook.getWorksheet(2);
  } else if (expectedCustomerType === 'BUS' && expectedFuelType === 'GAS') {
    worksheet = workbook.getWorksheet(4);
  } else if (expectedCustomerType === 'RES' && expectedFuelType === 'ELE') {
    worksheet = workbook.getWorksheet(1);
  } else if (expectedCustomerType === 'RES' && expectedFuelType === 'GAS') {
    worksheet = workbook.getWorksheet(3);
  }
  const rowCount = worksheet.actualRowCount;
  for (let i = 2; i < rowCount + 1; i++) {
    let row = worksheet.getRow(i);
    let actualCustomerType = row.getCell(2).value.toString();
    let actualFuelType = row.getCell(3).value.toString();
    let fuelUsage = row.getCell(7).value.toString();
    let customUsage, prizingZone, tariffType;
    let state = row.getCell(1).value.toString();
    let address = row.getCell(6).value.toString();
    let PlanName1, PlanName1_EstimatedCost, PlanName2, PlanName2_EstimatedCost, PlanName3, PlanName3_EstimatedCost;
    if (row.getCell(9).value) {
      PlanName1 = row.getCell(9).value.toString();
      PlanName1_EstimatedCost = Number(row.getCell(10).value);
    }
    if (row.getCell(11).value) {
      PlanName2 = row.getCell(11).value.toString();
      PlanName2_EstimatedCost = Number(row.getCell(12).value);
    }
    if (row.getCell(13).value) {
      PlanName3 = row.getCell(13).value.toString();
      PlanName3_EstimatedCost = Number(row.getCell(14).value);
    }
    if (actualCustomerType === expectedCustomerType && actualFuelType === expectedFuelType) {
      await plansMethod.provideAddressOnPlansPage(t, address);
      await testFunction.waitForElementToBeDisappeared(t, EaHomePage.elements.eaSpinner);
      if (expectedFuelType === 'ELE') {
        tariffType = row.getCell(4).value.toString();
        prizingZone = row.getCell(5).value.toString();
        if (fuelUsage === 'Custom') {
          customUsage = row.getCell(8).value.toString();
          await testFunction.click(t, EaHomePage.elements.refineEleUsage);
          await testFunction.click(t, EaHomePage.elements.refineEleUsageDropdown.withText('Custom'));
          await testFunction.clearTextField(t, EaHomePage.elements.refineElectrcityCustomInput);
          await testFunction.enterText(t, EaHomePage.elements.refineElectrcityCustomInput, customUsage);
        } else {
          await testFunction.click(t, EaHomePage.elements.refineEleUsage);
          await testFunction.click(t, EaHomePage.elements.refineEleUsageDropdown.withText(fuelUsage));
        }
        await testFunction.click(t, EaHomePage.elements.refinePeriod);
        await testFunction.click(t, EaHomePage.elements.refinePeriodDropdown.withText("Yearly"));
        await testFunction.waitForElementToBeDisappeared(t, EaHomePage.elements.eaSpinner);
        await t.wait(2000);
        console.log('Verifying estimated Electricity cost for tariff type:' + tariffType + ' and pricing zone:' + prizingZone + ' with address:' + address);
        if (PlanName1) {
          await plansMethod.validateEstimatedCost(t, PlanName1, PlanName1_EstimatedCost, actualCustomerType, state);
        }
        if (PlanName2) {
          await plansMethod.validateEstimatedCost(t, PlanName2, PlanName2_EstimatedCost, actualCustomerType, state);
        }
        if (PlanName3) {
          await plansMethod.validateEstimatedCost(t, PlanName3, PlanName3_EstimatedCost, actualCustomerType, state);
        }
        await testFunction.takeScreenshot(t, "Reprice_Address" + i);
      } else if (expectedFuelType === 'GAS') {
        if (fuelUsage === 'Custom') {
          customUsage = row.getCell(8).value.toString();
          await testFunction.click(t, EaHomePage.elements.refineGasUsage);
          await testFunction.click(t, EaHomePage.elements.refineGasUsageDropdown.withText('Custom'));
          await testFunction.clearTextField(t, EaHomePage.elements.refineGasCustomInput);
          await testFunction.enterText(t, EaHomePage.elements.refineGasCustomInput, customUsage);
        } else {
          await testFunction.click(t, EaHomePage.elements.refineGasUsage);
          await testFunction.click(t, EaHomePage.elements.refineGasUsageDropdown.withText(fuelUsage));
        }
        await testFunction.click(t, EaHomePage.elements.refinePeriod);
        await testFunction.click(t, EaHomePage.elements.refinePeriodDropdown.withText("Yearly"));
        await testFunction.waitForElementToBeDisappeared(t, EaHomePage.elements.eaSpinner);
        await t.wait(2000);
        console.log('Verifying estimated GAS cost for address:' + address);
        if (PlanName1) {
          await plansMethod.validateEstimatedGasCost(t, PlanName1, PlanName1_EstimatedCost, actualCustomerType, state);
        }
        if (PlanName2) {
          await plansMethod.validateEstimatedGasCost(t, PlanName2, PlanName2_EstimatedCost, actualCustomerType, state);
        }
        if (PlanName3) {
          await plansMethod.validateEstimatedGasCost(t, PlanName3, PlanName3_EstimatedCost, actualCustomerType, state);
        }
        await testFunction.takeScreenshot(t, "Reprice_Address" + i);
      }
    }
  }
});
When(/^user reset the verified account$/, async function (t) {
  await verifyAccountMethod.resetVerifiedAccount(t);
});
Then(/^user verifies retrieved account details on plans page$/, async function (t, [], dataTable) {
  let data = dataTable.hashes();
  await verifyAccountMethod.verifyRetrievedDetails(t, data[0].address, data[0].NMI, data[0].MIRN);
});
Given(/^user validates cro refine options on plans page for '(.*)'$/, async function (t, [customerType]) {
  await plansMethod.croRefineButtons(t, customerType);
});
When(/^user clicks the '(.*)' option$/, async function (t, [option]) {
  await plansMethod.selectOption(t, option);
});
Then(/^user validates the sidebar accordions$/, async function (t) {
  await plansMethod.validateEnergyUsageSideBar(t);
  await testFunction.takeScreenshot(t, 'validate_sidebar');
  console.log("User has validated the sidebar accordions");
});
When(/^user clicks the '(.*)' accordion$/, async function (t, [accordionOption]) {
  switch (accordionOption) {
    case 'Green Energy':
      await testFunction.click(t, EaHomePage.elements.croCustomiseEstimateSideBar.greenEnergyAccordionHeader);
      await testFunction.takeScreenshot(t, 'green_energy_accordion');
      break;
    case 'Billing Period':
      await testFunction.click(t, EaHomePage.elements.croCustomiseEstimateSideBar.billingPeriodAccordionHeader);
      await testFunction.takeScreenshot(t, 'billing_period_accordion');
      break;
  }
  console.log("User has clicked the" + accordionOption + " accordion");
});
Then(/^user validates the Energy Usage accordion is still expanded$/, async function (t) {
  let elementValue = await testFunction.getElementAttribute(t, EaHomePage.elements.croCustomiseEstimateSideBar.energyUsageAccordionHeader, 'class');
  await testFunction.assertPartialTextValue(t, elementValue, 'expanded');
  await testFunction.takeScreenshot(t, 'energy_accordion_expanded');
  console.log("User has validated the energy usage accordiomn is still expanded");
});
When(/^user clicks the '(.*)' usage tooltip and validates the tooltip text$/, async function (t, [usage]) {
  await plansMethod.validateEnergyUsageToolTip(t, usage);
  console.log("The" + usage + " usage tooltip validated");
});
When(/^user clicks the '(.*)' '(.*)' usage field$/, async function (t, [fueltype, usage]) {
  await plansMethod.selectSideBarUsage(t, fueltype, usage);
  console.log("user validates the enrgy usage values");
});
When(/^user enters values for '(.*)' custom usage field$/, async function (t, [fueltype]) {
  await plansMethod.enterSideBarCustomUsage(t, fueltype);
});
When(/^user clicks the done button to close the sidebar$/, async function (t) {
  await testFunction.click(t, EaHomePage.elements.croCustomiseEstimateSideBar.closeSideBar);
  await testFunction.takeScreenshot(t, 'sidebar_done');
});
Then(/^user validates the color of the '(.*)' button$/, async function (t, [option]) {
  switch (option) {
    case 'Energy Usage':
      await testFunction.takeScreenshot(t, 'energy_usage_plans_page_color1');
      await testFunction.click(t, EaHomePage.elements.croRefineOptions.customizeEstimateTitle);
      await testFunction.takeScreenshot(t, 'energy_usage_plans_page_color2');
      break;
    case 'Add Green Energy':
      await testFunction.takeScreenshot(t, 'add_green_energy_plans_page_color1');
      await testFunction.click(t, EaHomePage.elements.croRefineOptions.customizeEstimateTitle);
      await testFunction.takeScreenshot(t, 'add_green_energy_plans_page_color2');
      break;
    case 'More':
      await testFunction.takeScreenshot(t, 'more_Refine_plans_page_color1');
      await testFunction.click(t, EaHomePage.elements.croRefineOptions.customizeEstimateTitle);
      await testFunction.takeScreenshot(t, 'more_Refine_plans_page_color2');
      break;
  }
});
Then(/^user validates the Billing Period section in the sidebar$/, async function (t) {
  await plansMethod.validateSideBarBillingPeriod(t);
});
Then(/^user validates the Green Energy section in the sidebar for '(.*)' plans page$/, async function (t, [customer_type]) {
  await plansMethod.validateSideBarGreenEnergy(t, customer_type);
});
Then(/^user validates if the plans page loads yearly estimates$/, async function (t) {
  await testFunction.assertText(t, EaHomePage.elements.basicHomePlanEstimatePeriod, 'Your estimated yearly cost');
  await testFunction.takeScreenshot(t, 'validate_estimate_period_plans_page');
});
Then(/^user validates if the green energy value is displayed on the '(.*)' plans page$/, async function (t, [customer_type]) {
  switch (customer_type) {
    case 'RES':
      await testFunction.click(t, EaHomePage.elements.basicHomeElectricityRatesDropdown);
      await testFunction.assertText(t, EaHomePage.elements.greenEnergyTitleBasicHome, '100% Green energy');
      await testFunction.assertText(t, EaHomePage.elements.greenEnergyBasicHome, 'PureEnergy100');
      await testFunction.takeScreenshot(t, 'green_energy_rates_plans_page');
      break;
    case 'BUS':
      await testFunction.click(t, EaHomePage.elements.basicBusElectricityRatesDropdown);
      await testFunction.assertText(t, EaHomePage.elements.greenEnergyTitleBasicBus, '100% Green energy');
      await testFunction.assertText(t, EaHomePage.elements.greenEnergyBasicBus, 'PureEnergy100');
      await testFunction.takeScreenshot(t, 'green_energy_rates_plans_page');
      break;
  }
});
When(/^user clicks the upload bill accordion in the side bar$/, async function (t) {
  await testFunction.click(t, EaHomePage.elements.croCustomiseEstimateSideBar.uploadBillAccordionHeader);
});
When(/^user clicks the NMI or MIRN accordion in the side bar$/, async function (t) {
  await testFunction.click(t, EaHomePage.elements.croCustomiseEstimateSideBar.enterNMIorMIRNAccordionHeader);
});
Then(/^user validates the Bill Upload section in the sidebar$/, async function (t) {
  await testFunction.isElementDisplayed(t, EaHomePage.elements.croCustomiseEstimateSideBar.billUploadAccordion.billUploadText);
  await testFunction.isElementDisplayed(t, EaHomePage.elements.croCustomiseEstimateSideBar.billUploadAccordion.billUploadLink);
  await testFunction.click(t, EaHomePage.elements.croCustomiseEstimateSideBar.billUploadAccordion.billUploadLink);
});
Then(/^user validates the NMI or MIRN section in the sidebar$/, async function (t) {
  await testFunction.isElementDisplayed(t, EaHomePage.elements.croCustomiseEstimateSideBar.nmiOrMirnAccordion.nmiOrMirnText);
  await testFunction.assertText(t, EaHomePage.elements.croCustomiseEstimateSideBar.nmiOrMirnAccordion.nmiOrMirnText, 'Your NMI (National Metering Identifier) and MIRN (Meter Installation Reference Number) are 10 - 11 digit numbers that can be found on your existing utility bills. These numbers allow us to estimate your energy costs using your meter rates and tariffs specific to your connection address.');
});
When(/^user validates the existing customer section in the sidebar$/, async function (t) {
  await testFunction.click(t, EaHomePage.elements.croCustomiseEstimateSideBar.existingCustomerAccordionHeader);
  await testFunction.isElementDisplayed(t, EaHomePage.elements.croCustomiseEstimateSideBar.existingCustomerAccordion.existingCustomerText);
  await testFunction.assertText(t, EaHomePage.elements.croCustomiseEstimateSideBar.existingCustomerAccordion.existingCustomerText, 'Your account number can be found on your bill.');
  console.log("User validates the text for existing customer accordion");
});
When(/^user verifies the account through verify account journey for residential customer through AB test side Bar$/, async function (t, [], dataTable) {
  let data = dataTable.hashes();
  await testFunction.takeScreenshot(t, 'verify_account_main');//disabled UI Validation
  if (data[0].elecAccountNumber) {
    await verifyAccountMethod.provideAccountDetails(t, "ELE", data[0].elecAccountNumber);
  }
  if (data[0].gasAccountNumber) {
    await verifyAccountMethod.provideAccountDetails(t, "GAS", data[0].gasAccountNumber);
  }
  await verifyAccountMethod.provideAccountInformation(t, data[0].postcode, data[0].customer_type);
  await testFunction.takeScreenshot(t, 'verify_account_modal_with_data');//disabled UI Validation
  await verifyAccountMethod.verifyAccountNext(t);
  await verifyAccountMethod.provideIdentityDetails(t, data[0].idType, data[0].idNumber);
  await testFunction.takeScreenshot(t, 'verify_account_modal_id_with_data');//disabled UI Validation
  //await testFunction.captureNetworkCall(t,'/qt2/app/account/retrieve');
  await verifyAccountMethod.verifyAccountNext(t);
  //await testFunction.validateNetworkCall(t);
  await testFunction.takeScreenshot(t, 'verify_account_modal_final');//disabled UI Validation
  await verifyAccountMethod.showCostEstimates(t);
});
When(/^user enters the address "([^"]*)" on plans page$/, async function (t, [address]) {
  await plansMethod.provideAddressOnPlansPage(t, address);
});
When(/^user enters the address "([^"]*)" on campaign and click show me link$/, async function (t, [address]) {
  await plansMethod.provideAddressOnPlansPage(t, address);
  await testFunction.click(t, EaHomePage.elements.btnCampaignSearchOnModal);
  await testFunction.waitForElementToBeDisappeared(t, EaHomePage.elements.eaSpinner);
});
Then(/^user validates the solar disclaimer on the page$/, async function (t, dataTable) {
  dataTable = dataTable.hashes();
  await plansMethod.verifySolarDisclaimer(t, dataTable);
});

When(/^user verifies the account through verify account journey for business customer through AB test side Bar$/, async function (t, [], dataTable) {
  let data = dataTable.hashes();
  await testFunction.takeScreenshot(t, 'verify_account_main');//disabled UI Validation
  if (data[0].elecAccountNumber) {
    await verifyAccountMethod.provideAccountDetails(t, "ELE", data[0].elecAccountNumber);
  }
  if (data[0].gasAccountNumber) {
    await verifyAccountMethod.provideAccountDetails(t, "GAS", data[0].gasAccountNumber);
  }
  await verifyAccountMethod.provideAccountInformation(t, data[0].ABNOrACN, data[0].customer_type);
  await testFunction.takeScreenshot(t, 'verify_account_modal_with_data');//disabled UI Validation
  await verifyAccountMethod.verifyAccountNext(t);
  await verifyAccountMethod.provideIdentityDetails(t, data[0].idType, data[0].idNumber);
  await testFunction.takeScreenshot(t, 'verify_account_modal_id_with_data');//disabled UI Validation
  await verifyAccountMethod.verifyAccountNext(t);
  await testFunction.takeScreenshot(t, 'verify_account_modal_final');//disabled UI Validation
  await verifyAccountMethod.showCostEstimates(t);
});

When(/^user enters the postcode "([^"]*)" on plans page$/, async function (t, [postcode]) {
  await plansMethod.providePostcodeOnPlansPage(t, postcode);
});
When(/^user selects "([^"]*)" state from the state dropdown on plans page$/, async function (t, [state]) {
  await plansMethod.selectStateFromDropdown(t, state)
});

When(/^user selects '(.*)' fact sheet$/, async function (t, [planName]) {
  await plansMethod.selectBPIDPlan(t, planName);
});

Then(/^user validates the data on '(.*)' plans page for "([^"]*)" plan$/, async function (t, [page,campaignName], dataTable) {
  dataTable = dataTable.hashes();
  let data = await FileUtils.getJSONfile(campaignName);
  await plansMethod.validatePlanHeadingPlanPage(t, dataTable, data, page);
  //await testFunction.takeScreenshot(t, 'validated plan heading');//disabled UI Validation
  await plansMethod.validateFeaturesPlanPage(t, dataTable, data, page);
  //await testFunction.takeScreenshot(t, 'validated feature text for plans');//disabled UI Validation
  console.log("feature validated");
});

When(/^user validates the reprice pre-positioning disclaimer for '(.*)' '(.*)' for '(.*)' state$/, async function (t, [plan,campaign,state]) {
  let data = await FileUtils.getJSONfile(campaign);
  await plansMethod.validateRepricePrePositioningText(t, data, state);
});

When(/^user validates the reprice pre-positioning disclaimer for '(.*)' on '(.*)' plans page$/, async function (t, [plan, journey]) {
  await plansMethod.validateRepricePrePositioningTextPlansPage(t, plan, journey);
});

When(/^user selects the '(.*)' usage period$/, async function (t, [period]) {
  await plansMethod.enterCostEstimatePeriod(t, period);
});

When( /^user selects '(.*)' location type$/, async function (t, [addressOrPostcode]) {
  await plansMethod.selectAddressOrPostcode(t, addressOrPostcode)
})

When (/^user selects '(.*)' '(.*)' usage per day$/, async function (t, [usage, fueltype]) {
  await plansMethod.selectUsagePerDay(t, usage,fueltype );
});

When (/^user selects '(.*)' green energy$/, async function (t, [greenEnergyPercentage]) {
  await plansMethod.selectGreenEnergy(t, greenEnergyPercentage );
});

When(/^user clicks the estimate cost tooltip$/, async function (t) {
  await testFunction.click(t, EaHomePage.elements.estimateCostTooltip);
});
When(/^user clicks the electricity usage tooltip$/, async function (t) {
  await testFunction.click(t, EaHomePage.elements.electricityUsagesTooltip);
});
When(/^user clicks the gas usage tooltip$/, async function (t) {
  await testFunction.click(t, EaHomePage.elements.gasUsagesTooltip);
});
When(/^user clicks the green energy tooltip$/, async function (t) {
  await testFunction.click(t, EaHomePage.elements.greenEnergyTooltip);
});

When(/^user clicks '(.*)' toggle button$/, async function (t,[planName]) {
  if((planName===PlanType.BASIC_HOME)||(planName===PlanType.BASIC_BUSINESS)){
    await testFunction.click(t, EaHomePage.elements.basicHomeToggleButton);
  }else if(planName===PlanType.NO_FRILLS){
    await testFunction.click(t, EaHomePage.elements.noFrillsToggleButton);
  }else if((planName===PlanType.TOTAL_PLAN)||(planName===PlanType.TOTAL_BUSINESS)){
    await testFunction.click(t, EaHomePage.elements.totalPlanToggleButton);
  }else if((planName===PlanType.RESIDENTIAL_BALANCE_PLAN)){
    await testFunction.click(t, EaHomePage.elements.resiBalanceToggleButton);
  }else if((planName===PlanType.BUSINESS_BALANCE_PLAN)){
    await testFunction.click(t, EaHomePage.elements.bsmeBalanceToggleButton);
  }
});

When(/^user clicks '(.*)' electricity accordion button$/, async function (t,[planName]) {
  if((planName===PlanType.BASIC_HOME)||(planName===PlanType.BASIC_BUSINESS)){
    await testFunction.click(t, EaHomePage.elements.basicHomeEleRatesAccordion);
  }else if(planName===PlanType.NO_FRILLS){
    await testFunction.click(t, EaHomePage.elements.noFrillsEleRatesAccordion);
  }else if((planName===PlanType.TOTAL_PLAN)||(planName===PlanType.TOTAL_BUSINESS)){
    await testFunction.click(t, EaHomePage.elements.totalPlanEleRatesAccordion);
  }else if(planName===PlanType.BUSINESS_BALANCE_PLAN){
    await testFunction.click(t, EaHomePage.elements.bsmeBalanceEleRatesAccordion);
  }
});

When(/^user clicks '(.*)' gas accordion button$/, async function (t,[planName]) {
  if((planName===PlanType.BASIC_HOME)||(planName===PlanType.BASIC_BUSINESS)){
    await testFunction.click(t, EaHomePage.elements.basicHomeGasRatesAccordion);
  }else if(planName===PlanType.NO_FRILLS){
    await testFunction.click(t, EaHomePage.elements.noFrillsGasRatesAccordion);
  }else if((planName===PlanType.TOTAL_PLAN)||(planName===PlanType.TOTAL_BUSINESS)){
    await testFunction.click(t, EaHomePage.elements.totalPlanGasRatesAccordion);
  }
});

When(/^user clicks on '(.*)' estimate tooltip$/, async function (t,[planName]) {
  switch (planName) {
    case "basic-home" :
      await testFunction.click(t, EaHomePage.elements.basicHomeEstimatecostTooltip);
      break;
    case "no-frills" :
      await testFunction.click(t, EaHomePage.elements.nofrillsEstimatecostTooltip);
      break;
    case "total-plan" :
      await testFunction.click(t, EaHomePage.elements.totalplanEstimatecostTooltip);
      break;
  }
});

When(/^user clicks on '(.*)' benefit period tooltip$/, async function (t,[planName]) {
  switch (planName) {
    case "basic-home" :
      await testFunction.click(t, EaHomePage.elements.basicHomeBenefitPeriodTooltip);
      break;
    case "no-frills" :
      await testFunction.click(t, EaHomePage.elements.nofrillsBenefitPeriodTooltip);
      break;
    case "total-plan" :
      await testFunction.click(t, EaHomePage.elements.totalplanBenefitPeriodTooltip);
      break;
  }
});

When(/^user clicks on '(.*)' exit fees tooltip$/, async function (t,[planName]) {
  switch (planName) {
    case "basic-home" :
      await testFunction.click(t, EaHomePage.elements.basicHomeExitFeesTooltip);
      break;
    case "no-frills" :
      await testFunction.click(t, EaHomePage.elements.nofrillsExitFeesTooltip);
      break;
    case "total-plan" :
      await testFunction.click(t, EaHomePage.elements.totalplanExitFeesTooltip);
      break;
  }
});

When(/^user clicks on '(.*)' fees tooltip$/, async function (t,[planName]) {
  switch (planName) {
    case "basic-home" :
      await testFunction.click(t, EaHomePage.elements.basicHomeFeesTooltip);
      break;
    case "no-frills" :
      await testFunction.click(t, EaHomePage.elements.nofrillsFeesTooltip);
      break;
    case "total-plan" :
      await testFunction.click(t, EaHomePage.elements.totalplanFeesTooltip);
      break;
  }
});
When(/^user clicks on '(.*)' rates tooltip$/, async function (t,[planName]) {
  switch (planName) {
    case "basic-home" :
      await testFunction.click(t, EaHomePage.elements.basicHomeRatesTooltip);
      break;
    case "no-frills" :
      await testFunction.click(t, EaHomePage.elements.nofrillsRatesTooltip);
      break;
    case "total-plan" :
      await testFunction.click(t, EaHomePage.elements.totalplanRatesTooltip);
      break;
  }
});
When(/^user clicks on '(.*)' late payment tooltip$/, async function (t,[planName]) {
  switch (planName) {
    case "basic-home" :
      await testFunction.click(t, EaHomePage.elements.basicHomeLatePaymentTooltip);
      break;
    case "no-frills" :
      await testFunction.click(t, EaHomePage.elements.nofrillsLatePaymentTooltip);
      break;
    case "total-plan" :
      await testFunction.click(t, EaHomePage.elements.totalplanLatePaymentTooltip);
      break;
  }
});

When(/^user clicks on '(.*)' solar buyback tooltip$/, async function (t,[planName]) {
  switch (planName) {
    case "basic-home" :
      await testFunction.click(t, EaHomePage.elements.basicHomeSolarRatesTooltip);
      break;
    case "no-frills" :
      await testFunction.click(t, EaHomePage.elements.nofrillsSolarRatesTooltip);
      break;
    case "total-plan" :
      await testFunction.click(t, EaHomePage.elements.totalplanSolarRatesTooltip);
      break;
  }
});
Then(/^user closes the electricity usage modal window$/, async function (t) {
  await testFunction.click(t, EaHomePage.elements.elecUsagemodalClosebutton);
});

Then(/^user closes the gas usage modal window$/, async function (t) {
  await testFunction.click(t, EaHomePage.elements.gasUsagemodalClosebutton);
});
Then(/^user validates the '(.*)' account state for '(.*)' account number and '(.*)'$/, async function (t,[accountFuelRelationship,accountNumber,accountInfo]) {
  await plansMethod.validateAccountNumberAnalytics(t, accountFuelRelationship, accountNumber, accountInfo);
});

Given(/^user clicks '(.*)' features plan toggle button$/, async function (t, [planToggleButton]) {
  await plansMethod.selectSimplifiedPlanToggleButton(t, planToggleButton);
});
Then(/^user validates the label for Referee email address as the offer code$/, async function (t) {
  await testFunction.isElementDisplayed(t,EaHomePage.elements.familyAndFriendsRefereeEmailLabel);
  await testFunction.assertText(t, EaHomePage.elements.familyAndFriendsRefereeEmailLabel, "EnergyAustralia team member email");
});
Then( /^user validates the banner test for Referee email address instead of offer code$/, async function (t) {
  await testFunction.isElementDisplayed(t,EaHomePage.elements.familyAndFriendsRefereeEmailBanner);
  await testFunction.assertText(t, EaHomePage.elements.familyAndFriendsRefereeEmailBanner, "Enter the EnergyAustralia email address of the team member who referred you and your address or postcode to begin");
});
Then(/^user is presented with '(.*)' message$/, async function (t,[dynamicMessage]){
  await testFunction.isElementDisplayed(t,EaHomePage.elements.familyAndFriendsRefereeEmailDynamicError);
  const error = await testFunction.getElementText(t, EaHomePage.elements.familyAndFriendsRefereeEmailDynamicError);
  await testFunction.assertTextValue(t, error, dynamicMessage);
});
Then(/^user is presented with '(.*)' static message$/, async function (t,[staticMessage]){
  await testFunction.isElementDisplayed(t,EaHomePage.elements.familyAndFriendsRefereeEmailStaticError);
  const error = testFunction.getElementText(t, EaHomePage.elements.familyAndFriendsRefereeEmailStaticError);
  await testFunction.assertTextValue(t, error, staticMessage);
});
Then(/^user click on Rates tooltip for '(.*)' and validates the rate type text for '(.*)' on '(.*)' plans page for '(.*)'$/, async function (t, [fuelType,plan, journey,state]) {
  await plansMethod.validateRateTypeTextPlansPage(t, fuelType,plan, journey,state);
});
