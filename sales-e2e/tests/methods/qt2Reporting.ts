import {AustralianState} from '@ea/ea-commons-models';
import {CustomerStatus, OfferType, testFunction} from '../../global_methods/helper';
import {checkoutDetailsMethod} from './checkoutDetailsPage';
import * as assert from 'assert';
import {FileUtils} from '../../libs/FileUtils';

const eaQt2Reporting = require('../pages/eaQt2Reporting.page');
const {config} = require('../../resources/resource');


export class qt2Reporting {

  public static async loginToqt2Reporting(t) {
    let username = config.qt2ReportingCreds.username;
    let password = config.qt2ReportingCreds.password;
    console.log(`Using qt2reporting username: ${username}`);
    await testFunction.clearAndEnterText(t, eaQt2Reporting.elements.txtUsername, username);
    await testFunction.clearAndEnterText(t, eaQt2Reporting.elements.txtPassword, password);
    await testFunction.click(t, eaQt2Reporting.elements.btnSubmit);
  }

  public static async searchEleQuote(t, option) {
    await testFunction.isElementDisplayed(t, eaQt2Reporting.elements.listQt2Lookup);
    await testFunction.selectValueFromList(t, eaQt2Reporting.elements.listQt2Lookup, option);
    await testFunction.enterText(t, eaQt2Reporting.elements.txtEmail, checkoutDetailsMethod.map.get(checkoutDetailsMethod.getScenarioId(t)));
    await testFunction.click(t, eaQt2Reporting.elements.btnFind);
  }

  public static async verifySubmittedQuote(t) {
    await testFunction.isElementDisplayed(t, eaQt2Reporting.elements.linkQuoteId);
  }

  public static async validateQuoteDetails(t, fuelType) {
    if (await testFunction.isElectricity(fuelType)) {
      let eleQuoteDetails = await this.getEleQuoteDetails(t);
      await FileUtils.createYamlFile(t, eleQuoteDetails, fuelType);
      let jsonObj = await FileUtils.convertYmlTOJSONObj(t, fuelType);
      this.verifyJSONData(jsonObj.saleDetail);
    }
    if (await testFunction.isGas(fuelType)) {
      let gasQuoteDetails = await this.getGasQuoteDetails(t);
      await FileUtils.createYamlFile(t, gasQuoteDetails, fuelType);
      let jsonObj = await FileUtils.convertYmlTOJSONObj(t, fuelType);
      this.verifyJSONData(jsonObj.saleDetail);
    }
  }

  public static async validateQuoteDetailsForMailingAddress(t, fuelType) {
    if (await testFunction.isElectricity(fuelType)) {
      let eleQuoteDetails = await this.getEleQuoteDetails(t);
      eleQuoteDetails = eleQuoteDetails.replace("premiseDetail", "mainAddress");
      await FileUtils.createYamlFile(t, eleQuoteDetails, fuelType);
      let jsonObj = await FileUtils.convertYmlTOJSONObj(t, fuelType);
      this.verifyJSONData(jsonObj.saleDetail);
    }
    if (await testFunction.isGas(fuelType)) {
      let gasQuoteDetails = await this.getGasQuoteDetails(t);
      gasQuoteDetails = gasQuoteDetails.replace("premiseDetail", "mainAddress");
      await FileUtils.createYamlFile(t, gasQuoteDetails, fuelType);
      let jsonObj = await FileUtils.convertYmlTOJSONObj(t, fuelType);
      this.verifyJSONData(jsonObj.saleDetail);
    }
  }

  public static async getEleQuoteDetails(t) {
    let fuelType = await testFunction.getElementText(t, eaQt2Reporting.elements.fuelType);
    if (fuelType === 'ELECTRICITY') {
      await testFunction.click(t, eaQt2Reporting.elements.linkQuoteId.nth(0));
    } else {
      await testFunction.click(t, eaQt2Reporting.elements.linkQuoteId.nth(1));
    }
    let eleQuoteDetails = testFunction.getElementText(t, eaQt2Reporting.elements.txtQuoteDetails);
    return eleQuoteDetails;
  }

  public static async getGasQuoteDetails(t) {
    if (await testFunction.sizeOfElement(t, eaQt2Reporting.elements.txtQuoteDetails) > 0) {
      await this.searchGasQuote(t);
    }
    let quoteCount = await testFunction.sizeOfElement(t, eaQt2Reporting.elements.linkQuoteId);
    if (quoteCount === 2) {
      let fuelType = await testFunction.getElementText(t, eaQt2Reporting.elements.fuelType);
      if (fuelType === 'GAS') {
        await testFunction.click(t, eaQt2Reporting.elements.linkQuoteId.nth(0));
      } else {
        await testFunction.click(t, eaQt2Reporting.elements.linkQuoteId.nth(1));
      }
    } else {
      await testFunction.click(t, eaQt2Reporting.elements.linkQuoteId.nth(0));
    }
    let gasQuoteDetails = testFunction.getElementText(t, eaQt2Reporting.elements.txtQuoteDetails);
    return gasQuoteDetails;
  }

