import {qualifierPageFunction} from '../methods/qualifierPage';
import {CustomerStatus, testFuncs} from '../../global_methods/helper';
const helper  = testFuncs();
import {When, Then } from 'cucumber';

When(/^user selects '(.*)' and provides '(.*)' '(.*)' '(.*)' and '(.*)' and '(.*)' for '(.*)' customer$/, async function (t, [customerStatus,accNumber,accountDetail,accountIdentityType,idType,idValue,customerType]) {
  await qualifierPageFunction().selectCustomerStatus(t, customerStatus);
  await qualifierPageFunction().verifyAccount(t,accNumber,accountIdentityType,accountDetail);
  await qualifierPageFunction().verifyIdentity(t,idType,idValue);
});

Then(/^user is displayed with message to redirect to the dedicated team for assistance on qualifier$/,async function(t,[],dataTable){
      let data = dataTable.hashes();
      await qualifierPageFunction().verifyFamilyViolenceMessage(t,data[0].message);
  });

When(/^user provides all details on qualifier page$/, async function(t,[],dataTable){
  let data = dataTable.hashes();
  await helper.waitForLoadingIconToClose();
  await qualifierPageFunction().provideMovingType(t, data[0].movingType)
  await qualifierPageFunction().provideAddress(t, data[0].connectionAddress);
  await qualifierPageFunction().selectDateFromCalendar(t);
  await qualifierPageFunction().selectPropertyType(t, data[0].propertyType);
  await qualifierPageFunction().selectSolarOption(t, data[0].solarOption);
});

When(/^user provides all details on qualifier page for '(.*)' customer$/, async function (t,customerStatus,[],dataTable) {
  let data=dataTable.hashes();
  await helper.waitForLoadingIconToClose();
  if(customerStatus===CustomerStatus.NEW){
    await qualifierPageFunction().selectCustomerStatus(t,customerStatus);
    await qualifierPageFunction().provideMovingType(t, data[0].movingType);
    await qualifierPageFunction().provideAddress(t, data[0].connectionAddress);
    await qualifierPageFunction().selectDateFromCalendar(t);
    await qualifierPageFunction().selectPropertyType(t, data[0].propertyType);
    await qualifierPageFunction().selectSolarOption(t, data[0].solarOption);
  }
  else if(customerStatus===CustomerStatus.EXISTING){
    await qualifierPageFunction().selectCustomerStatus(t,customerStatus);
    await qualifierPageFunction().verifyAccount(t,data[0].accountNumber,data[0].accountIdentityType,data[0].postcodeOrABNACN);
    await qualifierPageFunction().provideMovingType(t, data[0].movingType);
    await qualifierPageFunction().provideAddress(t, data[0].connectionAddress);
    await qualifierPageFunction().selectDateFromCalendar(t);
    await qualifierPageFunction().selectPropertyType(t, data[0].propertyType);
    await qualifierPageFunction().selectSolarOption(t, data[0].solarOption);
  }

});
