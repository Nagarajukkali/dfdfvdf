import {AustralianState, FUEL_TYPE_OPTIONS} from '@ea/ea-commons-models';
import {CustomerType} from '@ea/ea-commons-models';
const EaHomePage=require('../pages/energy-australia-home.page');
import {IdType, PlanType, testFunction,scrollTo} from '../../global_methods/helper';
const eaQualifierPage=require('../pages/qualifier.page');
import {cartsMethod} from './cartsPage';
import {qualifierMethod} from './qualifierPage';
import {Selector} from 'testcafe';
const { config }=require('../../resources/resource');

export class plansMethod{
    public static async clickPlansPageModal(t, customerType) {
        if(customerType===CustomerType.RESIDENTIAL || customerType===CustomerType.BUSINESS){
            if(testFunction.isMobile()){
              await testFunction.click(t,EaHomePage.elements.ModalWindowMobileOnly);
            }
            else{
              await testFunction.click(t,EaHomePage.elements.ModalWindow);
            }
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
          if(testFunction.isMobile()){
            await scrollTo(EaHomePage.elements.basicResiPlanFeatureTitle);
            await scrollTo(EaHomePage.elements.basicResiPlanRatesTitle);
            await testFunction.click(t,EaHomePage.elements.sliderRight);
          }
          await testFunction.click(t,EaHomePage.elements.noFrillsPlan);
          break;
        case PlanType.TOTAL_PLAN:
          if(testFunction.isMobile()){
            await scrollTo(EaHomePage.elements.basicResiPlanRatesTitle);
            await scrollTo(EaHomePage.elements.basicResiPlanFeatureTitle);
            await testFunction.click(t,EaHomePage.elements.sliderRight);
            await testFunction.click(t,EaHomePage.elements.sliderRight);
          }
          if(testFunction.isTablet()){
            await scrollTo(EaHomePage.elements.basicResiPlanFeatureTitle);
            await scrollTo(EaHomePage.elements.basicResiPlanRatesTitle);
            await testFunction.click(t,EaHomePage.elements.sliderRight);
          }
          await testFunction.click(t,EaHomePage.elements.totalPlan);
          break;
        case PlanType.TOTAL_PLAN_PLUS:
          if(testFunction.isMobile()){
            await scrollTo(EaHomePage.elements.basicResiPlanFeatureTitle);
            await scrollTo(EaHomePage.elements.basicResiPlanRatesTitle);
            await testFunction.click(t,EaHomePage.elements.sliderRight);
            await testFunction.click(t,EaHomePage.elements.sliderRight);
            await testFunction.click(t,EaHomePage.elements.sliderRight);
          }
          if(testFunction.isTablet()){
            await scrollTo(EaHomePage.elements.basicResiPlanFeatureTitle);
            await scrollTo(EaHomePage.elements.basicResiPlanRatesTitle);
            await testFunction.click(t,EaHomePage.elements.sliderRight);
            await testFunction.click(t,EaHomePage.elements.sliderRight);
          }
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
          if(testFunction.isMobile()){
            await scrollTo(EaHomePage.elements.basicBsmePlanFeatureTitle);
            await scrollTo(EaHomePage.elements.basicBsmePlanRatesTitle);
            await testFunction.click(t,EaHomePage.elements.sliderRight);
          }
          await testFunction.click(t,EaHomePage.elements.totalPlanBusiness);
          break;
        case PlanType.TOTAL_PLAN_PLUS_BUSINESS:
          if(testFunction.isMobile()){
            await scrollTo(EaHomePage.elements.basicBsmePlanFeatureTitle);
            await scrollTo(EaHomePage.elements.basicBsmePlanRatesTitle);
            await testFunction.click(t,EaHomePage.elements.sliderRight);
            await testFunction.click(t,EaHomePage.elements.sliderRight);
          }
          if(testFunction.isTablet()){
            await scrollTo(EaHomePage.elements.basicBsmePlanFeatureTitle);
            await scrollTo(EaHomePage.elements.basicBsmePlanRatesTitle);
            await testFunction.click(t,EaHomePage.elements.sliderRight);
          }
          await testFunction.click(t,EaHomePage.elements.totalPlanPlusBusiness);
          break;
        default:
          console.error("Invalid plan is selected");
      }
    }

  public static async validateThePlansAreLoaded(t) {
    await testFunction.isElementDisplayed(t, EaHomePage.elements.planCostEstimate);
  }

  public static async validatePlanHeading(t, dataTable, data: any) {
    if(dataTable[0].fuelType === "ELE") {
      await testFunction.assertText(t, EaHomePage.campaignElements.elePlanHeadingTitle, data.planName);
      await testFunction.assertText(t, EaHomePage.campaignElements.elePlanHeadingFuel, "Electricity");
      await testFunction.assertText(t, EaHomePage.campaignElements.elePlanHeadingDescription, data.planDescription);
    } else if (dataTable[0].fuelType === 'GAS') {
      await testFunction.assertText(t, EaHomePage.campaignElements.gasPlanHeadingTitle, data.planName);
      await testFunction.assertText(t, EaHomePage.campaignElements.gasPlanHeadingFuel, "Gas");
      await testFunction.assertText(t, EaHomePage.campaignElements.gasPlanHeadingDescription, data.planDescription);
    }
  }

