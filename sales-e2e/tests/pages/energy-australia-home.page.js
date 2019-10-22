const { config } = require('../../resources/resource');
const Selector = require('testcafe').Selector;

const eaHomePage = {
  pageUrl: config.eaHomePageUrl,
  elements: {
    residentialComparePlansButton: Selector('.icon-GasElectricity'),
    residentialModalWindow: Selector('.tablet-desktop-only #hs-refine-modal-cta'),
    modalVerifyAccountOption: Selector('#hs-verify-account-cta button'),
    modalBillUploadOption: Selector('#hs-bill-upload-cta a'),
    elecAccountNo:Selector('#electricity-account-number'),
    gasAccountNo:Selector('#gas-account-number'),
    postcodeVerifyAccount:Selector('#account-postcode'),
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
    getCostEstimatesChangeButton: Selector('#refineModal .ea-button--primary'),
    changeLinkVerifyAccount: Selector('.tablet-desktop-only .hs-refine-modal-cta__text>span')
  },
};

module.exports = eaHomePage;
