import {Selector } from 'testcafe';

const eaQualifierPage={
  elements: {
    newCustomerBtn:Selector('#isNewEA0 label'),
    existingCustomerBtn:Selector('#isNewEA1 label'),
    accountNumber:Selector('#accNo'),
    accountDetail:Selector('#accPC'),
    existingCustomerAbn:Selector('#option-bus-abnacn-type-abn > span.wg-radio-option-text.ng-binding'),
    existingCustomerAcn:Selector('#option-bus-abnacn-type-acn > span.wg-radio-option-text.ng-binding'),
    abnAcnField:Selector('#abnacn'),
    accountDetailValidate:Selector('#signInResi1 .wg-valid-success'),
    verifyAccountSubmit:Selector('#verifyAccountBtn'),
    idTypeSelectedOption:Selector("#idtype div.sui-select"),
    idTypeDropDown: Selector('div.sui-dropdown sui-option'),
    idTypeDOB: Selector('#idtype sui-option:nth-child(1)'),
    idTypeDOBValue: Selector('#dob-day'),
    idTypeDOBMonthValue: Selector('#dob-month'),
    idTypeDOBYearValue: Selector('#dob-year'),
    idTypeDl: Selector('#idtype sui-option:nth-child(2)'),
    idTypeValue: Selector('#idno'),
    idTypePin: Selector('#idtype sui-option:nth-child(3)'),
    verifyIdentitySubmit:Selector('#verifyingID'),
    nonMoving: Selector('#moveHouse1'),
    moving: Selector('#moveHouse0'),
    //serviceAddress:Selector('#address-auto'),
    serviceAddress:Selector('#connection-address-auto-input'),
    //serviceAddressList:Selector('#address-auto+ ul>li a'),
    serviceAddressList:Selector('#connection-address-auto-autocomplete>ul>li'),
    addressLoadingIcon:Selector('#addrBtn .processing').withText('Loading'),
    addressContinue: Selector('#addrBtn .normal'),
    calendarTable:Selector('#switchDate > div > div > div.testMe.ng-isolate-scope.ng-empty.ng-valid.ng-valid-date-disabled > table > tbody'),
    familyViolenceMessage:Selector('#VerifyID > .wg-alert-error'),
    owner:Selector('#ownerOrTenant0 > button'),
    renter:Selector('#ownerOrTenant1 > button'),
    solarNo:Selector('#hasSolarPanels1 > button'),
    solarYes:Selector('#hasSolarPanels0 > button'),
    isElecInNewAddressQLD_Yes: Selector('#moveElecOn0'),
    isElecInNewAddressQLD_No: Selector('#moveElecOn1'),
    isElecInNewAddressQLD_NotSure: Selector('#moveElecOn2'),
    linkDetailsNotHandy:Selector('#signInDetailsNotHandy'),
    moveElecQLDQuestion:Selector(".move-elec-on__button"),
    btnQualifierClose:Selector("#btn-icon-close"),
    planSelectionPopup:Selector('#modal-heading-wrapper-CHANGE_PLAN_SELECTION_MODAL~div button.ea-modal__secondary-action-link'),
    safetyFlagMsgOnQualifier:Selector("#signIn div.wg-alert"),
    btnBackOnQualifier:Selector("#btn-icon-chevronLeft"),
    headingOnChangePlanSelectionModal:Selector("#modal-heading-CHANGE_PLAN_SELECTION_MODAL"),
    txtInvalidMeterType:Selector("#-error-NMI_BLOCKED"),
    txtAddressNotServiced:Selector("#-error-ADDRESS_NOT_SERVICED"),

  },
};

module.exports=eaQualifierPage;
