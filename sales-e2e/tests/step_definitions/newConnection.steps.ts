import {newConnectionMethod} from '../methods/newConnection';
import {Then, When} from 'cucumber';
import {CustomerType, FUEL_TYPE_OPTIONS} from '@ea/ea-commons-models';
import {testFunction} from '../../global_methods/helper';

When(/^user provides connection details$/, async function (t, [], dataTable) {
  let data = dataTable.hashes();
  let fuelType = data[0].fuelType;
  let state = data[0].state;
  await testFunction.takeScreenshot(t, "new_connections_connectionDetails");//disabled UI Validation
  await newConnectionMethod.selectFuel(t, fuelType);
  await newConnectionMethod.selectProperty(t, data[0].customerType);
  await newConnectionMethod.selectPremise(t, data[0].premiseType);
  await newConnectionMethod.enterPropertyDetails(t, data[0].state, data[0].postcode);
  if (fuelType === FUEL_TYPE_OPTIONS.GAS.value && state === "Victoria") {
    await newConnectionMethod.selectConnectionType(t, data[0].connectionType);
  }
  await testFunction.takeScreenshot(t, "new_connections_connectionDetails_with_data");
  await newConnectionMethod.proceedToStep2(t);
});
When(/^user provides distributor details for electricity connection$/, async function (t, [], dataTable) {
  let data = dataTable.hashes();
  let customerType = data[0].customerType;
  let distributor = data[0].distributor;
  await testFunction.takeScreenshot(t, "new_connections_distributorDetails");//disabled UI Validation
  await newConnectionMethod.enterDistributorDetails(t, data[0].state,distributor);
  await testFunction.takeScreenshot(t, "new_connections_distributorDetails_withData");
});
When(/^user provides property supply type and phase for electricity connection$/, async function (t, [], dataTable) {
  let data = dataTable.hashes();
  let customerType = data[0].customerType;
  let state = data[0].state;
  let supplyType=data[0].supplyType;
  let supplyPhases=data[0].supplyPhases;
  let meterPhases=data[0].meterPhases;
  let ctDetails=data[0].ctDetails;
  await testFunction.takeScreenshot(t, "new_connections_supplyTypeDetails");//disabled UI Validation
  if (state !== "VIC"){
    await newConnectionMethod.enterSupplyType(t, supplyType);
    await newConnectionMethod.enterSupplyPhases(t, supplyPhases);
    await newConnectionMethod.enterMeterPhases(t, meterPhases);
    await newConnectionMethod.enterCTDetails(t, ctDetails);
  }
  await testFunction.takeScreenshot(t, "new_connections_supplyTypeDetails_withData");
  await newConnectionMethod.proceedToStep3(t);
});
When(/^user provides property details for electricity connection$/, async function (t, [], dataTable) {
  let data = dataTable.hashes();
  let customerType = data[0].customerType;
  await testFunction.takeScreenshot(t, "new_connections_propertyDetails");
  if (data[0].state === "SA" || data[0].state === "QLD") {
    await newConnectionMethod.selectOptionForPaperwork(t, data[0].optionForPaperwork);
  }
  await newConnectionMethod.selectOptionForPoleInstallation(t, data[0].optionForPoleInstallation);
  await newConnectionMethod.selectOptionForOffPeakLoad(t, data[0].optionForOffPeakLoad);
  if (customerType === CustomerType.BUSINESS) {
    await newConnectionMethod.selectOptionForAMPS(t, data[0].optionForAMPS,data[0].state);
  }
  await testFunction.takeScreenshot(t, "new_connections_propertyDetails_withData");
  if (data[0].state === "VIC" ) {
    await newConnectionMethod.proceedToStep3(t);
  }
});
When(/^user select applicant type and provides applicant and electrician details$/, async function (t, [], dataTable) {
  let data = dataTable.hashes();
  let applicantType = data[0].applicantType;
  let state = data[0].state;
  await testFunction.takeScreenshot(t, "new_connections_applicantDetails");
  await newConnectionMethod.applicantTypeAndDetails(t, applicantType, state);
  await testFunction.takeScreenshot(t, "new_connections_applicantDetails_withData");
});
When(/^user provides Level2 Accredited Service Provider details$/, async function (t,[],dataTable) {
  let data = dataTable.hashes();
  let state = data[0].state;
  await testFunction.takeScreenshot(t, "new_connections_level2ASPDetails");
  await newConnectionMethod.enterLevel2ASPDetails(t,state);
  await testFunction.takeScreenshot(t, "new_connections_level2ASPDetails_withData");
});
When(/^user provides account setup and mailing details$/, async function (t,[],dataTable) {
  let data = dataTable.hashes();
  let state = data[0].state;
  let idType=data[0].idType;
  await newConnectionMethod.accountSetupAndMailingDetails(t,idType,state);
});
When(/^user provides property contacts$/, async function (t, [], dataTable) {
  let data = dataTable.hashes();
  let fuelType = data[0].fuelType;
  if (fuelType === FUEL_TYPE_OPTIONS.GAS.value) {
    await newConnectionMethod.plumberDetails(t);
  }
  await newConnectionMethod.applicantDetails(t, data[0].idType, data[0].state);
});
When(/^user submit the request$/, async function (t) {
  await newConnectionMethod.acceptTnCAndSubmit(t);
});
When(/^user clicks on proceed to quote$/, async function (t) {
  await testFunction.takeScreenshot(t, "new_connections_proceedToQuote");//disabled UI Validation
  await newConnectionMethod.navigateToQuoteTool(t);
});
When(/^user provides property details for gas connection$/, async function (t, [], dataTable) {
  let data = dataTable.hashes();
  await t.wait(2000);
  await newConnectionMethod.selectOptionForServiceLineInstallation(t, data[0].optionForServiceLineInstallation);
  await newConnectionMethod.selectOptionForSiteClear(t, data[0].optionForSiteClearance);
  await newConnectionMethod.selectOptionForSiteMarked(t, data[0].optionForSiteMarking);
});
When(/^user selects appliances$/, async function (t) {
  await testFunction.takeScreenshot(t, "new_connections_appliances");//disabled UI Validation
  await newConnectionMethod.selectAppliancesFromList(t);
  await testFunction.takeScreenshot(t, "new_connections_appliances_with_data");
  await newConnectionMethod.proceedToStep4(t);
});
Then(/^Error modal is displayed for "([^"]*)"$/, async function (t, [errorType]) {
  await newConnectionMethod.validateErrorMessage(t, errorType);
});
When(/^user clicks on "([^"]*)" button$/, async function (t) {
  await newConnectionMethod.goToPlansPage(t);
});
Then(/^user lands on "([^"]*)" page$/, async function (t, [expectedPage]) {
  await newConnectionMethod.isPlansPageDisplayed(t, expectedPage);
});
