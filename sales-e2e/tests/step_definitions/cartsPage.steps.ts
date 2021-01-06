import { cartsMethod } from '../methods/cartsPage';
import { When } from 'cucumber';
import {testFunction} from '../../global_methods/helper';
import {Then} from 'cucumber'
import {FileUtils} from '../../libs/FileUtils'
const cartsPage=require('../pages/carts.page');

When(/^user moves on to fill the qualifier$/, async function(t) {
    await testFunction.takeScreenshot(t, "cart_page");
    await cartsMethod.clickContinueCartsPage(t);
  });

Then(/^user validates plan details on cart page for "([^"]*)"$/, async function (t, [campaignName], dataTable) {
  let numOfExpectedFeatures = await testFunction.getExpectedFeatureCount(dataTable.rows());
  dataTable = dataTable.hashes();
  let json = await FileUtils.getJSONfile(campaignName);
  await cartsMethod.validatePlanName(t, json, dataTable);
  await cartsMethod.validateFeatures(t, dataTable, json, numOfExpectedFeatures);
  //await testFunction.takeScreenshot(t, 'validated plan details on carts page');//disabled UI Validation
});
When(/^user closes the cart page$/, async function (t) {
  await testFunction.click(t,cartsPage.elements.btnCartClose);
});
