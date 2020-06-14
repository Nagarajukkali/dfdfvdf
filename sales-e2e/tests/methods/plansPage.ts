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

      await testFunction.waitForElementToBeDisappeared(t,EaHomePage.elements.eaSpinner);
    }

    public static async selectPlan(t: any, planName: any) {
      switch(planName){
        case PlanType.BASIC_HOME:
          await testFunction.click(t,EaHomePage.elements.basicPlan);
          break;
        case PlanType.BASIC_HOME_QLD:
          await testFunction.click(t,EaHomePage.elements.basicPlanQLD);
          break;
        case PlanType.NO_FRILLS:
          await testFunction.click(t,EaHomePage.elements.noFrillsPlan);
          break;
        case PlanType.TOTAL_PLAN:
          await testFunction.click(t,EaHomePage.elements.totalPlan);
          break;
        case PlanType.TOTAL_PLAN_PLUS:
          await testFunction.click(t,EaHomePage.elements.totalPlanPlus);
          break;
        case PlanType.BASIC_BUSINESS:
          await testFunction.click(t,EaHomePage.elements.basicBusiness);
          break;
        case PlanType.BASIC_BUSINESS_QLD:
          await testFunction.click(t,EaHomePage.elements.basicBusinessQLD);
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

  public static async validateThePlansAreLoaded(t) {
    await testFunction.isElementDisplayed(t, EaHomePage.elements.planCostEstimate);
  }

  public static async validatePlanHeading(t, data: any) {
    await testFunction.assertText(t, EaHomePage.campaignElements.elePlanHeadingTitle, data.planName);
    await testFunction.assertText(t, EaHomePage.campaignElements.elePlanHeadingFuel, "Electricity");
    await testFunction.assertText(t, EaHomePage.campaignElements.elePlanHeadingDescription, data.planDescription);
    if(await testFunction.sizeOfElement(t, EaHomePage.campaignElements.isQLD) == 0) {
      await testFunction.assertText(t, EaHomePage.campaignElements.gasPlanHeadingTitle, data.planName);
      await testFunction.assertText(t, EaHomePage.campaignElements.gasPlanHeadingFuel, "Gas");
      await testFunction.assertText(t, EaHomePage.campaignElements.gasPlanHeadingDescription, data.planDescription);
    }
  }

  public static async validateFeatures(t: any, dataTable, data: any) {
    if(dataTable[0].fuelType === "ELE") {
      if(dataTable[0].Feature_50Credit === "Y") {
        await testFunction.assertText(t, EaHomePage.campaignElements.eleFeature50CreditTitle, data.electricity.feature.preSelect.Credit50.heading);
        await testFunction.assertText(t, EaHomePage.campaignElements.eleFeature50CreditDescription, data.electricity.feature.preSelect.Credit50.description);
      }
      if(dataTable[0].Feature_carbonNeutral === "Y") {
        await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureCNTitle, data.electricity.feature.preSelect.carbonNeutral.heading);
        await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureCNDescription, data.electricity.feature.preSelect.carbonNeutral.description);
      }
      if(dataTable[0].Feature_peaceOfMind === "Y") {
        await testFunction.assertText(t, EaHomePage.campaignElements.eleFeaturePeaceOfMindTitle, data.electricity.feature.preSelect.peaceOfMind.heading);
        await testFunction.assertText(t, EaHomePage.campaignElements.eleFeaturePeaceOfMindDescription, data.electricity.feature.preSelect.peaceOfMind.description);
      }
      if(dataTable[0].Feature_discountOffTotalEnergyBill === "Y") {
        await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureDiscountOffTotalBillTitle, data.electricity.feature.preSelect.discountOffTotalEnergyBill.heading);
        await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureDiscountOffTotalBillDescription, data.electricity.feature.preSelect.discountOffTotalEnergyBill.description);
      }
      if(dataTable[0].Feature_noStandardConnectionFee === "Y") {
        await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureNoStandardConnectionFeeTitle, data.electricity.feature.preSelect.noStandardConnectionFee.heading);
        await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureNoStandardConnectionFeeDescription, data.electricity.feature.preSelect.noStandardConnectionFee.description);
      }
    } else if(dataTable[0].fuelType === "GAS") {
      if(dataTable[0].Feature_50Credit === "Y") {
        await testFunction.assertText(t, EaHomePage.campaignElements.gasFeature50CreditTitle, data.gas.feature.preSelect.Credit50.heading);
        await testFunction.assertText(t, EaHomePage.campaignElements.gasFeature50CreditDescription, data.gas.feature.preSelect.Credit50.description);
      }
      if(dataTable[0].Feature_carbonNeutral === "Y") {
        await testFunction.assertText(t, EaHomePage.campaignElements.gasFeatureCNTitle, data.gas.feature.preSelect.carbonNeutral.heading);
        await testFunction.assertText(t, EaHomePage.campaignElements.gasFeatureCNDescription, data.gas.feature.preSelect.carbonNeutral.description);
      }
      if(dataTable[0].Feature_peaceOfMind === "Y") {
        await testFunction.assertText(t, EaHomePage.campaignElements.gasFeaturePeaceOfMindTitle, data.gas.feature.preSelect.peaceOfMind.heading);
        await testFunction.assertText(t, EaHomePage.campaignElements.gasFeaturePeaceOfMindDescription, data.gas.feature.preSelect.peaceOfMind.description);
      }
      if(dataTable[0].Feature_discountOffTotalEnergyBill === "Y") {
        await testFunction.assertText(t, EaHomePage.campaignElements.gasFeatureDiscountOffTotalBillTitle, data.gas.feature.preSelect.discountOffTotalEnergyBill.heading);
        await testFunction.assertText(t, EaHomePage.campaignElements.gasFeatureDiscountOffTotalBillDescription, data.gas.feature.preSelect.discountOffTotalEnergyBill.description);
      }
    }
  }

  public static async validateDiscount(t, fuelType, discount) {
    if(await testFunction.isElectricity(fuelType)) {
      await testFunction.assertText(t, EaHomePage.elements.eleDiscount, discount);
    } else if(await testFunction.isElectricity(fuelType)) {
      await testFunction.assertText(t, EaHomePage.elements.gasDiscount, discount);
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
                await this.provideIdValue(t, idValue,EaHomePage.elements.idTypeValueVerifyAccount);
                break;
            case IdType.PIN:
                await this.selectIdType(t, EaHomePage.elements.idTypePinVerifyAccount);
                await this.provideIdValue(t, idValue,EaHomePage.elements.idTypeValueVerifyAccount);
                break;
          case IdType.MEDICARE:
            await this.selectIdType(t, EaHomePage.elements.idTypeMedicareVerifyAccount);
            await this.provideIdValue(t, idValue,EaHomePage.elements.idTypeValueVerifyAccount);
            break;
          case IdType.PASSPORT:
            await this.selectIdType(t, EaHomePage.elements.idTypePassportVerifyAccount);
            await this.provideIdValue(t, idValue,EaHomePage.elements.idTypeValueVerifyAccount);
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

  public static  async validateErrorMessageForBlockerAccounts(t){
    let expectedErrorMessage = "We are currently unable to retrieve your information. Please call 133 466 (Monday – Friday, 8am – 8pm AEST)";
    await testFunction.assertText(t,EaHomePage.elements.safetyFlagMsgOnVAModal,expectedErrorMessage);
  }

  public static async verifySuccessfulAccountVerification(t) {
    await testFunction.isElementDisplayed(t,EaHomePage.elements.getCostEstimatesChangeButton);
  }

  public static async navigateBackToVerifyIdentity(t){
      await testFunction.isElementDisplayed(t,EaHomePage.elements.btnBackOnVerifyAccountModal);
      await testFunction.click(t,EaHomePage.elements.btnBackOnVerifyAccountModal);
      // if(await testFunction.isElementExists(t,EaHomePage.elements.idTypeDlValueVerifyAccount))
      //   await testFunction.clearTextField(t,EaHomePage.elements.idTypeDlValueVerifyAccount);
      // if(await testFunction.isElementExists(t,EaHomePage.elements.idTypeDOBValueVerifyAccount))
      //   await testFunction.clearTextField(t,EaHomePage.elements.idTypeDOBValueVerifyAccount);

  }

  public static async navigateBackToVerifyAccount(t){
    await testFunction.isElementDisplayed(t,EaHomePage.elements.btnBackOnVerifyAccountModal);
    await testFunction.click(t,EaHomePage.elements.btnBackOnVerifyAccountModal);
    if(await testFunction.isElementExists(t,EaHomePage.elements.elecAccountNo))
      await testFunction.clearTextField(t,EaHomePage.elements.elecAccountNo);
    if(await testFunction.isElementExists(t,EaHomePage.elements.gasAccountNo))
      await testFunction.clearTextField(t,EaHomePage.elements.gasAccountNo);
    if(await testFunction.isElementExists(t,EaHomePage.elements.postcodeVerifyAccount))
      await testFunction.clearTextField(t,EaHomePage.elements.postcodeVerifyAccount);
    if(await testFunction.isElementExists(t,EaHomePage.elements.businessInformation))
      await testFunction.clearTextField(t,EaHomePage.elements.businessInformation);
  }


}

export class campaignMethod{
  public static async enterPostcodeOnCampaign(t,postcode){
    await testFunction.clearAndEnterText(t,EaHomePage.elements.postcodeOnCampaignPage,postcode);
    await testFunction.click(t,EaHomePage.elements.btnCampaignSearch);
    await testFunction.waitForElementToBeDisappeared(t,EaHomePage.elements.eaSpinner);
  }

  public static async enterOfferCodeAndPostcodeOnCampaign(t,offerCode,postcode) {
    await testFunction.clearAndEnterText(t, EaHomePage.elements.txtOfferCode, offerCode);
    await t.wait(3000);
    await testFunction.clearAndEnterText(t, EaHomePage.elements.postcodeOnCampaignPage, postcode);
    await testFunction.click(t, EaHomePage.elements.btnCampaignSearch);
    await testFunction.waitForElementToBeDisappeared(t, EaHomePage.elements.eaSpinner);
  }
  public static async enterPostcodeOnCampaign1(t, state, postcode?: String){
    if(postcode == undefined) {
      state = state.toUpperCase();
      postcode = testFunction.getPostcode(state)
    }
    await testFunction.clearAndEnterText(t, EaHomePage.elements.postcodeOnCampaignPage, postcode);
    await testFunction.click(t, EaHomePage.elements.btnCampaignSearch);
  }

  public static  async addPlanOnCampaign(t){
    await testFunction.click(t,EaHomePage.elements.selectCampaignPlans);
  }




}
