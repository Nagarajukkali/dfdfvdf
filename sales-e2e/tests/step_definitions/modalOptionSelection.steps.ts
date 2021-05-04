import {verifyAccountMethod} from '../methods/plansPage';
import {Then, When} from 'cucumber';

When(/^user provides '(.*)' account number '(.*)'$/, async function (t, [fuel, accountNumber]) {
  await verifyAccountMethod.provideAccountDetails(t, fuel, accountNumber);
});

When(/^user provides '(.*)' for '(.*)' customer$/, async function (t, [accountInformation, customerType]) {
  await verifyAccountMethod.provideAccountInformation(t, accountInformation, customerType);
});

When(/^user clicks on Next button after account number$/, async t => {
  await verifyAccountMethod.verifyAccountDetails(t);
});

When(/^User selects ID type '(.*)' and enters '(.*)'$/, async function (t, [idType, idValue]) {
  await verifyAccountMethod.provideIdentityDetails(t, idType, idValue);
});

Then(/^Usage data is displayed for '(.*)'$/, async function (t, [fuelType]) {
  await verifyAccountMethod.verifyUsageData(t, fuelType);
});

Then(/^user verifies if the verify account window is displayed as per the '(.*)' fueltype for '(.*)' customer$/, async function (t, [fuelType, customerType]) {
  await verifyAccountMethod.verifyAccountIsDisplayed(t, fuelType, customerType);
});

When(/^user click show estimates on modal window$/, async t => {
  await verifyAccountMethod.showCostEstimates(t);
});

Then(/^user is displayed with message to redirect to the dedicated team for assistance$/, async function (t, [message], dataTable) {
  let data = dataTable.hashes();
  await verifyAccountMethod.verifyFamilyViolenceMessage(t, data[0].message);
});