  public static async validateFeatures(t: any, dataTable, data: any) {
    console.log("Validating plan features on campaign page.")
    if(dataTable[0].fuelType === "ELE") {
      if(dataTable[0].Feature_50Credit === "Y") {
        switch (dataTable[0].state) {
          case AustralianState.VIC:
            await testFunction.assertText(t, EaHomePage.campaignElements.eleFeature50CreditTitle, data.electricity.feature.preSelect.Credit50.VIC.heading);
            await testFunction.assertText(t, EaHomePage.campaignElements.eleFeature50CreditDescription, data.electricity.feature.preSelect.Credit50.VIC.description);
            break;
          case AustralianState.NSW:
            await testFunction.assertText(t, EaHomePage.campaignElements.eleFeature50CreditTitle, data.electricity.feature.preSelect.Credit50.NSW.heading);
            await testFunction.assertText(t, EaHomePage.campaignElements.eleFeature50CreditDescription, data.electricity.feature.preSelect.Credit50.NSW.description);
            break;
          case AustralianState.ACT:
            await testFunction.assertText(t, EaHomePage.campaignElements.eleFeature50CreditTitle, data.electricity.feature.preSelect.Credit50.ACT.heading);
            await testFunction.assertText(t, EaHomePage.campaignElements.eleFeature50CreditDescription, data.electricity.feature.preSelect.Credit50.ACT.description);
            break;
          case AustralianState.QLD:
            await testFunction.assertText(t, EaHomePage.campaignElements.eleFeature50CreditTitle, data.electricity.feature.preSelect.Credit50.QLD.heading);
            await testFunction.assertText(t, EaHomePage.campaignElements.eleFeature50CreditDescription, data.electricity.feature.preSelect.Credit50.QLD.description);
            break;
          case AustralianState.SA:
            await testFunction.assertText(t, EaHomePage.campaignElements.eleFeature50CreditTitle, data.electricity.feature.preSelect.Credit50.SA.heading);
            await testFunction.assertText(t, EaHomePage.campaignElements.eleFeature50CreditDescription, data.electricity.feature.preSelect.Credit50.SA.description);
            break;
          default:
            throw Error("Invalid State");
        }
      }
      if(dataTable[0].Feature_carbonNeutral === "Y") {
        await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureCNTitle, data.electricity.feature.preSelect.carbonNeutral.heading);
        await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureCNDescription, data.electricity.feature.preSelect.carbonNeutral.description);
      }
      if(dataTable[0].Feature_peaceOfMind === "Y") {
        await testFunction.assertText(t, EaHomePage.campaignElements.eleFeaturePeaceOfMindTitle, data.electricity.feature.preSelect.peaceOfMind.heading);
        await testFunction.assertText(t, EaHomePage.campaignElements.eleFeaturePeaceOfMindDescription, data.electricity.feature.preSelect.peaceOfMind.description);
      }
      if(dataTable[0].Feature_XX_discountOffTotalEnergyBill === "Y") {
        switch (dataTable[0].state) {
          case AustralianState.VIC:
            await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureDiscountOffTotalBillTitle, data.electricity.feature.preSelect.discountOffTotalEnergyBill.VIC.heading);
            break;
          case AustralianState.NSW:
            await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureDiscountOffTotalBillTitle, data.electricity.feature.preSelect.discountOffTotalEnergyBill.NSW.heading);
            break;
          case AustralianState.ACT:
            await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureDiscountOffTotalBillTitle, data.electricity.feature.preSelect.discountOffTotalEnergyBill.ACT.heading);
            break;
          case AustralianState.QLD:
            await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureDiscountOffTotalBillTitle, data.electricity.feature.preSelect.discountOffTotalEnergyBill.QLD.heading);
            break;
          case AustralianState.SA:
            await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureDiscountOffTotalBillTitle, data.electricity.feature.preSelect.discountOffTotalEnergyBill.SA.heading);
            break;
          default:
            throw Error("Invalid State");
        }
        await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureDiscountOffTotalBillDescription, data.electricity.feature.preSelect.discountOffTotalEnergyBill.description);
      }
      if(dataTable[0].Feature_discountOffTotalEnergyBill === "Y") {
        await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureDiscountOffTotalBillTitle, data.electricity.feature.preSelect.discountOffTotalEnergyBill.heading);
        await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureDiscountOffTotalBillDescription, data.electricity.feature.preSelect.discountOffTotalEnergyBill.description);
      }
      if(dataTable[0].Feature_noStandardConnectionFee === "Y") {
        await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureNoStandardConnectionFeeTitle, data.electricity.feature.preSelect.noStandardConnectionFee.heading);
        await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureNoStandardConnectionFeeDescription, data.electricity.feature.preSelect.noStandardConnectionFee.description);
      }
      if(dataTable[0].Feature_defaultOffer === "Y") {
        await testFunction.assertText(t,EaHomePage.campaignElements.eleFeatureDefaultOfferTitle,data.electricity.feature.preSelect.defaultOffer.heading);
        if(dataTable[0].state === 'VIC'){
          await testFunction.assertText(t,EaHomePage.campaignElements.eleFeatureDefaultOfferDescription, data.electricity.feature.preSelect.defaultOffer.VIC.description);
        }
        else {
          await testFunction.assertText(t,EaHomePage.campaignElements.eleFeatureDefaultOfferDescription, data.electricity.feature.preSelect.defaultOffer.NonVIC.description);
        }
      }
      if(dataTable[0].Feature_vipPriorityService === "Y") {
        await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureVipPriorityServiceTitle, data.electricity.feature.preSelect.vipPriorityService.heading);
      }
      if(dataTable[0].Feature_chanceToWin === "Y") {
        if(dataTable[0].state === 'VIC') {
          await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureChanceToWinTitle, data.electricity.feature.preSelect.chanceToWin.VIC.heading);
          await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureChanceToWinDescription, data.electricity.feature.preSelect.chanceToWin.VIC.description);
        }else if (dataTable[0].state === 'NSW') {
          await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureChanceToWinTitle, data.electricity.feature.preSelect.chanceToWin.NSW.heading);
          await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureChanceToWinDescription, data.electricity.feature.preSelect.chanceToWin.NSW.description);
        }else if (dataTable[0].state === 'QLD') {
          await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureChanceToWinTitle, data.electricity.feature.preSelect.chanceToWin.QLD.heading);
          await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureChanceToWinDescription, data.electricity.feature.preSelect.chanceToWin.QLD.description);
        }else{
          throw Error("Invalid State");
        }
      }
    } else if(dataTable[0].fuelType === "GAS") {
      if(dataTable[0].Feature_50Credit === "Y") {
        switch (dataTable[0].state) {
          case AustralianState.VIC:
            await testFunction.assertText(t, EaHomePage.campaignElements.gasFeature50CreditTitle, data.gas.feature.preSelect.Credit50.VIC.heading);
            await testFunction.assertText(t, EaHomePage.campaignElements.gasFeature50CreditDescription, data.gas.feature.preSelect.Credit50.VIC.description);
            break;
          case AustralianState.NSW:
            await testFunction.assertText(t, EaHomePage.campaignElements.gasFeature50CreditTitle, data.gas.feature.preSelect.Credit50.NSW.heading);
            await testFunction.assertText(t, EaHomePage.campaignElements.gasFeature50CreditDescription, data.gas.feature.preSelect.Credit50.NSW.description);
            break;
          case AustralianState.ACT:
            await testFunction.assertText(t, EaHomePage.campaignElements.gasFeature50CreditTitle, data.gas.feature.preSelect.Credit50.ACT.heading);
            await testFunction.assertText(t, EaHomePage.campaignElements.gasFeature50CreditDescription, data.gas.feature.preSelect.Credit50.ACT.description);
            break;
          case AustralianState.QLD:
            await testFunction.assertText(t, EaHomePage.campaignElements.gasFeature50CreditTitle, data.gas.feature.preSelect.Credit50.QLD.heading);
            await testFunction.assertText(t, EaHomePage.campaignElements.gasFeature50CreditDescription, data.gas.feature.preSelect.Credit50.QLD.description);
            break;
          case AustralianState.SA:
            await testFunction.assertText(t, EaHomePage.campaignElements.gasFeature50CreditTitle, data.gas.feature.preSelect.Credit50.SA.heading);
            await testFunction.assertText(t, EaHomePage.campaignElements.gasFeature50CreditDescription, data.gas.feature.preSelect.Credit50.SA.description);
            break;
          default:
            throw Error("Invalid State");
        }
      }
      if(dataTable[0].Feature_carbonNeutral === "Y") {
        await testFunction.assertText(t, EaHomePage.campaignElements.gasFeatureCNTitle, data.gas.feature.preSelect.carbonNeutral.heading);
        await testFunction.assertText(t, EaHomePage.campaignElements.gasFeatureCNDescription, data.gas.feature.preSelect.carbonNeutral.description);
      }
      if(dataTable[0].Feature_peaceOfMind === "Y") {
        await testFunction.assertText(t, EaHomePage.campaignElements.gasFeaturePeaceOfMindTitle, data.gas.feature.preSelect.peaceOfMind.heading);
        await testFunction.assertText(t, EaHomePage.campaignElements.gasFeaturePeaceOfMindDescription, data.gas.feature.preSelect.peaceOfMind.description);
      }
      if(dataTable[0].Feature_XX_discountOffTotalEnergyBill === "Y") {
        switch (dataTable[0].state) {
          case AustralianState.VIC:
            await testFunction.assertText(t, EaHomePage.campaignElements.gasFeatureDiscountOffTotalBillTitle, data.gas.feature.preSelect.discountOffTotalEnergyBill.VIC.heading);
            break;
          case AustralianState.NSW:
            await testFunction.assertText(t, EaHomePage.campaignElements.gasFeatureDiscountOffTotalBillTitle, data.gas.feature.preSelect.discountOffTotalEnergyBill.NSW.heading);
            break;
          case AustralianState.ACT:
            await testFunction.assertText(t, EaHomePage.campaignElements.gasFeatureDiscountOffTotalBillTitle, data.gas.feature.preSelect.discountOffTotalEnergyBill.ACT.heading);
            break;
          case AustralianState.QLD:
            await testFunction.assertText(t, EaHomePage.campaignElements.gasFeatureDiscountOffTotalBillTitle, data.gas.feature.preSelect.discountOffTotalEnergyBill.QLD.heading);
            break;
          case AustralianState.SA:
            await testFunction.assertText(t, EaHomePage.campaignElements.gasFeatureDiscountOffTotalBillTitle, data.gas.feature.preSelect.discountOffTotalEnergyBill.SA.heading);
            break;
          default:
            throw Error("Invalid State");
        }
        await testFunction.assertText(t, EaHomePage.campaignElements.gasFeatureDiscountOffTotalBillDescription, data.gas.feature.preSelect.discountOffTotalEnergyBill.description);
      }
      if(dataTable[0].Feature_discountOffTotalEnergyBill === "Y") {
        await testFunction.assertText(t, EaHomePage.campaignElements.gasFeatureDiscountOffTotalBillTitle, data.gas.feature.preSelect.discountOffTotalEnergyBill.heading);
        await testFunction.assertText(t, EaHomePage.campaignElements.gasFeatureDiscountOffTotalBillDescription, data.gas.feature.preSelect.discountOffTotalEnergyBill.description);
      }
      if(dataTable[0].Feature_vipPriorityService === "Y") {
        await testFunction.assertText(t, EaHomePage.campaignElements.gasFeatureVipPriorityServiceTitle, data.electricity.feature.preSelect.vipPriorityService.heading);
      }
      if(dataTable[0].Feature_chanceToWin === "Y") {
        if(dataTable[0].state === 'VIC') {
          await testFunction.assertText(t, EaHomePage.campaignElements.gasFeatureChanceToWinTitle, data.gas.feature.preSelect.chanceToWin.VIC.heading);
          await testFunction.assertText(t, EaHomePage.campaignElements.gasFeatureChanceToWinDescription, data.gas.feature.preSelect.chanceToWin.VIC.description);
        }else if (dataTable[0].state === 'NSW') {
          await testFunction.assertText(t, EaHomePage.campaignElements.gasFeatureChanceToWinTitle, data.gas.feature.preSelect.chanceToWin.NSW.heading);
          await testFunction.assertText(t, EaHomePage.campaignElements.gasFeatureChanceToWinDescription, data.gas.feature.preSelect.chanceToWin.NSW.description);
        }else{
          throw Error("Invalid State");
        }
      }
    }
  }

  public static async validateDisclaimer(t: any,dataTable, data: any){
    const disclaimer=Selector(() => document.getElementById("condiDisclaimer"));
    const disclaimerText=await disclaimer().innerText;
    if(dataTable[0].referencePriceComparison==='Y'){
      await testFunction.assertText(t,disclaimer,data.disclaimers.referencePriceComparison.heading);
      await testFunction.assertText(t,disclaimer,data.disclaimers.referencePriceComparison.description);
    }
    if(dataTable[0].goNeutral==='Y'){
      await testFunction.assertText(t,disclaimer,data.disclaimers.goNeutral.heading);
      if(dataTable[0].state==='QLD'){
        await testFunction.assertText(t,disclaimer,data.disclaimers.goNeutral.QLD.description);
      }
      else{
        await testFunction.assertText(t,disclaimer,data.disclaimers.goNeutral.NonQLD.description);
      }
    }
    if(dataTable[0].solarBuyBack==='Y'){
      await testFunction.assertText(t,disclaimer,data.disclaimers.solarBuyBack.heading);
      if(dataTable[0].state==='VIC'){
        await testFunction.assertText(t,disclaimer,data.disclaimers.solarBuyBack.VIC.description);
      }
      else{
        await testFunction.assertText(t,disclaimer,data.disclaimers.solarBuyBack.NonVIC.description);
      }
    }
    let planName=dataTable[0].planName;
    let state=dataTable[0].state;
    if(dataTable[0].signUpCredit==='Y'){
      await this.validateSignUpCredit(t,disclaimer,data,state);
    }
    if(dataTable[0].chanceToWin==='Y'){
      await this.validateChanceToWin(t,disclaimer,data,state);
    }
    await this.validatePlanDisclaimer(t,disclaimer,data,planName,state);
  }

  public static async validateSignUpCredit(t,disclaimer,data,state){
      switch (state) {
        case AustralianState.VIC:
          await testFunction.assertText(t,disclaimer,data.disclaimers.Credit50.VIC.heading);
          await testFunction.assertText(t,disclaimer,data.disclaimers.Credit50.VIC.description);
          break;
        case AustralianState.NSW:
          await testFunction.assertText(t,disclaimer,data.disclaimers.Credit50.NSW.heading);
          await testFunction.assertText(t,disclaimer,data.disclaimers.Credit50.NSW.description);
          break;
        case AustralianState.ACT:
          await testFunction.assertText(t,disclaimer,data.disclaimers.Credit50.ACT.heading);
          await testFunction.assertText(t,disclaimer,data.disclaimers.Credit50.ACT.description);
          break;
        case AustralianState.QLD:
          await testFunction.assertText(t,disclaimer,data.disclaimers.Credit50.QLD.heading);
          await testFunction.assertText(t,disclaimer,data.disclaimers.Credit50.QLD.description);
          break;
        case AustralianState.SA:
          await testFunction.assertText(t,disclaimer,data.disclaimers.Credit50.SA.heading);
          await testFunction.assertText(t,disclaimer,data.disclaimers.Credit50.SA.description);
          break;
        default:
          throw Error("Invalid State");

      }
  }

  public static async validateChanceToWin(t,disclaimer,data,state){
    switch (state) {
      case AustralianState.VIC:
        await testFunction.assertText(t,disclaimer,data.disclaimers.chanceToWin.heading);
        await testFunction.assertText(t,disclaimer,data.disclaimers.chanceToWin.VIC.description);
        break;
      case AustralianState.NSW:
        await testFunction.assertText(t,disclaimer,data.disclaimers.chanceToWin.heading);
        await testFunction.assertText(t,disclaimer,data.disclaimers.chanceToWin.NSW.description);
        break;
      case AustralianState.QLD:
        await testFunction.assertText(t,disclaimer,data.disclaimers.chanceToWin.heading);
        await testFunction.assertText(t,disclaimer,data.disclaimers.chanceToWin.QLD.description);
        break;
      default:
        throw Error("Invalid State");

    }
  }

  public static async validatePlanDisclaimer(t,disclaimer,data,planName,state){
    switch (planName) {
      case PlanType.BASIC_HOME:
        await testFunction.assertText(t, disclaimer,data.disclaimers.basicPlan.heading);
        switch (state) {
          case AustralianState.VIC:
            await testFunction.assertText(t,disclaimer,data.disclaimers.basicPlan.VIC.description);
            break;
          case AustralianState.NSW:
            await testFunction.assertText(t,disclaimer,data.disclaimers.basicPlan.NSW.description);
            break;
          case AustralianState.ACT:
            await testFunction.assertText(t,disclaimer,data.disclaimers.basicPlan.ACT.description);
            break;
          case AustralianState.SA:
            await testFunction.assertText(t,disclaimer,data.disclaimers.basicPlan.SA.description);
            break;
          case AustralianState.QLD:
            await testFunction.assertText(t,disclaimer,data.disclaimers.basicPlan.QLD.description);
            break;
          default:
            throw Error("Invalid State");
        }
        break;
      case PlanType.NO_FRILLS:
        await testFunction.assertText(t,disclaimer,data.disclaimers.noFrills.heading);
        switch (state) {
          case AustralianState.VIC:
            await testFunction.assertText(t,disclaimer,data.disclaimers.noFrills.VIC.description);
            break;
          case AustralianState.NSW:
            await testFunction.assertText(t,disclaimer,data.disclaimers.noFrills.NSW.description);
            break;
          case AustralianState.ACT:
            await testFunction.assertText(t,disclaimer,data.disclaimers.noFrills.ACT.description);
            break;
          case AustralianState.SA:
            await testFunction.assertText(t,disclaimer,data.disclaimers.noFrills.SA.description);
            break;
          case AustralianState.QLD:
            await testFunction.assertText(t,disclaimer,data.disclaimers.noFrills.QLD.description);
            break;
          default:
            throw Error("Invalid State");
        }
        break;
      case PlanType.TOTAL_PLAN:
        await testFunction.assertText(t,disclaimer,data.disclaimers.totalPlan.heading);
        switch (state) {
          case AustralianState.VIC:
            await testFunction.assertText(t,disclaimer,data.disclaimers.totalPlan.VIC.description);
            break;
          case AustralianState.NSW:
            await testFunction.assertText(t,disclaimer,data.disclaimers.totalPlan.NSW.description);
            break;
          case AustralianState.ACT:
            await testFunction.assertText(t,disclaimer,data.disclaimers.totalPlan.ACT.description);
            break;
          case AustralianState.SA:
            await testFunction.assertText(t,disclaimer,data.disclaimers.totalPlan.SA.description);
            break;
          case AustralianState.QLD:
            await testFunction.assertText(t,disclaimer,data.disclaimers.totalPlan.QLD.description);
            break;
          default:
            throw Error("Invalid State");
        }
        break;
      case PlanType.TOTAL_PLAN_PLUS:
        await testFunction.assertText(t,disclaimer,data.disclaimers.totalPlanPlus.heading);
        switch (state) {
          case AustralianState.VIC:
            await testFunction.assertText(t,disclaimer,data.disclaimers.totalPlanPlus.VIC.description);
            break;
          case AustralianState.NSW:
            await testFunction.assertText(t,disclaimer,data.disclaimers.totalPlanPlus.NSW.description);
            break;
          case AustralianState.ACT:
            await testFunction.assertText(t,disclaimer,data.disclaimers.totalPlanPlus.ACT.description);
            break;
          case AustralianState.SA:
            await testFunction.assertText(t,disclaimer,data.disclaimers.totalPlanPlus.SA.description);
            break;
          case AustralianState.QLD:
            await testFunction.assertText(t,disclaimer,data.disclaimers.totalPlanPlus.QLD.description);
            break;
          default:
            throw Error("Invalid State");
        }
        break;
      case PlanType.BASIC_BUSINESS:

        break;
      case PlanType.NO_FRILLS_BUSINESS:

        break;
      case PlanType.TOTAL_BUSINESS:
        await testFunction.assertText(t,disclaimer,data.disclaimers.totalPlanBusiness.heading);
        switch (state) {
          case AustralianState.VIC:
            await testFunction.assertText(t,disclaimer,data.disclaimers.totalPlanBusiness.VIC.description);
            break;
          case AustralianState.NSW:
            await testFunction.assertText(t,disclaimer,data.disclaimers.totalPlanBusiness.NSW.description);
            break;
          case AustralianState.ACT:
            await testFunction.assertText(t,disclaimer,data.disclaimers.totalPlanBusiness.ACT.description);
            break;
          case AustralianState.SA:
            await testFunction.assertText(t,disclaimer,data.disclaimers.totalPlanBusiness.SA.description);
            break;
          case AustralianState.QLD:
            await testFunction.assertText(t,disclaimer,data.disclaimers.totalPlanBusiness.QLD.description);
            break;
          default:
            throw Error("Invalid State");
        }
        break;
      case PlanType.TOTAL_PLAN_PLUS_BUSINESS:
        await testFunction.assertText(t,disclaimer,data.disclaimers.totalPlanPlusBusiness.heading);
        switch (state) {
          case AustralianState.VIC:
            await testFunction.assertText(t,disclaimer,data.disclaimers.totalPlanPlusBusiness.VIC.description);
            break;
          case AustralianState.NSW:
            await testFunction.assertText(t,disclaimer,data.disclaimers.totalPlanPlusBusiness.NSW.description);
            break;
          case AustralianState.ACT:
            await testFunction.assertText(t,disclaimer,data.disclaimers.totalPlanPlusBusiness.ACT.description);
            break;
          case AustralianState.SA:
            await testFunction.assertText(t,disclaimer,data.disclaimers.totalPlanPlusBusiness.SA.description);
            break;
          case AustralianState.QLD:
            await testFunction.assertText(t,disclaimer,data.disclaimers.totalPlanPlusBusiness.QLD.description);
            break;
          default:
            throw Error("Invalid State");
        }
        break;
      case PlanType.FAMILY_AND_FRIENDS:
        await testFunction.assertText(t,disclaimer,data.disclaimers.familyAndFriends.heading);
        switch (state) {
          case AustralianState.VIC:
            await testFunction.assertText(t,disclaimer,data.disclaimers.familyAndFriends.VIC.description);
            break;
          case AustralianState.NSW:
            await testFunction.assertText(t,disclaimer,data.disclaimers.familyAndFriends.NSW.description);
            break;
          case AustralianState.ACT:
            await testFunction.assertText(t,disclaimer,data.disclaimers.familyAndFriends.ACT.description);
            break;
          case AustralianState.SA:
            await testFunction.assertText(t,disclaimer,data.disclaimers.familyAndFriends.SA.description);
            break;
          case AustralianState.QLD:
            await testFunction.assertText(t,disclaimer,data.disclaimers.familyAndFriends.QLD.description);
            break;
          default:
            throw Error("Invalid State");
        }
        break;
      case PlanType.FAMILY_AND_FRIENDS_BUSINESS:
        await testFunction.assertText(t,disclaimer,data.disclaimers.familyAndFriendsBusiness.heading);
        switch (state) {
          case AustralianState.VIC:
            await testFunction.assertText(t,disclaimer,data.disclaimers.familyAndFriendsBusiness.VIC.description);
            break;
          case AustralianState.NSW:
            await testFunction.assertText(t,disclaimer,data.disclaimers.familyAndFriendsBusiness.NSW.description);
            break;
          case AustralianState.ACT:
            await testFunction.assertText(t,disclaimer,data.disclaimers.familyAndFriendsBusiness.ACT.description);
            break;
          case AustralianState.SA:
            await testFunction.assertText(t,disclaimer,data.disclaimers.familyAndFriendsBusiness.SA.description);
            break;
          case AustralianState.QLD:
            await testFunction.assertText(t,disclaimer,data.disclaimers.familyAndFriendsBusiness.QLD.description);
            break;
          default:
            throw Error("Invalid State");
        }
        break;
        break;
      default:
        throw Error("Invalid plan");
    }
  }

  public static async validateDiscount(t, fuelType, discount) {
    if(await testFunction.isElectricity(fuelType)) {
      await testFunction.assertText(t, EaHomePage.elements.eleDiscount, discount);
    } else if(await testFunction.isElectricity(fuelType)) {
      await testFunction.assertText(t, EaHomePage.elements.gasDiscount, discount);
    }
  }

  public static async enterNMIorMIRNorPostcode(t,NMIorMIRNorPostcodeValue,NMIorMIRNorPostcode){
      if(NMIorMIRNorPostcode==='NMI'){
        await testFunction.clearTextField(t,EaHomePage.elements.inputNMI);
        await testFunction.clearAndEnterText(t,EaHomePage.elements.inputNMI,NMIorMIRNorPostcodeValue);
      }
      if(NMIorMIRNorPostcode==='MIRN'){
        await testFunction.clearAndEnterText(t,EaHomePage.elements.inputMIRN,NMIorMIRNorPostcodeValue);
      }
      if(NMIorMIRNorPostcode==='POSTCODE'){
        await testFunction.clearAndEnterText(t,EaHomePage.elements.inputPostcode,NMIorMIRNorPostcodeValue);
      }

    }

  public static async verifyNMIorMIRNLookup(t,NMIorMIRNType){
      let errorMessage;
    switch (NMIorMIRNType) {
      case "STATE_NOT_SERVICED":
        errorMessage="Unfortunately we don't supply energy to postcode 6000. For more information please call us on";
        await testFunction.waitForElementToBeAppeared(t,EaHomePage.elements.txtStateNotServicedMsg);
        await testFunction.assertText(t,EaHomePage.elements.txtStateNotServicedMsg,errorMessage);
        break;
      case "POSTCODE_NOT_SERVICED":
        errorMessage="Unfortunately we don't supply energy to postcode 4600. For more information please call us on";
        await testFunction.waitForElementToBeAppeared(t,EaHomePage.elements.txtPostcodeNotServicedMsg);
        await testFunction.assertText(t,EaHomePage.elements.txtPostcodeNotServicedMsg,errorMessage);
        break;
      case "NMI_BLOCKED":
        errorMessage="We’re unable to sign you up online for Electricity because of the meter type detected at this address. For more information please call us on";
        await testFunction.waitForElementToBeAppeared(t,EaHomePage.elements.txtBlockedNMIMsg);
        await testFunction.assertText(t,EaHomePage.elements.txtBlockedNMIMsg,errorMessage);
        await testFunction.assertText(t,EaHomePage.elements.basicResiPlanHeadingFuel,'Gas');
        break;
      case "NMI_NOT_FOUND":
        errorMessage="Unfortunately we don't recognise NMI . You can enter your postcode instead to get the rates for your area, or give us a call us on";
        await testFunction.waitForElementToBeAppeared(t,EaHomePage.elements.txtNMINotFoundMsg);
        await testFunction.assertText(t,EaHomePage.elements.txtNMINotFoundMsg,errorMessage);
        break;
      case "MIRN_NOT_FOUND":
        errorMessage="Unfortunately we don't recognise MIRN . You can enter your postcode instead to get the rates for your area, or give us a call us on";
        await testFunction.waitForElementToBeAppeared(t,EaHomePage.elements.txtMIRNNotFoundMsg);
        await testFunction.assertText(t,EaHomePage.elements.txtMIRNNotFoundMsg,errorMessage);
        break;
      case "INVALID_CUSTOMER_TYPE":
        errorMessage="Meter detected";
        await testFunction.waitForElementToBeAppeared(t,EaHomePage.elements.changeCustomerModal);
        await testFunction.isElementDisplayed(t,EaHomePage.elements.changeCustomerModal);
        await testFunction.assertText(t,EaHomePage.elements.headingOnChangePlanSelectionModal,errorMessage);
        break;
      case "CAMPAIGN_NOT_SERVICED":
        errorMessage="This offer is not available in";
        await testFunction.waitForElementToBeAppeared(t,EaHomePage.elements.txtCampaignNotServicedMsg);
        await testFunction.assertText(t,EaHomePage.elements.txtCampaignNotServicedMsg,errorMessage);
        break;
      case "ADDRESS_NOT_SERVICED":
        errorMessage="We’re unable to sign you up online because of the meter type detected at this address. For more information please call us on";
        await testFunction.waitForElementToBeAppeared(t,EaHomePage.elements.txtAddressNotServicedMsg);
        await testFunction.assertText(t,EaHomePage.elements.txtAddressNotServicedMsg,errorMessage);
        break;
      case "GAS_NOT_SERVICED":
        errorMessage="we only supply electricity.";
        await testFunction.waitForElementToBeAppeared(t,EaHomePage.elements.txtAddressNotServicedMsg);
        await testFunction.assertText(t,EaHomePage.elements.txtAddressNotServicedMsg,errorMessage);
        await testFunction.assertText(t,EaHomePage.elements.basicResiPlanHeadingFuel,'Electricity');
        break;
      case "ELE_NOT_SERVICED":
        errorMessage="we only supply gas.";
        await testFunction.waitForElementToBeAppeared(t,EaHomePage.elements.txtAddressNotServicedMsg);
        await testFunction.assertText(t,EaHomePage.elements.txtAddressNotServicedMsg,errorMessage);
        await testFunction.assertText(t,EaHomePage.elements.basicResiPlanHeadingFuel,'Electricity');
        break;
      case "SYSTEM_ERROR":
        errorMessage="We're sorry, there has been an unexpected error and we're unable to process your request online. Please contact our team on 1800 596 517 and they'd be happy to assist.";
        await testFunction.assertText(t,EaHomePage.elements.txtSystemErrorMsg,errorMessage);
        break;
      case "SUCCESS":
        await testFunction.waitForElementToBeAppeared(t,EaHomePage.elements.eaSpinner);
        await testFunction.waitForElementToBeDisappeared(t,EaHomePage.elements.eaSpinner);
        let NMI=await EaHomePage.elements.inputNMI.textContent;
        let MIRN=await EaHomePage.elements.inputMIRN.textContent;
        await testFunction.assertText(t,EaHomePage.elements.txtElectricityBasedOn,'Electricity based on NMI '+NMI);
        await testFunction.assertText(t,EaHomePage.elements.txtGasBasedOn,'Gas based on MIRN '+MIRN);
        await testFunction.takeScreenshot(t, 'plans_page');//disabled UI Validation
        await this.selectPlan(t,'Total Plan');
        await cartsMethod.clickContinueCartsPage(t);
        await qualifierMethod.selectCustomerStatus(t,'New');
        await qualifierMethod.provideMovingType(t,'Non-Moving');
        await testFunction.takeScreenshot(t, 'plans_page');//disabled UI Validation
        await testFunction.click(t,eaQualifierPage.elements.addressContinue);
        await testFunction.isElementDisplayed(t,eaQualifierPage.elements.owner);
        break;
      default:
        throw Error("Invalid Error Code");
    }
  }

  public static async validateGeneralStateDisclaimer(t, customerType) {
    if(await testFunction.isResidential(customerType)) {
      //Residential customers
      await testFunction.assertText(t, EaHomePage.elements.disclaimer.generalStateDisclaimerP1, "When you choose us, you’ll be with a trusted power provider who supplies energy to 1.7 million Australian customers.");
      await testFunction.assertText(t, EaHomePage.elements.disclaimer.generalStateDisclaimerP2, "We are focusing on helping customers reduce their energy usage via tips in our blog on energy rating and how to be more energy efficient.");
      await testFunction.assertText(t, EaHomePage.elements.disclaimer.generalStateDisclaimerP3, "Compare energy plans from the options above and find our best electricity deals. Making an energy switch has never been so easy.");
    } else if(await testFunction.isBusiness(customerType)){
      //Business customers
      await testFunction.assertText(t, EaHomePage.elements.disclaimer.generalStateDisclaimerOld, "Find a better deal for your business here at EnergyAustralia. Easily compare plans, rates and benefits then switch online for instant email confirmation.");
    }
    console.log("General state disclaimer validated successfully on plans page.");
  }

  public static async validateComparisonStatement(t,baseCreditCondition,rewardCreditCondition,planName){
    let comparisonText;
    switch (planName) {
      case PlanType.NO_FRILLS:
        comparisonText=await testFunction.getElementText(t,EaHomePage.elements.noFrillsComparisonStatement);
        break;
      case PlanType.TOTAL_PLAN:
        comparisonText=await testFunction.getElementText(t,EaHomePage.elements.totalPlanComparisonStatement);
        break;
      case PlanType.TOTAL_PLAN_PLUS:
        comparisonText=await testFunction.getElementText(t,EaHomePage.elements.totalPlanPlusComparisonStatement);
        break;
      case PlanType.TOTAL_BUSINESS:
        comparisonText=await testFunction.getElementText(t,EaHomePage.elements.totalPlanBusinessComparisonStatement);
        break;
      case PlanType.TOTAL_PLAN_PLUS_BUSINESS:
        comparisonText=await testFunction.getElementText(t,EaHomePage.elements.totalPlanPlusBusinessComparisonStatement);
        break;

    }
    if(baseCreditCondition==='UNCONDITIONAL' && rewardCreditCondition===null){
      await t.expect(comparisonText).contains('and including credits');
      await t.expect(comparisonText).notContains('if eligible for credits');
    }
    if(baseCreditCondition==='CONDITIONAL' && rewardCreditCondition===null){
      await t.expect(comparisonText).contains('if eligible for credits');
      await t.expect(comparisonText).notContains('and including credits');
    }
    if(baseCreditCondition===null && rewardCreditCondition==='UNCONDITIONAL'){
      await t.expect(comparisonText).notContains('and including credits');
      await t.expect(comparisonText).notContains('if eligible for credits');
    }
    if(baseCreditCondition===null && rewardCreditCondition==='CONDITIONAL'){
      await t.expect(comparisonText).contains('if eligible for credits');
      await t.expect(comparisonText).notContains('and including credits');
    }
    if(baseCreditCondition==='UNCONDITIONAL' && rewardCreditCondition==='UNCONDITIONAL'){
      await t.expect(comparisonText).contains('and including credits');
      await t.expect(comparisonText).notContains('if eligible for credits');
    }
    if(baseCreditCondition==='CONDITIONAL' && rewardCreditCondition==='CONDITIONAL'){
      await t.expect(comparisonText).contains('if eligible for credits');
      await t.expect(comparisonText).notContains('and including credits');

    }
  }

  public static async validateReferencePrice(t,estimatedCost,referencePrice,percentageDiff,state,actualCustomerType){
    if(percentageDiff<0.5){
      if(state!=='QLD' && state!=='ACT'){
        if(actualCustomerType==='RES'){
          await testFunction.assertText(t,EaHomePage.elements.basicHomeReferencePrice,referencePrice.toString());
        }
        else{
          await testFunction.assertText(t,EaHomePage.elements.basicBusinessReferencePrice,referencePrice.toString());
        }
      }
      if(state==='QLD'){
        if(actualCustomerType==='RES'){
          await testFunction.assertText(t,EaHomePage.elements.basicHomeReferencePrice_QLD,referencePrice.toString());
        }
        else{
          await testFunction.assertText(t,EaHomePage.elements.basicBusinessReferencePrice_QLD,referencePrice.toString());
        }
      }
    }
    if(percentageDiff>0.5){
      if(state!=='QLD' && state!=='ACT'){
        if(actualCustomerType==='RES'){
          await testFunction.assertText(t,EaHomePage.elements.basicHomeReferencePrice,estimatedCost.toString());
          await testFunction.assertText(t,EaHomePage.elements.basicHomeReferencePrice,percentageDiff.toString());
        }
        else{
          await testFunction.assertText(t,EaHomePage.elements.basicBusinessReferencePrice,estimatedCost.toString());
          await testFunction.assertText(t,EaHomePage.elements.basicBusinessReferencePrice,percentageDiff.toString());
        }

      }
      if(state==='QLD'){
        if(actualCustomerType==='RES'){
          await testFunction.assertText(t,EaHomePage.elements.basicHomeReferencePrice_QLD,estimatedCost.toString());
          await testFunction.assertText(t,EaHomePage.elements.basicHomeReferencePrice_QLD,percentageDiff.toString());
        }
        else{
          await testFunction.assertText(t,EaHomePage.elements.basicBusinessReferencePrice_QLD,estimatedCost.toString());
          await testFunction.assertText(t,EaHomePage.elements.basicBusinessReferencePrice_QLD,percentageDiff.toString());
        }
      }
    }
  }

  public static async validateEstimatedCost(t,planName,estimatedCost,actualCustomerType,state){
    if(planName.includes('Basic - Home') || planName.includes('Basic - Business ')){
      if(state!=='QLD' && state!=='ACT'){
        if(actualCustomerType==='RES'){
          await testFunction.assertText(t,EaHomePage.elements.basicHomePlanEstimate,estimatedCost.toString());
        }
        else{
          await testFunction.assertText(t,EaHomePage.elements.basicBusinessPlanEstimate,estimatedCost.toString());
        }
      }
      if(state==='QLD'){
        if(actualCustomerType==='RES'){
          await testFunction.assertText(t,EaHomePage.elements.basicHomePlanEstimate_QLD,estimatedCost.toString());
        }
        else{
          await testFunction.assertText(t,EaHomePage.elements.basicBusinessPlanEstimate_QLD,estimatedCost.toString());
        }
      }
    }
    if(planName.includes('No Frills (Home)')){
      await testFunction.assertText(t,EaHomePage.elements.noFrillsPlanEstimate,estimatedCost.toString());
    }
    if(planName.includes('Total Plan (Home) ')){
      await testFunction.assertText(t,EaHomePage.elements.totalPlanEstimate,estimatedCost.toString());
    }
    if(planName.includes('Total Plan (Business)')){
      await testFunction.assertText(t,EaHomePage.elements.totalPlanBusinessEstimate,estimatedCost.toString());
    }
  }

  public static async validateBestOfferEstimatedCost(t,planName,estimatedCost,percentageDiff,benchmarkUsage){
    // if(planName.includes('Basic - Home') || planName.includes('Basic - Business ')){
    //   if(state!=='QLD' && state!=='ACT'){
    //     if(actualCustomerType==='RES'){
    //       await testFunction.assertText(t,EaHomePage.elements.basicHomePlanEstimate,estimatedCost.toString());
    //     }
    //     else{
    //       await testFunction.assertText(t,EaHomePage.elements.basicBusinessPlanEstimate,estimatedCost.toString());
    //     }
    //   }
    //   if(state==='QLD'){
    //     if(actualCustomerType==='RES'){
    //       await testFunction.assertText(t,EaHomePage.elements.basicHomePlanEstimate_QLD,estimatedCost.toString());
    //     }
    //     else{
    //       await testFunction.assertText(t,EaHomePage.elements.basicBusinessPlanEstimate_QLD,estimatedCost.toString());
    //     }
    //   }
    // }
    if(planName.includes('No Frills - Home')){
      await testFunction.assertText(t,EaHomePage.elements.noFrillsPlanEstimate,estimatedCost.toString());
      if(benchmarkUsage!=="")
        await testFunction.assertText(t,EaHomePage.elements.noFrillsComparisonStatement,percentageDiff.toString());
    }
    if(planName.includes('Total Plan - Home')){
      await testFunction.assertText(t,EaHomePage.elements.totalPlanEstimate,estimatedCost.toString());
      if(benchmarkUsage!=="")
        await testFunction.assertText(t,EaHomePage.elements.totalPlanComparisonStatement,percentageDiff.toString());
    }
    if(planName.includes('Total Plan Plus - Home')){
      let basicHomePlanEstimate=Number(await testFunction.getElementText(t,EaHomePage.elements.basicHomePlanEstimate).substring(1));
      let expectedPercentageDiff=Math.round(Number(((basicHomePlanEstimate-estimatedCost)/basicHomePlanEstimate)*100));
      await testFunction.assertTextValue(t,percentageDiff.toString(),expectedPercentageDiff.toString());
    }
    if(planName.includes('Total Plan - Business')){
      await testFunction.assertText(t,EaHomePage.elements.totalPlanBusinessEstimate,estimatedCost.toString());
      if(benchmarkUsage!=="")
        await testFunction.assertText(t,EaHomePage.elements.totalPlanBusinessComparisonStatement,percentageDiff.toString());
    }
    if(planName.includes('Total Plan Plus - Business')){
      let basicBusinessPlanEstimate=Number((await testFunction.getElementText(t,EaHomePage.elements.basicBusinessPlanEstimate)).substring(1));
      let expectedPercentageDiff=Math.round(Number(((basicBusinessPlanEstimate-estimatedCost)/basicBusinessPlanEstimate)*100));
      await testFunction.assertTextValue(t,percentageDiff.toString(),expectedPercentageDiff.toString());
    }
  }
}

