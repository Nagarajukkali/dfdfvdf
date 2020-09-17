import { Given } from 'cucumber';
import { testFunction } from '../../global_methods/helper';
import {CustomerType} from '@ea/ea-commons-models';
import {getTestCafeRC} from './hooks';
const eaHomePage=require('../pages/energy-australia-home.page');
const eaMyAccount = require('../pages/myAccount.page');
const eaQt2Reporting = require('../pages/eaQt2Reporting.page');

Given(/^user has navigated to '(.*)' plans page$/, async function(t, [customerType]) {
  if(customerType===CustomerType.RESIDENTIAL){
    await testFunction.click(t, eaHomePage.elements.residentialComparePlansButton);
  }else if (customerType===CustomerType.BUSINESS){
    if(testFunction.isTablet()){
      await testFunction.isElementDisplayed(t,eaHomePage.elements.menuBarCollapsed);
      await testFunction.click(t,eaHomePage.elements.menuBarCollapsed);
      await testFunction.click(t,eaHomePage.elements.businessMobileIcon);
      await testFunction.click(t,eaHomePage.elements.businessplansMenu);
      await testFunction.click(t,eaHomePage.elements.smallBusinessLink);
      await testFunction.click(t,eaHomePage.elements.btnBusAccessQuoteTool);
    }
    else{
      await testFunction.click(t, eaHomePage.elements.businessLink);
      await testFunction.click(t, eaHomePage.elements.smallBusinessButton);
    }
  }
  await testFunction.isElementDisplayed(t,eaHomePage.elements.plansCardFee);
  await testFunction.isElementDisplayed(t,eaHomePage.elements.planEstimateValue);
  await testFunction.takeScreenshot(t, 'plans_page');//disabled UI Validation
});

Given(/^user navigates to my account login page$/, async function (t, []) {
  await t.navigateTo(eaMyAccount.pageUrl);
  console.log("User lands on my account login page");
});

Given(/^user has opened the qt2 Reporting website link in a browser$/, async function(t, [folderName]) {
  if(!getTestCafeRC.browsers[0].includes('emulation')){
    await t.navigateTo(eaQt2Reporting.qt2ReportingPageURL);
  }
});

Given(/^user has navigated to move house page$/, async function (t) {
    await testFunction.click(t,eaHomePage.elements.linkMoveHouse);
    await testFunction.takeScreenshot(t, "move_house");
});