  public static async searchGasQuote(t) {
    await testFunction.navigateTo(t, eaQt2Reporting.qt2ReportingHomePageURL);
    await testFunction.isElementDisplayed(t, eaQt2Reporting.elements.listQt2Lookup);
    await testFunction.click(t, eaQt2Reporting.elements.listQt2Lookup);
    await testFunction.click(t, eaQt2Reporting.elements.listQt2LookupEmail);
    await testFunction.enterText(t, eaQt2Reporting.elements.txtEmail, checkoutDetailsMethod.map.get(checkoutDetailsMethod.getScenarioId(t)));
    await testFunction.click(t, eaQt2Reporting.elements.btnFind);
  }


  public static verifyJSONData(jsonObj) {
    let quoteDetails = Object.keys(jsonObj);
    quoteDetails.forEach(function (quoteDetail) {
      let quoteDatas = Object.keys(jsonObj[quoteDetail]);
      quoteDatas.forEach(function (quoteData) {
        let value = jsonObj[quoteDetail][quoteData];
        if (!quoteData.toString().includes('nmiMirnInformation')) {
          assert.ok(value.toString().length !== 0);
        }
      });
    });
  }

  public static async validateMandatoryField(t, actualValue, expectedValue) {
    console.log(actualValue + ": " + expectedValue);
    await testFunction.assertTextValue(t, actualValue.toString(), expectedValue.toString());
  }

  public static getCreditAssessmentValue(scenarioName) {
    let creditAssessmentValue;
    let testName = scenarioName.toLowerCase();
    switch (true) {
      case testName.includes("accept with condition"):
        creditAssessmentValue = "Accept With Condition";
        break;
      case testName.includes("accept"):
        creditAssessmentValue = "Accept";
        break;
      case testName.includes("decline"):
        creditAssessmentValue = "Decline";
        break;
      case testName.includes("error"):
        creditAssessmentValue = "Error";
        break;
      default:
        creditAssessmentValue = "Accept";
    }
    return creditAssessmentValue;
  }

  public static async validateSourceCode(t, state, customerStatus, actualSourceCode, campaign, expectedOfferType, expectedFuelType) {
    let data = await FileUtils.getJSONfile(campaign);
    if (customerStatus === CustomerStatus.NEW) {
      await this.validateNewCustomerSourceCode(t, state, actualSourceCode, data,expectedOfferType, expectedFuelType);
    }
    if (customerStatus === CustomerStatus.EXISTING) {
      await this.validateExistingCustomerSourceCode(t, state, actualSourceCode, data, expectedOfferType, expectedFuelType);
    }
  }

