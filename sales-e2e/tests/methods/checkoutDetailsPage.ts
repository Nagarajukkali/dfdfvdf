const eaCheckoutDetailsPage=require('../pages/checkoutDetails.page');
const eaCheckoutReviewPage=require('../pages/checkoutReview.page');
import {BusinessType, CustomerStatus, testFunction} from '../../global_methods/helper';
import {AustralianState, CustomerType} from '@ea/ea-commons-models';

export class checkoutDetailsMethod{

    public static async provideDetailsInAboutMeSection(t,journey,firstName,lastName){
        if((await testFunction.getElementText(t, eaCheckoutDetailsPage.elements.titleDropdown)).includes('Please select')){
            await testFunction.click(t,eaCheckoutDetailsPage.elements.titleDrop);
            await testFunction.click(t,eaCheckoutDetailsPage.elements.titleTag);
        }
        await this.enterFirstName(t,firstName);
        await this.enterLastName(t,lastName);
        if(journey===CustomerType.RESIDENTIAL || journey==='Campaign'){
            await this.enterDOB(t);
        }
    }
    public static async enterFirstName(t,firstName){
        firstName = firstName ? firstName : "test";
        await testFunction.clearAndEnterText(t, eaCheckoutDetailsPage.elements.firstName, firstName);
    }
    public static async enterLastName(t,lastName){
      lastName = lastName ? lastName : "test";
      await testFunction.clearAndEnterText(t, eaCheckoutDetailsPage.elements.lastName, lastName);
    }

    public static async enterDOB(t){
        await testFunction.clearAndEnterText(t,eaCheckoutDetailsPage.elements.dobDay,'01');
        await testFunction.clearAndEnterText(t,eaCheckoutDetailsPage.elements.dobMonth,'01');
        await testFunction.clearAndEnterText(t,eaCheckoutDetailsPage.elements.dobYear,'1980');
    }

    public static async provideContactDetails(t){
        let phoneNumber="03"+testFunction.getRandomNumber(99999999);
        await testFunction.clearAndEnterText(t,eaCheckoutDetailsPage.elements.email,'test@energyaustralia.com.au');
        await testFunction.clearAndEnterText(t,eaCheckoutDetailsPage.elements.phone,phoneNumber);
    }
    public static async checkoutIdentification(t,customerStatus,idType){
        if(customerStatus===CustomerStatus.EXISTING){
            await this.checkoutExistingCustomerIdentification(t,idType);
        }
        else if(customerStatus===CustomerStatus.NEW){
            await this.checkoutNewCustomerIdentification(t,idType);
        }else {
          console.error('Please select a valid customer');
        }
    }

    public static async checkoutExistingCustomerIdentification(t,idType){
        switch (idType) {
            case 'Passport':
              await this.checkoutExistingCustomerPassportIdentification(t);
              break;
            case 'Driver Licence':
              await this.checkoutExistingCustomerDriverLicenseIdentification(t);
              break;
            case 'Medicare':
              await this.checkoutExistingCustomerMedicareIdentification(t);
              break;
            default:
              console.error('Please select a valid identification type');
      }
    }

    public static async checkoutExistingCustomerPassportIdentification(t){
        let passportNo=testFunction.getRandomNumber(999999);
        await testFunction.click(t,eaCheckoutDetailsPage.elements.idDrop);
        await testFunction.click(t,eaCheckoutDetailsPage.elements.idValuePassport);
        await testFunction.clearAndEnterText(t,eaCheckoutDetailsPage.elements.idNumber,passportNo);
    }

    public static async checkoutExistingCustomerDriverLicenseIdentification(t){
      let dlNo=testFunction.getRandomNumber(999999);
      await testFunction.click(t,eaCheckoutDetailsPage.elements.idDrop);
      await testFunction.click(t,eaCheckoutDetailsPage.elements.idValueDriverLicense);
      await testFunction.click(t,eaCheckoutDetailsPage.elements.idNumber);
      await testFunction.clearAndEnterText(t,eaCheckoutDetailsPage.elements.idNumber,dlNo);
    }

    public static async checkoutExistingCustomerMedicareIdentification(t){
      let medicareNo=testFunction.getRandomNumber(999999);
      await testFunction.click(t,eaCheckoutDetailsPage.elements.idDrop);
      await testFunction.click(t,eaCheckoutDetailsPage.elements.idValueMedicare);
      await testFunction.clearAndEnterText(t,eaCheckoutDetailsPage.elements.idNumber,medicareNo);
    }
    public static async checkoutNewCustomerIdentification(t,idType){
    switch (idType) {
      case "Passport":
        await this.checkoutNewCustomerPassportIdentification(t);
        break;
      case "Driver License":
        await this.checkoutNewCustomerDriverLicenseIdentification(t);
        break;
      case "Medicare":
        await this.checkoutNewCustomerMedicareIdentification(t);
        break;
      default:
        console.error('Please select a valid ID type');
    }
  }

