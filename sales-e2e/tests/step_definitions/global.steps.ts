import { Given } from 'cucumber';
import {CustomerType, testFuncs} from '../../global_methods/helper';
const helper  = testFuncs();
const eaHomePage = require('../pages/energy-australia-home.page');


Given(/^user has navigated to '(.*)' plans page$/, async function(t, [customerType]) {
  if(customerType===CustomerType.RESIDENTIAL){
    await helper.click(t, eaHomePage.elements.residentialComparePlansButton);
  }else if (customerType==='Business'){
    await helper.click(t, eaHomePage.elements.businessLink);
    await helper.click(t, eaHomePage.elements.smallBusinessButton);
  }
});
