const { Given, When, Then } = require('cucumber');
const EaHomePage = require('../pages/energy-australia-home.page');
const { ClientFunction,t } = require('testcafe');
//const {testFuncs} = require('../../global_methods/helper');
import {testFuncs } from '../../global_methods/helper';
const helper  = testFuncs();
const replace = { replace: true };

Given('user have opened the website link in a browser', async t => {
  await t.navigateTo(EaHomePage.pageUrl);
});

Given(/^user has navigated to '(.*)' plans page$/, async function(t, [customerType]) {
  if(customerType==='Residential'){
    await helper.click(t, EaHomePage.elements.residentialComparePlansButton);
  }
});
