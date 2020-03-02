import {AustralianState, FUEL_TYPE_OPTIONS} from '@ea/ea-commons-models';
import {CustomerType} from '@ea/ea-commons-models';
const EaHomePage=require('../pages/energy-australia-home.page');
import {IdType, PlanType, testFunction} from '../../global_methods/helper';

export class plansMethod{
    public static async clickPlansPageModal(t, customerType) {
        if(customerType===CustomerType.RESIDENTIAL || customerType===CustomerType.BUSINESS){
            await testFunction.click(t,EaHomePage.elements.ModalWindow);
          }
          else {
              console.error('Modal window could not be opened due to page error')
          }
    }

    public static async verifyVerifyAccountChangeButton(t){
      await testFunction.isElementDisplayed(t,EaHomePage.elements.changeLinkVerifyAccount);
    }

    public static async selectFuel(t,fuelType){
      if(testFunction.getElementText(t, EaHomePage.elements.selectedState.innerText) !== AustralianState.QLD) {
        switch(fuelType){
          case FUEL_TYPE_OPTIONS.BOTH.value:
            await testFunction.click(t,EaHomePage.elements.fuelSelectorOption);
            await testFunction.click(t,EaHomePage.elements.fuelSelectorOptionDual);
            break;
          case FUEL_TYPE_OPTIONS.ELE.value:
            await testFunction.click(t,EaHomePage.elements.fuelSelectorOption);
            await testFunction.click(t,EaHomePage.elements.fuelSelectorOptionEle);
            break;
          case FUEL_TYPE_OPTIONS.GAS.value:
            await testFunction.click(t,EaHomePage.elements.fuelSelectorOption);
            await testFunction.click(t,EaHomePage.elements.fuelSelectorOptionGas);
            break;
          default:
            console.error("Invalid fuel type is selected");
        }
      } else
        console.log("Fuel selector is not available for QLD.")
    }

    public static async selectPlan(t: any, planName: any) {
      switch(planName){
        case PlanType.BASIC_HOME:
          await testFunction.click(t,EaHomePage.elements.basicPlan);
          break;
        case PlanType.NO_FRILLS:
          await testFunction.click(t,EaHomePage.elements.noFrillsPlan);
          break;
        case PlanType.TOTAL_PLAN:
          await testFunction.click(t,EaHomePage.elements.totalPlan);
          break;
        case PlanType.TOTAL_PLAN_PLUS:
          await testFunction.click(t,EaHomePage.elements.totalPlusPlan);
          break;
        case PlanType.BASIC_BUSINESS:
          await testFunction.click(t,EaHomePage.elements.basicBusiness);
          break;
        case PlanType.NO_FRILLS_BUSINESS:
          await testFunction.click(t,EaHomePage.elements.noFrillBusiness);
          break;
        case PlanType.TOTAL_BUSINESS:
          await testFunction.click(t,EaHomePage.elements.totalPlanBusiness);
          break;
        case PlanType.TOTAL_PLAN_PLUS_BUSINESS:
          await testFunction.click(t,EaHomePage.elements.totalPlanPlusBusiness);
          break;
        default:
          console.error("Invalid plan is selected");
      }
    }

}

export class selectionOptionModalWindowMethod {
    public static async selectOptionsModalWindow(t, modalWindowValue) {
        if (modalWindowValue==='verify account') {
            await testFunction.click(t,EaHomePage.elements.modalVerifyAccountOption);
          } else if (modalWindowValue==='Bill upload') {
            await testFunction.click(t,EaHomePage.elements.modalBillUploadOption);
          }
    }
}

export class verifyAccountMethod {
    public static async verifyAccountIsDisplayed(t, fuelType, customerType) {
        if (customerType===CustomerType.RESIDENTIAL) {
            switch (fuelType) {
              case FUEL_TYPE_OPTIONS.BOTH.value:
                await testFunction.isElementDisplayed(t,EaHomePage.elements.elecAccountNo);
                await testFunction.isElementDisplayed(t,EaHomePage.elements.gasAccountNo);
                break;
              case FUEL_TYPE_OPTIONS.ELE.value:
                  await testFunction.isElementDisplayed(t,EaHomePage.elements.elecAccountNo);
                break;
              case FUEL_TYPE_OPTIONS.GAS.value:
                  await testFunction.isElementDisplayed(t,EaHomePage.elements.gasAccountNo);
                break;
            }
            await testFunction.isElementDisplayed(t,EaHomePage.elements.nextAccountNumber);
            await testFunction.isElementDisplayed(t,EaHomePage.elements.backAccountNumber);
          }
  }

