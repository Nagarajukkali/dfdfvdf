import {Selector } from 'testcafe';

const moveHouse={
  elements: {
    linkExistingCustomer: Selector('#tab-17006'),
    linkNewCustomer: Selector('#tab-16926'),
    btnEnterYourNewAddress:Selector("#tab-16951"),
    txtAddress:Selector("#edit-field-property-address-to-assist-0-value"),
    listOfAddresses:Selector("#ui-id-3 li"),
    btnSelectMoveDate:Selector("#edit-submit"),
    tableCalendar:Selector("div.testMe.ng-pristine.ng-untouched.ng-valid.ng-isolate-scope.ng-empty.ng-valid-date-disabled > table > tbody"),
    btnMoving:Selector("hs-moving-datepicker > form > div:nth-child(2) > button"),
    errorMsgInDateSelection:Selector(".error-business-hint.two-business-days"),
  },
};

module.exports=moveHouse;



