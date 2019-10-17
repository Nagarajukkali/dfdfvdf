const { config } = require('../../resources/resource');
const Selector = require('testcafe').Selector;

const clickToPayReceiptPage = {
  elements: {
    successMessage: Selector('.ctp-message'),
    accountNumber: Selector('.ctp-receipt-account'),
    amount: Selector('.ctp-receipt-amount'),
    paidFrom: Selector('.ctp-receipt-card'),
    emailAddress: Selector('#ctp-email'),
    emailSuccessMessage: Selector('.ctp-success-message'),
  },
};

module.exports = clickToPayReceiptPage;
