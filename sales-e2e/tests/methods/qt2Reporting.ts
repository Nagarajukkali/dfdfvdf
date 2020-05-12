import {FUEL_TYPE_OPTIONS} from '@ea/ea-commons-models';
const eaQt2Reporting=require('../pages/eaQt2Reporting.page');
import {testFunction } from '../../global_methods/helper';
import {checkoutDetailsMethod} from './checkoutDetailsPage';
import * as assert from 'assert';
import {FileUtils} from '../../libs/FileUtils'
const cryptoJS = require('crypto-js');


export class qt2Reporting {

    public static async loginToqt2Reporting(t,username,password) {
      await testFunction.clearAndEnterText(t, eaQt2Reporting.elements.txtUsername, username);
      await testFunction.clearAndEnterText(t, eaQt2Reporting.elements.txtPassword, cryptoJS.AES.decrypt(password,username).toString(cryptoJS.enc.Utf8));
      await testFunction.click(t, eaQt2Reporting.elements.btnSubmit);
    }

    public static async searchEleQuote(t,option){
      await testFunction.isElementDisplayed(t,eaQt2Reporting.elements.listQt2Lookup);
      await testFunction.selectValueFromList(t,eaQt2Reporting.elements.listQt2Lookup,option);
      await testFunction.enterText(t,eaQt2Reporting.elements.txtEmail,checkoutDetailsMethod.map.get(checkoutDetailsMethod.getScenarioId(t)));
      await testFunction.click(t,eaQt2Reporting.elements.btnFind);
    }

    public static async verifySubmittedQuote(t){
      await testFunction.isElementDisplayed(t,eaQt2Reporting.elements.linkQuoteId);
    }

    public static async validateQuoteDetails(t,fuelType){
      if(await testFunction.isElectricity(fuelType)){
        let eleQuoteDetails=await this.getEleQuoteDetails(t);
        await FileUtils.createYamlFile(t,eleQuoteDetails,fuelType);
        let jsonObj = await FileUtils.convertYmlTOJSONObj(t,fuelType);
        this.verifyJSONData(jsonObj.saleDetail);
      }
      if(await testFunction.isGas(fuelType)){
        let gasQuoteDetails=await this.getGasQuoteDetails(t);
        await FileUtils.createYamlFile(t,gasQuoteDetails,fuelType);
        let jsonObj = await FileUtils.convertYmlTOJSONObj(t,fuelType);
        this.verifyJSONData(jsonObj.saleDetail);
      }
    }

    public static async getEleQuoteDetails(t){
      await testFunction.click(t,eaQt2Reporting.elements.linkQuoteId.nth(0));
      let eleQuoteDetails=testFunction.getElementText(t,eaQt2Reporting.elements.txtQuoteDetails);
      return eleQuoteDetails;
    }

    public static async getGasQuoteDetails(t){
      if(await testFunction.sizeOfElement(t,eaQt2Reporting.elements.txtQuoteDetails)>0){
        await this.searchGasQuote(t);
      }
      let quoteCount=await testFunction.sizeOfElement(t,eaQt2Reporting.elements.linkQuoteId);
      if(quoteCount===2){
        await testFunction.click(t,eaQt2Reporting.elements.linkQuoteId.nth(1));
      }
      else{
        await testFunction.click(t,eaQt2Reporting.elements.linkQuoteId.nth(0));
      }
      let gasQuoteDetails=testFunction.getElementText(t,eaQt2Reporting.elements.txtQuoteDetails);
      return gasQuoteDetails;
    }

    public static async searchGasQuote(t){
      await testFunction.navigateTo(t,eaQt2Reporting.qt2ReportingHomePageURL);
      await testFunction.isElementDisplayed(t,eaQt2Reporting.elements.listQt2Lookup);
      await testFunction.click(t,eaQt2Reporting.elements.listQt2Lookup);
      await testFunction.click(t,eaQt2Reporting.elements.listQt2LookupEmail);
      await testFunction.enterText(t,eaQt2Reporting.elements.txtEmail,checkoutDetailsMethod.map.get(checkoutDetailsMethod.getScenarioId(t)));
      await testFunction.click(t,eaQt2Reporting.elements.btnFind);
    }


    public static verifyJSONData(jsonObj){
      let quoteDetails = Object.keys(jsonObj);
      quoteDetails.forEach(function(quoteDetail) {
        let quoteDatas = Object.keys(jsonObj[quoteDetail]);
        quoteDatas.forEach(function(quoteData) {
          let value = jsonObj[quoteDetail][quoteData];
          if(!quoteData.toString().includes('nmiMirnInformation')){
            //console.log(quoteDetail+': '+quoteData+' = '+value);
            assert.ok(value.toString().length!==0);
          }
        });
      });
    }

    public static async validateMandatoryField(t,actualValue,expectedValue){
      console.log(actualValue+": "+expectedValue);
      await testFunction.assertTextValue(t,actualValue.toString(),expectedValue.toString());
    }






}
