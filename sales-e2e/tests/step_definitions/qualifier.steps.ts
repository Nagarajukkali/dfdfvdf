import {qualifierMethod} from '../methods/qualifierPage';
import {BusinessType, Moving, Property, testFunction} from '../../global_methods/helper';
import {Then, When} from 'cucumber';
import {CustomerType} from '@ea/ea-commons-models';
import {plansMethod} from '../methods/plansPage';
import {Selector} from "testcafe";
const eaQualifierPage=require('../pages/qualifier.page');
const { config }=require('../../resources/resource');
const validateAnalyticsEvent=config.validateAnalytics;

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
  await testFunction.click(t, eaQualifierPage.elements.btnContinueOnQualifier);
});

When(/^user selects moving date in the qualifier for '(.*)' customer$/, async function(t,[movingType]){
  await qualifierMethod.selectDateFromCalendarAnalyticsEvent(t,movingType);
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
      await testFunction.click(t,eaQualifierPage.elements.qldenenergisedyes);
    }
    await testFunction.takeScreenshot(t, "qualifier_page_calendar");//disabled UI Validation
    await qualifierMethod.selectDateFromCalendar(t);
  }
  if(customerType===CustomerType.RESIDENTIAL){
    await qualifierMethod.selectPropertyType(t, data[0].propertyType)
  }
  await t.wait(3000);
  await testFunction.isElementDisplayed(t, eaQualifierPage.elements.btnContinueOnQualifier)
  await testFunction.click(t, eaQualifierPage.elements.btnContinueOnQualifier);
  if (await (eaQualifierPage.elements.movingOptionSelected).exists && await testFunction.getElementText(t,eaQualifierPage.elements.datePickerSelected)=== '') {
    await  qualifierMethod.selectDateFromCalendar(t);
  }
  await  testFunction.click(t, eaQualifierPage.elements.btnContinueOnQualifier);
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
  if (await (eaQualifierPage.elements.movingOptionSelected).exists && await testFunction.getElementText(t,eaQualifierPage.elements.datePickerSelected)=== '') {
    await  qualifierMethod.selectDateFromCalendar(t);
  }
  await  testFunction.click(t, eaQualifierPage.elements.btnContinueOnQualifier);
});

When(/^user verifies account on qualifier$/, async function (t,[],dataTable) {
  let data=dataTable.hashes();
  await qualifierMethod.verifyAccount(t,data[0].accountNumber,data[0].accountIdentityType,data[0].postcodeOrABNACN);
  await qualifierMethod.verifyIdentity(t,data[0].idType,data[0].idValue);
});
When(/^user verifies account in c1 on qualifier$/, async function (t,[],dataTable) {
  let data=dataTable.hashes();
  await qualifierMethod.verifyAccount(t,data[0].accountNumber,data[0].accountIdentityType,data[0].postcodeOrABNACN);
});
When(/^user verifies identity in c1 on qualifier$/, async function (t,[],dataTable) {
  let data=dataTable.hashes();
  await qualifierMethod.verifyIdentity(t,data[0].idType,data[0].idValue);
});
When(/^user verifies identity in c1 on qualifier for resi$/, async function (t,[],dataTable) {
  let data=dataTable.hashes();
  await qualifierMethod.verifyIdentitySales(t,data[0].idType,data[0].idValue);
});
When(/^user selects '(.*)' on qualifier$/, async function (t,[customerStatus]) {
  await testFunction.takeScreenshot(t, 'qualifier_page');//disabled UI Validation
  await qualifierMethod.selectCustomerStatus(t,customerStatus);
});
Then(/^Relevant error message is presented for customers marked with safety flag on qualifier$/, async function (t) {
  await qualifierMethod.validateErrorMessageForBlockerAccounts(t);
  await testFunction.takeScreenshot(t, 'qualifier_page');//disabled UI Validation
});
Then(/^relevant error message is presented for customers marked with NSW remote meter risk on qualifier$/, async function (t) {
  await qualifierMethod.validateErrorMessageForNSWRemoteMeterRiskAccounts(t);
  await testFunction.takeScreenshot(t, 'qualifier_page');//disabled UI Validation
});
Then(/^relevant error message is presented for customers marked with NSW remote meter risk on qualifier address component$/, async function (t) {
  await qualifierMethod.validateErrorMessageForNSWRemoteMeterRiskAccountsAddressComponent(t);
  await testFunction.takeScreenshot(t, 'qualifier_page');//disabled UI Validation
});
When(/^user navigates back to account verification section and clears all the previously provided details$/, async function (t) {
  await qualifierMethod.navigateBackToAccountVerification(t);
});
Then(/^user can able to proceed further through qualifier$/, async function (t) {
  await qualifierMethod.verifySuccessfulAccountVerification(t);
  await testFunction.takeScreenshot(t, 'qualifier_page');//disabled UI Validation
});
When(/^user navigates back to account verification section from moving question and clears all the previously provided details$/, async function (t) {
  await qualifierMethod.navigateBackFromMovingQuestion(t);
});
When(/^user selects '(.*)' for moving question on qualifier$/, async function (t,[movingType]) {
  await qualifierMethod.provideMovingType(t,movingType);
});
When(/^user enters the address '(.*)' on qualifier$/, async function (t,[address]) {
  await qualifierMethod.provideAddress(t,address);
});
When(/^user enters the address '(.*)' on qualifier for NSW$/, async function (t,[address]) {
  await qualifierMethod.provideAddressNswRemote(t,address);
});
Then(/^relevant popup displays for provided '(.*)'$/, async function (t,[addressType]) {
  await  qualifierMethod.verifyLookupOnQualifier(t,addressType);
  await testFunction.takeScreenshot(t, 'qualifier_page');//disabled UI Validation
});

