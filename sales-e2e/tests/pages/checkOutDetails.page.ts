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
    medicareColorGreen:Selector('.card-option--green span.card-option__label__text'),
    medicareColorBlue:Selector('.card-option--blue span.card-option__label__text'),
    medicareColorYellow:Selector('.card-option--yellow span.card-option__label__text'),
    idMedicareNumber:Selector('#id_number-medicare'),
    idMedicareRef:Selector('#id_reference'),
    idMedicareValidDD:Selector('#id_validTo-day'),
    idMedicareValidMM:Selector('#id_validTo-month'),
    idMedicareValidYYYY:Selector('#id_validTo-year'),
    idMedicareValidYY:Selector('#id_validTo-year+input'),
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
    aahLastName: Selector("#aah_lastname"),
    aahEmail: Selector("#aah_email"),
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
    tfCCExpiryYear: Selector("#creditCardExpiry-year+input"),
    cbCCAgreeTermsAndCond: Selector("#ccAgree span"),
    rbDisconnectionYes:Selector("#option-disconnecting-true"),
    rbDisconnectionNo:Selector("#option-disconnecting-false"),
    rdbEleAccessRestrictionNo:Selector("#option-accessissuesele-false"),
    rdbGasAccessRestrictionNo:Selector("#option-accessissuesgas-false"),
    eleDisconnectionError:Selector("#electricity-disconnection-calendar-error"),
    gasDisconnectionError:Selector("#gas-disconnection-calendar-error"),
    eleDisconnectionCalendar: Selector("#disconnectCalendarEle"),
    gasDisconnectionCalendar: Selector("#disconnectCalendarGas"),
    basicElePlan:Selector("[id*='plan-select-button-RSOT-E']"),
    noFrillsElePlan:Selector("[id*='plan-select-button-RCPP-E']"),
    totalElePlan: Selector("[id*='plan-select-button-TOPH-E']"),
    totalPlanPlusEle:Selector("[id*='plan-select-button-SWSRH-E']"),
    basicEleBusiness:Selector("[id*='plan-select-button-BSOT-E']"),
    noFrillEleBusiness:Selector("[id*='plan-select-button-BCPP-E']"),
    totalElePlanBusiness:Selector("[id*='plan-select-button-TOPB-E']"),
    totalPlanPlusEleBusiness:Selector("[id*=plan-select-button-SWSRB-E']"),
    basicGasPlan:Selector("[id*='plan-select-button-RSOT-G']"),
    noFrillsGasPlan:Selector("[id*='plan-select-button-RCPP-G']"),
    totalGasPlan: Selector("[id*='plan-select-button-TOPH-G']"),
    totalPlanPlusGas:Selector("[id*='plan-select-button-SWSRH-G']"),
    basicGasBusiness:Selector("[id*='plan-select-button-BSOT-G']"),
    noFrillGasBusiness:Selector("[id*='plan-select-button-BCPP-G']"),
    totalGasPlanBusiness:Selector("[id*='plan-select-button-TOPB-G']"),
    totalPlanPlusGasBusiness:Selector("[id*='plan-select-button-SWSRB-G']"),
    txtMySelection:Selector("#connDetailsTitle"),
    plansExpand:Selector(".hs-checkout-plans-selection>.hs-checkout-plans-expanded"),
    chkboxCarbonNeutral:Selector("#carbonNeutralOptIn span"),
    rbBillPrefEmail: Selector("[for*='bill-delivery-method__email-option-value']"),
    rbBillPrefConnectionAddress: Selector("[for*='bill-delivery-method__connection-address-option-value']"),
    rbBillPrefOtherAddress: Selector("[value*='otherAddress'] [class*='wg-radio-option-text']"),
    tfBillPrefOtherAddress: Selector("#bill-delivery-other-address-auto"),
    serviceAddressList: Selector("[ng-form*='bill-delivery-other-address'] a"),
    rbFinalBillPrefEmail: Selector("[for*='final-bill-method__email-option-value']"),
    rbFinalBillPrefConnectionAddress: Selector("#final-bill-method__connection-address-option-value"),
    rbFinalBillPrefOtherAddress: Selector("#final-bill-method__other-address-option [class*='wg-radio-option-text']"),
    tfFinalBillPrefOtherAddress: Selector("#final-bill-other-address-auto"),
    finalBillServiceAddressList: Selector("[ng-form*='final-bill-other-address'] a")
  },
};

module.exports=eaCheckoutDetailsPage;
