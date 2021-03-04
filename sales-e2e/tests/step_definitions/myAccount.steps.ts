import {When} from "cucumber";
import {testFunction} from '../../global_methods/helper';
const eaMyAccount = require('../pages/myAccount.page');
const eaCheckoutDetailsPage = require('../pages/checkOutDetails.page');
import {CustomerType, FUEL_TYPE_OPTIONS} from '@ea/ea-commons-models';
import {myAccountMethod} from '../methods/myAccountPage';
import {checkoutDetailsMethod} from '../methods/checkoutDetailsPage';

When(/^user logs in to my account using '(.*)' and '(.*)'$/, async function(t, [username, password]) {
  await myAccountMethod.loginToMyAccount(t,username,password);
});

When(/^user clicks on view and change plan accordion for '(.*)'$/, async function (t, [fuelType]) {
 await myAccountMethod.navigateToViewAndChangePlan(t,fuelType);
});
When(/^user clicks on compare and switch plan button$/, async function (t) {
  if(t.testRun.test.name.includes('current plan'))
    await myAccountMethod.getPlanDetailsFromViewPlan(t);
  console.log(myAccountMethod.map);
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
  await myAccountMethod.navigateToMoveHome(t,fuelType);
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
  await testFunction.takeScreenshot(t, "my_account_move_home_Page");//disabled UI Validation
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
  await checkoutDetailsMethod.validateMAHeader(t, params[0].sourceSystem);
  await checkoutDetailsMethod.validateHeader(t, params[0].sourceSystem, params[0].journey);
  await checkoutDetailsMethod.validateProgressbarAndSubheading(t, params[0].sourceSystem, params[0].journey, params[0].fuelType);
  await checkoutDetailsMethod.validateCurrentPlanDetails(t);
  await checkoutDetailsMethod.validateContactPrefSection(t);
  await checkoutDetailsMethod.validateRefineBar(t, params[0].fuelType, params[0].sourceSystem);
  await checkoutDetailsMethod.validateDisclaimer(t, params[0].sourceSystem, eaCheckoutDetailsPage.elements.txtFeesDisclaimer, "Please note for all payment options, excluding direct debit or Centrepay, a merchant service fee may apply to credit card payments - 0.36% for paying bills by Visa or Mastercard® and 1.5% for paying bills by American Express®. The best way to avoid these fees is to set up direct debit via My Account.");
  await checkoutDetailsMethod.validateNavigationButtons(t, params[0].sourceSystem, params[0].journey);
  await checkoutDetailsMethod.validatePresenceOfEmailQuoteAndCancelButton(t,params[0].sourceSystem,params[0].journey);
  console.log("Checkout Details page validated successfully for "+params[0].sourceSystem+" "+params[0].journey+" journey.");
});

When(/^user logs in to my account as a ghosting user$/, async function(t) {
  await myAccountMethod.loginAsGhostingUser(t);
});
When(/^the user searches '(.*)'$/, async function(t, [accountNumber]) {
  await myAccountMethod.searchAccountNumber(t,accountNumber);
});
When(/^the user clicks on Impersonate button$/, async function(t, [accountNumber]) {
  await myAccountMethod.clickOnImpersonateButton(t);
});


