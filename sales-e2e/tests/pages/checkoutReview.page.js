const Selector = require('testcafe').Selector;

const eaCheckoutReviewPage = {
    elements: {
      lifeSupportHeader: Selector('div[class*=life-support] h4'),
      lifeSupportDisclaimer: Selector('[class*=life-support-disclaimer]'),
      lifeSupportQuestionSection: Selector('[class*=life-support__question-section]'),
      lifeSupportQuestion: Selector('[class$=life-support__question]'),
      lifeSupportQuestionYes: Selector('[for*=edit-life-support-required-yes]'),
      lifeSupportQuestionNo: Selector('[for*=edit-life-support-required-no]'),
      rbLifeSupportYes: Selector('[for*=\'edit-life-support-required-yes\']'),
      rbLifeSupportNo: Selector('[for*=\'edit-life-support-required-no\']'),
      lifeSupportElec: Selector('#ele-life-support'),
      lifeSupportGas: Selector('#gas-life-support'),
      btnRegisterDeviceElec: Selector('[id*=\'ele-life-support-register\'] button'),
      btnRegisterDeviceGas: Selector('[id*=\'gas-life-support-register\'] button'),
      reviewYourOfferTxt:Selector('.review-order.ng-star-inserted>h2'),
    }
}

module.exports = eaCheckoutReviewPage;
