import {Selector} from 'testcafe';

const eaQualifierPage = {
  elements: {
    newCustomerBtn: Selector('#isNewEA0 button'),
    existingCustomerBtn: Selector('#isNewEA1 button'),
    accountNumber: Selector('#accNo'),
    accountDetail: Selector('#accPC'),
    existingCustomerAbn: Selector('#option-bus-abnacn-type-abn > span.wg-radio-option-text.ng-binding'),
    existingCustomerAcn: Selector('#option-bus-abnacn-type-acn > span.wg-radio-option-text.ng-binding'),
    abnAcnField: Selector('#abnacn'),
    accountDetailValidate: Selector('#signInResi1 .wg-valid-success'),
    verifyAccountSubmit: Selector('#verifyAccountBtn'),
    idTypeSelectedOption: Selector("#idtype div.sui-select"),
    idTypeDropDown: Selector('div.sui-dropdown sui-option'),
    idTypeDOB: Selector('#idtype sui-option:nth-child(1)'),
    idTypeDOBValue: Selector('#dob-day'),
    idTypeDOBMonthValue: Selector('#dob-month'),
    idTypeDOBYearValue: Selector('#dob-year'),
    idTypeDl: Selector('#idtype sui-option:nth-child(2)'),
    idTypeValue: Selector('#idno'),
    idTypePin: Selector('#idtype sui-option:nth-child(3)'),
    verifyIdentitySubmit: Selector('#verifyingID'),
    nonMoving: Selector('#moveHouse1 button'),
    moving: Selector('#moveHouse0 button'),
    //serviceAddress:Selector('#address-auto'),
    serviceAddress: Selector('#connection-address-auto-input'),
    //serviceAddressList:Selector('#address-auto+ ul>li a'),
    serviceAddressList: Selector('#connection-address-auto-autocomplete>ul>li'),
    addressLoadingIcon: Selector('#addrBtn .processing').withText('Loading'),
    addressContinue: Selector('#addrBtn .normal'),
    calendarTable: Selector('#switchDate > div > div > div.testMe.ng-isolate-scope.ng-empty.ng-valid.ng-valid-date-disabled > table > tbody'),
    familyViolenceMessage: Selector('#VerifyID > .wg-alert-error'),
    owner: Selector('#ownerOrTenant0 > button'),
    renter: Selector('#ownerOrTenant1 > button'),
    isElecInNewAddressQLD_Yes: Selector('#moveElecOn0 button'),
    isElecInNewAddressQLD_No: Selector('#moveElecOn1 button'),
    isElecInNewAddressQLD_NotSure: Selector('#moveElecOn2 button'),
    linkDetailsNotHandy: Selector('#signInDetailsNotHandy'),
    moveElecQLDQuestion: Selector(".move-elec-on__button"),
    btnQualifierClose: Selector("#btn-icon-close"),
    planSelectionPopup: Selector('#modal-heading-wrapper-CHANGE_PLAN_SELECTION_MODAL~div button.ea-modal__secondary-action-link'),
    safetyFlagMsgOnQualifier: Selector("#signIn div.wg-alert"),
    nswRemoterMeterMsgOnQualifier: Selector("#VerifyID .ea-message__static-message-content"),
    nswRemoterMeterMsgOnCheckoutPage: Selector("#blockerModal [class*='ea-modal__body']"),
    nswRemoterMeterMsgOnQualifierAddressComponent: Selector("#qualifier-step-wrapper-2 .ea-message__static-message-content"),
    verifyIdentityContinueWithGas: Selector("#existingInfo .wg-btn-primary-far.btn-action").nth(2),
    verifyIdentityContinueWithGasAddress: Selector("#addrBtn"),
    linkDetailsNotHandyID: Selector('#VIDDetailsNotHandy'),
    idSelectOptionNswRemote: Selector("#idtype sui-select"),
    btnBackOnQualifier: Selector("#btn-icon-chevronLeft"),
    headingOnChangePlanSelectionModal: Selector("#modal-heading-CHANGE_PLAN_SELECTION_MODAL"),
    txtInvalidMeterType: Selector("#-error-NMI_BLOCKED"),
    txtAddressNotServiced: Selector("#-error-ADDRESS_NOT_SERVICED"),
    solarDetectionErrorLink: Selector("#solar-detection-error a")

  },
};

module.exports = eaQualifierPage;
