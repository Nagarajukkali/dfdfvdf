import {CustomerStatus} from '../../global_methods/helper';
import {When, Then } from 'cucumber';
import {checkoutDetailsMethod} from '../methods/checkoutDetailsPage';
import {testFunction } from '../../global_methods/helper';
import {AustralianState, CustomerType} from '@ea/ea-commons-models';

When(/^user provides all details for existing customer on checkout details page$/, async function(t,[],dataTable){
  let data=dataTable.hashes();
  await testFunction.waitForLoadingIconToClose();
  await checkoutDetailsMethod.provideDetailsInAboutMeSection(t,data[0].customerType,data[0].firstName,data[0].lastName);
  await checkoutDetailsMethod.provideContactDetails(t);
  await checkoutDetailsMethod.checkoutExistingCustomerIdentification(t, data[0].identificationType);
  await checkoutDetailsMethod.accessRestriction(t,data[0].electricityAccess,data[0].gasAccess);
  await checkoutDetailsMethod.clickOnReviewYourOrderBtn(t);
});

When(/^user provides all details on checkout details page$/, async function (t,[],dataTable) {
  let data=dataTable.hashes();
  let customerType=data[0].customerType;
  await testFunction.waitForLoadingIconToClose();
  await checkoutDetailsMethod.provideDetailsInAboutMeSection(t,data[0].journey,data[0].firstName,data[0].lastName);
  await checkoutDetailsMethod.provideContactDetails(t);
  if(customerType===CustomerType.RESIDENTIAL){
    await checkoutDetailsMethod.checkoutIdentification(t,data[0].customerStatus,data[0].idType);
  }
  if(customerType===CustomerType.BUSINESS){
    await checkoutDetailsMethod.provideBusinessDetails(t,data[0].businessType);
  }
});

When(/^user clicks on 'Review your order' button and navigates to review page$/, async function (t) {
  await checkoutDetailsMethod.clickOnReviewYourOrderBtn(t);
});
When(/^user selects answer for property renovation question for '(.*)'$/, async function (t,[state]) {
  await checkoutDetailsMethod.propertyRenovationNo(t,state);
});
When(/^user chooses "([^"]*)" for disconnection$/, async function (t,[disconnectionOption]) {
  await checkoutDetailsMethod.disconnectionDetails(t,disconnectionOption);
});

When(/^user opts for AAH and DD$/, async function (t,[],dataTable) {
  let data=dataTable.hashes();
  let optAAHOption=data[0].optAAHOption;
  let optDDOption=data[0].optDDOption;
  if(optAAHOption==='Yes'){
    await checkoutDetailsMethod.addAAHDetails(t);
  }
  if(optDDOption==='Yes'){
    await checkoutDetailsMethod.addDirectDebit(t,data[0].DDType);
  }
});