  public static async validateNewCustomerSourceCode(t, state, actualSourceCode, data, expectedOfferType,expectedFuelType) {
    if (await testFunction.isElectricity(expectedFuelType)) {
      switch (state) {
        case AustralianState.VIC:
          if (expectedOfferType === OfferType.COR) {
            await this.validateMandatoryField(t, actualSourceCode, data.electricity.sourceCode.newCustomer.COR.VIC);
          }
          if (expectedOfferType === OfferType.ENE) {
            await this.validateMandatoryField(t, actualSourceCode, data.electricity.sourceCode.newCustomer.ENE.VIC);
          }
          break;
        case AustralianState.NSW:
          if (expectedOfferType === OfferType.COR) {
            if (t.testRun.test.name.includes('Essential')) {
              await this.validateMandatoryField(t, actualSourceCode, data.electricity.sourceCode.newCustomer.COR.NSW.Essential);
            } else if (t.testRun.test.name.includes('Endeavour')) {
              await this.validateMandatoryField(t, actualSourceCode, data.electricity.sourceCode.newCustomer.COR.NSW.Endeavour);
            } else if (t.testRun.test.name.includes('Ausgrid')) {
              await this.validateMandatoryField(t, actualSourceCode, data.electricity.sourceCode.newCustomer.COR.NSW.Ausgrid);
            } else {
              await this.validateMandatoryField(t, actualSourceCode, data.electricity.sourceCode.newCustomer.COR.NSW.default);
            }
          }
          if (expectedOfferType === OfferType.ENE) {
            if (t.testRun.test.name.includes('Essential')) {
              await this.validateMandatoryField(t, actualSourceCode, data.electricity.sourceCode.newCustomer.ENE.NSW.Essential);
            } else if (t.testRun.test.name.includes('Endeavour')) {
              await this.validateMandatoryField(t, actualSourceCode, data.electricity.sourceCode.newCustomer.ENE.NSW.Endeavour);
            } else if (t.testRun.test.name.includes('Ausgrid')) {
              await this.validateMandatoryField(t, actualSourceCode, data.electricity.sourceCode.newCustomer.ENE.NSW.Ausgrid);
            } else {
              await this.validateMandatoryField(t, actualSourceCode, data.electricity.sourceCode.newCustomer.ENE.NSW.default);
            }
          }
          break;
        case AustralianState.SA:
          if (expectedOfferType === OfferType.COR) {
            await this.validateMandatoryField(t, actualSourceCode, data.electricity.sourceCode.newCustomer.COR.SA);
          }
          if (expectedOfferType === OfferType.ENE) {
            await this.validateMandatoryField(t, actualSourceCode, data.electricity.sourceCode.newCustomer.ENE.SA);
          }
          break;
        case AustralianState.ACT:
          if (expectedOfferType === OfferType.COR) {
            await this.validateMandatoryField(t, actualSourceCode, data.electricity.sourceCode.newCustomer.COR.ACT);
          }
          if (expectedOfferType === OfferType.ENE) {
            await this.validateMandatoryField(t, actualSourceCode, data.electricity.sourceCode.newCustomer.ENE.ACT);
          }
          break;
        case AustralianState.QLD:
          if (expectedOfferType === OfferType.COR) {
            await this.validateMandatoryField(t, actualSourceCode, data.electricity.sourceCode.newCustomer.COR.QLD);
          }
          if (expectedOfferType === OfferType.ENE) {
            await this.validateMandatoryField(t, actualSourceCode, data.electricity.sourceCode.newCustomer.ENE.QLD);
          }
          break;
        default:
      }
    }
    if (await testFunction.isGas(expectedFuelType)) {
      if (expectedOfferType === OfferType.COR) {
        switch (state) {
          case AustralianState.VIC:
            await this.validateMandatoryField(t, actualSourceCode, data.gas.sourceCode.newCustomer.COR.VIC);
            break;
          case AustralianState.NSW:
            await this.validateMandatoryField(t, actualSourceCode, data.gas.sourceCode.newCustomer.COR.NSW);
            break;
          case AustralianState.SA:
            await this.validateMandatoryField(t, actualSourceCode, data.gas.sourceCode.newCustomer.COR.SA);
            break;
          case AustralianState.ACT:
            await this.validateMandatoryField(t, actualSourceCode, data.gas.sourceCode.newCustomer.COR.ACT);
            break;
          case AustralianState.QLD:
            await this.validateMandatoryField(t, actualSourceCode, data.gas.sourceCode.newCustomer.COR.QLD);
            break;
          default:
        }
      }
      if (expectedOfferType === OfferType.ENE) {
        switch (state) {
          case AustralianState.VIC:
            await this.validateMandatoryField(t, actualSourceCode, data.gas.sourceCode.newCustomer.ENE.VIC);
            break;
          case AustralianState.NSW:
            await this.validateMandatoryField(t, actualSourceCode, data.gas.sourceCode.newCustomer.ENE.NSW);
            break;
          case AustralianState.SA:
            await this.validateMandatoryField(t, actualSourceCode, data.gas.sourceCode.newCustomer.ENE.SA);
            break;
          case AustralianState.ACT:
            await this.validateMandatoryField(t, actualSourceCode, data.gas.sourceCode.newCustomer.ENE.ACT);
            break;
          case AustralianState.QLD:
            await this.validateMandatoryField(t, actualSourceCode, data.gas.sourceCode.newCustomer.ENE.QLD);
            break;
          default:
        }
      }
    }
  }

