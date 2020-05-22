const { config }=require('../../resources/resource');
import {Selector } from 'testcafe';

const eaMyAccount={
  pageUrl: config.eaMyAccountUrl,
  elements: {
    tfUsername: Selector("#username"),
    tfPassword: Selector("#password"),
    btnSignIn: Selector("[name='remember-me']~.ea-button.ea-button--primary"),
    eleViewAndChangePlan: Selector("a[href*='view']").nth(0),
    gasViewAndChangePlan: Selector("a[href*='view']").nth(1),
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
    rbHomeImprovement_No: Selector("#option-prev-or-planned-home-improve-false"),
    oneUXSpinner: Selector("[class*='spinner']").with({visibilityCheck: true}),
    eaSpinner:Selector(".ea-spinner.ng-star-inserted"),
    btnUpSellComparePlan:Selector(".up-sell div.cta>button"),
  },
};

module.exports = eaMyAccount;
