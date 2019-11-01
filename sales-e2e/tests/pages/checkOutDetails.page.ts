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
    idValueDriverLicense:Selector('[id=\'id_type\'] [class*=\'sui-dropdown\'] sui-option:nth-of-type(1)'),
    idValuePassport:Selector('[id=\'id_type\'] [class*=\'sui-dropdown\'] sui-option:nth-of-type(2)'),
    idValueMedicare:Selector('[id=\'id_type\'] [class*=\'sui-dropdown\'] sui-option:nth-of-type(3)'),
    idNumbder:Selector('id_number'),
    idCountry:Selector('#id_country+input'),
  },
};

module.exports = eaCheckoutDetailsPage;
