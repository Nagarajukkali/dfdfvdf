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
    if(!t.testRun.test.name.includes('FRMP/FRO as UNKNOWN')){
      let NMI=data[0].NMI;
      if(NMI.length!==0){
        await qt2Reporting.validateMandatoryField(t,jsonObj.saleDetail.offerDetail.nmiMirnInformation.NMI,NMI);
      }
    }
    if((jsonObj.saleDetail.offerDetail.offerType==='ENE' || jsonObj.saleDetail.offerDetail.offerType==='COR') && jsonObj.saleDetail.saleDetailHeader.customerType==='RESIDENTIAL' && jsonObj.saleDetail.premiseDetail.state!=='ACT' && jsonObj.saleDetail.premiseDetail.state!=='SA' && !planCode.includes('SWSRH') && !t.testRun.test.name.includes('elec-totalP') && !t.testRun.test.name.includes('familyandfriends') && !t.testRun.test.name.includes('EACorporateOffer')){
      await qt2Reporting.validateMandatoryField(t,jsonObj.saleDetail.saleDetailHeader.sourceCode,checkoutDetailsMethod.map.get('ele source code_'+checkoutDetailsMethod.getScenarioId(t))+'_50');
    }
    else{
      if(t.testRun.test.name.includes('gas-tpp') || t.testRun.test.name.includes('gas-totalP') || t.testRun.test.name.includes('comeback')){
        await qt2Reporting.validateMandatoryField(t,jsonObj.saleDetail.saleDetailHeader.sourceCode,checkoutDetailsMethod.map.get('ele source code_'+checkoutDetailsMethod.getScenarioId(t))+'_50');
      }
      else{
        await qt2Reporting.validateMandatoryField(t,jsonObj.saleDetail.saleDetailHeader.sourceCode,checkoutDetailsMethod.map.get('ele source code_'+checkoutDetailsMethod.getScenarioId(t)));
      }
    }
  }
  if(fuelType===FUEL_TYPE_OPTIONS.GAS.value){
    if(!t.testRun.test.name.includes('FRMP/FRO as UNKNOWN')){
      let MIRN=data[0].MIRN;
      if(MIRN.length!==0){
        await qt2Reporting.validateMandatoryField(t,jsonObj.saleDetail.offerDetail.nmiMirnInformation.MIRN,MIRN);
      }
    }
    if((jsonObj.saleDetail.offerDetail.offerType==='ENE' || jsonObj.saleDetail.offerDetail.offerType==='COR') && jsonObj.saleDetail.saleDetailHeader.customerType==='RESIDENTIAL' && jsonObj.saleDetail.premiseDetail.state!=='ACT' && jsonObj.saleDetail.premiseDetail.state!=='SA' && !planCode.includes('SWSRH') && !t.testRun.test.name.includes('gas-totalP')){
      await qt2Reporting.validateMandatoryField(t,jsonObj.saleDetail.saleDetailHeader.sourceCode,checkoutDetailsMethod.map.get('gas source code_'+checkoutDetailsMethod.getScenarioId(t))+'_50');
    }
    else{
      if((t.testRun.test.name.includes('elec-tpp') || t.testRun.test.name.includes('elec-totalP'))){
        await qt2Reporting.validateMandatoryField(t,jsonObj.saleDetail.saleDetailHeader.sourceCode,checkoutDetailsMethod.map.get('gas source code_'+checkoutDetailsMethod.getScenarioId(t))+'_50');
      }
      else{
        await qt2Reporting.validateMandatoryField(t,jsonObj.saleDetail.saleDetailHeader.sourceCode,checkoutDetailsMethod.map.get('gas source code_'+checkoutDetailsMethod.getScenarioId(t)));
      }
    }
  }
  // Campaign testing
  // if((t.testRun.test.name.includes('elec-tpp') || t.testRun.test.name.includes('elec-totalP')) && fuelType===FUEL_TYPE_OPTIONS.GAS.value){
  //   await qt2Reporting.validateMandatoryField(t,jsonObj.saleDetail.saleDetailHeader.sourceCode,checkoutDetailsMethod.map.get('gas source code_'+checkoutDetailsMethod.getScenarioId(t))+'_50');
  // }
  // if((t.testRun.test.name.includes('gas-tpp') || t.testRun.test.name.includes('gas-totalP')) && fuelType===FUEL_TYPE_OPTIONS.ELE.value){
  //   await qt2Reporting.validateMandatoryField(t,jsonObj.saleDetail.saleDetailHeader.sourceCode,checkoutDetailsMethod.map.get('ele source code_'+checkoutDetailsMethod.getScenarioId(t))+'_50');
  // }
  // if(t.testRun.test.name.includes('comeback') && fuelType===FUEL_TYPE_OPTIONS.ELE.value){
  //   await qt2Reporting.validateMandatoryField(t,jsonObj.saleDetail.saleDetailHeader.sourceCode,checkoutDetailsMethod.map.get('ele source code_'+checkoutDetailsMethod.getScenarioId(t))+'_50');
  // }
  if(renovationsSinceDeenergisation.length!==0){
    await qt2Reporting.validateMandatoryField(t,jsonObj.saleDetail.offerDetail.energySafeVicQuestions.renovationsSinceDeenergisation,renovationsSinceDeenergisation);
    await qt2Reporting.validateMandatoryField(t,jsonObj.saleDetail.offerDetail.energySafeVicQuestions.renovationsInProgressOrPlanned,renovationsInProgressOrPlanned);
  }
  if(customerWithLifeSupport==='Y'){
    await qt2Reporting.validateMandatoryField(t,jsonObj.saleDetail.offerDetail.energySafeVicQuestions.customerWithLifeSupport,'Y');
    let lifeSupportEquipmentType=data[0].lifeSupportEquipmentType;
    await qt2Reporting.validateMandatoryField(t,jsonObj.saleDetail.offerDetail.lifeSupportEquipment.lifeSupportEquipmentType,lifeSupportEquipmentType);
  }
  await qt2Reporting.validateMandatoryField(t,jsonObj.saleDetail.billDeliveryDetail.billRouteType,billRouteType);
  if(customerType==='RESIDENTIAL'){
    await qt2Reporting.validateMandatoryField(t,jsonObj.saleDetail.personDetail.personIdDetail.primaryIdFlag,'Y');
  }
  if(customerType==='BUSINESS'){
    await qt2Reporting.validateMandatoryField(t,jsonObj.saleDetail.personDetail.personAccountRelationship,'CUSCON');
    await qt2Reporting.validateMandatoryField(t,jsonObj.saleDetail.businessDetail.businessNameDetail.nameType,'PRIM');
  }
  if(jsonObj.saleDetail.offerDetail.offerType==='COR' && customerType==='RESIDENTIAL'){
    await qt2Reporting.validateMandatoryField(t,jsonObj.saleDetail.personDetail.personIdDetail.idValidationInformation.consentForIdValidation,'Y');
    await qt2Reporting.validateMandatoryField(t,jsonObj.saleDetail.creditAssessmentReasonCode,'Accept');
  }
  await qt2Reporting.validateMandatoryField(t,jsonObj.saleDetail.creditAssessmentDecision,'Accept');

});
