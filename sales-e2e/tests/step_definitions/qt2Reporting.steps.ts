import {When} from "cucumber";
import {qt2Reporting} from '../methods/qt2Reporting';
import {Then} from 'cucumber'
const fileUtils=require('../../libs/FileUtils.js');
import {plansMethod} from '../methods//plansPage';
import {FUEL_TYPE_OPTIONS} from '@ea/ea-commons-models';
import {checkoutDetailsMethod} from '../methods/checkoutDetailsPage';

When(/^user logs in to qt2 reporting using '(.*)' and '(.*)'$/, async function(t, [username, password]) {
  await qt2Reporting.loginToqt2Reporting(t,username,password);
});

When(/^user search quote on the basis of '(.*)'$/, async function (t,[option]) {
  await qt2Reporting.searchEleQuote(t,option);
});
Then(/^submitted quote is displayed$/, async function (t) {
  await qt2Reporting.verifySubmittedQuote(t);
});

Then(/^user validates all the details for '(.*)' submitted quote$/, async function (t,[fuelType]) {
  await qt2Reporting.validateQuoteDetails(t,fuelType);
});
Then(/^user validates below mandatory fields$/, async function (t,[],dataTable) {
  let data=dataTable.hashes();
  let fuelType=data[0].fuelType;
  let quoteStatus=data[0].quoteStatus;
  let customerType=data[0].customerType;
  let offerType=data[0].offerType;
  let planCode=data[0].planCode;
  let renovationsSinceDeenergisation=data[0].renovationsSinceDeenergisation;
  let renovationsInProgressOrPlanned=data[0].renovationsInProgressOrPlanned;
  let customerWithLifeSupport=data[0].customerWithLifeSupport
  let billRouteType=data[0].billRouteType;
  let jsonObj=fileUtils.convertYmlTOJSONObj(t,fuelType);
  await qt2Reporting.validateMandatoryField(t,jsonObj.saleDetail.saleDetailHeader.quoteStatus,quoteStatus);
  await qt2Reporting.validateMandatoryField(t,jsonObj.saleDetail.saleDetailHeader.customerType,customerType);
  await qt2Reporting.validateMandatoryField(t,jsonObj.saleDetail.offerDetail.offerType,offerType);
  await qt2Reporting.validateMandatoryField(t,jsonObj.saleDetail.offerDetail.plan,planCode);
  if(fuelType===FUEL_TYPE_OPTIONS.ELE.value){
    let NMI=data[0].NMI;
    await qt2Reporting.validateMandatoryField(t,jsonObj.saleDetail.offerDetail.nmiMirnInformation.NMI,NMI);
    if(jsonObj.saleDetail.offerDetail.offerType==='ENE'){
      await qt2Reporting.validateMandatoryField(t,jsonObj.saleDetail.saleDetailHeader.sourceCode,checkoutDetailsMethod.map.get('ele source code')+'_50');
    }
    else{
      await qt2Reporting.validateMandatoryField(t,jsonObj.saleDetail.saleDetailHeader.sourceCode,checkoutDetailsMethod.map.get('ele source code'));
    }
  }
  if(fuelType===FUEL_TYPE_OPTIONS.GAS.value){
    let MIRN=data[0].MIRN;
    await qt2Reporting.validateMandatoryField(t,jsonObj.saleDetail.offerDetail.nmiMirnInformation.MIRN,MIRN);
    if(jsonObj.saleDetail.offerDetail.offerType==='ENE'){
      await qt2Reporting.validateMandatoryField(t,jsonObj.saleDetail.saleDetailHeader.sourceCode,checkoutDetailsMethod.map.get('gas source code')+'_50');
    }
    else{
      await qt2Reporting.validateMandatoryField(t,jsonObj.saleDetail.saleDetailHeader.sourceCode,checkoutDetailsMethod.map.get('gas source code'));
    }
  }
  await qt2Reporting.validateMandatoryField(t,jsonObj.saleDetail.offerDetail.energySafeVicQuestions.renovationsSinceDeenergisation,renovationsSinceDeenergisation);
  await qt2Reporting.validateMandatoryField(t,jsonObj.saleDetail.offerDetail.energySafeVicQuestions.renovationsInProgressOrPlanned,renovationsInProgressOrPlanned);
  if(customerWithLifeSupport==='Y'){
    await qt2Reporting.validateMandatoryField(t,jsonObj.saleDetail.offerDetail.energySafeVicQuestions.customerWithLifeSupport,'Y');
    let lifeSupportEquipmentType=data[0].lifeSupportEquipmentType;
    await qt2Reporting.validateMandatoryField(t,jsonObj.saleDetail.offerDetail.lifeSupportEquipment.lifeSupportEquipmentType,lifeSupportEquipmentType);
  }
  await qt2Reporting.validateMandatoryField(t,jsonObj.saleDetail.billDeliveryDetail.billRouteType,billRouteType);
  await qt2Reporting.validateMandatoryField(t,jsonObj.saleDetail.personDetail.personIdDetail.primaryIdFlag,'Y');
  await qt2Reporting.validateMandatoryField(t,jsonObj.saleDetail.personDetail.personIdDetail.idValidationInformation.consentForIdValidation,'Y');
  await qt2Reporting.validateMandatoryField(t,jsonObj.saleDetail.creditAssessmentDecision,'Accept');
  await qt2Reporting.validateMandatoryField(t,jsonObj.saleDetail.creditAssessmentReasonCode,'Accept');
  if(jsonObj.saleDetail.offerDetail.energySafeVicQuestions.customerWithLifeSupport==='Y'){

  }

});
