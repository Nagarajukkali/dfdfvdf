import {Selector} from 'testcafe';

const eaQualifierPage = {
  elements: {
    newCustomerBtn: Selector('#edit-new-existing-new__label'),
    existingCustomerBtn: Selector('#edit-new-existing-existing__label'),
    accountNumber: Selector('#account-number'),
    accountDetail: Selector('#postcode'),
    abnAcnField: Selector('#abnAcn'),
    accountDetailValidate: Selector("[class*='hs-qualifier__navigation'] button[class*='ea-button--primary']"),
    verifyAccountSubmit: Selector("[class*='hs-qualifier__navigation'] button[class*='ea-button--primary']"),
    idTypeSelectedOption: Selector("#idtype div.sui-select"),
    idTypeDOBRadio: Selector('#edit-idtype-dob__label > span'),
    idTypeDLRadio: Selector('#edit-idtype-dl__label > span'),
    idTypePinRadio: Selector('#edit-idtype-pin__label > span'),
    idTypePassportRadio: Selector('#edit-idtype-passport__label > span'),
    idTypeMedicareRadio: Selector('#edit-idtype-medicare__label > span'),
    idValue: Selector('#idValue'),
    verifyIdentitySubmit: Selector("[class*='hs-qualifier__navigation'] button[class*='ea-button--primary']"),
    nonMoving: Selector('#edit-moving-or-not-no__label span'),
    moving: Selector('#edit-moving-or-not-yes__label span'),
    serviceAddress: Selector('#qualifier-connection-address-auto-input'),
    serviceAddressList: Selector('#qualifier-connection-address-auto-autocomplete>ul>li'),
    calendarTable: Selector(' #qualifier-connection-datepicker table > tbody'),
    btnNextMonth: Selector("#qualifier-connection-datepicker > span > div > div > div > button"),
    familyViolenceMessage: Selector('#VerifyID > .wg-alert-error'),
    owner: Selector('#edit-customer-property-relationship-owner__label > span'),
    renter: Selector('#edit-customer-property-relationship-renter__label > span'),
    isElecInNewAddressQLD_Yes: Selector('#edit-queensland-energised-questions-yes__label'),
    isElecInNewAddressQLD_No: Selector('#edit-queensland-energised-questions-no__label'),
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
    solarDetectionErrorLink: Selector("#solar-detection-error a"),
    btnContinueOnQualifier: Selector("div.hs-qualifier__navigation >button.hs-qualifier__submit"),
    qldenenergisedyes: Selector("#edit-queensland-energised-questions-yes__label"),
    movingOptionSelected: Selector("#edit-moving-or-not-yes__label.ea-radio-button-group__label.ea-state-active"),
    datePickerSelected: Selector("div.ea-datepicker-selected"),
    selectNewPlan: Selector("button#ea-modal-primary-action-CHANGE_PLAN_SELECTION_MODAL"),
  },
};

module.exports = eaQualifierPage;
