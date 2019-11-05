const eaCheckoutDetailsPage = require('../pages/checkoutDetails.page');
const eaCheckoutReviewPage = require('../pages/checkoutReview.page');
import {BusinessType, CustomerStatus, CustomerType, State, testFuncs} from '../../global_methods/helper';
const helper  = testFuncs();

export function checkoutDetailsPageFunction(){

    async function provideDetailsInAboutMeSection(t,customerType,firstName,lastName){
        if((await helper.getElementText(t, eaCheckoutDetailsPage.elements.titleDropdown)).includes('Please select')){
            await helper.click(t,eaCheckoutDetailsPage.elements.titleDrop);
            await helper.click(t,eaCheckoutDetailsPage.elements.titleTag);
        }
        await enterFirstName(t,firstName);
        await enterLastName(t,lastName);
        if(customerType===CustomerType.RESIDENTIAL || customerType==='Campaign'){
            await enterDOB(t);
        }
    }
    async function enterFirstName(t,firstName){
      if(firstName!=undefined){
        await helper.clearAndEnterText(t,eaCheckoutDetailsPage.elements.firstName,firstName);
      }
      else{
        await helper.clearAndEnterText(t,eaCheckoutDetailsPage.elements.firstName,'test');
      }
    }
    async function enterLastName(t,lastName){
        if(lastName!=undefined){
          await helper.clearAndEnterText(t,eaCheckoutDetailsPage.elements.lastName,lastName);
        }
        else{
          await helper.clearAndEnterText(t,eaCheckoutDetailsPage.elements.lastName,'test');
        }
    }

    async function enterDOB(t){
        await helper.clearAndEnterText(t,eaCheckoutDetailsPage.elements.dobDay,'01');
        await helper.clearAndEnterText(t,eaCheckoutDetailsPage.elements.dobMonth,'01');
        await helper.clearAndEnterText(t,eaCheckoutDetailsPage.elements.dobYear,'1980');
    }

    async function provideContactDetails(t){
        await helper.clearAndEnterText(t,eaCheckoutDetailsPage.elements.email,'test@energyaustralia.com.au');
        await helper.clearAndEnterText(t,eaCheckoutDetailsPage.elements.phone,"0354556789");
    }
    async function checkoutIdentification(t,idType,customerType){
        if(customerType===CustomerStatus.EXISTING){
            await checkoutExistingCustomerIdentification(t,idType);
        }
        else if(customerType===CustomerStatus.NEW){
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
            case 'Medicare':
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
        await helper.clearAndEnterText(t,eaCheckoutDetailsPage.elements.idNumber,passportNo);

    }

    async function checkoutExistingCustomerDriverLicenseIdentification(t){
      //console.log(getRandomInt(999999));
      let dlNo=helper.getRandomNumber(999999);
      await helper.click(t,eaCheckoutDetailsPage.elements.idDrop);
      await helper.click(t,eaCheckoutDetailsPage.elements.idValueDriverLicense);
      await helper.click(t,eaCheckoutDetailsPage.elements.idNumber);
      await helper.clearAndEnterText(t,eaCheckoutDetailsPage.elements.idNumber,dlNo);
    }
    async function checkoutExistingCustomerMedicareIdentification(t){
      let medicareNo=helper.getRandomNumber(999999);
      await helper.click(t,eaCheckoutDetailsPage.elements.idDrop);
      await helper.click(t,eaCheckoutDetailsPage.elements.idValueMedicare);
      await helper.clearAndEnterText(t,eaCheckoutDetailsPage.elements.idNumber,medicareNo);
    }
    async function checkoutNewCustomerIdentification(t,idType){
    switch (idType) {
      case "Passport":
        await checkoutNewCustomerPassportIdentification(t);
        break;
      case "Driver Licence":
        await checkoutNewCustomerDriverLicenseIdentification(t);
        break;
      case "Medicare":
        await checkoutNewCustomerMedicareIdentification(t);
        break;
      default:
        //ReusableComponents.errorOutAndStopExecution();
    }
  }

  async function checkoutNewCustomerPassportIdentification(t){
    let passportNo=helper.getRandomNumber(999999);
    await helper.click(t,eaCheckoutDetailsPage.elements.idDrop);
    await helper.click(t,eaCheckoutDetailsPage.elements.idValuePassport);
    await helper.clearAndEnterText(t,eaCheckoutDetailsPage.elements.idNumber,passportNo);
    await helper.clearAndEnterText(t,eaCheckoutDetailsPage.elements.idCountry,'Australia');
  }
  async function checkoutNewCustomerDriverLicenseIdentification(t){
    //let dlNo=helper.getRandomNumber(999999);
    await helper.click(t,eaCheckoutDetailsPage.elements.idDrop);
    await helper.click(t,eaCheckoutDetailsPage.elements.idValueDriverLicense);
    await helper.clearAndEnterText(t,eaCheckoutDetailsPage.elements.idNumber,Promise.resolve((Math.floor(100000 + Math.random() * 900000)).toString()));
  }

  async function checkoutNewCustomerMedicareIdentification(t){
    let medicareNo=helper.getRandomNumber(999999);
    await helper.click(t,eaCheckoutDetailsPage.elements.idDrop);
    await helper.click(t,eaCheckoutDetailsPage.elements.idValueMedicare);
    await helper.click(t,eaCheckoutDetailsPage.elements.medicareColor);
    await helper.clearAndEnterText(t,eaCheckoutDetailsPage.elements.idMedicareNumber,medicareNo);
    await helper.clearAndEnterText(t,eaCheckoutDetailsPage.elements.idMedicareRef,'1');
    await helper.clearAndEnterText(t,eaCheckoutDetailsPage.elements.idMedicareValidMM,'01');
    await helper.clearAndEnterText(t,eaCheckoutDetailsPage.elements.idMedicareValidYYYY,'2024');
  }

  async function clickOnReviewYourOrderBtn(t){
    await helper.waitForLoadingIconToClose();
    await helper.click(t,eaCheckoutDetailsPage.elements.reviewYourOrderBtn);
    await helper.isElementVisible(t,eaCheckoutReviewPage.elements.reviewYourOfferTxt);
  }

  async function accessRestriction(t,electricityAccess,gasAccess){
      if(electricityAccess==='No') {
        await helper.click(t, eaCheckoutDetailsPage.elements.electricityAccessNo);
      }
    if(gasAccess==='No') {
      await helper.click(t, eaCheckoutReviewPage.elements.gasAccessNo);
    }
  }
  async function propertyRenovationNo(t,state){
      if(state===State.VIC){
        await helper.click(t,eaCheckoutDetailsPage.elements.prevHomeImproveNo);
        await helper.click(t,eaCheckoutDetailsPage.elements.planHomeImproveNo);
        await helper.click(t,eaCheckoutDetailsPage.elements.renovationNo);
      }
  }
  async function provideBusinessDetails(t,businessType){
      let businessId=helper.getRandomNumber(999999);
      if(businessType===BusinessType.ABN){
        await helper.click(t,eaCheckoutDetailsPage.elements.ABN);
      }
      else if(businessType===BusinessType.ACN){
        await helper.click(t,eaCheckoutDetailsPage.elements.ACN);
      }
      await helper.clearAndEnterText(t,eaCheckoutDetailsPage.elements.number_ABNACN,businessId);
      await helper.clearAndEnterText(t,eaCheckoutDetailsPage.elements.company,'NA');
      await helper.click(t,eaCheckoutDetailsPage.elements.businessType);
      await helper.click(t,eaCheckoutDetailsPage.elements.businessTypeOption);
      await helper.click(t,eaCheckoutDetailsPage.elements.anzsicCode);
      await helper.click(t,eaCheckoutDetailsPage.elements.anzsicCodeOption);
  }

    return{
        provideDetailsInAboutMeSection,
        enterFirstName,
        enterLastName,
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
        accessRestriction,
        provideBusinessDetails,
    };
}
