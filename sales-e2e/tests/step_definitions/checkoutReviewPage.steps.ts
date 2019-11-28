import {checkoutReviewMethod} from '../methods/checkoutReviewPage';
import {testFunction } from '../../global_methods/helper';
import {When, Then } from 'cucumber';
import {FUEL_TYPE_OPTIONS} from '@ea/ea-commons-models';

When(/^user provides life support details$/, async function(t,[],dataTable){
  let data=dataTable.hashes();
  await checkoutReviewMethod.answerLifeSupportQuestion(t,data[0].lifeSupportOption);
  await testFunction.waitForLoadingIconToClose();
});

Then(/^user submits the quote$/, async function(t){
  await checkoutReviewMethod.submitQuote(t);
});

When(/^user provides life support details on review page$/, async function (t,[],dataTable) {
  let data=dataTable.hashes();
  let fuelType=data[0].fuelType;
  if(data[0].lifeSupportOption==='Yes'){
    await checkoutReviewMethod.answerLifeSupportQuestion(t,data[0].lifeSupportOption);
    await checkoutReviewMethod.clickOnRegisterDeviceBtn(t,fuelType);
    if(testFunction.isElectricity(fuelType)){
      await checkoutReviewMethod.selectLSEquipment(t,data[0].EleclifeSupportDevices,fuelType);
    }
    if(testFunction.isGas(fuelType)){
      await checkoutReviewMethod.selectLSEquipment(t,data[0].GaslifeSupportDevices,fuelType);
    }
  }
});
