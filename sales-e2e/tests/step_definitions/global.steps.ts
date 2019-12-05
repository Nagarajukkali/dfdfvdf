import { Given } from 'cucumber';
import {testFunction} from '../../global_methods/helper';
import {CustomerType} from '@ea/ea-commons-models';
const eaHomePage=require('../pages/energy-australia-home.page');
const eaMyAccount = require('../pages/myAccount.page');


Given(/^user has navigated to '(.*)' plans page$/, async function(t, [customerType]) {
  if(customerType===CustomerType.RESIDENTIAL){
    await testFunction.click(t, eaHomePage.elements.residentialComparePlansButton);
  }else if (customerType===CustomerType.BUSINESS){
    await testFunction.click(t, eaHomePage.elements.businessLink);
    await testFunction.click(t, eaHomePage.elements.smallBusinessButton);
  }
});

Given(/^user navigates to my account login page$/, async function (t, []) {
  await t.navigateTo(eaMyAccount.pageUrl);
});
