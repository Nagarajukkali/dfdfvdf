import {When} from "cucumber";
import {qt2Reporting} from '../methods/qt2Reporting';
import {Then} from 'cucumber'
import {FUEL_TYPE_OPTIONS} from '@ea/ea-commons-models';
import {checkoutDetailsMethod} from '../methods/checkoutDetailsPage';
import {testFunction} from '../../global_methods/helper';
import {FileUtils} from '../../libs/FileUtils'
import {getPackage, getTestCafeRC} from './hooks';
const { config }=require('../../resources/resource');
const envToExclude=config.qt2ReportingToExcludeInEnvs;

When(/^user logs in to qt2 reporting$/, async function(t) {
  if(!getTestCafeRC.browsers[0].includes('emulation') && !envToExclude.includes(getPackage.config.env)){
    await qt2Reporting.loginToqt2Reporting(t);
  }
});

When(/^user search quote on the basis of '(.*)'$/, async function (t,[option]) {
  if(!getTestCafeRC.browsers[0].includes('emulation') && !envToExclude.includes(getPackage.config.env)) {
    await qt2Reporting.searchEleQuote(t, option);
  }
});
Then(/^submitted quote is displayed$/, async function (t) {
  if(!getTestCafeRC.browsers[0].includes('emulation') && !envToExclude.includes(getPackage.config.env)) {
    await qt2Reporting.verifySubmittedQuote(t);
    await testFunction.takeScreenshot(t, "qt2_reporting_app_quotes");
  }
});

Then(/^user validates all the details for '(.*)' submitted quote$/, async function (t,[fuelType]) {
  if(!getTestCafeRC.browsers[0].includes('emulation') && !envToExclude.includes(getPackage.config.env)) {
    await qt2Reporting.validateQuoteDetails(t, fuelType);
    await testFunction.takeScreenshot(t, "qt2_reporting_app_" + fuelType);
  }
});

