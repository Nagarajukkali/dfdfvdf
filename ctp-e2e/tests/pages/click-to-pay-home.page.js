const { config } = require('../../resources/resource');
const Selector = require('testcafe').Selector;

const clickToPayHomePage = {
  pageUrl: config.clickToPayWebsiteUrl,
  smsUrl: config.clickToPaySMSUrl,
  elements: {
    accountNumber: Selector('#ctp-account'),
    accountNumberPrefilled: Selector ('#ctp-account-label+div'),
    amountToPay: Selector('#ctp-amount'),
    creditCardNumber: Selector('#ctp-card-number'),
    nameOnCard: Selector('#ctp-card-name'),
    expiryDate: Selector('#ctp-card-expiry'),
    cvv: Selector('#ctp-card-cvn'),
    modalSpinner: Selector('.ea-spinner'),
    button: Selector('.ea-button'),
  },
};

module.exports = clickToPayHomePage;
