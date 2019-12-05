import {When} from "cucumber";
import {testFunction} from '../../global_methods/helper';
const eaMyAccount = require('../pages/myAccount.page');
import {Crypto} from '../methods/Crypto';

When(/^User logs in to my account using '(.*)' and '(.*)'$/, async function(t, [username, password]) {
  await testFunction.clearAndEnterText(t, eaMyAccount.elements.tfUsername, username);
  await testFunction.clearAndEnterText(t, eaMyAccount.elements.tfPassword, Crypto.decrypt(password));
  await testFunction.click(t, eaMyAccount.elements.btnSignIn);
});
