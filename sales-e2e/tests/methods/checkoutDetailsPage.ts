const eaCheckoutDetailsPage = require('../pages/checkoutDetails.page');
import {testFuncs } from '../../global_methods/helper';
const helper  = testFuncs();

export function checkoutDetailsPageFunction(){

    async function provideDetailsInAboutMeSection(t,customerType,firstName,lastName){
        if((await helper.getElementText(t, eaCheckoutDetailsPage.elements.titleDropdown)).includes('Please select')){
            await helper.click(t,eaCheckoutDetailsPage.elements.titleDrop);
            await helper.click(t,eaCheckoutDetailsPage.elements.titleTag);
        }
        if(firstName!=undefined){
            await helper.clearAndEnterText(t,eaCheckoutDetailsPage.elements.firstName,firstName);
        }
        else{
            await helper.clearAndEnterText(t,eaCheckoutDetailsPage.elements.firstName,'test');
        }
        if(lastName!=undefined){
            await helper.clearAndEnterText(t,eaCheckoutDetailsPage.elements.lastName,lastName);
        }
        else{
            await helper.clearAndEnterText(t,eaCheckoutDetailsPage.elements.lastName,'test');
        }
        if(customerType==='Residential' || customerType==='Campaign'){
            await enterDOB(t);
        }

    }
    async function enterDOB(t){
        await helper.clearAndEnterText(t,eaCheckoutDetailsPage.elements.dobDay,'01');
        await helper.clearAndEnterText(t,eaCheckoutDetailsPage.elements.dobMonth,'01');
        await helper.clearAndEnterText(t,eaCheckoutDetailsPage.elements.dobYear,'1980');
    }
    async function provideContactDetails(t){
        await helper.clearAndEnterText(t,eaCheckoutDetailsPage.elements.email,'test@energyaustralia.com.au');
        await helper.clearAndEnterText(t,eaCheckoutDetailsPage.elements.phone,'0345678901');
    }
    async function checkoutIdentification(t,idType,customerType){
        if(customerType==='Existing'){
            await checkoutExistingCustomerIdentification(t,idType);
        }
        else if(customerType==='New'){
            await checkoutNewCustomerIdentification(t,idType);
        }
    }

    async function checkoutExistingCustomerIdentification(t,idType){
        switch (idType) {
            case 'Passport':
              await checkoutExistingCustomerPassportIdentification(t);
              break;
            case 'Driver Licence':
              await checkoutExistingCustomerDriverLicenseIdentification(t);
              break;
            case 'medicare':
              await checkoutExistingCustomerMedicareIdentification(t);
              break;
            default:
              //ReusableComponents.errorOutAndStopExecution();
      }
    }

    async function checkoutExistingCustomerPassportIdentification(t){
        let passportNo=helper.getRandomNumber(999999);
        await helper.click(t,eaCheckoutDetailsPage.elements.idDrop);
        await helper.click(t,eaCheckoutDetailsPage.elements.idValuePassport);
        await helper.clearAndEnterText(t,eaCheckoutDetailsPage.elements.idNumbder,passportNo);
    }
    async function checkoutExistingCustomerDriverLicenseIdentification(t){
      let dlNo=helper.getRandomNumber(999999);
      await helper.click(t,eaCheckoutDetailsPage.elements.idDrop);
      await helper.click(t,eaCheckoutDetailsPage.elements.idValueDriverLicense);
      await helper.clearAndEnterText(t,eaCheckoutDetailsPage.elements.idNumbder,dlNo);
    }
    async function checkoutExistingCustomerMedicareIdentification(t){
      let medicareNo=helper.getRandomNumber(999999);
      await helper.click(t,eaCheckoutDetailsPage.elements.idDrop);
      await helper.click(t,eaCheckoutDetailsPage.elements.idValueMedicare);
      await helper.clearAndEnterText(t,eaCheckoutDetailsPage.elements.idNumbder,medicareNo);
    }
    async function checkoutNewCustomerIdentification(t,idType){
    switch (idType) {
      case "Passport":
        await checkoutNewCustomerPassportIdentification(t);
        break;
      case "Driver Licence":
        await checkoutNewCustomerDriverLicenseIdentification(t);
        break;
      case "medicare":
        await checkoutNewCustomerMedicareIdentification(t);
        break;
      default:
        //ReusableComponents.errorOutAndStopExecution();
    }
  }
  async function checkoutNewCustomerPassportIdentification(t){
    //let passportNo=helper.getRandomNumber();
    await helper.click(t,eaCheckoutDetailsPage.elements.idDrop);
  }
  async function checkoutNewCustomerDriverLicenseIdentification(t){

  }
  async function checkoutNewCustomerMedicareIdentification(t){

  }

    return{
        provideDetailsInAboutMeSection,
        enterDOB,
        provideContactDetails,
    };
}
