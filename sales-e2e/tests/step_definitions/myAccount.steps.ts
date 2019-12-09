import {When} from "cucumber";
import {testFunction} from '../../global_methods/helper';
const eaMyAccount = require('../pages/myAccount.page');
import {Crypto} from '../methods/Crypto';
import {CustomerType} from '@ea/ea-commons-models';
import {checkoutDetailsMethod} from '../methods/checkoutDetailsPage';

When(/^user logs in to my account using '(.*)' and '(.*)'$/, async function(t, [username, password]) {
  await testFunction.clearAndEnterText(t, eaMyAccount.elements.tfUsername, username);
  await testFunction.clearAndEnterText(t, eaMyAccount.elements.tfPassword, Crypto.decrypt(password));
  await testFunction.click(t, eaMyAccount.elements.btnSignIn);
});
When(/^user clicks on view and change plan accordion$/, async function (t, []) {
  await testFunction.waitForLoadingIconToClose_MA();
  await testFunction.click(t, eaMyAccount.elements.eleViewAndChangePlan);
});
When(/^user clicks on compare and switch plan button$/, async function (t, []) {
  await testFunction.waitForLoadingIconToClose_MA();
  await testFunction.click(t, eaMyAccount.elements.btnCompareAndSwitchPlans);
});
When(/^user selects No for solar question and confirm$/, async function (t, []) {
  await testFunction.click(t, eaMyAccount.elements.btnSolarNo);
  await testFunction.click(t, eaMyAccount.elements.btnQualifierConfirm);
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
