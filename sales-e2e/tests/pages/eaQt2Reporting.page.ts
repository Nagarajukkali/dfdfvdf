const { config }=require('../../resources/resource');
import {Selector } from 'testcafe';

const eaQt2Reporting={
  qt2ReportingPageURL:config.qt2ReportingURL,
  elements: {
    txtUsername:Selector('#username'),
    txtPassword: Selector("#password"),
    btnSubmit:Selector('#submit'),
    listQt2Lookup:Selector('#qt2-lookup-selector'),
    txtEmail:Selector('#email'),
    btnFind:Selector('#findByQuoteID'),
    linkQuoteId:Selector('a[href*=\'/qt2reporting/app/xml?quoteId=\']'),
    txtQuoteDetails:Selector('html>body>pre')
  },
};

module.exports = eaQt2Reporting;
