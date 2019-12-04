import {Selector } from 'testcafe';

const eaCheckoutDetailsPage={
  elements: {
    myDetailsHeaderText:Selector('#myDetailsTitle'),
    titleDropdown:Selector('#title sui-select>div'),
    titleDrop:Selector('#title div.sui-select>span'),
    titleTag:Selector("div[title*='Please select'] sui-option").nth(0),
    firstName:Selector('#firstname'),
    lastName:Selector('#lastname'),
    dobDay:Selector('#dob-day'),
    dobMonth:Selector('#dob-month'),
    dobYear:Selector('#dob-year'),
    email:Selector('#contactDetails #email'),
    phone:Selector('#contactDetails #phone'),
    idDrop:Selector('#id_type sui-select'),
    idValueDriverLicense:Selector('#id_type .sui-dropdown sui-option:nth-of-type(1)'),
    idValuePassport:Selector('#id_type .sui-dropdown sui-option:nth-of-type(2)'),
    idValueMedicare:Selector('#id_type .sui-dropdown sui-option:nth-of-type(3)'),
    idNumber:Selector('#id_number'),
    idLicenseNumber:Selector('#id_number-licence'),
    idPassportNumber:Selector('#id_number-passport'),
    idCountry:Selector('#id_country+input'),
    medicareColor:Selector('.card-option--green span.card-option__label__text'),
    idMedicareNumber:Selector('#id_number-medicare'),
    idMedicareRef:Selector('#id_reference'),
    idMedicareValidMM:Selector('#id_validTo-month'),
    idMedicareValidYYYY:Selector('#id_validTo-year'),
    electricityAccessNo:Selector('#option-accessissuesele-false'),
    gasAccessNo: Selector('#option-accessissuesgas-false'),
    reviewYourOrderBtn:Selector('#reviewYourOrderButton'),
    ABN:Selector('#option-bus-abnacn-type-abn>span.wg-radio-option-text'),
    ACN:Selector('#option-bus-abnacn-type-acn>span.wg-radio-option-text'),
    number_ABNACN:Selector('#busABNACNNumber'),
    company:Selector('#busCompanyName'),
    businessType:Selector('#businessType sui-select'),
    businessTypeOption:Selector('#businessType sui-option:nth-of-type(6)'),
    anzsicCode:Selector('#anzsic sui-select'),
    anzsicCodeOption:Selector('#anzsic sui-option:nth-of-type(6)'),
    prevHomeImproveNo:Selector('#option-prev-home-improve-false'),
    planHomeImproveNo:Selector('#option-plan-home-improve-false'),
    renovationNo:Selector('#option-prev-or-planned-home-improve-disconnect-false'),
    addAAH: Selector("#additional-account-holder__add"),
    aahFirstName: Selector("#aah_firstname"),
    aahLastName: Selector("aah_lastname"),
    aahEmail: Selector("aah_email"),
    aahPermissionLvl1: Selector("#select-1"),
    aahPermissionLvl2: Selector("#select-2"),
    aahPermissionLvl3: Selector("#select-3"),
    addDirectDebit: Selector("#direct-debit__add"),
    tfBankAccountName: Selector("#bankAccountName"),
    tfBsb: Selector("#bsb"),
    tfBankAccountNumber: Selector("#bankAccountNumber"),
    cbBankAccountAgreeTermsAndCond: Selector("#baAgree span"),
    useCC: Selector("div[class*='direct-debit-form'] div[class='side-right']"),
    tfCCName: Selector("#creditCardName"),
    tfCCNumber: Selector("#creditCardNumber"),
    tfCCExpiryMonth: Selector("#creditCardExpiry-month"),
    tfCCExpiryYear: Selector("#creditCardExpiry-month"),
    cbCCAgreeTermsAndCond: Selector("#ccAgree"),
    eleDisconnectionYes:Selector("#option-disconnecting-true"),
    eleDisconnectionNo:Selector("#option-disconnecting-false"),
    eleAccessRestrictionNo:Selector("#option-accessissuesele-false"),
    gasAccessRestrictionNo:Selector("#option-accessissuesgas-false"),
    disconnectionCalendarError:Selector("#electricity-disconnection-calendar-error"),
    basicElePlan:Selector('#plan-select-button-RSOT-E'),
    noFrillsElePlan:Selector('#plan-select-button-RCPP-E'),
    totalElePlan: Selector('#plan-select-button-TOPH-E'),
    totalPlanPlusEle:Selector('#plan-select-button-SWSRR-E'),
    basicEleBusiness:Selector('#plan-select-button-BSOT-E'),
    noFrillEleBusiness:Selector('#plan-select-button-BCPP-E'),
    totalElePlanBusiness:Selector('#plan-select-button-TOPB-E'),
    totalPlanPlusEleBusiness:Selector('#plan-select-button-SWSRB-E'),
    basicGasPlan:Selector('#plan-select-button-RSOT-G'),
    noFrillsGasPlan:Selector('#plan-select-button-RCPP-G'),
    totalGasPlan: Selector('#plan-select-button-TOPH-G'),
    totalPlanPlusGas:Selector('#plan-select-button-SWSRR-E'),
    basicGasBusiness:Selector('#plan-select-button-BSOT-G'),
    noFrillGasBusiness:Selector('#plan-select-button-BCPP-G'),
    totalGasPlanBusiness:Selector('#plan-select-button-TOPB-G'),
    totalPlanPlusGasBusiness:Selector('#plan-select-button-SWSRB-G'),
  },
};

module.exports=eaCheckoutDetailsPage;
