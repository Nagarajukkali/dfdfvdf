import {qualifierMethod} from '../methods/qualifierPage';
import {testFunction, Moving} from '../../global_methods/helper';
import {When, Then } from 'cucumber';
import {CustomerType} from '@ea/ea-commons-models';
const eaQualifierPage=require('../pages/qualifier.page');

When(/^user selects '(.*)' and provides '(.*)' '(.*)' '(.*)' and '(.*)' and '(.*)' for '(.*)' customer$/, async function (t, [customerStatus,accNumber,accountDetail,accountIdentityType,idType,idValue,customerType]) {
  await qualifierMethod.selectCustomerStatus(t, customerStatus);
  await qualifierMethod.verifyAccount(t,accNumber,accountIdentityType,accountDetail);
  await qualifierMethod.verifyIdentity(t,idType,idValue);
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
  let customerType=data[0].customerType;
  let state=data[0].state;
  await testFunction.waitForLoadingIconToClose();
  await qualifierMethod.provideMovingType(t, movingType);
  if(movingType === Moving.MOVING){
    await qualifierMethod.provideAddress(t, data[0].connectionAddress);
    if(state==='QLD'){
      await testFunction.click(t,eaQualifierPage.elements.moveElecQLDQuestion);
    }
    await testFunction.takeScreenshot(t,"qualifier_page_calendar");
    await qualifierMethod.selectDateFromCalendar(t);
  } else if (movingType === Moving.NON_MOVING) {
    await testFunction.click(t, eaQualifierPage.elements.addressContinue);
  }
  if(customerType===CustomerType.RESIDENTIAL){
    await qualifierMethod.selectPropertyType(t, data[0].propertyType);
  }
  await qualifierMethod.selectSolarOption(t, data[0].solarOption);
});

When(/^user provides all other details on qualifier page$/, async function (t,[],dataTable) {
  let data=dataTable.hashes();
  let customerType=data[0].customerType;
  let movingType=data[0].movingType;
  await testFunction.waitForLoadingIconToClose();
  await qualifierMethod.provideMovingType(t, data[0].movingType);
  if(movingType === Moving.MOVING){
    await qualifierMethod.provideAddress(t, data[0].connectionAddress);
    if(data[0].connectionAddress.toLowerCase().includes("qld")) {
      await testFunction.click(t,eaQualifierPage.elements.isElecInNewAddressQLD_Yes);
    }
    await qualifierMethod.selectDateFromCalendar(t);
  }
  if(movingType===Moving.NON_MOVING){
    await qualifierMethod.provideAddress(t, data[0].connectionAddress);
  }
  if(customerType===CustomerType.RESIDENTIAL){
    await qualifierMethod.selectPropertyType(t, data[0].propertyType);
  }
  await qualifierMethod.selectSolarOption(t, data[0].solarOption);
});

When(/^user verifies account on qualifier$/, async function (t,[],dataTable) {
  let data=dataTable.hashes();
  await qualifierMethod.verifyAccount(t,data[0].accountNumber,data[0].accountIdentityType,data[0].postcodeOrABNACN);
  await qualifierMethod.verifyIdentity(t,data[0].idType,data[0].idValue);
});
When(/^user selects '(.*)' on qualifier$/, async function (t,[customerStatus]) {
  await testFunction.takeScreenshot(t,'qualifier_page');
  await qualifierMethod.selectCustomerStatus(t,customerStatus);
});
Then(/^Relevant error message is presented for customers marked with safety flag on qualifier$/, async function (t) {
  await qualifierMethod.validateErrorMessageForBlockerAccounts(t);
});
When(/^user navigates back to account verification section and clears all the previously provided details$/, async function (t) {
  await qualifierMethod.navigateBackToAccountVerification(t);
});
Then(/^user can able to proceed further through qualifier$/, async function (t) {
  await qualifierMethod.verifySuccessfulAccountVerification(t);
});
When(/^user navigates back to account verification section from moving question and clears all the previously provided details$/, async function (t) {
  await qualifierMethod.navigateBackFromMovingQuestion(t);
});
