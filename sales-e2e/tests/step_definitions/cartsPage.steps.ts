import { cartsMethod } from '../methods/cartsPage';
import { When } from 'cucumber';
import {Then} from 'cucumber'
import {plansMethod} from '../methods/plansPage';
import {testFunction} from '../../global_methods/helper';
const fileUtils=require('../../libs/FileUtils.js');


When(/^user moves on to fill the qualifier$/, async function(t) {
    await cartsMethod.clickContinueCartsPage(t);
  });

Then(/^user validates plan details on cart page for "([^"]*)"$/, async function (t, [campaignName], dataTable) {
  let numOfExpectedFeatures = await testFunction.getExpectedFeatureCount(dataTable.rows());
  dataTable = dataTable.hashes();
  let json = await fileUtils.getJSONfile(campaignName);
  await cartsMethod.validatePlanName(t, json, dataTable);
  await cartsMethod.validateFeatures(t, dataTable, json, numOfExpectedFeatures);
});
