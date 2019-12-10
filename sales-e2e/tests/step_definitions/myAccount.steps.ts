import {When} from "cucumber";
import {testFunction} from '../../global_methods/helper';
const eaMyAccount = require('../pages/myAccount.page');
import {CustomerType, FUEL_TYPE_OPTIONS} from '@ea/ea-commons-models';
import {checkoutDetailsMethod} from '../methods/checkoutDetailsPage';
const cryptoJS = require('crypto-js');
let isSolar: boolean = false;

When(/^user logs in to my account using '(.*)' and '(.*)'$/, async function(t, [username, password]) {
  await testFunction.clearAndEnterText(t, eaMyAccount.elements.tfUsername, username);
  await testFunction.clearAndEnterText(t, eaMyAccount.elements.tfPassword, cryptoJS.AES.decrypt(password, username).toString(cryptoJS.enc.Utf8));
  await testFunction.click(t, eaMyAccount.elements.btnSignIn);
});
When(/^user clicks on view and change plan accordion for '(.*)'$/, async function (t, [fuelType]) {
  await testFunction.waitForLoadingIconToClose_MA();
  if(fuelType === FUEL_TYPE_OPTIONS.ELE.value) {
    await testFunction.click(t, eaMyAccount.elements.eleViewAndChangePlan);
    isSolar = true;
  } else if(fuelType === FUEL_TYPE_OPTIONS.GAS.value) {
    await testFunction.click(t, eaMyAccount.elements.gasViewAndChangePlan);
    isSolar = false;
  }

});
When(/^user clicks on compare and switch plan button$/, async function (t, []) {
  await testFunction.waitForLoadingIconToClose_MA();
  await testFunction.click(t, eaMyAccount.elements.btnCompareAndSwitchPlans);
});
When(/^user selects No for solar question and confirm$/, async function (t, []) {
  if(isSolar === true)  {
    await testFunction.click(t, eaMyAccount.elements.btnSolarNo);
    await testFunction.click(t, eaMyAccount.elements.btnQualifierConfirm);
  }else {
    console.log("Solar question not available for gas fuel.");
  }
});
When(/^user provides identification details$/, async function (t, [], dataTable) {
  let data=dataTable.hashes();
  let customerType=data[0].customerType;
  await testFunction.waitForLoadingIconToClose();
  if(customerType === CustomerType.RESIDENTIAL){
    await checkoutDetailsMethod.checkoutIdentification(t,data[0].customerStatus,data[0].idType);
  }
  if(customerType === CustomerType.BUSINESS){
    await checkoutDetailsMethod.provideBusinessDetails(t,data[0].businessType);
  }
});
