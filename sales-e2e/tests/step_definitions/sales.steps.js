const { Given, When, Then } = require('cucumber');
const EaHomePage = require('../pages/energy-australia-home.page');
const { ClientFunction } = require('testcafe');

const replace = { replace: true };

Given('user have opened the website link in a browser', async t => {
  await t.navigateTo(EaHomePage.pageUrl);
});

Given(/^user has navigated to '(.*)' plans page$/, async function(t, [customerType]) {
  if(customerType==='Residential'){
    await t.click(EaHomePage.elements.residentialComparePlansButton);
  }
});

When(/^user clicks on the verify modal window on '(.*)' page$/, async function(t, [customerType]) {
  if(customerType==='Residential'){
    await t.click(EaHomePage.elements.residentialModalWindow);
  }
});

When(/^user clicks on '(.*)' from the modal$/, async function(t, [modalWindowValue]) {
  if (modalWindowValue==='verify account') {
    await t.click(EaHomePage.elements.modalVerifyAccountOption);
  } else if (modalWindowValue==='Bill upload') {
    await t.click(EaHomePage.elements.modalBillUploadOption);
  }
});

Then(/^user verifies if the verify account window is displayed as per the '(.*)' fueltype for '(.*)' customer$/, async function(t, [fuelType,customerType]) {
  if (customerType==='Residential') {
    switch (fuelType) {
      case 'Both':
        await t.expect(EaHomePage.elements.elecAccountNo.exists).ok;
        await t.expect(EaHomePage.elements.gascAccountNo.exists).ok;
        break;
      case 'Elec':
          await t.expect(EaHomePage.elements.elecAccountNo.exists).ok;
        break;
      case 'Gas':
          await t.expect(EaHomePage.elements.gasAccountNo.exists).ok;
        break;
    }
    await t.expect(EaHomePage.elements.postcodeVerifyAccount.exists).ok;
    await t.expect(EaHomePage.elements.nextAccountNumber.exists).ok;
    await t.expect(EaHomePage.elements.backAccountNumber.exists).ok;
    //isElementDisplayedAndEnabled(ComparePlansPage_Resi.BackAccountNumber);
  }
});
When(/^user provides '(.*)' account number '(.*)'$/, async function(t, [fuel, accountNumber]){
  switch(fuel){
    case 'Electricity':
      await t.typeText(EaHomePage.elements.elecAccountNo, accountNumber, replace);
      break;
    case 'Gas':
      await t.typeText(EaHomePage.elements.gasAccountNo,accountNumber, replace);
      break;
  }
});

When(/^user provides '(.*)' for '(.*)' customer$/, async function(t, [accountInformation, customerType]){
  switch(customerType){
    case 'Residential':
      await t.typeText(EaHomePage.elements.postcodeVerifyAccount, accountInformation, replace);
      break;
    case 'Business':
      await t.typeText(EaHomePage.elements.gascAccountNo,replace);
      break;
  }
});

When(/^user clicks on Next button after account number$/, async t => {
  await t.click(EaHomePage.elements.nextAccountNumber);
});

When(/^User selects ID type '(.*)' and enters '(.*)'$/, async function(t, [idType, idValue]){
  switch(idType){
    case 'dob':
       verifyAccount(t, idValue, replace, EaHomePage.elements.idTypeDOBVerifyAccount, EaHomePage.elements.idTypeDOBValueVerifyAccount);
       break;
    case 'dl':
        verifyAccount(t,idValue, replace, EaHomePage.elements.idTypeDlVerifyAccount, EaHomePage.elements.idTypeDlValueVerifyAccount);
        break;
    case 'pin':
        verifyAccount(t,idValue, replace, EaHomePage.elements.idTypePinVerifyAccount, EaHomePage.elements.idTypeDlValueVerifyAccount);
        break;
  }
});

async function verifyAccount(t,idValue, replace, itemToClick, inputField) {
  await t.click(EaHomePage.elements.idTypeDropDownVerifyAccount);
  await t.click(itemToClick);
  await t.typeText(inputField, idValue, replace);
}

Then(/^Usage data is displayed for '(.*)'$/, async function(t,[fuelType]){
  switch (fuelType) {
    case "Dual":
        await t.expect(EaHomePage.elements.usageData_ele.exists).ok;
        await t.expect(EaHomePage.elements.usageData_gas.exists).ok;
      break;
    case "Elec":
        await t.expect(EaHomePage.elements.usageData_ele.exists).ok;
      break;
    case "Gas":
        await t.expect(EaHomePage.elements.usageData_gas.exists).ok;
      break;
  }
});

When(/^user click show estimates on modal window$/, async t =>{
  await t.click(EaHomePage.elements.getCostEstimatesChangeButton);
});

Then(/^User lands on plans page after verify account journey$/, async t =>{
  await t.expect(EaHomePage.elements.changeLinkVerifyAccount).exists.ok;
});