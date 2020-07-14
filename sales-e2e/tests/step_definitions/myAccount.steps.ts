import {When} from "cucumber";
import {testFunction} from '../../global_methods/helper';
const eaMyAccount = require('../pages/myAccount.page');
const eaCheckoutDetailsPage = require('../pages/checkOutDetails.page');
import {CustomerType, FUEL_TYPE_OPTIONS} from '@ea/ea-commons-models';
import {checkoutDetailsMethod} from '../methods/checkoutDetailsPage';
const cryptoJS = require('crypto-js');
let isSolar: boolean = true;

When(/^user logs in to my account using '(.*)' and '(.*)'$/, async function(t, [username, password]) {
  await testFunction.clearAndEnterText(t, eaMyAccount.elements.tfUsername, username);
  console.log(cryptoJS.AES.encrypt("TestPass1", username).toString());
  await testFunction.clearAndEnterText(t, eaMyAccount.elements.tfPassword, cryptoJS.AES.decrypt(password, username).toString(cryptoJS.enc.Utf8));
  await testFunction.click(t, eaMyAccount.elements.btnSignIn);
  await testFunction.waitForElementToBeAppeared(t,eaMyAccount.elements.eaSpinner);
  await testFunction.waitForElementToBeDisappeared(t,eaMyAccount.elements.eaSpinner);
  await testFunction.takeScreenshot(t,"my_account_dashboard");
  console.log("User lands on my account dashboard.");
});

When(/^user clicks on view and change plan accordion for '(.*)'$/, async function (t, [fuelType]) {
  if(fuelType === FUEL_TYPE_OPTIONS.ELE.value) {
    await testFunction.click(t, eaMyAccount.elements.eleViewAndChangePlan);
    isSolar = true;
  } else if(fuelType === FUEL_TYPE_OPTIONS.GAS.value) {
    await testFunction.click(t, eaMyAccount.elements.gasViewAndChangePlan);
    isSolar = false;
  }
  await testFunction.waitForElementToBeDisappeared(t,eaMyAccount.elements.eaSpinner);
  await testFunction.takeScreenshot(t,"my_account_view_and_change_plan");
  console.log("User lands on 'View or change plan' page.");
});
When(/^user clicks on compare and switch plan button$/, async function (t, []) {
  //await testFunction.waitForLoadingIconToClose_MA(t);
  await testFunction.click(t, eaMyAccount.elements.btnCompareAndSwitchPlans);
  console.log("User clicks on 'Compare and switch plan' button.")
});
When(/^user selects No for solar question and confirm$/, async function (t, []) {
  if(await testFunction.sizeOfElement(t, eaMyAccount.elements.btnSolarNo) !== 0)  {
    await testFunction.click(t, eaMyAccount.elements.btnSolarNo);
    await testFunction.click(t, eaMyAccount.elements.btnQualifierConfirm);
    console.log("User answers solar question.");
  }else {
    console.log("Solar question not available for gas fuel.");
  }
});
When(/^user provides identification details$/, async function (t, [], dataTable) {
  let data=dataTable.hashes();
  let customerType=data[0].customerType;
  await testFunction.waitForLoadingIconToClose();
  if(customerType === CustomerType.RESIDENTIAL){
    await checkoutDetailsMethod.checkoutIdentification(t,data[0].customerStatus,data[0].idType, "");
  }
  if(customerType === CustomerType.BUSINESS){
    await checkoutDetailsMethod.provideBusinessDetails(t,data[0].businessType);
  }
});
When(/^user clicks on move home link for '(.*)'$/, async function (t, [fuelType]) {
  await testFunction.waitForLoadingIconToClose_MA(t);
  if(fuelType === FUEL_TYPE_OPTIONS.ELE.value) {
    await testFunction.click(t, eaMyAccount.elements.eleMoveHome);
  } else if(fuelType === FUEL_TYPE_OPTIONS.GAS.value) {
    await testFunction.click(t, eaMyAccount.elements.gasMoveHome);
  }
  await testFunction.isElementDisplayed(t,eaMyAccount.elements.moveHeader);
  await t.wait(10000);
  await testFunction.takeScreenshot(t,"my_account_move_home");
});
When(/^user enters service address as '(.*)'$/, async function (t, [address]) {
  await testFunction.clearAndEnterText(t, eaMyAccount.elements.serviceAddress, address);
  await testFunction.isElementVisible(t, eaMyAccount.elements.serviceAddressList);
  await testFunction.clickElementFromList(t, eaMyAccount.elements.serviceAddressList, address);
  console.log(`${address} is provided`);
});
When(/^user selects connection date$/, async function (t, []) {
  let className=await testFunction.getElementAttribute(t,eaMyAccount.elements.chkBoxGas,'class');
  if(className.includes('unchecked'))
    await testFunction.click(t,eaMyAccount.elements.chkBoxGas);
  await testFunction.click(t, eaMyAccount.elements.moveHouseCalendarAvailableDates);
});
When(/^user selects No for solar question on moving service page$/, async function (t, []) {
  await testFunction.click(t, eaMyAccount.elements.btnSolarNo_MA);
});
When(/^user clicks on lets get moving button$/, async function (t, []) {
  await testFunction.takeScreenshot(t,"my_account_move_home_Page");
  await testFunction.click(t, eaMyAccount.elements.btnLetsGetMoving);
});
When(/^user answers No for home improvements question$/, async function (t, []) {
  await testFunction.click(t, eaMyAccount.elements.rbHomeImprovement_No);
});
When(/^user clicks on compare plans button$/, async function (t) {
  await testFunction.click(t,eaMyAccount.elements.btnUpSellComparePlan);

});
When(/^user validates details on checkout details page$/, async function (t,[],dataTable) {
  /*
  |sourceSystem |journey  |fuelType |
   */
  let params = dataTable.hashes();
  await checkoutDetailsMethod.validateHeader(t, params[0].sourceSystem, params[0].journey);
  await checkoutDetailsMethod.validateProgressbarAndSubheading(t, params[0].sourceSystem, params[0].journey, params[0].fuelType);
  await checkoutDetailsMethod.validateContactPrefSection(t);
  await checkoutDetailsMethod.validateRefineBar(t, params[0].fuelType, params[0].sourceSystem);
  await checkoutDetailsMethod.validateDisclaimer(t, params[0].sourceSystem, eaCheckoutDetailsPage.elements.txtFeesDisclaimer, "Please note for all payment options, excluding direct debit or Centrepay, a merchant service fee may apply to credit card payments - 0.36% for paying bills by Visa or Mastercard® and 1.5% for paying bills by American Express®. The best way to avoid these fees is to set up direct debit via My Account.");
  await checkoutDetailsMethod.validateNavigationButtons(t, params[0].sourceSystem, params[0].journey);
  console.log("Checkout Details page validated successfully.");
});
