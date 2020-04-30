import { cartsMethod } from '../methods/cartsPage';
import { When } from 'cucumber';
import {Then} from 'cucumber'
import {plansMethod} from '../methods/plansPage';
const fileUtils=require('../../libs/FileUtils.js');


When(/^user moves on to fill the qualifier$/, async function(t) {
    await cartsMethod.clickContinueCartsPage(t);
  });

Then(/^user validates plan details on cart page for "([^"]*)"$/, async function (t, [campaignName], dataTable) {
  dataTable = dataTable.hashes();
  let json = await fileUtils.getJSONfile(campaignName);
  await cartsMethod.validatePlanName(t, json, dataTable);


  //await plansMethod.validatePlanHeading(t, json);
  //await plansMethod.validateFeatures(t, dataTable, json);
});
