const { config }=require('../../resources/resource');
import {Selector } from 'testcafe';

const eaMyAccount={
  pageUrl: config.eaMyAccountUrl,
  elements: {
    tfUsername: Selector("#okta-signin-username"),
    tfPassword: Selector("#okta-signin-password"),
    btnSignIn: Selector("#okta-signin-submit"),
    eleViewAndChangePlan: Selector("a[href*='view-plan']").nth(0),
    gasViewAndChangePlan: Selector("a[href*='view-plan']").nth(1),
    btnCompareAndSwitchPlans: Selector("[class*='header-action'] button"),
    btnSolarNo: Selector("[class*='qualifier-question'] label[for*='edit-solar-panels-field-1']"),
    btnQualifierConfirm: Selector("[primaryactiontext*='Confirm'] [class*='ea-button--primary']"),
    eleMoveHome: Selector("a[href*='movers']").nth(0),
    gasMoveHome: Selector("a[href*='movers']").nth(1),
    serviceAddress: Selector(".form-control"),
    serviceAddressList: Selector(".form-control+ ul>li a"),
    moveHouseCalendarAvailableDates: Selector(".uib-day button:not([disabled])"),
    btnSolarNo_MA: Selector("#mover-solar-button-no"),
    btnLetsGetMoving: Selector("#mover-lets-get-moving-button"),
    rbHomeImprovement_No: Selector("#edit-planned-home-renovations-no__label"),
    oneUXSpinner: Selector("[class*='spinner']").with({visibilityCheck: true}),
    eaSpinner:Selector(".ea-spinner.ng-star-inserted"),
    btnUpSellComparePlan:Selector(".up-sell div.cta>button"),
    moveHeader:Selector("[src*='accounts-movers-add']>h1"),
    btnModalSkip: Selector("button.skip-button"),
    chkBoxGas: Selector("#mover-fuel-button-gas div.checkbox-image"),
    benefitPeriod:Selector("#benefit-period div.field-body"),
    exitFees:Selector("#exit-fees div.field-body"),
    discounts:Selector("#discounts div.field-body div"),
    btnRetry:Selector("button[type='submit']"),
    tfAccountNumber : Selector("#accountNumber"),
    btnSearch : Selector('#find-user-search-btn'),
    btnImpersonate : Selector("#impersonate-btn-0"),

  },
};

module.exports = eaMyAccount;
