import {Selector } from 'testcafe';

const eaCheckoutReviewPage={
    elements: {
      lifeSupportHeader: Selector('div[class*=life-support] h4'),
      lifeSupportDisclaimer: Selector('[class*=life-support-disclaimer]'),
      lifeSupportQuestionSection: Selector('[class*=life-support__question-section]'),
      lifeSupportQuestion: Selector('[class$=life-support__question]'),
      lifeSupportQuestionYes: Selector('[for*=edit-life-support-required-yes]'),
      lifeSupportQuestionNo: Selector('[for*=edit-life-support-required-no]'),
      lifeSupportElec: Selector('#ele-life-support'),
      lifeSupportGas: Selector('#gas-life-support'),
      btnRegisterDeviceElec: Selector("[id*='ele-life-support-register'] button"),
      btnRegisterDeviceGas: Selector("[id*='gas-life-support-register'] button"),
      reviewYourOfferTxt:Selector('.review-order.ng-star-inserted>h2'),
      agreeAndConfirm: Selector('#reviewAgreeConfirmButton > span'),
      cbEleDevice_LSCNSPE: Selector("[for*='ELE-LSCNSPE']"),
      cbEleDevice_LSCPAPR: Selector("[for*='ELE-LSCPAPR']"),
      cbEleDevice_LSIPDM: Selector("[for*='ELE-LSIPDM']"),
      cbEleDevice_LSKDM: Selector("[for*='ELE-LSKDM']"),
      cbEleDevice_LSOC: Selector("[for*='ELE-LSOC']"),
      cbEleDevice_LSVFLS: Selector("[for*='ELE-LSVFLS']"),
      cbEleDevice_OTHER: Selector("[for*='ELE-OTHER']"),
      cbGasDevice_GLSMRHAC: Selector("[for*='GAS-GLSMRHAC']"),
      cbGasDevice_GLSMRHW: Selector("[for*='GAS-GLSMRHW']"),
      cbGasDevice_OTHER: Selector("[for*='GAS-OTHER']"),
      tfOtherEquipmentDetailsElec: Selector('#ele-otherEquipmentDetails'),
      tfOtherEquipmentDetailsGas: Selector('#gas-otherEquipmentDetails'),
      lblGenericError: Selector('div.generic-error'),
      lblElecOtherFieldError: Selector("[id='ele-life-support'] div.ea-field-errors"),
      lblGasOtherFieldError: Selector("[id='gas-life-support'] div.ea-field-errors"),
      btnCancelElec: Selector("div#ele-life-support-cancel button[aria-label*='cancel']"),
      btnCancelGas: Selector("div#gas-life-support-cancel button[aria-label*='cancel']"),
      existingEleLifeSupportSection:Selector("#record-ele-life-support"),
      existingGasLifeSupportSection:Selector("#record-gas-life-support"),
      eleTextOnLifeSupportSection:Selector("#record-ele-life-support-fuel-text"),
      gasTextOnLifeSupportSection:Selector("#record-gas-life-support-fuel-text"),
      eleLifesupportStatus:Selector("#record-ele-life-support-status-text"),
      gasLifesupportStatus:Selector("#record-gas-life-support-status-text"),
      imgReviewSectionEle:Selector("#reviewSectionEle button[id*='eui-accordion-header']>img"),
      imgReviewSectionGas:Selector("#reviewSectionGas button[id*='eui-accordion-header']>img"),
      txtEleDiscount:Selector("#reviewSectionEle div.review-plan__plan-rates div[id*='charge-before-discount']+div"),
      txtGasDiscount:Selector("#reviewSectionGas div.review-plan__plan-rates div[id*='charge-before-discount']+div"),
      txtElePlanName:Selector('#reviewSectionEle div.review-plan__title--planName'),
      txtGasPlanName:Selector('#reviewSectionGas div.review-plan__title--planName'),
    }
}

module.exports=eaCheckoutReviewPage;
