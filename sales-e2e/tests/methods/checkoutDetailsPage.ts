import {t} from 'testcafe';

const eaCheckoutDetailssPage = require('../pages/checkoutDetails.page');
import {testFuncs } from '../../global_methods/helper';
const helper  = testFuncs();

export function checkoutDetailsPageFunction(){

    async function provideDetailsInAboutMeSection(customerType,firstName,lastName){
        await helper.scrollToElement(t,eaCheckoutDetailssPage.elements.myDetailsHeaderText);
        if((await helper.getElementText(t, eaCheckoutDetailssPage.elements.titleDropdown)).includes('Please select')){
            await helper.click(t,eaCheckoutDetailssPage.elements.titleDrop);
            await helper.click(t,eaCheckoutDetailssPage.elements.titleTag);
        }
        if(firstName!=undefined){
            await helper.clearAndEnterText(t,eaCheckoutDetailssPage.elements.firstName,firstName);
        }
        else{
            await helper.clearAndEnterText(t,eaCheckoutDetailssPage.elements.firstName,'test');
        }
        if(lastName!=undefined){
            await helper.clearAndEnterText(t,eaCheckoutDetailssPage.elements.lastName,lastName);
        }
        else{
            await helper.clearAndEnterText(t,eaCheckoutDetailssPage.elements.lastName,'test');
        }
        if(customerType.toUpperCase()==='RESI' || customerType.toUpperCase()==='CAMPAIGN'){
            enterDOB();
        }

    }
    async function enterDOB(){
        await helper.clearAndEnterText(t,eaCheckoutDetailssPage.elements.dobDay,'01');
        await helper.clearAndEnterText(t,eaCheckoutDetailssPage.elements.dobMonth,'01');
        await helper.clearAndEnterText(t,eaCheckoutDetailssPage.elements.dobYear,'1980');
    }
    async function provideContactDetails(){
        await helper.clearAndEnterText(t,eaCheckoutDetailssPage.elements.email,'test@energyaustralia.com.au');
        await helper.clearAndEnterText(t,eaCheckoutDetailssPage.elements.phone,'0345678901');
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
        let passportNo=helper.getRandomNumber(999999);
        await helper.click(t,eaCheckoutDetailssPage.elements.idDrop);
        await helper.click(t,eaCheckoutDetailssPage.elements.idValuePassport);
        await helper.clearAndEnterText(t,eaCheckoutDetailssPage.elements.idNumbder,passportNo);
    }
    async function checkoutExistingCustomerDriverLicenseIdentification(){
      let dlNo=helper.getRandomNumber(999999);
      await helper.click(t,eaCheckoutDetailssPage.elements.idDrop);
      await helper.click(t,eaCheckoutDetailssPage.elements.idValueDriverLicense);
      await helper.clearAndEnterText(t,eaCheckoutDetailssPage.elements.idNumbder,dlNo);
    }
    async function checkoutExistingCustomerMedicareIdentification(){
      let medicareNo=helper.getRandomNumber(999999);
      await helper.click(t,eaCheckoutDetailssPage.elements.idDrop);
      await helper.click(t,eaCheckoutDetailssPage.elements.idValueMedicare);
      await helper.clearAndEnterText(t,eaCheckoutDetailssPage.elements.idNumbder,medicareNo);
    }
    async function checkoutNewCustomerIdentification(idType){
    switch (idType) {
      case "Passport":
        checkoutNewCustomerPassportIdentification();
        break;
      case "Driver Licence":
        checkoutNewCustomerDriverLicenseIdentification();
        break;
      case "medicare":
        checkoutNewCustomerMedicareIdentification();
        break;
      default:
        //ReusableComponents.errorOutAndStopExecution();
    }
  }
  async function checkoutNewCustomerPassportIdentification(){
    //let passportNo=helper.getRandomNumber();
    await helper.click(t,eaCheckoutDetailssPage.elements.idDrop);
  }
  async function checkoutNewCustomerDriverLicenseIdentification(){

  }
  async function checkoutNewCustomerMedicareIdentification(){

  }

    return{
        provideDetailsInAboutMeSection,
        enterDOB,
        provideContactDetails,
    };
}
