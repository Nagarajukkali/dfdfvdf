import { newConnectionMethod } from '../methods/newConnection';
import { When } from 'cucumber';
import {cartsMethod} from '../methods/cartsPage';
import {AustralianState, CustomerType, FUEL_TYPE_OPTIONS} from '@ea/ea-commons-models';

When(/^user provides connection details$/, async function (t,[],dataTable) {
  let data=dataTable.hashes();
  let fuelType=data[0].fuelType;
  let state=data[0].state;
  await newConnectionMethod.selectFuel(t, fuelType);
  await newConnectionMethod.selectProperty(t,data[0].customerType);
  await newConnectionMethod.selectPremise(t,data[0].premiseType);
  await newConnectionMethod.enterPropertyDetails(t,data[0].state,data[0].postcode);
  if(fuelType===FUEL_TYPE_OPTIONS.GAS.value && state===AustralianState.VIC){
    await newConnectionMethod.selectConnectionType(t,data[0].connectionType);
  }
  await newConnectionMethod.proceedToStep2(t);
});
When(/^user provides property details for electricity connection$/, async function (t,[],dataTable) {
  let data=dataTable.hashes();
  let customerType=data[0].customerType;
  await newConnectionMethod.selectOptionForPoleInstallation(t,data[0].optionForPoleInstallation);
  await newConnectionMethod.selectOptionForOffPeakLoad(t,data[0].optionForOffPeakLoad);
  if(customerType===CustomerType.BUSINESS){
    await newConnectionMethod.selectOptionForAMPS(t,data[0].optionForAMPS);
  }
  await newConnectionMethod.proceedToStep3(t);
});
When(/^user provides property contacts$/, async function (t,[],dataTable) {
  let data=dataTable.hashes();
  let fuelType=data[0].fuelType;
  if(fuelType===FUEL_TYPE_OPTIONS.GAS.value){
    await newConnectionMethod.plumberDetails(t);
  }
  await newConnectionMethod.applicantDetails(t,data[0].idType,data[0].state);
});
When(/^user submit the request$/, async function (t) {
  await newConnectionMethod.acceptTnCAndSubmit(t);
});
When(/^user clicks on proceed to quote$/, async function (t) {
  await newConnectionMethod.navigateToQuoteTool(t);
});
When(/^user provides property details for gas connection$/, async function (t,[],dataTable) {
  let data=dataTable.hashes();
  await newConnectionMethod.selectOptionForServiceLineInstallation(t,data[0].optionForServiceLineInstallation);
  await newConnectionMethod.selectOptionForSiteClear(t,data[0].optionForSiteClearance);
  await newConnectionMethod.selectOptionForSiteMarked(t,data[0].optionForSiteMarking);
  await newConnectionMethod.proceedToStep3(t);
});
When(/^user selects appliances$/, async function (t) {
  await newConnectionMethod.selectAppliancesFromList(t);
  await newConnectionMethod.proceedToStep4(t);
});