  public static async checkoutNewCustomerDriverLicenseIdentification(t){
    let dlNo=testFunction.getRandomNumber(999999);
    await testFunction.click(t,eaCheckoutDetailsPage.elements.idDrop);
    await testFunction.click(t,eaCheckoutDetailsPage.elements.idValueDriverLicense);
    await testFunction.click(t,eaCheckoutDetailsPage.elements.idLicenseNumber);
    await testFunction.clearAndEnterText(t,eaCheckoutDetailsPage.elements.idLicenseNumber,dlNo);
  }

  public static async checkoutNewCustomerPassportIdentification(t){
    let passportNo=testFunction.getRandomNumber(999999);
    await testFunction.click(t,eaCheckoutDetailsPage.elements.idDrop);
    await testFunction.click(t,eaCheckoutDetailsPage.elements.idValuePassport);
    await testFunction.clearAndEnterText(t,eaCheckoutDetailsPage.elements.idPassportNumber,passportNo);
    await testFunction.clearAndEnterText(t,eaCheckoutDetailsPage.elements.idCountry,'Australia');
  }

  public static async checkoutNewCustomerMedicareIdentification(t){
    let medicareNo=testFunction.getRandomNumber(999999);
    await testFunction.click(t,eaCheckoutDetailsPage.elements.idDrop);
    await testFunction.click(t,eaCheckoutDetailsPage.elements.idValueMedicare);
    await testFunction.click(t,eaCheckoutDetailsPage.elements.medicareColor);
    await testFunction.clearAndEnterText(t,eaCheckoutDetailsPage.elements.idMedicareNumber,medicareNo);
    await testFunction.clearAndEnterText(t,eaCheckoutDetailsPage.elements.idMedicareRef,'1');
    await testFunction.clearAndEnterText(t,eaCheckoutDetailsPage.elements.idMedicareValidMM,'01');
    await testFunction.clearAndEnterText(t,eaCheckoutDetailsPage.elements.idMedicareValidYYYY,'2024');
  }

  public static async clickOnReviewYourOrderBtn(t){
    await testFunction.waitForLoadingIconToClose();
    await t.wait(5000);
    await testFunction.click(t,eaCheckoutDetailsPage.elements.reviewYourOrderBtn);
    await testFunction.isElementVisible(t,eaCheckoutReviewPage.elements.reviewYourOfferTxt);
  }

  public static async accessRestriction(t,electricityAccess:String,gasAccess){
      if(electricityAccess==='No') {
        await testFunction.click(t, eaCheckoutDetailsPage.elements.electricityAccessNo);
      }else{
        console.error('Access restriction is not present for the premise');
      }
      if(gasAccess==='No') {
        await testFunction.click(t, eaCheckoutDetailsPage.elements.gasAccessNo);
      }else {
        console.error('Access restriction is not present for the premise');
      }
  }
  public static async propertyRenovationNo(t,state){
      if(state===AustralianState.VIC){
        await testFunction.click(t,eaCheckoutDetailsPage.elements.prevHomeImproveNo);
        await testFunction.click(t,eaCheckoutDetailsPage.elements.planHomeImproveNo);
        await testFunction.click(t,eaCheckoutDetailsPage.elements.renovationNo);
      }
      else {
        console.error('Property renovation is not required for this state');
      }
  }
  public static async provideBusinessDetails(t,businessType){
      let businessId=testFunction.getRandomNumber(99999999999);
      if(businessType===BusinessType.ABN){
        await testFunction.click(t,eaCheckoutDetailsPage.elements.ABN);
      }
      else if(businessType===BusinessType.ACN){
        await testFunction.click(t,eaCheckoutDetailsPage.elements.ACN);
      }else {
        console.error('ABN/ACN is not valid');
      }
      await testFunction.clearAndEnterText(t,eaCheckoutDetailsPage.elements.number_ABNACN,businessId);
      await testFunction.clearAndEnterText(t,eaCheckoutDetailsPage.elements.company,'NA');
      await testFunction.click(t,eaCheckoutDetailsPage.elements.businessType);
      await testFunction.click(t,eaCheckoutDetailsPage.elements.businessTypeOption);
      await t.wait(3000);
      await testFunction.click(t,eaCheckoutDetailsPage.elements.anzsicCode);
      await testFunction.click(t,eaCheckoutDetailsPage.elements.anzsicCodeOption);
  }
}
