import {checkoutDetailsMethod} from '../methods/checkoutDetailsPage';
import {testFunction } from '../../global_methods/helper';
import {When } from 'cucumber';

When(/^user provides all details for existing customer on checkout details page$/, async function(t,[],dataTable){
  let data=dataTable.hashes();
  await testFunction.waitForLoadingIconToClose();
  await checkoutDetailsMethod.provideDetailsInAboutMeSection(t,data[0].customerType,data[0].firstName,data[0].lastName);
  await checkoutDetailsMethod.provideContactDetails(t);
  await checkoutDetailsMethod.checkoutExistingCustomerIdentification(t, data[0].identificationType);
  await checkoutDetailsMethod.accessRestriction(t,data[0].electricityAccess,data[0].gasAccess);
  await checkoutDetailsMethod.clickOnReviewYourOrderBtn(t);
});
