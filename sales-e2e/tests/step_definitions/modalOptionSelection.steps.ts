import {verifyAccount} from '../methods/plansPage';
import { When, Then } from 'cucumber';

When(/^user provides '(.*)' account number '(.*)'$/, async function(t, [fuel, accountNumber]){
    await verifyAccount().provideAccountDetails(t,fuel, accountNumber);
});

When(/^user provides '(.*)' for '(.*)' customer$/, async function(t, [accountInformation, customerType]){
    await verifyAccount().provideAccountInformation(t,accountInformation, customerType);
});

When(/^user clicks on Next button after account number$/, async t => {
    await verifyAccount().verifyAccountDetails(t)
});

When(/^User selects ID type '(.*)' and enters '(.*)'$/, async function(t, [idType, idValue]){
    await verifyAccount().provideIdentityDetails(t,idType,idValue);
});

Then(/^Usage data is displayed for '(.*)'$/, async function(t,[fuelType]){
    await verifyAccount().verifyUsageData(t, fuelType);
});

Then(/^user verifies if the verify account window is displayed as per the '(.*)' fueltype for '(.*)' customer$/, async function(t,[fuelType,customerType]){
  await verifyAccount().verifyAccountIsDisplayed(t, fuelType,customerType);
});

When(/^user click show estimates on modal window$/, async t =>{
    await verifyAccount().showCostEstimates(t);
});

Then(/^user is displayed with '(.*)' to redirect to the dedicated team for assistance$/,async function(t,[message]){
    await verifyAccount().verifyFamilyViolenceMessage(t,message);
})
