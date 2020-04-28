import { Given } from 'cucumber';
import {testFunction} from '../../global_methods/helper';
import {CustomerType} from '@ea/ea-commons-models';
const eaHomePage=require('../pages/energy-australia-home.page');
const eaMyAccount = require('../pages/myAccount.page');
const eaQt2Reporting = require('../pages/eaQt2Reporting.page');
import {fetchBrowser,screenshotFolder,getDateTime} from '../step_definitions/hooks';


Given(/^user has navigated to '(.*)' plans page$/, async function(t, [customerType]) {
  if(customerType===CustomerType.RESIDENTIAL){
    await testFunction.click(t, eaHomePage.elements.residentialComparePlansButton);
    await testFunction.isElementDisplayed(t,eaHomePage.elements.plansCardFee);
  }else if (customerType===CustomerType.BUSINESS){
    await testFunction.click(t, eaHomePage.elements.businessLink);
    await testFunction.click(t, eaHomePage.elements.smallBusinessButton);
    await testFunction.isElementDisplayed(t,eaHomePage.elements.plansCardFee);
  }
  await t.takeScreenshot(`../${await fetchBrowser()}/${await screenshotFolder}/plans_page_${await getDateTime()}.png`);
});

Given(/^user navigates to my account login page$/, async function (t, []) {
  await t.navigateTo(eaMyAccount.pageUrl);
});

Given(/^user has opened the qt2 Reporting website link in a browser$/, async function(t, [folderName]) {
  await t.navigateTo(eaQt2Reporting.qt2ReportingPageURL);
});

Given(/^user has navigated to move house page$/, async function (t) {
    await testFunction.click(t,eaHomePage.elements.linkMoveHouse);
});
