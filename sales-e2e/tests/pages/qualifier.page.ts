import {Selector } from 'testcafe';

const eaQualifierPage = {
  elements: {
    newCustomerBtn:Selector('#isNewEA0 label'),
    existingCustomerBtn:Selector('#isNewEA1 label'),
    accountNumber:Selector('#accNo'),
    accountDetail:Selector('#accPC'),
    accountDetailValidate:Selector('#signInResi1 .wg-valid-success'),
    verifyAccountSubmit:Selector('#verifyAccountBtn'),
    idTypeDropDown: Selector('#idtype div.sui-select'),
    idTypeDOB: Selector('#idtype sui-option:nth-child(1)'),
    idTypeDOBValue: Selector('#dob-day'),
    idTypeDl: Selector('#idtype sui-option:nth-child(2)'),
    idTypeDlValue: Selector('#idno'),
    idTypePin: Selector('#idtype sui-option:nth-child(3)'),
    verifyIdentitySubmit:Selector('#verifyingID'),
    nonMoving: Selector('#moveHouse1'),
    moving: Selector('#moveHouse0'),
    serviceAddress:Selector('#address-auto'),
    serviceAddressList:Selector('#address-auto+ ul>li a'),
    addressLoadingIcon:Selector('#addrBtn .processing').withText('Loading'),
    addressContinue: Selector('#addrBtn .normal'),
    calendarTable:Selector('#switchDate > div > div > div.testMe.ng-isolate-scope.ng-empty.ng-valid.ng-valid-date-disabled > table > tbody'),
    familyViolenceMessage:Selector('#VerifyID > .wg-alert-error'),
    owner:Selector('#ownerOrTenant0 > button'),
    renter:Selector('#ownerOrTenant1 > button'),
    solarNo:Selector('#hasSolarPanels1 > button'),
    solarYes:Selector('#hasSolarPanels0 > button'),
  },
};

module.exports = eaQualifierPage;
