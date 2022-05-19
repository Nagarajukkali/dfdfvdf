import {Selector} from 'testcafe';

const moveHouse = {
  elements: {
    // linkExistingCustomer: Selector('#existing'),
    linkExistingCustomer: Selector('span').withText('Existing Customer'),
    linkNewCustomer: Selector('#tab-16926'),
    // btnEnterYourNewAddress: Selector("tab-33696"),
    btnEnterYourNewAddress: Selector('div').withText('Enter your new address'),
    txtAddress: Selector("#edit-field-property-address-to-assist-0-value"),
    listOfAddresses: Selector("#ui-id-3 li"),
    btnSelectMoveDate: Selector("#edit-submit"),
    tableCalendar: Selector("#energisation-calendar table > tbody"),
    btnNextMonth: Selector("#energisation-calendar > span > div > div > div > button"),
    btnMoving: Selector("hs-moving-datepicker > form > div:nth-child(2) > button"),
    errorMsgInDateSelection: Selector(".error-business-hint.two-business-days"),
    disclaimerMsg: Selector(".t-emphasize"),
    solarSetUpUnknownError: Selector("#plan-error-SOLAR_SETUP_UNKNOWN"),
    solarSetUpUnknownErrorForUndetectedNMI: Selector("#hs-solar-power-error-move .ea-message__static-message-content"),
    contactUsTextForUndetectedNMI: Selector("#hs-solar-power-error-move .hs-solar-contact-us__text"),
  },
};

module.exports = moveHouse;



