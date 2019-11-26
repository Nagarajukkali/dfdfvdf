const { config }=require('../../resources/resource');
import {Selector } from 'testcafe';

const eaHomePage={
  pageUrl: config.eaHomePageUrl,
  elements: {
    residentialComparePlansButton: Selector('.icon-GasElectricity'),
    businessLink:Selector('[class*=\'menu-item--collapsed\'] a[href^=\'/business\']'),
    smallBusinessButton:Selector('a[class*=\'ea-button--primary\'][href*=\'/small\']'),
    ModalWindow: Selector('.tablet-desktop-only #hs-refine-modal-cta'),
    creditCardDisclaimer: Selector('.hs-plan-card-fees'),
    modalVerifyAccountOption: Selector('#hs-verify-account-cta button'),
    modalBillUploadOption: Selector('#hs-bill-upload-cta a'),
    elecAccountNo:Selector('#electricity-account-number'),
    gasAccountNo:Selector('#gas-account-number'),
    postcodeVerifyAccount:Selector('#account-postcode'),
    businessInformation:Selector('#account-abnAcn'),
    nextAccountNumber:Selector('#refineModal .ea-modal__primary-action'),
    backAccountNumber:Selector('#refineModal .ea-modal__secondary-action'),
    idTypeDropDownVerifyAccount: Selector('#identification-selector-active-option'),
    idTypeDOBVerifyAccount: Selector('#edit-identification-selector-dob'),
    idTypeDOBValueVerifyAccount: Selector('#identification-value-dob'),
    idTypeDlVerifyAccount: Selector('#edit-identification-selector-dl'),
    idTypeDlValueVerifyAccount: Selector('#identification-value'),
    idTypePinVerifyAccount: Selector('#edit-identification-selector-pin'),
    usageData_ele: Selector('#hs-electricity-usage-description:first-of-type+div'),
    usageData_gas: Selector('#hs-gas-usage-description:first-of-type+div'),
    getCostEstimatesChangeButton: Selector('#refineModal div.ea-modal__footer.ng-tns-c19-0>.ea-modal__primary-action'),
    familyViolenceMessage: Selector('.ea-message.error:last-of-type'),
    changeLinkVerifyAccount: Selector('.tablet-desktop-only .hs-refine-modal-cta__text>span'),
    totalPlan: Selector('#plan-select-button-TOPH'),
    basicBusiness:Selector('#plan-select-button-BSOT'),
    noFrillBusiness:Selector('#plan-select-button-BCPP'),
    totalPlanBusiness:Selector('#plan-select-button-TOPB'),
    totalPlanPlusBusiness:Selector('#plan-select-button-SWSRB'),
    fuelSelectorOption:Selector('#fuel-selector-active-option'),
    fuelSelectorOptionDual:Selector('#edit-fuel-selector-both'),
    fuelSelectorOptionEle:Selector('#edit-fuel-selector-ele'),
    fuelSelectorOptionGas:Selector('#edit-fuel-selector-gas'),
  },
};

module.exports=eaHomePage;
