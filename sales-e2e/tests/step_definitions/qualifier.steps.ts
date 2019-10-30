import {qualifierPageFunction} from '../methods/qualifierPage';
import {When, Then } from 'cucumber';

When(/^user selects '(.*)' and provides '(.*)' '(.*)' and '(.*)' and '(.*)'$/, async function(t, [customer,accNumber,accountDetail,idType,idValue]) {
      await qualifierPageFunction().selectCustomerStatus(t,customer,accNumber,accountDetail,idType,idValue);
});

Then(/^user is displayed with '(.*)' to redirect to the dedicated team for assistance on qualifier$/,async function(t,[message]){
      await qualifierPageFunction().verifyFamilyViolenceMessage(t,message);
  })
