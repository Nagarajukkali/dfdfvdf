import {t} from 'testcafe';

const eaCheckoutDetailsPage = require('../pages/checkoutDetails.page');
const eaCheckoutReviewPage = require('../pages/checkoutReview.page');
import {testFuncs } from '../../global_methods/helper';
const helper  = testFuncs();

export function checkoutDetailsPageFunction(){

    async function provideDetailsInAboutMeSection(customerType,firstName,lastName){
        await helper.scrollToElement(t,eaCheckoutDetailsPage.elements.myDetailsHeaderText);
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
        if(customerType.toUpperCase()==='RESI' || customerType.toUpperCase()==='CAMPAIGN'){
            enterDOB();
        }

    }
    async function enterDOB(){
        await helper.clearAndEnterText(t,eaCheckoutDetailsPage.elements.dobDay,'01');
        await helper.clearAndEnterText(t,eaCheckoutDetailsPage.elements.dobMonth,'01');
        await helper.clearAndEnterText(t,eaCheckoutDetailsPage.elements.dobYear,'1980');
    }
    async function provideContactDetails(){
        await helper.clearAndEnterText(t,eaCheckoutDetailsPage.elements.email,'test@energyaustralia.com.au');
        await helper.clearAndEnterText(t,eaCheckoutDetailsPage.elements.phone,'0345678901');
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
        await helper.click(t,eaCheckoutDetailsPage.elements.idDrop);
        await helper.click(t,eaCheckoutDetailsPage.elements.idValuePassport);
        await helper.clearAndEnterText(t,eaCheckoutDetailsPage.elements.idNumber,passportNo);
    }
    async function checkoutExistingCustomerDriverLicenseIdentification(){
      let dlNo=helper.getRandomNumber(999999);
      await helper.click(t,eaCheckoutDetailsPage.elements.idDrop);
      await helper.click(t,eaCheckoutDetailsPage.elements.idValueDriverLicense);
      await helper.clearAndEnterText(t,eaCheckoutDetailsPage.elements.idNumber,dlNo);
    }
    async function checkoutExistingCustomerMedicareIdentification(){
      let medicareNo=helper.getRandomNumber(999999);
      await helper.click(t,eaCheckoutDetailsPage.elements.idDrop);
      await helper.click(t,eaCheckoutDetailsPage.elements.idValueMedicare);
      await helper.clearAndEnterText(t,eaCheckoutDetailsPage.elements.idNumber,medicareNo);
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
    let passportNo=helper.getRandomNumber(999999);
    await helper.click(t,eaCheckoutDetailsPage.elements.idDrop);
    await helper.click(t,eaCheckoutDetailsPage.elements.idValuePassport);
    await helper.clearAndEnterText(t,eaCheckoutDetailsPage.elements.idNumber,passportNo);
    await helper.clearAndEnterText(t,eaCheckoutDetailsPage.elements.idCountry,'Australia');
  }
  async function checkoutNewCustomerDriverLicenseIdentification(){
    let dlNo=helper.getRandomNumber(999999);
    await helper.click(t,eaCheckoutDetailsPage.elements.idDrop);
    await helper.click(t,eaCheckoutDetailsPage.elements.idValueDriverLicense);
    await helper.clearAndEnterText(t,eaCheckoutDetailsPage.elements.idNumber,dlNo);
  }
  async function checkoutNewCustomerMedicareIdentification(){
    let medicareNo=helper.getRandomNumber(999999);
    await helper.click(t,eaCheckoutDetailsPage.elements.idDrop);
    await helper.click(t,eaCheckoutDetailsPage.elements.idValueMedicare);
    await helper.click(t,eaCheckoutDetailsPage.elements.medicareColor);
    await helper.clearAndEnterText(t,eaCheckoutDetailsPage.elements.idMedicareNumber,medicareNo);
    await helper.clearAndEnterText(t,eaCheckoutDetailsPage.elements.idMedicareRef,'1');
    await helper.clearAndEnterText(t,eaCheckoutDetailsPage.elements.idMedicareValidMM,'01');
    await helper.clearAndEnterText(t,eaCheckoutDetailsPage.elements.idMedicareValidYYYY,'2024');

  }
  async function clickOnReviewYourOrderBtn(){
      await helper.waitForLoadingIconToClose();
      await helper.click(t,eaCheckoutDetailsPage.elements.reviewYourOrderBtn);
      await helper.isElementVisible(t,eaCheckoutReviewPage.elements.reviewYourOfferTxt);
  }

    return{
        provideDetailsInAboutMeSection,
        enterDOB,
        provideContactDetails,
        checkoutIdentification,
        checkoutExistingCustomerIdentification,
        checkoutExistingCustomerPassportIdentification,
        checkoutExistingCustomerDriverLicenseIdentification,
        checkoutExistingCustomerMedicareIdentification,
        checkoutNewCustomerIdentification,
        checkoutNewCustomerPassportIdentification,
        checkoutNewCustomerDriverLicenseIdentification,
        checkoutNewCustomerMedicareIdentification,
        clickOnReviewYourOrderBtn,
    };
}
