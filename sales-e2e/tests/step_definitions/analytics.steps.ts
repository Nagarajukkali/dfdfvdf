import {Given} from 'cucumber'
import {getSpyData, spyOff, spyOn} from '../../global_methods/analyticsFunction';
import {Then} from 'cucumber'
import {plansMethod} from '../methods/plansPage';

Given(/^user initiates the call to capture analytics events$/, async function(t) {
 await spyOn();


});
Then(/^user validates the data layer is updated for solar$/, async function(t) {
  await plansMethod.validateAnalyticsSolarData(t,"yes");
});
Then(/^user closes the spy on datalayer$/, async function(t) {
  await spyOff;
});

Then(/^user validates the state and postcode of data layer is updated for the provided address$/, async function (t,[], dataTable) {
  const data=dataTable.hashes();
  const state=data[0].state;
  const postcode=data[0].postcode;
  await plansMethod.validateAnalyticsForStateAndPostcodeUpdate(t,state,postcode);
});
