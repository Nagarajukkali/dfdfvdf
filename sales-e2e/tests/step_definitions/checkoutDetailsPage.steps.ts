import {When} from 'cucumber';
import {checkoutDetailsMethod} from '../methods/checkoutDetailsPage';
import {testFunction } from '../../global_methods/helper';
import { CustomerType} from '@ea/ea-commons-models';

When(/^user provides all details for existing customer on checkout details page$/, async function(t,[],dataTable){
  let data=dataTable.hashes();
  await testFunction.waitForLoadingIconToClose();
  await checkoutDetailsMethod.provideDetailsInAboutMeSection(t,data[0].customerType,data[0].firstName,data[0].lastName);
  let emailAddress=await checkoutDetailsMethod.provideContactDetails(t);
  await checkoutDetailsMethod.getEmailWithScenario(t,emailAddress);
  await checkoutDetailsMethod.checkoutExistingCustomerIdentification(t, data[0].identificationType);
  await checkoutDetailsMethod.accessRestriction(t,data[0].electricityAccess,data[0].gasAccess);
  await checkoutDetailsMethod.clickOnReviewYourOrderBtn(t);
});

When(/^user provides all details on checkout details page$/, async function (t,[],dataTable) {
  let data=dataTable.hashes();
  let customerType=data[0].customerType;
  await testFunction.waitForLoadingIconToClose();
  await checkoutDetailsMethod.provideDetailsInAboutMeSection(t,data[0].journey,data[0].firstName,data[0].lastName);
  let emailAddress=await checkoutDetailsMethod.provideContactDetails(t);
  await checkoutDetailsMethod.getEmailWithScenario(t,emailAddress);
  if(customerType===CustomerType.RESIDENTIAL){
    if(data[0].idType === "Medicare") {
      await checkoutDetailsMethod.checkoutIdentification(t,data[0].customerStatus,data[0].idType, data[0].medicareType);
    } else {
      await checkoutDetailsMethod.checkoutIdentification(t,data[0].customerStatus,data[0].idType, "");
    }
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
    await checkoutDetailsMethod.addDirectDebit(t,data[0].directDebitType);
  }
});
When(/^user selects plans on checkout details page$/, async function (t,[],dataTable) {
  let data=dataTable.hashes();
  await checkoutDetailsMethod.selectPlan(t,data[0].elePlan,data[0].gasPlan);
});
When(/^user provides dob and id details$/, async function (t,[],dataTable) {
  let data=dataTable.hashes();
  await checkoutDetailsMethod.enterDOB(t);
  await checkoutDetailsMethod.checkoutIdentification(t,data[0].customerStatus,data[0].idType, "")
});
When(/^user provides business details$/, async function (t,[],dataTable) {
  await checkoutDetailsMethod.provideBusinessDetails(t,'ABN')
});
When(/^user selects carbon neutral option$/, async function (t) {
  await checkoutDetailsMethod.selectCarbonNeutralOption(t);
});
When(/^user selects billing preference option$/, async function (t, [], dataTable) {
  /*
  Example:
  And user selects billing preference option
    |option         |otherAddress                                 |
    |Other address  |271 Heatherhill Road, FRANKSTON  VIC  3199   |
   */
  let data = dataTable.hashes();
  await checkoutDetailsMethod.selectBillingPreference(t, data[0].option, data[0].otherAddress);
});
When(/^user selects final bill option$/, async function (t, [], dataTable) {
  /*
  Example:
  And user selects final bill option
    |option         |otherAddress                                 |
    |Other address  |271 Heatherhill Road, FRANKSTON  VIC  3199   |
   */
  let data = dataTable.hashes();
  await checkoutDetailsMethod.selectBillingPreference(t, data[0].option, data[0].otherAddress, true);
});