export class selectionOptionModalWindowMethod {
    public static async selectOptionsModalWindow(t, modalWindowValue) {
        if (modalWindowValue.toLowerCase() === 'verify account') {
          await testFunction.click(t,EaHomePage.elements.modalVerifyAccountOption);
        } else if (modalWindowValue.toLowerCase() === 'bill upload') {
          await testFunction.click(t,EaHomePage.elements.modalBillUploadOption);
        } else if (modalWindowValue === 'enter usage') {
          await testFunction.click(t, EaHomePage.elements.modalEnterUsageOption);
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
        let expectedLoyaltyPlanMessage = 'As a valued customer who\'s been with us for at least six consecutive months, you can sign up to Total Plan Plus. It\'s got the same features as Total Plan, but with a higher discount off your total energy bill. So you can enjoy a higher discount on both usage and supply charges for 12 months. Click \'Show estimates\' to compare Total Plan Plus against our other plans.';
        await testFunction.isElementDisplayed(t,EaHomePage.elements.getCostEstimatesChangeButton);
        await testFunction.assertText(t, EaHomePage.elements.txtLoyaltyPlanMsg, expectedLoyaltyPlanMessage);
        await testFunction.click(t, EaHomePage.elements.getCostEstimatesChangeButton);
        await testFunction.waitForElementToBeDisappeared(t,EaHomePage.elements.eaSpinner);
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

  public static async enterSampleAccountDetails(t, customerType) {
    if(await testFunction.isResidential(customerType)) {
      await verifyAccountMethod.provideAccountDetails(t,"ELE", config.sampleResiAccount.eleAccount);
      await verifyAccountMethod.provideAccountDetails(t, "GAS", config.sampleResiAccount.gasAccount);
      await verifyAccountMethod.provideAccountInformation(t, config.sampleResiAccount.postcode, customerType);
    }else {
      await verifyAccountMethod.provideAccountDetails(t,"ELE", config.sampleBsmeAccount.eleAccount);
      await verifyAccountMethod.provideAccountDetails(t, "GAS", config.sampleBsmeAccount.gasAccount);
      await verifyAccountMethod.provideAccountInformation(t, config.sampleBsmeAccount.abn, customerType);
    }
  }
}

export class campaignMethod{
  public static async enterPostcodeOnCampaign(t,postcode){
    await testFunction.clearAndEnterText(t,EaHomePage.elements.postcodeOnCampaignPage,postcode);
    await testFunction.click(t,EaHomePage.elements.btnCampaignSearch);
    await testFunction.waitForElementToBeDisappeared(t,EaHomePage.elements.eaSpinner);
  }

  public static async enterOfferCodeAndPostcodeOnCampaign(t,offerCode,postcode) {
    if(await this.isNswSeniors()) {
      await testFunction.clearAndEnterText(t, EaHomePage.elements.txtOfferCodeSeniorsCard, offerCode);
    } else {
      await testFunction.clearAndEnterText(t, EaHomePage.elements.txtOfferCode, offerCode);
    }
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

  public static async addPlanOnCampaign(t){
    await testFunction.click(t,EaHomePage.elements.selectCampaignPlans);
  }

  public static async isNswSeniors() {
    let pageUrl = await testFunction.getPageURL();
    return pageUrl.includes("/nsw-seniors");
  }

}