    public static async provideAccountDetails(t,fuel,accountNumber){
        switch(fuel){
            case FUEL_TYPE_OPTIONS.ELE.value:
              await testFunction.clearAndEnterText(t,EaHomePage.elements.elecAccountNo, accountNumber);
              break;
            case FUEL_TYPE_OPTIONS.GAS.value:
              await testFunction.clearAndEnterText(t,EaHomePage.elements.gasAccountNo, accountNumber);
              break;
            default:
              console.error('Couldnot provide account details as the page didnot load properly');
          }
    }

    public static async provideAccountInformation(t, accountInformation, customerType ){
        switch(customerType){
            case CustomerType.RESIDENTIAL:
                await testFunction.clearAndEnterText(t,EaHomePage.elements.postcodeVerifyAccount, accountInformation);
              break;
            case CustomerType.BUSINESS:
                await testFunction.clearAndEnterText(t,EaHomePage.elements.businessInformation, accountInformation);
              break;
          }
    }

    public static async verifyAccountDetails(t){
        await testFunction.click(t, EaHomePage.elements.nextAccountNumber);
        await testFunction.waitForElementToBeDisappeared(t,EaHomePage.elements.eaSpinner);
    }

    public static async provideIdentityDetails(t, idType, idValue){
        switch(idType){
            case IdType.DOB:
               await this.provideIdValue(t, idValue,EaHomePage.elements.idTypeDOBValueVerifyAccount);
               break;
            case IdType.DL:
                await this.selectIdType(t, EaHomePage.elements.idTypeDlVerifyAccount);
                await this.provideIdValue(t, idValue,EaHomePage.elements.idTypeDlValueVerifyAccount);
                break;
            case IdType.PIN:
                await this.selectIdType(t, EaHomePage.elements.idTypePinVerifyAccount);
                await this.provideIdValue(t, idValue,EaHomePage.elements.idTypeDlValueVerifyAccount);
                break;
          }
    }

    public static async verifyUsageData(t, fuelType){
        switch (fuelType) {
            case FUEL_TYPE_OPTIONS.BOTH.value:
                await testFunction.isElementDisplayed(t,EaHomePage.elements.usageData_ele);
                await testFunction.isElementDisplayed(t,EaHomePage.elements.usageData_gas);
              break;
            case FUEL_TYPE_OPTIONS.ELE.value:
                await testFunction.isElementDisplayed(t,EaHomePage.elements.usageData_ele);
              break;
            case FUEL_TYPE_OPTIONS.GAS.value:
                await testFunction.isElementDisplayed(t,EaHomePage.elements.usageData_gas);
              break;
          }
    }

    public static async verifyFamilyViolenceMessage(t, value){
      await testFunction.assertText(t, EaHomePage.elements.familyViolenceMessage, value);
    }

    public static async showCostEstimates(t){
        await testFunction.isElementDisplayed(t,EaHomePage.elements.getCostEstimatesChangeButton);
        await testFunction.click(t, EaHomePage.elements.getCostEstimatesChangeButton);
    }

    public static async selectIdType(t, itemToClick) {
        await testFunction.click(t, EaHomePage.elements.idTypeDropDownVerifyAccount);
        await testFunction.click(t, itemToClick);
      }

    public static async provideIdValue(t,idValue, inputField) {
        await testFunction.clearAndEnterText(t,inputField, idValue);
    }
}

export class campaignMethod{
  public static async enterPostcodeOnCampaign(t,postcode){
    await testFunction.clearAndEnterText(t,EaHomePage.elements.postcodeOnCampaignPage,postcode);
    await testFunction.click(t,EaHomePage.elements.btnCampaignSearch);
  }

  public static  async addPlanOnCampaign(t){
    await testFunction.click(t,EaHomePage.elements.selectCampaignPlans);
  }
}
