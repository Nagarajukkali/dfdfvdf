import {forEachComment} from 'tslint';

const eaCheckoutDetailsPage=require('../pages/checkoutDetails.page');
const eaCheckoutReviewPage=require('../pages/checkoutReview.page');
import {BusinessType, CustomerStatus, directDebitType, testFunction} from '../../global_methods/helper';
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
        phoneNumber=phoneNumber.padEnd(10,"0");
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
            case 'Driver License':
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
      if(electricityAccess==='No'){
        await testFunction.click(t, eaCheckoutDetailsPage.elements.electricityAccessNo);
      }
      if(gasAccess==='No'){
        await testFunction.click(t, eaCheckoutDetailsPage.elements.gasAccessNo);
      }
  }
  public static async propertyRenovationNo(t,state){
      if(state===AustralianState.VIC){
        await testFunction.click(t,eaCheckoutDetailsPage.elements.prevHomeImproveNo);
        await testFunction.click(t,eaCheckoutDetailsPage.elements.planHomeImproveNo);
      }
  }
  public static async provideBusinessDetails(t,businessType){
      if(businessType===BusinessType.ABN){
        let ABN=testFunction.getRandomNumber(99999999999);
        await testFunction.click(t,eaCheckoutDetailsPage.elements.ABN);
        await testFunction.clearAndEnterText(t,eaCheckoutDetailsPage.elements.number_ABNACN,ABN);
      }
      else if(businessType===BusinessType.ACN){
        let ACN=testFunction.getRandomNumber(999999999);
        await testFunction.click(t,eaCheckoutDetailsPage.elements.ACN);
        await testFunction.clearAndEnterText(t,eaCheckoutDetailsPage.elements.number_ABNACN,ACN);
      }else {
        console.error('ABN/ACN is not valid');
      }
      await testFunction.clearAndEnterText(t,eaCheckoutDetailsPage.elements.company,'NA');
      await testFunction.click(t,eaCheckoutDetailsPage.elements.businessType);
      await testFunction.click(t,eaCheckoutDetailsPage.elements.businessTypeOption);
      await t.wait(3000);
      await testFunction.click(t,eaCheckoutDetailsPage.elements.anzsicCode);
      await testFunction.click(t,eaCheckoutDetailsPage.elements.anzsicCodeOption);
  }

  public static async addAAHDetails(t) {
    let fName = "FNAME" + testFunction.generateRandomText(5);
    let lName = "LNAME" + testFunction.generateRandomText(5);
    let email = testFunction.generateRandomText(5) + "@test.com";
    await testFunction.click(t, eaCheckoutDetailsPage.elements.addAAH);
    await testFunction.clearAndEnterText(t, eaCheckoutDetailsPage.elements.aahFirstName, fName);
    await testFunction.clearAndEnterText(t, eaCheckoutDetailsPage.elements.aahLastName, lName);
    await testFunction.clearAndEnterText(t, eaCheckoutDetailsPage.elements.aahEmail, email);
    await testFunction.click(t, eaCheckoutDetailsPage.elements.aahPermissionLvl2);
  }

  public static async addDirectDebit(t, DDType) {
    await testFunction.click(t, eaCheckoutDetailsPage.elements.addDirectDebit);
    if(DDType === directDebitType.BANK_ACCOUNT) {
      await testFunction.clearAndEnterText(t, eaCheckoutDetailsPage.elements.tfBankAccountName, "AccountName_" + testFunction.generateRandomText(5));
      await testFunction.clearAndEnterText(t, eaCheckoutDetailsPage.elements.tfBsb, testFunction.getRandomNumber(999999));
      await testFunction.clearAndEnterText(t, eaCheckoutDetailsPage.elements.tfBankAccountNumber, testFunction.getRandomNumber(9999999999));
      await testFunction.click(t, eaCheckoutDetailsPage.elements.cbBankAccountAgreeTermsAndCond);
    } else if(DDType === directDebitType.CREDIT_CARD) {
      await testFunction.click(t, eaCheckoutDetailsPage.elements.useCC);
      await testFunction.clearAndEnterText(t, eaCheckoutDetailsPage.elements.tfCCName, "CCName_" + testFunction.generateRandomText(5));
      await testFunction.clearAndEnterText(t, eaCheckoutDetailsPage.elements.tfCCNumber, "4111111111111111");
      await testFunction.clearAndEnterText(t, eaCheckoutDetailsPage.elements.tfCCExpiryMonth, "01");
      await testFunction.clearAndEnterText(t, eaCheckoutDetailsPage.elements.tfCCExpiryYear, "30");
      await testFunction.click(t, eaCheckoutDetailsPage.elements.cbCCAgreeTermsAndCond);
    }
  }
}
