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

Then(/^user validates the '(.*)' '(.*)' event for NSW remote meter$/, async function (t,[pageComponent,event]) {
  await plansMethod.validateComponentLibraryEvent(t, pageComponent, event);
});

Then(/^user validates the '(.*)' '(.*)' link event$/, async function (t,[pageComponent,event]) {
  await t.closeWindow();
  await plansMethod.validateComponentLibraryEvent(t, pageComponent, event);
});

Then(/^user validates the analytics event for the '(.*)' state and '(.*)' person state on the data layer$/, async function (t,[movingType,personType]) {
  await checkoutDetailsMethod.validateAnalyticsForMovingStateAndPersonState(t,movingType,personType);
});

Then(/^user validates the data layer is updated for usage period as '(.*)'$/, async function (t, [usagePeriodValue]) {
  await plansMethod.validateAnalyticsUsagePeriod(t, usagePeriodValue);
});

Then(/^user validates the green energy percentage value of data layer is updated as '(.*)'$/, async function (t, [greenEnergyPercentage]) {
  await plansMethod.validateAnalyticsGreenEnergyPercentage(t, greenEnergyPercentage);
});

Then(/^user validates the data layer is updated for location type as '(.*)'$/, async function (t, [locationTypeValue]) {
  await plansMethod.validateAnalyticsLocationType(t, locationTypeValue);
});

Then(/^user validates the usage and usage value of data layer is updated$/, async function (t, [], dataTable) {
  const data = dataTable.hashes();
  const usage = data[0].usage;
  const usageValue  = data[0].usageValue;
  const fuelType = data[0].fuelType;
  await plansMethod.validateAnalyticsForUsagePerDay(t, usage,usageValue,fuelType);
});

Then(/^user validates the data layer is updated for selected plan as '(.*)'$/, async function (t, [fuelType]) {
  await plansMethod.validateAnalyticsSelectedPlan(t, fuelType);
  console.log("Selected plan analytics validated for "+fuelType);
});

Then(/^user validates the data layer is updated for available plan for '(.*)' plans page for '(.*)'$/, async function (t, [customertype,fueltype]) {
  await plansMethod.validateAnalyticsAvailablePlan(t, customertype,fueltype);
});

Then(/^user validates the data layer for '(.*)' plan selected by user for '(.*)'$/, async function (t, [plan,fueltype]) {
  await plansMethod.validateAnalyticsSelectedPlanDetails(t, plan,fueltype);
});

Then(/^user validates the page name for '(.*)' '(.*)' page$/, async function (t,[journey,page]) {
  await plansMethod.validatePageName(t, journey, page);
});

