import { Given } from 'cucumber';
const eaHomePage = require('../pages/energy-australia-home.page');
import {CustomerType, testFuncs} from '../../global_methods/helper';
const helper  = testFuncs();

Given(/^user have opened the website link in a browser$/, async t => {
  await t.navigateTo(eaHomePage.pageUrl);
});

Given(/^user has navigated to '(.*)' plans page$/, async function(t, [customerType]) {
  if(customerType===CustomerType.RESIDENTIAL){
    await helper.click(t, eaHomePage.elements.residentialComparePlansButton);
  }else if (customerType==='Business'){
    await helper.click(t, eaHomePage.elements.businessLink);
    await helper.click(t, eaHomePage.elements.smallBusinessButton);
  }
});
