const { config }=require('../../resources/resource');
import {Selector } from 'testcafe';

const eaMyAccount={
  pageUrl: config.eaMyAccountUrl,
  elements: {
    tfUsername: Selector("#username"),
    tfPassword: Selector("#password"),
    btnSignIn: Selector("form[name*='loginForm'] button[type*='submit']"),
    eleViewAndChangePlan: Selector("a[href*='view']"),
    btnCompareAndSwitchPlans: Selector("[class*='header-action'] button"),
    btnSolarNo: Selector("[class*='qualifier-question'] label[for*='edit-solar-panels-field-1']"),
    btnQualifierConfirm: Selector("[primaryactiontext*='Confirm'] [class*='ea-button--primary']")

  },
};

module.exports = eaMyAccount;
