import { cartsMethod } from '../methods/cartsPage';
import { When } from 'cucumber';
import {Then} from 'cucumber'
import {testFunction} from '../../global_methods/helper';
import {FileUtils} from '../../libs/FileUtils'

When(/^user moves on to fill the qualifier$/, async function(t) {
    await cartsMethod.clickContinueCartsPage(t);
  });

Then(/^user validates plan details on cart page for "([^"]*)"$/, async function (t, [campaignName], dataTable) {
  let numOfExpectedFeatures = await testFunction.getExpectedFeatureCount(dataTable.rows());
  dataTable = dataTable.hashes();
  let json = await FileUtils.getJSONfile(campaignName);
  await cartsMethod.validatePlanName(t, json, dataTable);
  await cartsMethod.validateFeatures(t, dataTable, json, numOfExpectedFeatures);
});
