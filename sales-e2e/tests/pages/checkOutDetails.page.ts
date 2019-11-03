import {Selector } from 'testcafe';

const eaCheckoutDetailsPage = {
  elements: {
    myDetailsHeaderText:Selector('#myDetailsTitle'),
    titleDropdown:Selector('#title sui-select>div'),
    titleDrop:Selector('#title div.sui-select>span'),
    titleTag:Selector('div[title*=\'Please select\'] sui-option').nth(0),
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
    idCountry:Selector('#id_country+input'),
    medicareColor:Selector('.card-option--green span.card-option__label__text'),
    idMedicareNumber:Selector('#id_number-medicare'),
    idMedicareRef:Selector('#id_reference'),
    idMedicareValidMM:Selector('#id_validTo-month'),
    idMedicareValidYYYY:Selector('#id_validTo-year'),
    reviewYourOrderBtn:Selector('#reviewYourOrderButton'),
    ABN:Selector('#option-bus-abnacn-type-abn>span.wg-radio-option-text'),
    ACN:Selector('#option-bus-abnacn-type-acn>span.wg-radio-option-text'),
    number_ABNACN:Selector('#busABNACNNumber'),
    company:Selector('#busCompanyName'),
    businessType:Selector('#businessType sui-select'),
    businessTypeOption:Selector('#businessType sui-option:nth-of-type(6)'),
    anzsicCode:Selector('#anzsic sui-select'),
    anzsicCodeOption:Selector('#anzsic sui-option:nth-of-type(6)'),
  },
};

module.exports = eaCheckoutDetailsPage;
