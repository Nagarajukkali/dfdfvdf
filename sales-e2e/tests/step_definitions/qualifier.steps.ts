import {qualifierMethod} from '../methods/qualifierPage';
import {testFunction, Moving} from '../../global_methods/helper';
import {When, Then } from 'cucumber';
const eaQualifierPage=require('../pages/qualifier.page');

When(/^user selects '(.*)' and provides '(.*)' '(.*)' '(.*)' and '(.*)' and '(.*)' for '(.*)' customer$/, async function (t, [customer,accNumber,accountDetail,accountIdentityType,idType,idValue,customerType]) {
  await qualifierMethod.selectCustomerStatus(t, customer,accNumber,accountDetail,accountIdentityType,idType,idValue,customerType);
});

Then(/^user is displayed with message to redirect to the dedicated team for assistance on qualifier$/,async function(t,[],dataTable){
      let data=dataTable.hashes();
      await qualifierMethod.verifyFamilyViolenceMessage(t,data[0].message);
  });

When(/^user provides all details on qualifier page$/, async function(t,[],dataTable){
  let data=dataTable.hashes();
  await testFunction.waitForLoadingIconToClose();
  await qualifierMethod.provideMovingType(t, data[0].movingType)
  await qualifierMethod.provideAddress(t, data[0].connectionAddress);
  await qualifierMethod.selectDateFromCalendar(t);
  await qualifierMethod.selectPropertyType(t, data[0].propertyType);
  await qualifierMethod.selectSolarOption(t, data[0].solarOption);
});

When(/^user provides all other details on qualifier page for Existing customer$/, async function (t,[],dataTable) {
  let data = dataTable.hashes();
  let movingType = data[0].movingType;
  await qualifierMethod.provideMovingType(t, movingType);
  if(movingType === Moving.MOVING){
    await qualifierMethod.provideAddress(t, data[0].connectionAddress);
    await testFunction.click(t, eaQualifierPage.elements.addressContinue);
    await qualifierMethod.selectDateFromCalendar(t);
  } else if (movingType === Moving.NONMOVING) {
    await testFunction.click(t, eaQualifierPage.elements.addressContinue);
  }
  await qualifierMethod.selectPropertyType(t, data[0].propertyType);
  await qualifierMethod.selectSolarOption(t, data[0].solarOption);
});

