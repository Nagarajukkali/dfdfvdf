import {qualifierPageFunction} from '../methods/qualifierPage';
import {testFuncs } from '../../global_methods/helper';
const helper  = testFuncs();
import {When, Then } from 'cucumber';

When(/^user selects '(.*)' and provides '(.*)' '(.*)' '(.*)' and '(.*)' and '(.*)' for '(.*)' customer$/, async function (t, [customer,accNumber,accountDetail,accountIdentityType,idType,idValue,customerType]) {
  await qualifierPageFunction().selectCustomerStatus(t, customer,accNumber,accountDetail,accountIdentityType,idType,idValue,customerType);
});

Then(/^user is displayed with message to redirect to the dedicated team for assistance on qualifier$/,async function(t,[],dataTable){
      let data = dataTable.hashes();
      await qualifierPageFunction().verifyFamilyViolenceMessage(t,data[0].message);
  });

When(/^user provides all details on qualifier page$/, async function(t,[],dataTable){
  let data = dataTable.hashes();
  await helper.waitForLoadingIconToClose();
  await qualifierPageFunction().provideMovingType(t, data[0].movingType);
  await qualifierPageFunction().provideAddress(t, data[0].connectionAddress);
  await qualifierPageFunction().selectDateFromCalendar(t);
  await qualifierPageFunction().selectPropertyType(t, data[0].propertyType);
  await qualifierPageFunction().selectSolarOption(t, data[0].solarOption);
});

