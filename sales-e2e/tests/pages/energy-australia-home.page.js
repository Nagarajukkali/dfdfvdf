const { config } = require('../../resources/resource');
const Selector = require('testcafe').Selector;

const eaHomePage = {
  pageUrl: config.eaHomePageUrl,
  elements: {
    redidentialComparePlansButton: Selector('div:nth-child(1) > div > a > span.quick-link-item-title'),
    residentialModalWindow: Selector('.tablet-desktop-only #hs-refine-modal-cta'),
    modalVerifyAccountOption: Selector('#hs-verify-account-cta button'),
    modalBillUploadOption: Selector('#hs-bill-upload-cta a'),
  },
};

module.exports = eaHomePage;
