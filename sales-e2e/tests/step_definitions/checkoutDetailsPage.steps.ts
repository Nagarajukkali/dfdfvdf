import {checkoutDetailsPageFunction} from '../methods/checkoutDetailsPage';
import {testFuncs } from '../../global_methods/helper';
const helper  = testFuncs();
import {When, Then } from 'cucumber';

When(/^user provides all details for existing customer on checkout details page$/, async function(t,[],dataTable){
  let data = dataTable.hashes();
  await helper.waitForLoadingIconToClose();
  await checkoutDetailsPageFunction().provideDetailsInAboutMeSection(t,data[0].customerType,data[0].firstName,data[0].lastName);
  await checkoutDetailsPageFunction().provideContactDetails(t);
  await checkoutDetailsPageFunction().checkoutExistingCustomerIdentification(t, data[0].identificationType);
  await checkoutDetailsPageFunction().accessRestriction(t,data[0].electricityAccess,data[0].gasAccess);
  await checkoutDetailsPageFunction().clickOnReviewYourOrderBtn(t);
});
