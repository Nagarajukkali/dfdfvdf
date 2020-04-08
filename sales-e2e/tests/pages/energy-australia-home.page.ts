const { config }=require('../../resources/resource');
import {Selector } from 'testcafe';

const eaHomePage={
  pageUrl: config.eaHomePageUrl,
  newConnectionPageUrl: config.eaNewConnectionPageUrl,
  campaignPageUrl: config.eaCampaignUrl,
  elements: {
    selectedState: Selector("#navbar div[class*='state-value']"),
    residentialComparePlansButton: Selector('.icon-GasElectricity'),
    plansCardFee:Selector("div.hs-plan-fees__card"),
    businessLink:Selector("[class*='menu-item--collapsed'] a[href^='/business']"),
    smallBusinessButton:Selector("a[class*='ea-button--primary'][href*='/small']"),
    ModalWindow: Selector('.tablet-desktop-only #hs-refine-modal-cta'),
    creditCardDisclaimer: Selector('.hs-plan-card-fees'),
    modalVerifyAccountOption: Selector('#hs-verify-account-cta button'),
    modalBillUploadOption: Selector('#hs-bill-upload-cta a'),
    elecAccountNo:Selector('#electricity-account-number'),
    gasAccountNo:Selector('#gas-account-number'),
    postcodeVerifyAccount:Selector('#account-postcode'),
    businessInformation:Selector('#account-abnAcn'),
    nextAccountNumber:Selector('#refineModal .ea-modal__primary-action'),
    eaSpinner:Selector(".ea-spinner.ng-star-inserted"),
    backAccountNumber:Selector('#refineModal .ea-modal__secondary-action'),
    idTypeDropDownVerifyAccount: Selector('#identification-selector-active-option'),
    idTypeDOBVerifyAccount: Selector('#edit-identification-selector-dob'),
    idTypeDOBValueVerifyAccount: Selector('#identification-value-dob'),
    idTypeDlVerifyAccount: Selector('#edit-identification-selector-dl'),
    idTypeDlValueVerifyAccount: Selector('#identification-value'),
    idTypePinVerifyAccount: Selector('#edit-identification-selector-pin'),
    usageData_ele: Selector('#hs-electricity-usage-description:first-of-type+div'),
    usageData_gas: Selector('#hs-gas-usage-description:first-of-type+div'),
    getCostEstimatesChangeButton: Selector('#modal-heading-wrapper-refineModal~div.ea-modal__footer>.ea-modal__primary-action'),
    familyViolenceMessage: Selector('.ea-message.error:last-of-type'),
    changeLinkVerifyAccount: Selector('.tablet-desktop-only .hs-refine-modal-cta__text>span'),
    basicPlan: Selector("[id*='plan-select-button-RSOT']"),
    noFrillsPlan: Selector("[id*='plan-select-button-RCPP']"),
    totalPlan: Selector("[id*='plan-select-button-TOPH']"),
    totalPlanEleDiscount:Selector("#plan-rate-summary-TOPH-0 span.hs-plan-rate-summary__title-amount"),
    totalPlanGasDiscount:Selector("#plan-rate-summary-TOPH-1 span.hs-plan-rate-summary__title-amount"),
    totalPlanPlus: Selector("[id*='plan-select-button-SWSRH']"),
    totalPlanPlusEleDiscount:Selector("#plan-rate-summary-SWSRH-0 span.hs-plan-rate-summary__title-amount"),
    totalPlanPlusGasDiscount:Selector("#plan-rate-summary-SWSRH-1 span.hs-plan-rate-summary__title-amount"),
    basicBusiness:Selector('#plan-select-button-BSOT'),
    noFrillBusiness:Selector('#plan-select-button-BCPP'),
    totalPlanBusiness:Selector('#plan-select-button-TOPB'),
    totalPlanBusinessEleDiscount:Selector("#plan-rate-summary-TOPB-0 span.hs-plan-rate-summary__title-amount"),
    totalPlanBusinessGasDiscount:Selector("#plan-rate-summary-TOPB-1 span.hs-plan-rate-summary__title-amount"),
    totalPlanPlusBusiness:Selector('#plan-select-button-SWSRB'),
    totalPlanPlusBusinessEleDiscount:Selector("#plan-rate-summary-SWSRB-0 span.hs-plan-rate-summary__title-amount"),
    totalPlanPlusBusinessGasDiscount:Selector("#plan-rate-summary-SWSRB-1 span.hs-plan-rate-summary__title-amount"),
    fuelSelectorOption:Selector('#fuel-selector-active-option'),
    fuelSelectorOptionDual:Selector('#edit-fuel-selector-both'),
    fuelSelectorOptionEle:Selector('#edit-fuel-selector-ele'),
    fuelSelectorOptionGas:Selector('#edit-fuel-selector-gas'),
    linkMoveHouse:Selector(".icon-moving"),
    postcodeOnCampaignPage:Selector("#campaign-postcode-input"),
    btnCampaignSearch:Selector("[id^='campaign-search-submit']"),
    selectCampaignPlans:Selector("#action__submit"),
  },
};

module.exports=eaHomePage;
