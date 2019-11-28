import {CustomerStatus} from '../../global_methods/helper';
import {When, Then } from 'cucumber';
import {checkoutDetailsMethod} from '../methods/checkoutDetailsPage';
import {testFunction } from '../../global_methods/helper';
import {CustomerType} from '@ea/ea-commons-models';

When(/^user provides all details for existing customer on checkout details page$/, async function(t,[],dataTable){
  let data=dataTable.hashes();
  await testFunction.waitForLoadingIconToClose();
  await checkoutDetailsMethod.provideDetailsInAboutMeSection(t,data[0].customerType,data[0].firstName,data[0].lastName);
  await checkoutDetailsMethod.provideContactDetails(t);
  await checkoutDetailsMethod.checkoutExistingCustomerIdentification(t, data[0].identificationType);
  await checkoutDetailsMethod.accessRestriction(t,data[0].electricityAccess,data[0].gasAccess);
  await checkoutDetailsMethod.clickOnReviewYourOrderBtn(t);
});

When(/^user provides all details on checkout details page for Residential customer$/, async function (t,[],dataTable) {
  let data=dataTable.hashes();
  await testFunction.waitForLoadingIconToClose();
  await checkoutDetailsMethod.provideDetailsInAboutMeSection(t,data[0].journey,data[0].firstName,data[0].lastName);
  await checkoutDetailsMethod.provideContactDetails(t);
  await checkoutDetailsMethod.checkoutIdentification(t,data[0].customerStatus,data[0].idType)
});
When(/^user clicks on 'Review your order' button and navigates to review page$/, async function (t) {
  await checkoutDetailsMethod.clickOnReviewYourOrderBtn(t);
});