Then(/^user validates qualifier for "([^"]*)" "([^"]*)" customers$/, async function (t, [customerStatus, customerType]) {
  await testFunction.compareImages(t, customerType + "_QUALIFIER_AreYouNewToEA");
  await qualifierMethod.selectCustomerStatus(t,customerStatus);
  if(await testFunction.isExistingCustomer(customerStatus)) {
    await testFunction.compareImages(t, customerType + "_QUALIFIER_VerifyAccount");
    if(await testFunction.isResidential(customerType)) {
      await qualifierMethod.verifyAccount(t, config.sampleResiAccount.eleAccount, "Postcode", config.sampleResiAccount.postcode);
    }else {
      await qualifierMethod.verifyAccount(t, config.sampleBsmeAccount.eleAccount, BusinessType.ABN, config.sampleBsmeAccount.abn);
    }
    await testFunction.compareImages(t, customerType + "_QUALIFIER_VerifyIdentity");
    if(await testFunction.isResidential(customerType)) {
      await qualifierMethod.verifyIdentity(t, config.sampleResiAccount.idType, config.sampleResiAccount.idValue);
    }else {
      await qualifierMethod.verifyIdentity(t, config.sampleBsmeAccount.idType, config.sampleBsmeAccount.idValue);
    }
    await testFunction.waitForLoadingIconToClose();
  }
  await testFunction.compareImages(t, customerType + "_QUALIFIER_AreYouMovingHouse");
  await qualifierMethod.provideMovingType(t, Moving.NON_MOVING);
  await testFunction.compareImages(t, customerType + "_QUALIFIER_Address");
  if(await testFunction.isResidential(customerType)) {
    await qualifierMethod.provideAddress(t, config.sampleResiAddress);
  }else {
    await qualifierMethod.provideAddress(t, config.sampleBsmeAddress);
  }
  await testFunction.compareImages(t, customerType + "_QUALIFIER_OwnerOrRenter");
  if(await testFunction.isResidential(customerType)) {
    await qualifierMethod.selectPropertyType(t, Property.OWNER);
  }
  await testFunction.compareImages(t, customerType + "_QUALIFIER_SolarQuestion");
});
When(/^user closes the qualifier$/, async function (t) {
  await testFunction.click(t,eaQualifierPage.elements.btnQualifierClose);
});
Then(/^New\/Existing customer qualifier question is displayed$/, async function (t) {
  await testFunction.isElementVisible(t,eaQualifierPage.elements.newCustomerBtn);
  await testFunction.isElementVisible(t,eaQualifierPage.elements.existingCustomerBtn);
});
Then(/^Address field is '(.*)'$/, async function (t,[addressField]) {
  await testFunction.isElementDisplayed(t, eaQualifierPage.elements.serviceAddress);
  await t.wait(5000);
  let serviceAddress=await eaQualifierPage.elements.serviceAddress.value;
  if(addressField==='auto_populated'){
    await t.expect(serviceAddress.length).notEql(0);
  }
  if(addressField==='blank'){
    await t.expect(serviceAddress.length).eql(0);
  }
});
Then(/^user clicks on continue button after providing address$/, async function (t) {
  await qualifierMethod.clickOnContinueAddress(t);
});
Then(/^the verify identity section continue button has the text as "([^"]*)"$/, async function (t, [buttontext]) {
  let buttonText = buttontext;
  await testFunction.assertText(t, eaQualifierPage.elements.verifyIdentityContinueWithGas, buttonText);
  console.log("Continue with gas button validated");
});

Then(/^the verify identity section continue button has the text as "([^"]*)" is not visible$/, async function (t, []) {
  let y = await testFunction.getElementAttribute(t, eaQualifierPage.elements.verifyIdentityContinueWithGas, "class");
  await testFunction.assertPartialTextValue(t, y, "ng-hide");
  console.log("Continue with Gas is not visible");
});

Then(/^the verify identity section continue button has the text as "([^"]*)" on address component$/, async function (t, [buttontext]) {
  let buttonText = buttontext;
  await testFunction.assertText(t, eaQualifierPage.elements.verifyIdentityContinueWithGasAddress, buttonText);
  console.log("Continue with gas button validated");
});

Then(/^the details not handy link and verify identity dropdown is not visible$/, async function (t, []) {
  let y = await testFunction.getElementAttribute(t, eaQualifierPage.elements.linkDetailsNotHandyID, "class");
  await testFunction.assertPartialTextValue(t, y, "ng-hide");
  console.log("Details not handy not visible on verify identity page on qualifer");
  let x = await testFunction.getElementAttribute(t, eaQualifierPage.elements.idSelectOptionNswRemote, "class");
  await testFunction.assertPartialTextValue(t, x, "sui-disabled");
  console.log("Dropdown validated that is not visible after user have clicked on continue button for NSW remote risk");
});

When(/^user clicks on back button$/, async function (t) {
  await testFunction.click(t, eaQualifierPage.elements.btnBackOnQualifier);
});

When(/^user selects property type as '(.*)'$/, async function (t, [propertyType]) {
  await qualifierMethod.selectPropertyType(t, propertyType);
});

When(/^user selects connection date in qualifier$/, async function (t, []) {
  await qualifierMethod.selectDateFromCalendar(t);
});

When(/^user refresh the qualifier$/, async function (t,[]) {
  await t.eval(() => location.reload());
});
