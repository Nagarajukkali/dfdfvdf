import {When} from "cucumber";
import {testFunction} from '../../global_methods/helper';
const eaMyAccount = require('../pages/myAccount.page');
import {Crypto} from '../methods/Crypto';

When(/^user logs in to my account using '(.*)' and '(.*)'$/, async function(t, [username, password]) {
  await testFunction.clearAndEnterText(t, eaMyAccount.elements.tfUsername, username);
  await testFunction.clearAndEnterText(t, eaMyAccount.elements.tfPassword, Crypto.decrypt(password));
  await testFunction.click(t, eaMyAccount.elements.btnSignIn);
});
When(/^user clicks on view and change plan accordion$/, async function (t, []) {
  await testFunction.click(t, eaMyAccount.elements.eleViewAndChangePlan);
});
When(/^user clicks on compare and switch plan button$/, async function (t, []) {
  await testFunction.click(t, eaMyAccount.elements.btnCompareAndSwitchPlans);
});
When(/^user selects No for solar question and confirm$/, async function (t, []) {
  await testFunction.click(t, eaMyAccount.elements.btnSolarNo);
  await testFunction.click(t, eaMyAccount.elements.btnQualifierConfirm);
});
