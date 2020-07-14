const { config }=require('../../resources/resource');
import {Selector } from 'testcafe';

const eaQt2Reporting={
  qt2ReportingPageURL:config.qt2ReportingURL,
  qt2ReportingHomePageURL:config.qt2ReportingHomePageURL,
  elements: {
    txtUsername:Selector('#username'),
    txtPassword: Selector("#password"),
    btnSubmit:Selector('#submit'),
    listQt2Lookup:Selector('select#qt2-lookup-selector'),
    listQt2LookupEmail:Selector('select#qt2-lookup-selector>option[value=\'qt2-email\']'),
    txtEmail:Selector('#email'),
    btnFind:Selector('#findByQuoteID'),
    linkQuoteId:Selector('a[href*=\'/qt2reporting/app/xml?quoteId=\']'),
    fuelType:Selector('a[href*=\'/qt2reporting/app/xml?quoteId=\']').parent().nextSibling(),
    txtQuoteDetails:Selector('html>body>pre')
  },
};

module.exports = eaQt2Reporting;