  public static async validateExistingCustomerSourceCode(t, state, actualSourceCode, data, expectedOfferType, expectedFuelType) {
    if (await testFunction.isElectricity(expectedFuelType)) {
      switch (state) {
        case AustralianState.VIC:
          if (expectedOfferType === OfferType.PS) {
            await this.validateMandatoryField(t, actualSourceCode, data.electricity.sourceCode.existingCustomer.PS.VIC);
          }
          if (expectedOfferType === OfferType.ENE) {
            await this.validateMandatoryField(t, actualSourceCode, data.electricity.sourceCode.existingCustomer.ENE.VIC);
          }
          break;
        case AustralianState.NSW:
          if (expectedOfferType === OfferType.PS) {
            if (t.testRun.test.name.includes('Essential')) {
              await this.validateMandatoryField(t, actualSourceCode, data.electricity.sourceCode.existingCustomer.PS.NSW.Essential);
            } else if (t.testRun.test.name.includes('Endeavour')) {
              await this.validateMandatoryField(t, actualSourceCode, data.electricity.sourceCode.existingCustomer.PS.NSW.Endeavour);
            } else if (t.testRun.test.name.includes('Ausgrid')) {
              await this.validateMandatoryField(t, actualSourceCode, data.electricity.sourceCode.existingCustomer.PS.NSW.Ausgrid);
            } else {
              await this.validateMandatoryField(t, actualSourceCode, data.electricity.sourceCode.existingCustomer.PS.NSW.default);
            }
          }
          if (expectedOfferType === OfferType.ENE) {
            if (t.testRun.test.name.includes('Essential')) {
              await this.validateMandatoryField(t, actualSourceCode, data.electricity.sourceCode.existingCustomer.ENE.NSW.Essential);
            } else if (t.testRun.test.name.includes('Endeavour')) {
              await this.validateMandatoryField(t, actualSourceCode, data.electricity.sourceCode.existingCustomer.ENE.NSW.Endeavour);
            } else if (t.testRun.test.name.includes('Ausgrid')) {
              await this.validateMandatoryField(t, actualSourceCode, data.electricity.sourceCode.existingCustomer.ENE.NSW.Ausgrid);
            } else {
              await this.validateMandatoryField(t, actualSourceCode, data.electricity.sourceCode.existingCustomer.ENE.NSW.default);
            }
          }
          break;
        case AustralianState.SA:
          if (expectedOfferType === OfferType.PS) {
            await this.validateMandatoryField(t, actualSourceCode, data.electricity.sourceCode.existingCustomer.PS.SA);
          }
          if (expectedOfferType === OfferType.ENE) {
            await this.validateMandatoryField(t, actualSourceCode, data.electricity.sourceCode.existingCustomer.ENE.SA);
          }
          break;
        case AustralianState.ACT:
          if (expectedOfferType === OfferType.PS) {
            await this.validateMandatoryField(t, actualSourceCode, data.electricity.sourceCode.existingCustomer.PS.ACT);
          }
          if (expectedOfferType === OfferType.ENE) {
            await this.validateMandatoryField(t, actualSourceCode, data.electricity.sourceCode.existingCustomer.ENE.ACT);
          }
          break;
        case AustralianState.QLD:
          if (expectedOfferType === OfferType.PS) {
            await this.validateMandatoryField(t, actualSourceCode, data.electricity.sourceCode.existingCustomer.PS.QLD);
          }
          if (expectedOfferType === OfferType.ENE) {
            await this.validateMandatoryField(t, actualSourceCode, data.electricity.sourceCode.existingCustomer.ENE.QLD);
          }
          break;
        default:
      }
    }
    if (await testFunction.isGas(expectedFuelType)) {
      switch (state) {
        case AustralianState.VIC:
          if (expectedOfferType === OfferType.PS) {
            await this.validateMandatoryField(t, actualSourceCode, data.gas.sourceCode.existingCustomer.PS.VIC);
          }
          if (expectedOfferType === OfferType.ENE) {
            await this.validateMandatoryField(t, actualSourceCode, data.gas.sourceCode.existingCustomer.ENE.VIC);
          }
          break;
        case AustralianState.NSW:
          if (expectedOfferType === OfferType.PS) {
            await this.validateMandatoryField(t, actualSourceCode, data.gas.sourceCode.existingCustomer.PS.NSW);
          }
          if (expectedOfferType === OfferType.ENE) {
            await this.validateMandatoryField(t, actualSourceCode, data.gas.sourceCode.existingCustomer.ENE.NSW);
          }
          break;
        case AustralianState.SA:
          if (expectedOfferType === OfferType.PS) {
            await this.validateMandatoryField(t, actualSourceCode, data.gas.sourceCode.existingCustomer.PS.SA);
          }
          if (expectedOfferType === OfferType.ENE) {
            await this.validateMandatoryField(t, actualSourceCode, data.gas.sourceCode.existingCustomer.ENE.SA);
          }
          break;
        case AustralianState.ACT:
          if (expectedOfferType === OfferType.PS) {
            await this.validateMandatoryField(t, actualSourceCode, data.gas.sourceCode.existingCustomer.PS.ACT);
          }
          if (expectedOfferType === OfferType.ENE) {
            await this.validateMandatoryField(t, actualSourceCode, data.gas.sourceCode.existingCustomer.ENE.ACT);
          }
          break;
        case AustralianState.QLD:
          if (expectedOfferType === OfferType.PS) {
            await this.validateMandatoryField(t, actualSourceCode, data.gas.sourceCode.existingCustomer.PS.QLD);
          }
          if (expectedOfferType === OfferType.ENE) {
            await this.validateMandatoryField(t, actualSourceCode, data.gas.sourceCode.existingCustomer.ENE.QLD);
          }
          break;
        default:
      }
    }
  }

}
