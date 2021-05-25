import {Given, Then} from 'cucumber';
import {spyOff, spyOn} from '../../global_methods/analyticsFunction';
import {plansMethod} from '../methods/plansPage';
import {checkoutDetailsMethod} from '../methods/checkoutDetailsPage';

Given(/^user initiates the call to capture analytics events$/, async function (t) {
  await spyOn();
});
Then(/^user validates the data layer is updated for solar as '(.*)'$/, async function (t, [actualSolarIndicatorValue]) {
  //const data = await getSpyData();
  await plansMethod.validateAnalyticsSolarData(t, actualSolarIndicatorValue);
});
Then(/^user closes the spy on datalayer$/, async function (t) {
  await spyOff;
});

Then(/^user validates the state and postcode of data layer is updated for the provided address$/, async function (t, [], dataTable) {
  const data = dataTable.hashes();
  const state = data[0].state;
  const postcode = data[0].postcode;
  await plansMethod.validateAnalyticsForStateAndPostcodeUpdate(t, state, postcode);
});

Then(/^user validates the '(.*)' '(.*)' event$/, async function (t,[pageComponent,event]) {
  await plansMethod.validateComponentLibraryEvent(t, pageComponent, event);
});

Then(/^user validates the '(.*)' '(.*)' link event$/, async function (t,[pageComponent,event]) {
  await t.closeWindow();
  await plansMethod.validateComponentLibraryEvent(t, pageComponent, event);
});

Then(/^user validates the analytics event for the '(.*)' state and '(.*)' person state on the data layer$/, async function (t,[movingType,personType]) {
  await checkoutDetailsMethod.validateAnalyticsForMovingStateAndPersonState(t,movingType,personType);
});