Then(/^user validates below mandatory fields$/, async function (t,[],dataTable) {
  if(!getTestCafeRC.browsers[0].includes('emulation') && !envToExclude.includes(getPackage.config.env)) {
    //Expected Data
    let data = dataTable.hashes();
    let expectedFuelType = data[0].fuelType;
    let expectedQuoteStatus = data[0].quoteStatus;
    let expectedCustomerType = data[0].customerType;
    let expectedOfferType = data[0].offerType;
    let expectedPlanCode = data[0].planCode;
    let expectedRenovationsSinceDeEnergisation = data[0].renovationsSinceDeenergisation;
    let expectedRenovationsInProgressOrPlanned = data[0].renovationsInProgressOrPlanned;
    let expectedCustomerWithLifeSupport = data[0].customerWithLifeSupport
    let expectedBillRouteType = data[0].billRouteType;
    //Actual Data
    let jsonObj = await FileUtils.convertYmlTOJSONObj(t, expectedFuelType);
    let actualQuoteStatus = jsonObj.saleDetail.saleDetailHeader.quoteStatus;
    let actualCustomerType = jsonObj.saleDetail.saleDetailHeader.customerType;
    let actualOfferType = jsonObj.saleDetail.offerDetail.offerType;
    let actualPlanCode = jsonObj.saleDetail.offerDetail.plan;
    let actualState = jsonObj.saleDetail.premiseDetail.state;
    let actualBillRouteType = jsonObj.saleDetail.billDeliveryDetail.billRouteType;
    let isCampaignTest = (t.testRun.test.name.includes('campaign'));
    let isOfferType=(actualOfferType==='ENE'||actualOfferType === 'COR');
    let isState= (actualState!=='ACT');
    let isPlanCode = (expectedPlanCode.includes('BSOT') || expectedPlanCode.includes('TOPB') || expectedPlanCode.includes('SWSR'));

    //Comparison
    await qt2Reporting.validateMandatoryField(t, actualQuoteStatus, expectedQuoteStatus);
    await qt2Reporting.validateMandatoryField(t, actualCustomerType, expectedCustomerType);
    await qt2Reporting.validateMandatoryField(t, actualOfferType, expectedOfferType);
    await qt2Reporting.validateMandatoryField(t, actualPlanCode, expectedPlanCode);

    if (expectedFuelType === FUEL_TYPE_OPTIONS.ELE.value) {
      let expectedNMI = data[0].NMI;
      if (expectedNMI.length !== 0) {
        let actualNMI = jsonObj.saleDetail.offerDetail.nmiMirnInformation.NMI
        await qt2Reporting.validateMandatoryField(t, actualNMI, expectedNMI);
      }
      // //conditions for $50 extensions
      // let isOfferType=(actualOfferType==='ENE' || actualOfferType==='COR');
      // let isCustomerType=(actualCustomerType==='RESIDENTIAL');
      // let isState=(actualState!=='ACT' && actualState!=='SA');
      // let isPlanCode=(!expectedPlanCode.includes('SWSRH'));
      // let isNegativeTestName=((!t.testRun.test.name.includes('elec-totalP') && !t.testRun.test.name.includes('familyandfriends')
      //                         && !t.testRun.test.name.includes('EACorporateOffer')));
      // let isPositiveTestName=(t.testRun.test.name.includes('gas-totalP'));
      // let isPlanCodeWithTestName=(!isPlanCode && (t.testRun.test.name.includes('gas-tpp') || t.testRun.test.name.includes('comeback')));
      // let isPlanCodeWithStateAndTestName=(((!isPlanCode && t.testRun.test.name.includes('gas-tpp')) || isPositiveTestName) && actualState==='SA');
      // let actualEleSourceCode=jsonObj.saleDetail.saleDetailHeader.sourceCode;
      // let expectedEleSourceCode=checkoutDetailsMethod.map.get('ele source code_'+checkoutDetailsMethod.getScenarioId(t));
      // if((isOfferType || (!isOfferType && t.testRun.test.name.includes('gas-tpp'))) && isCustomerType && (isState || isPlanCodeWithStateAndTestName) && (isPlanCode || isPlanCodeWithTestName) && (isPositiveTestName || isNegativeTestName)){
      //   await qt2Reporting.validateMandatoryField(t,actualEleSourceCode,expectedEleSourceCode+'_50');
      // }
      // else{
      //     await qt2Reporting.validateMandatoryField(t,actualEleSourceCode,expectedEleSourceCode);
      // }

      //updated conditions for $50 extensions


      let actualEleSourceCode = jsonObj.saleDetail.saleDetailHeader.sourceCode;
      let expectedEleSourceCode = checkoutDetailsMethod.map.get('ele source code_' + checkoutDetailsMethod.getScenarioId(t));
      if ( isCampaignTest) {
        await qt2Reporting.validateSourceCode(t, actualState, data[0].customerStatus,actualEleSourceCode,data[0].campaign,expectedOfferType,expectedFuelType);
      }else if(isOfferType && !isPlanCode ){
        await qt2Reporting.validateMandatoryField(t, actualEleSourceCode, expectedEleSourceCode+'_25');

      } else {
          await qt2Reporting.validateMandatoryField(t, actualEleSourceCode, expectedEleSourceCode);

      }


    }
    if (expectedFuelType === FUEL_TYPE_OPTIONS.GAS.value) {
      let expectedMIRN = data[0].MIRN;
      if (expectedMIRN.length !== 0) {
        let actualMIRN = jsonObj.saleDetail.offerDetail.nmiMirnInformation.MIRN
        await qt2Reporting.validateMandatoryField(t, actualMIRN, expectedMIRN);
      }
      // //conditions for $50 extensions
      // let isOfferType=(actualOfferType==='ENE' || actualOfferType==='COR');
      // let isCustomerType=(actualCustomerType==='RESIDENTIAL');
      // let isState=(actualState!=='ACT' && actualState!=='SA');
      // let isPlanCode=(!expectedPlanCode.includes('SWSRH'));
      // let isNegativeTestName=(!t.testRun.test.name.includes('gas-totalP'));
      // let isPositiveTestName=(t.testRun.test.name.includes('elec-totalP'));
      // let isPlanCodeWithTestName=(!isPlanCode && t.testRun.test.name.includes('elec-tpp'));
      // let isPlanCodeWithStateAndTestName=(((!isPlanCode && t.testRun.test.name.includes('elec-tpp')) || isPositiveTestName) && actualState==='SA')
      // let actualGasSourceCode=jsonObj.saleDetail.saleDetailHeader.sourceCode;
      // let expectedGasSourceCode=checkoutDetailsMethod.map.get('gas source code_'+checkoutDetailsMethod.getScenarioId(t));
      //
      // if((isOfferType || (!isOfferType && t.testRun.test.name.includes('elec-tpp'))) && isCustomerType && (isState || isPlanCodeWithStateAndTestName) && (isPlanCode || isPlanCodeWithTestName) && (isPositiveTestName || isNegativeTestName)){
      //   await qt2Reporting.validateMandatoryField(t,actualGasSourceCode,expectedGasSourceCode+'_50');
      // }
      // else{
      //     await qt2Reporting.validateMandatoryField(t,actualGasSourceCode,expectedGasSourceCode);
      // }

      //updated conditions for $50 extensions
      let actualGasSourceCode = jsonObj.saleDetail.saleDetailHeader.sourceCode;
      let expectedGasSourceCode = checkoutDetailsMethod.map.get('gas source code_' + checkoutDetailsMethod.getScenarioId(t));
      if (isCampaignTest) {
        await qt2Reporting.validateSourceCode(t, actualState, data[0].customerStatus,actualGasSourceCode,data[0].campaign,expectedGasSourceCode,expectedFuelType);
      } else if(isOfferType && !isPlanCode ){
        await qt2Reporting.validateMandatoryField(t, actualGasSourceCode, expectedGasSourceCode+'_25');
      } else {
        await qt2Reporting.validateMandatoryField(t, actualGasSourceCode, expectedGasSourceCode);
      }
    }

    if (expectedRenovationsSinceDeEnergisation.length !== 0) {
      let actualRenovationsSinceDeEnergisation = jsonObj.saleDetail.offerDetail.energySafeVicQuestions.renovationsSinceDeenergisation;
      let actualRenovationsInProgressOrPlanned = jsonObj.saleDetail.offerDetail.energySafeVicQuestions.renovationsInProgressOrPlanned;
      await qt2Reporting.validateMandatoryField(t, actualRenovationsSinceDeEnergisation, expectedRenovationsSinceDeEnergisation);
      await qt2Reporting.validateMandatoryField(t, actualRenovationsInProgressOrPlanned, expectedRenovationsInProgressOrPlanned);
    }
    if (expectedCustomerWithLifeSupport === 'Y') {
      let actualCustomerWithLifeSupport = jsonObj.saleDetail.offerDetail.energySafeVicQuestions.customerWithLifeSupport;
      await qt2Reporting.validateMandatoryField(t, actualCustomerWithLifeSupport, expectedCustomerWithLifeSupport);
      let expectedLifeSupportEquipmentType = data[0].lifeSupportEquipmentType;
      let actualLifeSupportEquipmentType = jsonObj.saleDetail.offerDetail.lifeSupportEquipment.lifeSupportEquipmentType;
      await qt2Reporting.validateMandatoryField(t, actualLifeSupportEquipmentType, expectedLifeSupportEquipmentType);
    }

    await qt2Reporting.validateMandatoryField(t, actualBillRouteType, expectedBillRouteType);
    if (expectedCustomerType === 'RESIDENTIAL') {
      let expectedPrimaryIdFlag = 'Y'
      let actualPrimaryIdFlag = jsonObj.saleDetail.personDetail.personIdDetail.primaryIdFlag
      await qt2Reporting.validateMandatoryField(t, actualPrimaryIdFlag, expectedPrimaryIdFlag);
    }
    if (expectedCustomerType === 'BUSINESS') {
      let expectedPersonAccountRelationship = 'CUSCON';
      let actualPersonAccountRelationship = jsonObj.saleDetail.personDetail.personAccountRelationship;
      let expectedBusinessNameType = 'PRIM';
      let actualBusinessNameType = jsonObj.saleDetail.businessDetail.businessNameDetail.nameType;
      await qt2Reporting.validateMandatoryField(t, actualPersonAccountRelationship, expectedPersonAccountRelationship);
      await qt2Reporting.validateMandatoryField(t, actualBusinessNameType, expectedBusinessNameType);
    }
    if ((expectedOfferType === 'COR' || expectedOfferType === 'ENE') && expectedCustomerType === 'RESIDENTIAL' && t.testRun.test.name.includes('new')) {
      let expectedConsentForIdValidation = 'Y';
      let actualConsentForIdValidation = jsonObj.saleDetail.personDetail.personIdDetail.idValidationInformation.consentForIdValidation;
      let expectedCreditAssessmentReasonCode = qt2Reporting.getCreditAssessmentValue(t.testRun.test.name.toString());
      let actualCreditAssessmentReasonCode = jsonObj.saleDetail.creditAssessmentReasonCode;
      await qt2Reporting.validateMandatoryField(t, actualConsentForIdValidation, expectedConsentForIdValidation);
      await qt2Reporting.validateMandatoryField(t, actualCreditAssessmentReasonCode, expectedCreditAssessmentReasonCode);
    }
    let expectedCreditAssessmentDecision = qt2Reporting.getCreditAssessmentValue(t.testRun.test.name.toString());
    let actualCreditAssessmentDecision = jsonObj.saleDetail.creditAssessmentDecision
    await qt2Reporting.validateMandatoryField(t, actualCreditAssessmentDecision, expectedCreditAssessmentDecision);

  }

});

