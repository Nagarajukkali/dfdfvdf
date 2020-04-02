import {checkoutDetailsMethod} from './checkoutDetailsPage';
const eaQt2Reporting=require('../pages/eaQt2Reporting.page');
import {testFunction } from '../../global_methods/helper';
const fileUtils=require('../../libs/FileUtils.js');
const cryptoJS = require('crypto-js');



export class qt2Reporting {

    public static async loginToqt2Reporting(t,username,password) {
      await testFunction.clearAndEnterText(t, eaQt2Reporting.elements.txtUsername, username);
      await testFunction.clearAndEnterText(t, eaQt2Reporting.elements.txtPassword, cryptoJS.AES.decrypt(password,username).toString(cryptoJS.enc.Utf8));
      await testFunction.click(t, eaQt2Reporting.elements.btnSubmit);
    }

    public static async searchQuote(t,option){
      await testFunction.isElementDisplayed(t,eaQt2Reporting.elements.listQt2Lookup);
      await testFunction.selectValueFromList(t,eaQt2Reporting.elements.listQt2Lookup,option);
      await testFunction.enterText(t,eaQt2Reporting.elements.txtEmail,checkoutDetailsMethod.emailAddress);
      await testFunction.click(t,eaQt2Reporting.elements.btnFind);
      await t.wait(5000);
    }

    public static async verifySubmittedQuote(t){
      await testFunction.isElementDisplayed(t,eaQt2Reporting.elements.linkQuoteId);
    }

    public static async validateQuoteDetails(t){
      await testFunction.click(t,eaQt2Reporting.elements.linkQuoteId.nth(0));
      let quoteDetails=await testFunction.getElementText(t,eaQt2Reporting.elements.txtQuoteDetails);
      fileUtils.createYamlFile(quoteDetails);
      let jsonObj=fileUtils.converYmlTOJSONObj();
      console.log(jsonObj.saleDetail.saleDetailHeader.quoteId);
      console.log(jsonObj.saleDetail.offerDetail.nmiMirnInformation.NMI);
      console.log(jsonObj.saleDetail.creditAssessmentDecision);
    }

}
