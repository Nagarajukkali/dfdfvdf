import { Given } from 'cucumber';
const eaHomePage = require('../pages/energy-australia-home.page');
import {testFuncs } from '../../global_methods/helper';
const helper  = testFuncs();

Given(/^user have opened the website link in a browser$/, async t => {
  await t.navigateTo(eaHomePage.pageUrl);
});

Given(/^user has navigated to '(.*)' plans page$/, async function(t, [customerType]) {
  if(customerType==='Residential'){
    await helper.click(t, eaHomePage.elements.residentialComparePlansButton);
  }
});
