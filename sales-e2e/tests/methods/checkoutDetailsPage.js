const eaCheckoutDetailssPage = require('../pages/checkoutDetails.page');
import {testFuncs } from '../../global_methods/helper';
const helper  = testFuncs();

export function checkoutDetailsPageFunction(){

    async function provideDetailsInAboutMeSection(customerType,firstName,lastName){
        await helper.scrollToElement(t,eaCheckoutDetailssPage.elements.myDetailsHeaderText);
        if(helper.getElementText(t,eaCheckoutDetailssPage.elements.titleDropdown).includes('Please select')){
            await helper.click(t,eaCheckoutDetailssPage.elements.titleDrop);
            await helper.click(t,eaCheckoutDetailssPage.elements.titleTag);
        }
        if(firstName!=undefined){
            await helper.clearAndText(t,eaCheckoutDetailssPage.elements.firstName,firstName);
        }
        else{
            await helper.clearAndText(t,eaCheckoutDetailssPage.elements.firstName,'test');
        }
        if(lastName!=undefined){
            await helper.clearAndText(t,eaCheckoutDetailssPage.elements.lastName,lastName);
        }
        else{
            await helper.clearAndText(t,eaCheckoutDetailssPage.elements.lastName,'test');
        }
        if(customerType.toUpperCase()==='RESI' || customerType.toUpperCase()==='CAMPAIGN'){
            enterDOB();
        }

    }
    async function enterDOB(){
        await helper.clearAndText(t,eaCheckoutDetailssPage.elements.dobDay,'01');
        await helper.clearAndText(t,eaCheckoutDetailssPage.elements.dobMonth,'01');
        await helper.clearAndText(t,eaCheckoutDetailssPage.elements.dobYear,'1980');
    }
    async function provideContactDetails(){
        await helper.clearAndText(t,eaCheckoutDetailssPage.elements.email,'test@energyaustralia.com.au');
        await helper.clearAndText(t,eaCheckoutDetailssPage.elements.phone,'0345678901');
    }
    async function checkoutIdentification(idType,customerType){
        if(customerType.toUpperCase()==='EXISTING'){
            checkoutExistingCustomerIdentification(idType);
        }
        else if(customerType.toUpperCase()==='NEW'){
            checkoutNewCustomerIdentification(idType);
        }
    }

    async function checkoutExistingCustomerIdentification(idType){
        switch (idType) {
            case 'Passport':
              checkoutExistingCustomerPassportIdentification();
              break;
            case 'Driver Licence':
              checkoutExistingCustomerDriverLicenseIdentification();
              break;
            case 'medicare':
              checkoutExistingCustomerMedicareIdentification();
              break;
            default:
              //ReusableComponents.errorOutAndStopExecution();
      }
    }

    async function checkoutExistingCustomerPassportIdentification(){
        let passportNo=helper.generateRandomNumber(999999);
        await helper.click(t,eaCheckoutDetailssPage.elements.idDrop);


    }

    return{
        provideDetailsInAboutMeSection,
        enterDOB,
        provideContactDetails,
    };
}
