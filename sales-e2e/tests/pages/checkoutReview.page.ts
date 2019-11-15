import {Selector } from 'testcafe';

const eaCheckoutReviewPage = {
    elements: {
      lifeSupportHeader: Selector('div[class*=life-support] h4'),
      lifeSupportDisclaimer: Selector('[class*=life-support-disclaimer]'),
      lifeSupportQuestionSection: Selector('[class*=life-support__question-section]'),
      lifeSupportQuestion: Selector('[class$=life-support__question]'),
      lifeSupportQuestionYes: Selector('[for*=edit-life-support-required-yes]'),
      lifeSupportQuestionNo: Selector('[for*=edit-life-support-required-no]'),
      rbLifeSupportYes: Selector('[for*=\'edit-life-support-required-yes\']'),
      rbLifeSupportNo: Selector('[for*=\'edit-life-support-required-no\']'),
      lifeSupportElec: Selector('#ele-life-support'),
      lifeSupportGas: Selector('#gas-life-support'),
      btnRegisterDeviceElec: Selector('[id*=\'ele-life-support-register\'] button'),
      btnRegisterDeviceGas: Selector('[id*=\'gas-life-support-register\'] button'),
      reviewYourOfferTxt:Selector('.review-order.ng-star-inserted>h2'),
      agreeAndConfirm: Selector('#reviewAgreeConfirmButton > span'),
      cbEleDevice_LSCNSPE: Selector('[for*=\'ELE-LSCNSPE\']'),
      cbEleDevice_LSCPAPR: Selector('[for*=\'ELE-LSCPAPR\']'),
      cbEleDevice_LSIPDM: Selector('[for*=\'ELE-LSIPDM\']'),
      cbEleDevice_LSKDM: Selector('[for*=\'ELE-LSKDM\']'),
      cbEleDevice_LSOC: Selector('[for*=\'ELE-LSOC\']'),
      cbEleDevice_LSVFLS: Selector('[for*=\'ELE-LSVFLS\']'),
      cbEleDevice_OTHER: Selector('[for*=\'ELE-OTHER\']'),
      cbGasDevice_GLSMRHAC: Selector('[for*=\'GAS-GLSMRHAC\']'),
      cbGasDevice_GLSMRHW: Selector('[for*=\'GAS-GLSMRHW\']'),
      cbGasDevice_OTHER: Selector('[for*=\'GAS-OTHER\']'),
      tfOtherEquipmentDetailsElec: Selector('#ele-otherEquipmentDetails'),
      tfOtherEquipmentDetailsGas: Selector('#gas-otherEquipmentDetails')

    }
}

module.exports = eaCheckoutReviewPage;
