const { config } = require('../../resources/resource');
const Selector = require('testcafe').Selector;

const eaHomePage = {
  pageUrl: config.eaHomePageUrl,
  elements: {
    redidentialComparePlansButton: Selector('#ctp-account'),
  },
};

module.exports = eaHomePage;
