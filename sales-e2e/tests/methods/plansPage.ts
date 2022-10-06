import {AustralianState, CustomerType, FUEL_TYPE_OPTIONS} from '@ea/ea-commons-models';
import {IdType, PlanType, scrollTo, testFunction} from '../../global_methods/helper';
import {cartsMethod} from './cartsPage';
import {qualifierMethod} from './qualifierPage';
const EaHomePage = require('../pages/energy-australia-home.page');
const eaQualifierPage = require('../pages/qualifier.page');
import {Selector} from 'testcafe';
import {getSpyData, spyOff, spyOn} from '../../global_methods/analyticsFunction';
const { config }=require('../../resources/resource');
const fs   = require('fs');
const validateAnalyticsEvent=config.validateAnalytics;

export class plansMethod {
  public static async clickPlansPageModal(t, customerType) {
    if (customerType === CustomerType.RESIDENTIAL || customerType === CustomerType.BUSINESS) {
      if (testFunction.isMobile()) {
        await testFunction.click(t, EaHomePage.elements.ModalWindowMobileOnly);
      } else {
        await testFunction.click(t, EaHomePage.elements.ModalWindow);
      }
    } else {
      console.error('Modal window could not be opened due to page error');
    }
  }

  public static async verifyVerifyAccountChangeButton(t) {
    await testFunction.isElementDisplayed(t, EaHomePage.elements.changeLinkVerifyAccount);
  }

  public static async selectFuel(t, fuelType) {
    if (testFunction.getElementText(t, EaHomePage.elements.selectedState.innerText) !== AustralianState.QLD) {
      switch (fuelType) {
        case FUEL_TYPE_OPTIONS.BOTH.value:
          await testFunction.click(t, EaHomePage.elements.fuelSelectorOption);
          await testFunction.click(t, EaHomePage.elements.fuelSelectorOptionDual);
          break;
        case FUEL_TYPE_OPTIONS.ELE.value:
          await testFunction.click(t, EaHomePage.elements.fuelSelectorOption);
          await testFunction.click(t, EaHomePage.elements.fuelSelectorOptionEle);
          break;
        case FUEL_TYPE_OPTIONS.GAS.value:
          await testFunction.click(t, EaHomePage.elements.fuelSelectorOption);
          await testFunction.click(t, EaHomePage.elements.fuelSelectorOptionGas);
          break;
        default:
          console.error("Invalid fuel type is selected");
      }
    } else {
      console.log("Fuel selector is not available for QLD.");
    }

    await testFunction.waitForElementToBeDisappeared(t, EaHomePage.elements.eaSpinner);
  }

  public static async selectSimplifiedPlanToggleButton(t, planToggleButton: string){
    if (planToggleButton === 'All'){
      await testFunction.click(t, EaHomePage.elements.allFeaturesToggleButton);
    } else
    {
      await testFunction.click(t, EaHomePage.elements.keyFeaturesToggleButton)
    }
  }

  public static async selectPlan(t: any, planName: any) {
    switch (planName) {
      case PlanType.BASIC_HOME:
        await testFunction.click(t, EaHomePage.elements.basicPlan);
        break;
      case PlanType.BASIC_HOME_QLD:
        await testFunction.click(t, EaHomePage.elements.basicPlanQLD);
        break;
      case PlanType.NO_FRILLS:
        if (testFunction.isMobile()) {
          await scrollTo(EaHomePage.elements.noFrillsPlan);
        }
        await testFunction.click(t, EaHomePage.elements.noFrillsPlan);
        break;
      case PlanType.TOTAL_PLAN:
        if (testFunction.isMobile() || testFunction.isTablet()) {
          await scrollTo(EaHomePage.elements.totalPlan);
        }
        await testFunction.click(t, EaHomePage.elements.totalPlan);
        break;
      case PlanType.FLEXI_PLAN:
        if (testFunction.isMobile() || testFunction.isTablet()) {
          await scrollTo(EaHomePage.elements.FlexiPlanTable.flexiPlan);
        }
        await testFunction.click(t, EaHomePage.elements.FlexiPlanTable.flexiPlan);
        break;
      case PlanType.TOTAL_PLAN_PLUS:
        if (testFunction.isMobile() || testFunction.isTablet()) {
          await scrollTo(EaHomePage.elements.totalPlanPlus);
        }
        await testFunction.click(t, EaHomePage.elements.totalPlanPlus);
        break;
      case PlanType.SOLAR_MAX:
        if (testFunction.isMobile() || testFunction.isTablet()) {
          await scrollTo(EaHomePage.elements.SolarMaxPlanTable.sMaxPlan);
        }
        await testFunction.click(t, EaHomePage.elements.SolarMaxPlanTable.sMaxPlan);
        break;
      case PlanType.BASIC_BUSINESS:
        if (testFunction.isMobile() || testFunction.isTablet()) {
          await scrollTo(EaHomePage.elements.basicBusiness);
        }
        await testFunction.click(t, EaHomePage.elements.basicBusiness);
        break;
      case PlanType.BASIC_BUSINESS_QLD:
        if (testFunction.isMobile() || testFunction.isTablet()) {
          await scrollTo(EaHomePage.elements.basicBusinessQLD);
        }
        await testFunction.click(t, EaHomePage.elements.basicBusinessQLD);
        break;
      case PlanType.NO_FRILLS_BUSINESS:
        await testFunction.click(t, EaHomePage.elements.noFrillBusiness);
        break;
      case PlanType.TOTAL_BUSINESS:
        if (testFunction.isMobile()) {
          await scrollTo(EaHomePage.elements.totalPlanBusiness);
        }
        await testFunction.click(t, EaHomePage.elements.totalPlanBusiness);
        break;
      case PlanType.TOTAL_PLAN_PLUS_BUSINESS:
        if (testFunction.isMobile() || testFunction.isTablet()) {
          await scrollTo(EaHomePage.elements.totalPlanPlusBusiness);
        }
        await testFunction.click(t, EaHomePage.elements.totalPlanPlusBusiness);
        break;
      case PlanType.BUSINESS_CARBON_NEUTRAL:
        if (testFunction.isMobile() || testFunction.isTablet()) {
          await scrollTo(EaHomePage.elements.businessCNPlan);
        }
        await testFunction.click(t, EaHomePage.elements.businessCNPlan);
        break;
      case PlanType.BUSINESS_CARBON_NEUTRAL_FLEXI:
        if (testFunction.isMobile() || testFunction.isTablet()) {
          await scrollTo(EaHomePage.elements.businessCNFPlan);
        }
        await testFunction.click(t, EaHomePage.elements.businessCNFPlan);
        break;
      case PlanType.BUSINESS_BALANCE_PLAN:
        if (testFunction.isMobile() || testFunction.isTablet()) {
          await scrollTo(EaHomePage.elements.businessBalancePlan);
        }
        await testFunction.click(t, EaHomePage.elements.businessBalancePlan);
        break;
      case PlanType.RESIDENTIAL_BALANCE_PLAN:
        if (testFunction.isMobile() || testFunction.isTablet()) {
          await scrollTo(EaHomePage.elements.residentialBalancePlan);
        }
        await testFunction.click(t, EaHomePage.elements.residentialBalancePlan);
        break;
      case PlanType.SOLAR_MAX_COMBO:
        if (testFunction.isMobile() || testFunction.isTablet()) {
          await scrollTo(EaHomePage.elements.SolarMaxPlanTable.sMaxPlan);
        }
        await testFunction.click(t, EaHomePage.elements.SolarMaxPlanTable.sMaxPlan);
        break;
      default:
        console.error("Invalid plan is selected");
    }
  }

  public static async validateThePlansAreLoaded(t) {
    await testFunction.isElementDisplayed(t, EaHomePage.elements.planCostEstimate);
  }

  public static async validateAccountNumberAnalytics(t, accountFuelRelationship,accountNumber, accountInfo){
    if(validateAnalyticsEvent==='Y'){
      if(accountFuelRelationship==='Electricity'){
        let elecAccountNumber = await t.eval(() => window.ead.user.account[0].accNumber);
        let accountInformation = await t.eval(() => window.ead.user.account[0].accPostCode);
        await t.expect(elecAccountNumber).eql(accountNumber);
        await t.expect(accountInformation).eql(accountInfo);
      }else if(accountFuelRelationship==='Gas'){
        let gasAccountNumber = await t.eval(() => window.ead.user.account[1].accNumber);
        let accountInformation = await t.eval(() => window.ead.user.account[1].accPostCode);
        await t.expect(gasAccountNumber).eql(accountNumber);
        await t.expect(accountInformation).eql(accountInfo);
      }
      console.log("Analytics validated for "+accountFuelRelationship+" Account");
    }
  }

  public static async validatePlanHeading(t, dataTable, data: any) {
    if (dataTable[0].fuelType === "ELE") {
      switch (dataTable[0].state) {
        case AustralianState.NSW:
          await testFunction.assertText(t, EaHomePage.campaignElements.elePlanHeadingTitle, data.planDetails.NSW.planName);
          await testFunction.assertText(t, EaHomePage.campaignElements.elePlanHeadingFuel, "Electricity");
          await testFunction.assertText(t, EaHomePage.campaignElements.elePlanHeadingDescription, data.planDetails.NSW.planDescription);
          break;
        case AustralianState.VIC:
          await testFunction.assertText(t, EaHomePage.campaignElements.elePlanHeadingTitle, data.planDetails.VIC.planName);
          await testFunction.assertText(t, EaHomePage.campaignElements.elePlanHeadingFuel, "Electricity");
          await testFunction.assertText(t, EaHomePage.campaignElements.elePlanHeadingDescription, data.planDetails.VIC.planDescription);
          break;
        case AustralianState.SA:
          await testFunction.assertText(t, EaHomePage.campaignElements.elePlanHeadingTitle, data.planDetails.SA.planName);
          await testFunction.assertText(t, EaHomePage.campaignElements.elePlanHeadingFuel, "Electricity");
          await testFunction.assertText(t, EaHomePage.campaignElements.elePlanHeadingDescription, data.planDetails.SA.planDescription);
          break;
        case AustralianState.ACT:
          await testFunction.assertText(t, EaHomePage.campaignElements.elePlanHeadingTitle, data.planDetails.ACT.planName);
          await testFunction.assertText(t, EaHomePage.campaignElements.elePlanHeadingFuel, "Electricity");
          await testFunction.assertText(t, EaHomePage.campaignElements.elePlanHeadingDescription, data.planDetails.ACT.planDescription);
          break;
        case AustralianState.QLD:
          await testFunction.assertText(t, EaHomePage.campaignElements.elePlanHeadingTitle, data.planDetails.QLD.planName);
          await testFunction.assertText(t, EaHomePage.campaignElements.elePlanHeadingFuel, "Electricity");
          await testFunction.assertText(t, EaHomePage.campaignElements.elePlanHeadingDescription, data.planDetails.QLD.planDescription);
          break;
        default:
          console.log("Invalid Electricity plan details for state");
      }

    } else if (dataTable[0].fuelType === 'GAS') {
      switch (dataTable[0].state) {
        case AustralianState.NSW:
          await testFunction.assertText(t, EaHomePage.campaignElements.gasPlanHeadingTitle, data.planDetails.NSW.planName);
          await testFunction.assertText(t, EaHomePage.campaignElements.gasPlanHeadingFuel, "Gas");
          await testFunction.assertText(t, EaHomePage.campaignElements.gasPlanHeadingDescription, data.planDetails.NSW.planDescription);
          break;
        case AustralianState.VIC:
          await testFunction.assertText(t, EaHomePage.campaignElements.gasPlanHeadingTitle, data.planDetails.VIC.planName);
          await testFunction.assertText(t, EaHomePage.campaignElements.gasPlanHeadingFuel, "Gas");
          await testFunction.assertText(t, EaHomePage.campaignElements.gasPlanHeadingDescription, data.planDetails.VIC.planDescription);
          break;
        case AustralianState.SA:
          await testFunction.assertText(t, EaHomePage.campaignElements.gasPlanHeadingTitle, data.planDetails.SA.planName);
          await testFunction.assertText(t, EaHomePage.campaignElements.gasPlanHeadingFuel, "Gas");
          await testFunction.assertText(t, EaHomePage.campaignElements.gasPlanHeadingDescription, data.planDetails.SA.planDescription);
          break;
        case AustralianState.ACT:
          await testFunction.assertText(t, EaHomePage.campaignElements.gasPlanHeadingTitle, data.planDetails.ACT.planName);
          await testFunction.assertText(t, EaHomePage.campaignElements.gasPlanHeadingFuel, "Gas");
          await testFunction.assertText(t, EaHomePage.campaignElements.gasPlanHeadingDescription, data.planDetails.ACT.planDescription);
          break;
        case AustralianState.QLD:
          await testFunction.assertText(t, EaHomePage.campaignElements.gasPlanHeadingTitle, data.planDetails.QLD.planName);
          await testFunction.assertText(t, EaHomePage.campaignElements.gasPlanHeadingFuel, "Gas");
          await testFunction.assertText(t, EaHomePage.campaignElements.gasPlanHeadingDescription, data.planDetails.QLD.planDescription);
          break;
        default:
          console.log("Invalid GAS plan details for state");
      }
    }
  }

  public static async validatePlanHeadingPlanPage(t, dataTable, data: any, page) {
    console.log("Validating Plan details for "+dataTable[0].planName);
    if (page === "Residential") {
      switch(dataTable[0].planName){
        case PlanType.BASIC_HOME :
          await testFunction.assertText(t, EaHomePage.elements.BasicPlanTable.basicHomeTitle, data.planName);
          await testFunction.assertText(t, EaHomePage.elements.BasicPlanTable.basicHomeFuel, "Electricity & gas");
          await testFunction.assertText(t, EaHomePage.elements.BasicPlanTable.basicHomePlanHeadingDescription, data.planDescription);
        case PlanType.RESIDENTIAL_BALANCE_PLAN :
          if(dataTable[0].fuelType==="BOTH") {
            switch (dataTable[0].state) {
              case AustralianState.NSW:
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.residentialBalanceTitle, data.planDetails.NSW.planName);
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.residentialBalanceFuel, "Electricity & gas");
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.residentialBalanceHeadingDescription, data.planDetails.NSW.planDescription);
                break;
              case AustralianState.VIC:
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.residentialBalanceTitle, data.planDetails.VIC.planName);
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.residentialBalanceFuel, "Electricity & gas");
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.residentialBalanceHeadingDescription, data.planDetails.VIC.planDescription);
                break;
              case AustralianState.SA:
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.residentialBalanceTitle, data.planDetails.SA.planName);
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.residentialBalanceFuel, "Electricity & gas");
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.residentialBalanceHeadingDescription, data.planDetails.SA.planDescription);
                break;
              case AustralianState.ACT:
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.residentialBalanceTitle, data.planDetails.ACT.planName);
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.residentialBalanceFuel, "Electricity & gas");
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.residentialBalanceHeadingDescription, data.planDetails.ACT.planDescription);
                break;
              case AustralianState.QLD:
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.residentialBalanceTitle, data.planDetails.QLD.planName);
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.residentialBalanceFuel, "Electricity & gas");
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.residentialBalanceHeadingDescription, data.planDetails.QLD.planDescription);
                break;
              default:
                console.log("Invalid combo plan details for state");
            }
          }else if(dataTable[0].fuelType==="ELE") {
            switch (dataTable[0].state) {
              case AustralianState.NSW:
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.residentialBalanceTitle, data.planDetails.NSW.planName);
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.residentialBalanceFuel, "Electricity");
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.residentialBalanceHeadingDescription, data.planDetails.NSW.planDescription);
                break;
              case AustralianState.VIC:
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.residentialBalanceTitle, data.planDetails.VIC.planName);
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.residentialBalanceFuel, "Electricity");
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.residentialBalanceHeadingDescription, data.planDetails.VIC.planDescription);
                break;
              case AustralianState.SA:
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.residentialBalanceTitle, data.planDetails.SA.planName);
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.residentialBalanceFuel, "Electricity");
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.residentialBalanceHeadingDescription, data.planDetails.SA.planDescription);
                break;
              case AustralianState.ACT:
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.residentialBalanceTitle, data.planDetails.ACT.planName);
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.residentialBalanceFuel, "Electricity");
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.residentialBalanceHeadingDescription, data.planDetails.ACT.planDescription);
                break;
              case AustralianState.QLD:
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.residentialBalanceTitle, data.planDetails.QLD.planName);
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.residentialBalanceFuel, "Electricity");
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.residentialBalanceHeadingDescription, data.planDetails.QLD.planDescription);
                break;
              default:
                console.log("Invalid electricity plan details for state");
            }
          }else{
            console.log("Invalid fueltype");
          }
          break;
        case PlanType.TOTAL_PLAN :
          if(dataTable[0].fuelType==="BOTH") {
            // await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.totalPlanTitle, data.planName);
            // await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.totalPlanFuel, "Electricity & gas");
            // await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.totalPlanHeadingDescription, data.planDescription);

            switch (dataTable[0].state) {
              case AustralianState.NSW:
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.totalPlanTitle, data.planDetails.NSW.planName);
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.totalPlanFuel, "Electricity & gas");
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.totalPlanHeadingDescription, data.planDetails.NSW.planDescription);
                break;
              case AustralianState.VIC:
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.totalPlanTitle, data.planDetails.VIC.planName);
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.totalPlanFuel, "Electricity & gas");
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.totalPlanHeadingDescription, data.planDetails.VIC.planDescription);
                break;
              case AustralianState.SA:
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.totalPlanTitle, data.planDetails.SA.planName);
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.totalPlanFuel, "Electricity & gas");
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.totalPlanHeadingDescription, data.planDetails.SA.planDescription);
                break;
              case AustralianState.ACT:
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.totalPlanTitle, data.planDetails.ACT.planName);
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.totalPlanFuel, "Electricity & gas");
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.totalPlanHeadingDescription, data.planDetails.ACT.planDescription);
                break;
              case AustralianState.QLD:
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.totalPlanTitle, data.planDetails.QLD.planName);
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.totalPlanFuel, "Electricity & gas");
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.totalPlanHeadingDescription, data.planDetails.QLD.planDescription);
                break;
              default:
                console.log("Invalid combo plan details for state");
            }
          }else if(dataTable[0].fuelType==="ELE") {
            // await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.totalPlanTitle, data.planName);
            // await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.totalPlanFuel, "Electricity");
            // await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.totalPlanHeadingDescription, data.planDescription);

            switch (dataTable[0].state) {
              case AustralianState.NSW:
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.totalPlanTitle, data.planDetails.NSW.planName);
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.totalPlanFuel, "Electricity");
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.totalPlanHeadingDescription, data.planDetails.NSW.planDescription);
                break;
              case AustralianState.VIC:
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.totalPlanTitle, data.planDetails.VIC.planName);
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.totalPlanFuel, "Electricity");
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.totalPlanHeadingDescription, data.planDetails.VIC.planDescription);
                break;
              case AustralianState.SA:
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.totalPlanTitle, data.planDetails.SA.planName);
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.totalPlanFuel, "Electricity");
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.totalPlanHeadingDescription, data.planDetails.SA.planDescription);
                break;
              case AustralianState.ACT:
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.totalPlanTitle, data.planDetails.ACT.planName);
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.totalPlanFuel, "Electricity");
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.totalPlanHeadingDescription, data.planDetails.ACT.planDescription);
                break;
              case AustralianState.QLD:
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.totalPlanTitle, data.planDetails.QLD.planName);
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.totalPlanFuel, "Electricity");
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.totalPlanHeadingDescription, data.planDetails.QLD.planDescription);
                break;
              default:
                console.log("Invalid electricity plan details for state");
            }

          }else{
            console.log("Invalid fueltype");
          }
          break;
        case PlanType.FLEXI_PLAN :
          if(dataTable[0].fuelType==="BOTH") {
            switch (dataTable[0].state) {
              case AustralianState.NSW:
                await testFunction.assertText(t, EaHomePage.elements.FlexiPlanTable.flexiPlanTitle, data.planDetails.NSW.planName);
                await testFunction.assertText(t, EaHomePage.elements.FlexiPlanTable.flexiPlanFuel, "Electricity & gas");
                await testFunction.assertText(t, EaHomePage.elements.FlexiPlanTable.flexiPlanHeadingDescription, data.planDetails.NSW.planDescription);
                break;
              case AustralianState.VIC:
                await testFunction.assertText(t, EaHomePage.elements.FlexiPlanTable.flexiPlanTitle, data.planDetails.VIC.planName);
                await testFunction.assertText(t, EaHomePage.elements.FlexiPlanTable.flexiPlanFuel, "Electricity & gas");
                await testFunction.assertText(t, EaHomePage.elements.FlexiPlanTable.flexiPlanHeadingDescription, data.planDetails.VIC.planDescription);
                break;
              case AustralianState.SA:
                await testFunction.assertText(t, EaHomePage.elements.FlexiPlanTable.flexiPlanTitle, data.planDetails.SA.planName);
                await testFunction.assertText(t, EaHomePage.elements.FlexiPlanTable.flexiPlanFuel, "Electricity & gas");
                await testFunction.assertText(t, EaHomePage.elements.FlexiPlanTable.flexiPlanHeadingDescription, data.planDetails.SA.planDescription);
                break;
              case AustralianState.ACT:
                await testFunction.assertText(t, EaHomePage.elements.FlexiPlanTable.flexiPlanTitle, data.planDetails.ACT.planName);
                await testFunction.assertText(t, EaHomePage.elements.FlexiPlanTable.flexiPlanFuel, "Electricity & gas");
                await testFunction.assertText(t, EaHomePage.elements.FlexiPlanTable.flexiPlanHeadingDescription, data.planDetails.ACT.planDescription);
                break;
              case AustralianState.QLD:
                await testFunction.assertText(t, EaHomePage.elements.FlexiPlanTable.flexiPlanTitle, data.planDetails.QLD.planName);
                await testFunction.assertText(t, EaHomePage.elements.FlexiPlanTable.flexiPlanFuel, "Electricity & gas");
                await testFunction.assertText(t, EaHomePage.elements.FlexiPlanTable.flexiPlanHeadingDescription, data.planDetails.QLD.planDescription);
                break;
              default:
                console.log("Invalid combo plan details for state");
            }
          }else if(dataTable[0].fuelType==="ELE") {
              switch (dataTable[0].state) {
                case AustralianState.NSW:
                  await testFunction.assertText(t, EaHomePage.elements.FlexiPlanTable.flexiPlanTitle, data.planDetails.NSW.planName);
                  await testFunction.assertText(t, EaHomePage.elements.FlexiPlanTable.flexiPlanFuel, "Electricity");
                  await testFunction.assertText(t, EaHomePage.elements.FlexiPlanTable.flexiPlanHeadingDescription, data.planDetails.NSW.planDescription);
                  break;
                case AustralianState.VIC:
                  await testFunction.assertText(t, EaHomePage.elements.FlexiPlanTable.flexiPlanTitle, data.planDetails.VIC.planName);
                  await testFunction.assertText(t, EaHomePage.elements.FlexiPlanTable.flexiPlanFuel, "Electricity");
                  await testFunction.assertText(t, EaHomePage.elements.FlexiPlanTable.flexiPlanHeadingDescription, data.planDetails.VIC.planDescription);
                  break;
                case AustralianState.SA:
                  await testFunction.assertText(t, EaHomePage.elements.FlexiPlanTable.flexiPlanTitle, data.planDetails.SA.planName);
                  await testFunction.assertText(t, EaHomePage.elements.FlexiPlanTable.flexiPlanFuel, "Electricity");
                  await testFunction.assertText(t, EaHomePage.elements.FlexiPlanTable.flexiPlanHeadingDescription, data.planDetails.SA.planDescription);
                  break;
                case AustralianState.ACT:
                  await testFunction.assertText(t, EaHomePage.elements.FlexiPlanTable.flexiPlanTitle, data.planDetails.ACT.planName);
                  await testFunction.assertText(t, EaHomePage.elements.FlexiPlanTable.flexiPlanFuel, "Electricity");
                  await testFunction.assertText(t, EaHomePage.elements.FlexiPlanTable.flexiPlanHeadingDescription, data.planDetails.ACT.planDescription);
                  break;
                case AustralianState.QLD:
                  await testFunction.assertText(t, EaHomePage.elements.FlexiPlanTable.flexiPlanTitle, data.planDetails.QLD.planName);
                  await testFunction.assertText(t, EaHomePage.elements.FlexiPlanTable.flexiPlanFuel, "Electricity");
                  await testFunction.assertText(t, EaHomePage.elements.FlexiPlanTable.flexiPlanHeadingDescription, data.planDetails.QLD.planDescription);
                  break;
                default:
                  console.log("Invalid electricity plan details for state");
              }
          }else{
            console.log("Invalid fueltype");
          }
          break;
          case PlanType.SOLAR_MAX_COMBO :
            if(dataTable[0].fuelType==="BOTH") {
              switch (dataTable[0].state) {
                case AustralianState.NSW:
                  await testFunction.assertText(t, EaHomePage.elements.SolarMaxPlanTable.sMaxPlanTitle, data.planDetails.NSW.planName);
                  await testFunction.assertText(t, EaHomePage.elements.SolarMaxPlanTable.sMaxPlanFuel, "Electricity & gas");
                  await testFunction.assertText(t, EaHomePage.elements.SolarMaxPlanTable.sMaxPlanHeadingDescription, data.planDetails.NSW.planDescription);
                  break;
                case AustralianState.VIC:
                  await testFunction.assertText(t, EaHomePage.elements.SolarMaxPlanTable.sMaxPlanTitle, data.planDetails.VIC.planName);
                  await testFunction.assertText(t, EaHomePage.elements.SolarMaxPlanTable.sMaxPlanFuel, "Electricity & gas");
                  await testFunction.assertText(t, EaHomePage.elements.SolarMaxPlanTable.sMaxPlanHeadingDescription, data.planDetails.NSW.planDescription);
                  break;
                case AustralianState.SA:
                  await testFunction.assertText(t, EaHomePage.elements.SolarMaxPlanTable.sMaxPlanTitle, data.planDetails.SA.planName);
                  await testFunction.assertText(t, EaHomePage.elements.SolarMaxPlanTable.sMaxPlanFuel, "Electricity & gas");
                  await testFunction.assertText(t, EaHomePage.elements.SolarMaxPlanTable.sMaxPlanHeadingDescription, data.planDetails.SA.planDescription);
                  break;
                case AustralianState.ACT:
                  await testFunction.assertText(t, EaHomePage.elements.SolarMaxPlanTable.sMaxPlanTitle, data.planDetails.ACT.planName);
                  await testFunction.assertText(t, EaHomePage.elements.SolarMaxPlanTable.sMaxPlanFuel, "Electricity & gas");
                  await testFunction.assertText(t, EaHomePage.elements.SolarMaxPlanTable.sMaxPlanHeadingDescription, data.planDetails.ACT.planDescription);
                  break;
                default:
                  console.log("Invalid combo plan details for state");
              }
            }else if(dataTable[0].fuelType==="ELE") {
                switch (dataTable[0].state) {
                  case AustralianState.NSW:
                    await testFunction.assertText(t, EaHomePage.elements.SolarMaxPlanTable.sMaxPlanTitle, data.planDetails.NSW.planName);
                    await testFunction.assertText(t, EaHomePage.elements.SolarMaxPlanTable.sMaxPlanFuel, "Electricity");
                    await testFunction.assertText(t, EaHomePage.elements.SolarMaxPlanTable.sMaxPlanHeadingDescription, data.planDetails.NSW.planDescription);
                    break;
                  case AustralianState.VIC:
                    await testFunction.assertText(t, EaHomePage.elements.SolarMaxPlanTable.sMaxPlanTitle, data.planDetails.VIC.planName);
                    await testFunction.assertText(t, EaHomePage.elements.SolarMaxPlanTable.sMaxPlanFuel, "Electricity");
                    await testFunction.assertText(t, EaHomePage.elements.SolarMaxPlanTable.sMaxPlanHeadingDescription, data.planDetails.VIC.planDescription);
                    break;
                  case AustralianState.SA:
                    await testFunction.assertText(t, EaHomePage.elements.SolarMaxPlanTable.sMaxPlanTitle, data.planDetails.SA.planName);
                    await testFunction.assertText(t, EaHomePage.elements.SolarMaxPlanTable.sMaxPlanFuel, "Electricity");
                    await testFunction.assertText(t, EaHomePage.elements.SolarMaxPlanTable.sMaxPlanHeadingDescription, data.planDetails.SA.planDescription);
                    break;
                  case AustralianState.ACT:
                    await testFunction.assertText(t, EaHomePage.elements.SolarMaxPlanTable.sMaxPlanTitle, data.planDetails.ACT.planName);
                    await testFunction.assertText(t, EaHomePage.elements.SolarMaxPlanTable.sMaxPlanFuel, "Electricity");
                    await testFunction.assertText(t, EaHomePage.elements.SolarMaxPlanTable.sMaxPlanHeadingDescription, data.planDetails.ACT.planDescription);
                    break;
                  case AustralianState.QLD:
                    await testFunction.assertText(t, EaHomePage.elements.SolarMaxPlanTable.sMaxPlanTitle, data.planDetails.QLD.planName);
                    await testFunction.assertText(t, EaHomePage.elements.SolarMaxPlanTable.sMaxPlanFuel, "Electricity");
                    await testFunction.assertText(t, EaHomePage.elements.SolarMaxPlanTable.sMaxPlanHeadingDescription, data.planDetails.QLD.planDescription);
                    break;
                  default:
                    console.log("Invalid electricity plan details for state");
              }
            }
            else{
              console.log("Invalid fueltype");
            }
            break;
        default:
          throw Error("Invalid Plan");
      }
    } else if (page === 'Business') {
      if (dataTable[0].planName === PlanType.BUSINESS_CARBON_NEUTRAL_FLEXI) {
        if (dataTable[0].fuelType === "ELE") {
          switch (dataTable[0].state) {
            case AustralianState.NSW:
              await testFunction.assertText(t, EaHomePage.elements.BusinessCarbonNeutralFlexiPlanTable.businessCarbonNeutralFlexiPlanTitle, data.planDetails.NSW.planName);
              await testFunction.assertText(t, EaHomePage.elements.BusinessCarbonNeutralFlexiPlanTable.businessCarbonNeutralFlexiPlanFuel, "Electricity");
              await testFunction.assertText(t, EaHomePage.elements.BusinessCarbonNeutralFlexiPlanTable.businessCarbonNeutralFlexiPlanHeadingDescription, data.planDetails.NSW.planDescription);
              break;
            case AustralianState.VIC:
              await testFunction.assertText(t, EaHomePage.elements.BusinessCarbonNeutralFlexiPlanTable.businessCarbonNeutralFlexiPlanTitle, data.planDetails.VIC.planName);
              await testFunction.assertText(t, EaHomePage.elements.BusinessCarbonNeutralFlexiPlanTable.businessCarbonNeutralFlexiPlanFuel, "Electricity");
              await testFunction.assertText(t, EaHomePage.elements.BusinessCarbonNeutralFlexiPlanTable.businessCarbonNeutralFlexiPlanHeadingDescription, data.planDetails.VIC.planDescription);
              break;
            case AustralianState.QLD:
              await testFunction.assertText(t, EaHomePage.elements.BusinessCarbonNeutralFlexiPlanTable.businessCarbonNeutralFlexiPlanTitle, data.planDetails.QLD.planName);
              await testFunction.assertText(t, EaHomePage.elements.BusinessCarbonNeutralFlexiPlanTable.businessCarbonNeutralFlexiPlanFuel, "Electricity");
              await testFunction.assertText(t, EaHomePage.elements.BusinessCarbonNeutralFlexiPlanTable.businessCarbonNeutralFlexiPlanHeadingDescription, data.planDetails.QLD.planDescription);
              break;
            case AustralianState.ACT:
              await testFunction.assertText(t, EaHomePage.elements.BusinessCarbonNeutralFlexiPlanTable.businessCarbonNeutralFlexiPlanTitle, data.planDetails.ACT.planName);
              await testFunction.assertText(t, EaHomePage.elements.BusinessCarbonNeutralFlexiPlanTable.businessCarbonNeutralFlexiPlanFuel, "Electricity");
              await testFunction.assertText(t, EaHomePage.elements.BusinessCarbonNeutralFlexiPlanTable.businessCarbonNeutralFlexiPlanHeadingDescription, data.planDetails.ACT.planDescription);
              break;
            case AustralianState.SA:
              await testFunction.assertText(t, EaHomePage.elements.BusinessCarbonNeutralFlexiPlanTable.businessCarbonNeutralFlexiPlanTitle, data.planDetails.SA.planName);
              await testFunction.assertText(t, EaHomePage.elements.BusinessCarbonNeutralFlexiPlanTable.businessCarbonNeutralFlexiPlanFuel, "Electricity");
              await testFunction.assertText(t, EaHomePage.elements.BusinessCarbonNeutralFlexiPlanTable.businessCarbonNeutralFlexiPlanHeadingDescription, data.planDetails.SA.planDescription);
              break;
            default:
              console.log("Invalid electricity plan details for state");
            }
          }

      }
      else if (data.planName === PlanType.BUSINESS_CARBON_NEUTRAL) {
        if (dataTable[0].fuelType === "ELE") {
          await testFunction.assertText(t, EaHomePage.elements.BusinessCarbonNeutralPlanTable.businessCarbonNeutralPlanTitle, data.planName);
          await testFunction.assertText(t, EaHomePage.elements.BusinessCarbonNeutralPlanTable.businessCarbonNeutralPlanFuel, "Electricity");
          await testFunction.assertText(t, EaHomePage.elements.BusinessCarbonNeutralPlanTable.businessCarbonNeutralPlanHeadingDescription, data.planDescription);
        } else if (dataTable[0].fuelType === 'GAS') {
          await testFunction.assertText(t, EaHomePage.BusinessCarbonNeutralPlanTable.businessCarbonNeutralPlanTitle, data.planName);
          await testFunction.assertText(t, EaHomePage.BusinessCarbonNeutralPlanTable.businessCarbonNeutralPlanFuel, "Gas");
          await testFunction.assertText(t, EaHomePage.BusinessCarbonNeutralPlanTable.businessCarbonNeutralPlanHeadingDescription, data.planDescription);
        }
      } else if (dataTable[0].planName === PlanType.BUSINESS_BALANCE_PLAN) {
        if (dataTable[0].fuelType === "ELE") {
          switch (dataTable[0].state) {
            case AustralianState.NSW:
              await testFunction.assertText(t, EaHomePage.elements.BusinessBalancePlanTable.businessBalancePlanTitle, data.planDetails.NSW.planName);
              await testFunction.assertText(t, EaHomePage.elements.BusinessBalancePlanTable.businessBalancePlanFuel, "Electricity");
              await testFunction.assertText(t, EaHomePage.elements.BusinessBalancePlanTable.businessBalancePlanHeadingDescription, data.planDetails.NSW.planDescription);
              break;
            case AustralianState.VIC:
              await testFunction.assertText(t, EaHomePage.elements.BusinessBalancePlanTable.businessBalancePlanTitle, data.planDetails.VIC.planName);
              await testFunction.assertText(t, EaHomePage.elements.BusinessBalancePlanTable.businessBalancePlanFuel, "Electricity");
              await testFunction.assertText(t, EaHomePage.elements.BusinessBalancePlanTable.businessBalancePlanHeadingDescription, data.planDetails.VIC.planDescription);
              break;
            case AustralianState.QLD:
              await testFunction.assertText(t, EaHomePage.elements.BusinessBalancePlanTable.businessBalancePlanTitle, data.planDetails.QLD.planName);
              await testFunction.assertText(t, EaHomePage.elements.BusinessBalancePlanTable.businessBalancePlanFuel, "Electricity");
              await testFunction.assertText(t, EaHomePage.elements.BusinessBalancePlanTable.businessBalancePlanHeadingDescription, data.planDetails.QLD.planDescription);
              break;
            case AustralianState.ACT:
              await testFunction.assertText(t, EaHomePage.elements.BusinessBalancePlanTable.businessBalancePlanTitle, data.planDetails.ACT.planName);
              await testFunction.assertText(t, EaHomePage.elements.BusinessBalancePlanTable.businessBalancePlanFuel, "Electricity");
              await testFunction.assertText(t, EaHomePage.elements.BusinessBalancePlanTable.businessBalancePlanHeadingDescription, data.planDetails.ACT.planDescription);
              break;
            case AustralianState.SA:
              await testFunction.assertText(t, EaHomePage.elements.BusinessBalancePlanTable.businessBalancePlanTitle, data.planDetails.SA.planName);
              await testFunction.assertText(t, EaHomePage.elements.BusinessBalancePlanTable.businessBalancePlanFuel, "Electricity");
              await testFunction.assertText(t, EaHomePage.elements.BusinessBalancePlanTable.businessBalancePlanHeadingDescription, data.planDetails.SA.planDescription);
              break;
            default:
              console.log("Invalid electricity plan details for state");
          }
          } else if (dataTable[0].fuelType === 'GAS') {
          await testFunction.assertText(t, EaHomePage.elements.BusinessBalancePlanTable.businessBalancePlanTitle, data.planDetails.NSW.planName);
          await testFunction.assertText(t, EaHomePage.elements.BusinessBalancePlanTable.businessBalancePlanFuel, "Gas");
          await testFunction.assertText(t, EaHomePage.elements.BusinessBalancePlanTable.businessBalancePlanHeadingDescription, data.planDetails.NSW.planDescription);
        }
      }
      else if (data.planName === PlanType.TOTAL_BUSINESS) {
        if (dataTable[0].fuelType === "ELE") {
          await testFunction.assertText(t, EaHomePage.elements.BusinessTotalPlanTable.businessTotalPlanTitle, data.planName);
          await testFunction.assertText(t, EaHomePage.elements.BusinessTotalPlanTable.businessTotalPlanFuel, "Electricity");
          await testFunction.assertText(t, EaHomePage.elements.BusinessTotalPlanTable.businessTotalPlanHeadingDescription, data.planDescription);
        } else if (dataTable[0].fuelType === 'GAS') {
          await testFunction.assertText(t, EaHomePage.BusinessTotalPlanTable.businessTotalPlanTitle, data.planName);
          await testFunction.assertText(t, EaHomePage.BusinessTotalPlanTable.businessTotalPlanFuel, "Gas");
          await testFunction.assertText(t, EaHomePage.BusinessTotalPlanTable.businessTotalPlanHeadingDescription, data.planDescription);
        }
      }
      else {
        await testFunction.assertText(t, EaHomePage.campaignElements.gasPlanHeadingTitle, data.planName);
        await testFunction.assertText(t, EaHomePage.campaignElements.gasPlanHeadingFuel, "Gas");
        await testFunction.assertText(t, EaHomePage.campaignElements.gasPlanHeadingDescription, data.planDescription);
      }
    }
  }

  public static async validateFeaturesPlanPage(t: any, dataTable, data: any, page) {
    console.log("Validating plan features on plans page page.");
    if (page === "Residential") {
      if (data.planName=== PlanType.TOTAL_PLAN) {
        if (dataTable[0].Feature_carbonNeutral === "Y") {
          if (dataTable[0].fuelType === "BOTH" || dataTable[0].fuelType === "ELE") {
            await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.cNTotalTitle, data.both.feature.preSelect.carbonNeutral.heading);
            await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.cNTotalDescription, data.both.feature.preSelect.carbonNeutral.description);
          }
        }
        if (dataTable[0].Feature_peaceOfMind === "Y") {
          if (dataTable[0].fuelType === "BOTH" || dataTable[0].fuelType === "ELE") {
            await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.peaceOfMindTotalTitle, data.both.feature.preSelect.peaceOfMind.heading);
            await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.peaceOfMindTotalDescription, data.both.feature.preSelect.peaceOfMind.description);
          }
        }
        if (dataTable[0].Feature_XX_discountOffTotalEnergyBill === "Y") {
            switch (dataTable[0].state) {
            case AustralianState.VIC:
              await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.elediscountOffTotalTitle, data.electricity.feature.preSelect.discountOffTotalEnergyBill.VIC.heading);
              await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.elediscountOffTotalDescription, data.electricity.feature.preSelect.discountOffTotalEnergyBill.description);
              await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.gasdiscountOffTotalTitle, data.gas.feature.preSelect.discountOffTotalEnergyBill.VIC.heading);
              await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.gasdiscountOffTotalDescription, data.gas.feature.preSelect.discountOffTotalEnergyBill.description);
              break;
            case AustralianState.NSW:
              await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.elediscountOffTotalTitle, data.electricity.feature.preSelect.discountOffTotalEnergyBill.NSW.heading);
              await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.elediscountOffTotalDescription, data.electricity.feature.preSelect.discountOffTotalEnergyBill.description);
              await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.gasdiscountOffTotalTitle, data.gas.feature.preSelect.discountOffTotalEnergyBill.NSW.heading);
              await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.gasdiscountOffTotalDescription, data.gas.feature.preSelect.discountOffTotalEnergyBill.description);
              break;
            case AustralianState.ACT:
              await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.elediscountOffTotalTitle, data.electricity.feature.preSelect.discountOffTotalEnergyBill.ACT.heading);
              await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.elediscountOffTotalDescription, data.electricity.feature.preSelect.discountOffTotalEnergyBill.description);
              await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.gasdiscountOffTotalTitle, data.gas.feature.preSelect.discountOffTotalEnergyBill.ACT.heading);
              await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.gasdiscountOffTotalDescription, data.gas.feature.preSelect.discountOffTotalEnergyBill.description);
              break;
            case AustralianState.QLD:
              await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.elediscountOffTotalTitle, data.electricity.feature.preSelect.discountOffTotalEnergyBill.QLD.heading);
              await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.elediscountOffTotalDescription, data.electricity.feature.preSelect.discountOffTotalEnergyBill.description);
              break;
            case AustralianState.SA:
              await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.elediscountOffTotalTitle, data.electricity.feature.preSelect.discountOffTotalEnergyBill.SA.heading);
              await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.elediscountOffTotalDescription, data.electricity.feature.preSelect.discountOffTotalEnergyBill.description);
              await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.gasdiscountOffTotalTitle, data.gas.feature.preSelect.discountOffTotalEnergyBill.SA.heading);
              await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.gasdiscountOffTotalDescription, data.gas.feature.preSelect.discountOffTotalEnergyBill.description);
              break;
            default:
              throw Error("Invalid State");
            }
        }
      }
      if (data.planName=== PlanType.RESIDENTIAL_BALANCE_PLAN) {
        if (dataTable[0].Feature_carbonNeutral === "Y") {
          if (dataTable[0].fuelType === "BOTH" || dataTable[0].fuelType === "ELE") {
            await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.cNBalanceTitle, data.both.feature.preSelect.carbonNeutral.heading);
            await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.cNBalanceDescription, data.both.feature.preSelect.carbonNeutral.description);
          }
        }
        if (dataTable[0].Feature_variableRates === "Y") {
          if (dataTable[0].fuelType === "BOTH" || dataTable[0].fuelType === "ELE") {
            await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.peaceOfMindBalanceTitle, data.both.feature.preSelect.variableRates.heading);
            await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.peaceOfMindBalanceDescription, data.both.feature.preSelect.variableRates.description);
          }
        }
        if (dataTable[0].Feature_XX_discountOffTotalEnergyBill === "Y") {
          switch (dataTable[0].state) {
            case AustralianState.VIC:
              await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.elediscountOffBalanceTitle, data.electricity.feature.preSelect.discountOffTotalEnergyBill.VIC.heading);
              await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.elediscountOffBalanceDescription, data.electricity.feature.preSelect.discountOffTotalEnergyBill.description);
              await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.gasdiscountOffBalanceTitle, data.gas.feature.preSelect.discountOffTotalEnergyBill.VIC.heading);
              await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.gasdiscountOffBalanceDescription, data.gas.feature.preSelect.discountOffTotalEnergyBill.description);
              break;
            case AustralianState.NSW:
              if (t.testRun.test.name.includes('Essential')) {
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.elediscountOffBalanceTitle, data.electricity.feature.preSelect.discountOffTotalEnergyBill.NSW.Essential.heading);
              } else if (t.testRun.test.name.includes('Endeavour')) {
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.elediscountOffBalanceTitle, data.electricity.feature.preSelect.discountOffTotalEnergyBill.NSW.Endeavour.heading);
              } else if (t.testRun.test.name.includes('Ausgrid')) {
                await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.elediscountOffBalanceTitle, data.electricity.feature.preSelect.discountOffTotalEnergyBill.NSW.Ausgrid.heading);
              } else {
                await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureDiscountOffTotalBillTitle, data.electricity.feature.preSelect.discountOffTotalEnergyBill.NSW.heading);
              }
              await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.elediscountOffBalanceDescription, data.electricity.feature.preSelect.discountOffTotalEnergyBill.description);
              await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.gasdiscountOffBalanceTitle, data.gas.feature.preSelect.discountOffTotalEnergyBill.NSW.heading);
              await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.gasdiscountOffBalanceDescription, data.gas.feature.preSelect.discountOffTotalEnergyBill.description);
              break;
            case AustralianState.ACT:
              await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.elediscountOffBalanceTitle, data.electricity.feature.preSelect.discountOffTotalEnergyBill.ACT.heading);
              await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.elediscountOffBalanceDescription, data.electricity.feature.preSelect.discountOffTotalEnergyBill.description);
              await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.gasdiscountOffBalanceTitle, data.gas.feature.preSelect.discountOffTotalEnergyBill.ACT.heading);
              await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.gasdiscountOffBalanceDescription, data.gas.feature.preSelect.discountOffTotalEnergyBill.description);
              break;
            case AustralianState.QLD:
              await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.elediscountOffBalanceTitle, data.electricity.feature.preSelect.discountOffTotalEnergyBill.QLD.heading);
              await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.elediscountOffBalanceDescription, data.electricity.feature.preSelect.discountOffTotalEnergyBill.description);
              break;
            case AustralianState.SA:
              await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.elediscountOffBalanceTitle, data.electricity.feature.preSelect.discountOffTotalEnergyBill.SA.heading);
              await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.elediscountOffBalanceDescription, data.electricity.feature.preSelect.discountOffTotalEnergyBill.description);
              await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.gasdiscountOffBalanceTitle, data.gas.feature.preSelect.discountOffTotalEnergyBill.SA.heading);
              await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.gasdiscountOffBalanceDescription, data.gas.feature.preSelect.discountOffTotalEnergyBill.description);
              break;
            default:
              throw Error("Invalid State");
          }
        }
      }
    }
  }

  public static async validateRepricePrePositioningText(t: any, data, state) {
    if (data.planName === PlanType.BASIC_HOME) {
      if (state === AustralianState.QLD) {
        await testFunction.assertText(t, EaHomePage.campaignElements.electrciityRepriceText, "Our rates will generally be adjusted annually & we'll notify you when this happens.");
      } else if (state === AustralianState.VIC) {
        await testFunction.assertText(t, EaHomePage.campaignElements.electrciityRepriceText, "Our rates will generally be adjusted annually & we'll notify you when this happens.");
      } else {
        await testFunction.assertText(t, EaHomePage.campaignElements.electrciityRepriceText, "Our rates will generally be adjusted annually & we'll notify you when this happens.");
        await testFunction.assertText(t, EaHomePage.campaignElements.gasRepriceText, "Our rates will generally be adjusted annually & we'll notify you when this happens.");
      }
    } else if ((data.planName === PlanType.TOTAL_PLAN) || (data.planName === PlanType.NO_FRILLS) || (data.planName === PlanType.TOTAL_PLAN_PLUS) || (data.planName === PlanType.EMPLOYEE_PLAN)) {
      if (state === AustralianState.QLD) {
        await testFunction.assertText(t, EaHomePage.campaignElements.electrciityRepriceText, "Our rates will generally be adjusted annually & we'll notify you when this happens.");
      } else {
        await testFunction.assertText(t, EaHomePage.campaignElements.gasRepriceText, "Our rates will generally be adjusted annually & we'll notify you when this happens.");
      }
    }
    console.log("Reprice text validated for " + data.planName)
  }

  public static async validateRepricePrePositioningTextPlansPage(t: any, plan, journey) {
    if (journey === 'Residential') {
      if (plan === PlanType.BASIC_HOME) {
        await testFunction.assertText(t, EaHomePage.elements.BasicPlanTable.repriceText, "Our rates will generally be adjusted annually & we'll notify you when this happens.");
      } else if (plan === PlanType.NO_FRILLS) {
        await testFunction.assertText(t, EaHomePage.elements.NoFrillsPlanTable.repriceText, "Our rates will generally be adjusted annually & we'll notify you when this happens.");
      } else if (plan === PlanType.TOTAL_PLAN) {
        await testFunction.assertText(t, EaHomePage.elements.TotalPlanTable.repriceText, "Our rates will generally be adjusted annually & we'll notify you when this happens.");
      }else if (plan === PlanType.EMPLOYEE_PLAN) {
        await testFunction.assertText(t, EaHomePage.elements.EmployeePlanTable.repriceText, "Our rates will generally be adjusted annually & we'll notify you when this happens.");
      }else if (plan === PlanType.RESIDENTIAL_BALANCE_PLAN) {
        await testFunction.assertText(t, EaHomePage.elements.BalancePlanTable.repriceText, "Our rates will generally be adjusted annually & we'll notify you when this happens.");
      }
    } else if (journey === 'Business') {
      if ((plan === PlanType.BASIC_BUSINESS)) {
        await testFunction.assertText(t, EaHomePage.elements.BasicBusinessTable.repriceText, "Our rates will generally be adjusted annually & we'll notify you when this happens.");
      }else if((plan === PlanType.TOTAL_BUSINESS) || (plan === PlanType.FAMILY_AND_FRIENDS_BUSINESS)){
        await testFunction.assertText(t, EaHomePage.elements.TotalPlanTable.repriceText, "Our rates will generally be adjusted annually & we'll notify you when this happens.");
      }else if((plan === PlanType.BUSINESS_BALANCE_PLAN)){
        await testFunction.assertText(t, EaHomePage.elements.BusinessBalancePlanTable.repriceText, "Our rates will generally be adjusted annually & we'll notify you when this happens.");
      }
    }
    console.log("Reprice text validated for " + plan + " on " + journey + " plans page")
  }
  public static async validateRateTypeTextPlansPage(t: any, fuelType,plan, journey,state) {
    if (journey === 'Residential') {
      if (plan === PlanType.RESIDENTIAL_BALANCE_PLAN) {
        //For campaign page ELE
        if(fuelType==='Electricity'){
          await testFunction.click(t, EaHomePage.elements.BalancePlanTable.balancePlanEleRatesTooltip);
          if(state==='VIC'){
            await testFunction.assertText(t, EaHomePage.elements.BalancePlanTable.balancePlanEleRatesTooltipText, "The Electricity market usage rates and daily supply charge are variable. Our rates are generally reviewed around January each year and we'll let you know when this happens.");
          }else{
            await testFunction.assertText(t, EaHomePage.elements.BalancePlanTable.balancePlanEleRatesTooltipText, "The Electricity market usage rates and daily supply charge are variable. Our rates are generally reviewed around July each year and we'll let you know when this happens.");
          }
        }
        //For campaign page GAS
        else if(fuelType==='Gas'){
          await testFunction.click(t, EaHomePage.elements.BalancePlanTable.balancePlanGasRatesTooltip);
          if(state==='VIC'){
            await testFunction.assertText(t, EaHomePage.elements.BalancePlanTable.balancePlanGasRatesTooltipText, "The Gas market usage rates and daily supply charge are variable. Our rates are generally reviewed around January each year and we'll let you know when this happens.");
          }else{
            await testFunction.assertText(t, EaHomePage.elements.BalancePlanTable.balancePlanGasRatesTooltipText, "The Gas market usage rates and daily supply charge are variable. Our rates are generally reviewed around July each year and we'll let you know when this happens.");
          }
        }
        //For campaign page Both
        else if(fuelType==='Both'){
          await testFunction.click(t, EaHomePage.elements.BalancePlanTable.balancePlanRatesTooltip);
          if(state==='VIC'){
            await testFunction.assertText(t, EaHomePage.elements.BalancePlanTable.balancePlanRatesTooltipText, "The Electricity market usage rates and daily supply charge are variable. The Gas market usage rates and daily supply charge are variable. Our rates are generally reviewed around January each year and we'll let you know when this happens.");
          }else{
            await testFunction.assertText(t, EaHomePage.elements.BalancePlanTable.balancePlanRatesTooltipText, "The Electricity market usage rates and daily supply charge are variable. The Gas market usage rates and daily supply charge are variable. Our rates are generally reviewed around July each year and we'll let you know when this happens.");
          }
        }
      }
    } else if (journey === 'Business') {
      if((plan === PlanType.BUSINESS_BALANCE_PLAN)){
        //For campaign page ELE
        if(fuelType==='Electricity'){
          await testFunction.click(t, EaHomePage.elements.BusinessBalancePlanTable.businessBalancePlanEleRatesTooltip);
          if(state==='VIC'){
            await testFunction.assertText(t, EaHomePage.elements.BusinessBalancePlanTable.businessBalancePlanEleRatesTooltipText, "The Electricity market usage rates and daily supply charge are variable. Our rates are generally reviewed around January each year and we'll let you know when this happens.");
          }else{
            await testFunction.assertText(t, EaHomePage.elements.BusinessBalancePlanTable.businessBalancePlanEleRatesTooltipText, "The Electricity market usage rates and daily supply charge are variable. Our rates are generally reviewed around July each year and we'll let you know when this happens.");
          }
        }
        //For campaign page GAS
        else if(fuelType==='Gas'){
          await testFunction.click(t, EaHomePage.elements.BusinessBalancePlanTable.businessBalancePlanGasRatesTooltip);
          if(state==='VIC'){
            await testFunction.assertText(t, EaHomePage.elements.BusinessBalancePlanTable.businessBalancePlanGasRatesTooltipText, "The Gas market usage rates and daily supply charge are variable. Our rates are generally reviewed around January each year and we'll let you know when this happens.");
          }else{
            await testFunction.assertText(t, EaHomePage.elements.BusinessBalancePlanTable.businessBalancePlanGasRatesTooltipText, "The Gas market usage rates and daily supply charge are variable. Our rates are generally reviewed around July each year and we'll let you know when this happens.");
          }
        }
        //For plans page ELE
        else if(fuelType==='ELE'){
          await plansMethod.selectFuel(t, fuelType);
          await testFunction.click(t, EaHomePage.elements.BusinessBalancePlanTable.businessBalancePlanRatesTooltip);
          if(state==='VIC'){
            await testFunction.assertText(t, EaHomePage.elements.BusinessBalancePlanTable.businessBalancePlanRatesTooltipText, "The Electricity market usage rates and daily supply charge are variable. Our rates are generally reviewed around January each year and we'll let you know when this happens.");
          }else{
            await testFunction.assertText(t, EaHomePage.elements.BusinessBalancePlanTable.businessBalancePlanRatesTooltipText, "The Electricity market usage rates and daily supply charge are variable. Our rates are generally reviewed around July each year and we'll let you know when this happens.");
          }
        }
        //For plans page GAS
        else if(fuelType==='GAS'){
          await plansMethod.selectFuel(t, fuelType);
          await testFunction.click(t, EaHomePage.elements.BusinessBalancePlanTable.businessBalancePlanRatesTooltip);
          if(state==='VIC'){
            await testFunction.assertText(t, EaHomePage.elements.BusinessBalancePlanTable.businessBalancePlanRatesTooltipText, "The Gas market usage rates and daily supply charge are variable. Our rates are generally reviewed around January each year and we'll let you know when this happens.");
          }else{
            await testFunction.assertText(t, EaHomePage.elements.BusinessBalancePlanTable.businessBalancePlanRatesTooltipText, "The Gas market usage rates and daily supply charge are variable. Our rates are generally reviewed around July each year and we'll let you know when this happens.");
          }
        }
      }
    }
    console.log("Rate type text validated for " + plan + " on " + journey + " plans page")
  }
  public static async validateFeatures(t: any, dataTable, data: any) {
    console.log("Validating plan features on campaign page.");
    if (dataTable[0].fuelType === "ELE") {
      if (dataTable[0].Feature_50Credit === "Y") {
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
      if (dataTable[0].Feature_carbonNeutral === "Y") {
        if (t.testRun.test.name.includes('familyandfriends')|| t.testRun.test.name.includes('mcc') || t.testRun.test.name.includes('mcdonalds') || t.testRun.test.name.includes('employee')) {
          await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureCNEGTitle, data.electricity.feature.preSelect.carbonNeutral.heading);
          await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureCNEGDescription, data.electricity.feature.preSelect.carbonNeutral.description);
        } else if (t.testRun.test.name.includes('business-carbon-neutral')){
          await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureCNCampaignTitle, data.electricity.feature.preSelect.carbonNeutral.heading);
          await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureCNCampaignDescription, data.electricity.feature.preSelect.carbonNeutral.description);
        }else {
          await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureCNTitle, data.electricity.feature.preSelect.carbonNeutral.heading);
          await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureCNDescription, data.electricity.feature.preSelect.carbonNeutral.description);
        }

      }
      if (dataTable[0].Feature_moveHomeCredit === "Y") {
          await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureMoveHomeTitle, data.electricity.feature.preSelect.moveHomeCredit.heading);
          await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureMoveHomeDescription, data.electricity.feature.preSelect.moveHomeCredit.description);
      }
      if (dataTable[0].Feature_peaceOfMind === "Y") {
        if (t.testRun.test.name.includes('employee')){
          await testFunction.assertText(t, EaHomePage.campaignElements.eleFeaturePeaceOfMindEETitle, data.electricity.feature.preSelect.peaceOfMind.heading);
          await testFunction.assertText(t, EaHomePage.campaignElements.eleFeaturePeaceOfMindEEDescription, data.electricity.feature.preSelect.peaceOfMind.description);
        } else {
          await testFunction.assertText(t, EaHomePage.campaignElements.eleFeaturePeaceOfMindTitle, data.electricity.feature.preSelect.peaceOfMind.heading);
          await testFunction.assertText(t, EaHomePage.campaignElements.eleFeaturePeaceOfMindDescription, data.electricity.feature.preSelect.peaceOfMind.description);
        }
      }
      if (dataTable[0].Feature_XX_discountOffTotalEnergyBill === "Y") {
        switch (dataTable[0].state) {
          case AustralianState.VIC:
            await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureDiscountOffTotalBillTitle, data.electricity.feature.preSelect.discountOffTotalEnergyBill.VIC.heading);
            break;
          case AustralianState.NSW:
            if (t.testRun.test.name.includes('Essential')) {
              await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureDiscountOffTotalBillTitle, data.electricity.feature.preSelect.discountOffTotalEnergyBill.NSW.Essential.heading);
            } else if (t.testRun.test.name.includes('Endeavour')) {
              await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureDiscountOffTotalBillTitle, data.electricity.feature.preSelect.discountOffTotalEnergyBill.NSW.Endeavour.heading);
            } else if (t.testRun.test.name.includes('Ausgrid')) {
              await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureDiscountOffTotalBillTitle, data.electricity.feature.preSelect.discountOffTotalEnergyBill.NSW.Ausgrid.heading);
            } else {
              await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureDiscountOffTotalBillTitle, data.electricity.feature.preSelect.discountOffTotalEnergyBill.NSW.heading);
            }
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
      if (dataTable[0].Feature_discountOffTotalEnergyBill === "Y") {
        await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureDiscountOffTotalBillTitle, data.electricity.feature.preSelect.discountOffTotalEnergyBill.heading);
        await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureDiscountOffTotalBillDescription, data.electricity.feature.preSelect.discountOffTotalEnergyBill.description);
      }
      if (dataTable[0].Feature_noStandardConnectionFee === "Y") {
        await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureNoStandardConnectionFeeTitle, data.electricity.feature.preSelect.noStandardConnectionFee.heading);
        await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureNoStandardConnectionFeeDescription, data.electricity.feature.preSelect.noStandardConnectionFee.description);
      }
      if (dataTable[0].Feature_vipDiscount === "Y") {
        await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureVipDiscountTitle, data.electricity.feature.preSelect.vipDiscount.heading);
        await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureVipDiscountDescription, data.electricity.feature.preSelect.vipDiscount.description);
      }
      if (dataTable[0].Feature_defaultOffer === "Y") {
        await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureDefaultOfferTitle, data.electricity.feature.preSelect.defaultOffer.heading);
        if (dataTable[0].state === 'VIC') {
          await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureDefaultOfferDescription, data.electricity.feature.preSelect.defaultOffer.VIC.description);
        } else {
          await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureDefaultOfferDescription, data.electricity.feature.preSelect.defaultOffer.NonVIC.description);
        }
      }
      if (dataTable[0].Feature_vipPriorityService === "Y") {
        await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureVipPriorityServiceTitle, data.electricity.feature.preSelect.vipPriorityService.heading);
      }
      if (dataTable[0].Feature_chanceToWin === "Y") {
        if (dataTable[0].state === 'VIC') {
          await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureChanceToWinTitle, data.electricity.feature.preSelect.chanceToWin.VIC.heading);
          await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureChanceToWinDescription, data.electricity.feature.preSelect.chanceToWin.VIC.description);
        } else if (dataTable[0].state === 'NSW') {
          await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureChanceToWinTitle, data.electricity.feature.preSelect.chanceToWin.NSW.heading);
          await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureChanceToWinDescription, data.electricity.feature.preSelect.chanceToWin.NSW.description);
        } else if (dataTable[0].state === 'QLD') {
          await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureChanceToWinTitle, data.electricity.feature.preSelect.chanceToWin.QLD.heading);
          await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureChanceToWinDescription, data.electricity.feature.preSelect.chanceToWin.QLD.description);
        } else {
          throw Error("Invalid State");
        }
      }
      if (dataTable[0].Feature_variableRates === "Y") {
        // if (dataTable[0].state === 'VIC') {
        //   await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureVariableRatesTitle, data.electricity.feature.preSelect.variableRates.VIC.heading);
        //   await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureVariableRatesDescription, data.electricity.feature.preSelect.variableRates.VIC.description);
        // } else if (dataTable[0].state === 'NSW') {
        //   await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureVariableRatesTitle, data.electricity.feature.preSelect.variableRates.NSW.heading);
        //   await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureVariableRatesDescription, data.electricity.feature.preSelect.variableRates.NSW.description);
        // } else if (dataTable[0].state === 'QLD') {
        //   await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureVariableRatesTitle, data.electricity.feature.preSelect.variableRates.QLD.heading);
        //   await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureVariableRatesDescription, data.electricity.feature.preSelect.variableRates.QLD.description);
        // } else if (dataTable[0].state === 'ACT') {
        //   await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureVariableRatesTitle, data.electricity.feature.preSelect.variableRates.ACT.heading);
        //   await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureVariableRatesDescription, data.electricity.feature.preSelect.variableRates.ACT.description);
        // }else {
        //   throw Error("Invalid State");
        // }
        await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureVariableRatesTitle, data.electricity.feature.preSelect.variableRates.heading);
        await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureVariableRatesDescription, data.electricity.feature.preSelect.variableRates.description);
      }
    } else if (dataTable[0].fuelType === "GAS") {
      if (dataTable[0].Feature_50Credit === "Y") {
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
      /* if(dataTable[0].Feature_200Credit === "Y") {
         switch (dataTable[0].state) {
           case AustralianState.VIC:
             await testFunction.assertText(t, EaHomePage.campaignElements.gasFeature200CreditTitle, data.gas.feature.preSelect.Credit200.VIC.heading);
             await testFunction.assertText(t, EaHomePage.campaignElements.gasFeature200CreditDescription, data.gas.feature.preSelect.Credit200.VIC.description);
             break;
           case AustralianState.NSW:
             await testFunction.assertText(t, EaHomePage.campaignElements.gasFeature200CreditTitle, data.egas.feature.preSelect.Credit200.NSW.heading);
             await testFunction.assertText(t, EaHomePage.campaignElements.gasFeature200CreditDescription, data.gas.feature.preSelect.Credit200.NSW.description);
             break;
           default:
               throw Error("Invalid State");
         }
       } */
      if (dataTable[0].Feature_carbonNeutral === "Y") {
        if (t.testRun.test.name.includes('familyandfriends')|| t.testRun.test.name.includes('mcc') || t.testRun.test.name.includes('mcdonalds') || t.testRun.test.name.includes('employee')) {
          await testFunction.assertText(t, EaHomePage.campaignElements.gasFeatureCNEGTitle, data.gas.feature.preSelect.carbonNeutral.heading);
          await testFunction.assertText(t, EaHomePage.campaignElements.gasFeatureCNEGDescription, data.gas.feature.preSelect.carbonNeutral.description);
        } else {
          await testFunction.assertText(t, EaHomePage.campaignElements.gasFeatureCNTitle, data.gas.feature.preSelect.carbonNeutral.heading);
          await testFunction.assertText(t, EaHomePage.campaignElements.gasFeatureCNDescription, data.gas.feature.preSelect.carbonNeutral.description);
        }
      }
      if (dataTable[0].Feature_moveHomeCredit === "Y") {
        await testFunction.assertText(t, EaHomePage.campaignElements.gasFeatureMoveHomeTitle, data.gas.feature.preSelect.moveHomeCredit.heading);
        await testFunction.assertText(t, EaHomePage.campaignElements.gasFeatureMoveHomeDescription, data.gas.feature.preSelect.moveHomeCredit.description);
      }
      if (dataTable[0].Feature_peaceOfMind === "Y") {
        if (t.testRun.test.name.includes('employee')) {
          await testFunction.assertText(t, EaHomePage.campaignElements.gasFeaturePeaceOfMindEETitle, data.gas.feature.preSelect.peaceOfMind.heading);
          await testFunction.assertText(t, EaHomePage.campaignElements.gasFeaturePeaceOfMindEEDescription, data.gas.feature.preSelect.peaceOfMind.description);
        } else {
          await testFunction.assertText(t, EaHomePage.campaignElements.gasFeaturePeaceOfMindTitle, data.gas.feature.preSelect.peaceOfMind.heading);
          await testFunction.assertText(t, EaHomePage.campaignElements.gasFeaturePeaceOfMindDescription, data.gas.feature.preSelect.peaceOfMind.description);
        }
      }
      if (dataTable[0].Feature_XX_discountOffTotalEnergyBill === "Y") {
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
      if (dataTable[0].Feature_discountOffTotalEnergyBill === "Y") {
        await testFunction.assertText(t, EaHomePage.campaignElements.gasFeatureDiscountOffTotalBillTitle, data.gas.feature.preSelect.discountOffTotalEnergyBill.heading);
        await testFunction.assertText(t, EaHomePage.campaignElements.gasFeatureDiscountOffTotalBillDescription, data.gas.feature.preSelect.discountOffTotalEnergyBill.description);
      }
      if (dataTable[0].Feature_vipPriorityService === "Y") {
        await testFunction.assertText(t, EaHomePage.campaignElements.gasFeatureVipPriorityServiceTitle, data.electricity.feature.preSelect.vipPriorityService.heading);
      }
      if (dataTable[0].Feature_vipDiscount === "Y") {
        await testFunction.assertText(t, EaHomePage.campaignElements.gasFeatureVipDiscountTitle, data.gas.feature.preSelect.vipDiscount.heading);
        await testFunction.assertText(t, EaHomePage.campaignElements.gasFeatureVipDiscountDescription, data.gas.feature.preSelect.vipDiscount.description);
      }
      if (dataTable[0].Feature_chanceToWin === "Y") {
        if (dataTable[0].state === 'VIC') {
          await testFunction.assertText(t, EaHomePage.campaignElements.gasFeatureChanceToWinTitle, data.gas.feature.preSelect.chanceToWin.VIC.heading);
          await testFunction.assertText(t, EaHomePage.campaignElements.gasFeatureChanceToWinDescription, data.gas.feature.preSelect.chanceToWin.VIC.description);
        } else if (dataTable[0].state === 'NSW') {
          await testFunction.assertText(t, EaHomePage.campaignElements.gasFeatureChanceToWinTitle, data.gas.feature.preSelect.chanceToWin.NSW.heading);
          await testFunction.assertText(t, EaHomePage.campaignElements.gasFeatureChanceToWinDescription, data.gas.feature.preSelect.chanceToWin.NSW.description);
        } else {
          throw Error("Invalid State");
        }
      }
      if (dataTable[0].Feature_variableRates === "Y") {
        // if (dataTable[0].state === 'VIC') {
        //   await testFunction.assertText(t, EaHomePage.campaignElements.gasFeatureVariableRatesTitle, data.gas.feature.preSelect.variableRates.VIC.heading);
        //   await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureVariableRatesDescription, data.gas.feature.preSelect.variableRates.VIC.description);
        // } else if (dataTable[0].state === 'NSW') {
        //   await testFunction.assertText(t, EaHomePage.campaignElements.gasFeatureVariableRatesTitle, data.gas.feature.preSelect.variableRates.NSW.heading);
        //   await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureVariableRatesDescription, data.gas.feature.preSelect.variableRates.NSW.description);
        // } else {
        //   throw Error("Invalid State");
        // }
        await testFunction.assertText(t, EaHomePage.campaignElements.gasFeatureVariableRatesTitle, data.gas.feature.preSelect.variableRates.heading);
        await testFunction.assertText(t, EaHomePage.campaignElements.eleFeatureVariableRatesDescription, data.gas.feature.preSelect.variableRates.description);
      }
    }
  }

  public static async selectBPIDPlan(t: any, planName: any) {
    switch (planName) {
      case PlanType.BASIC_HOME:
        await testFunction.click(t, EaHomePage.elements.basicPlan_BPID);
        break;
      case PlanType.BASIC_HOME_QLD:
        await testFunction.click(t, EaHomePage.elements.basicPlanQLD_BPID);
        break;
      case PlanType.NO_FRILLS:
        await testFunction.click(t, EaHomePage.elements.noFrillsPlan_BPID);
        break;
      case PlanType.TOTAL_PLAN:
        await testFunction.click(t, EaHomePage.elements.totalPlan_BPID);
        break;
      case PlanType.TOTAL_PLAN_PLUS:
        await testFunction.click(t, EaHomePage.elements.totalPlanPlus_BPID);
        break;
      case PlanType.BASIC_BUSINESS:
        await testFunction.click(t, EaHomePage.elements.basicBusiness_BPID);
        break;
      case PlanType.BASIC_BUSINESS_QLD:
        await testFunction.click(t, EaHomePage.elements.basicBusinessQLD_BPID);
        break;
      case PlanType.NO_FRILLS_BUSINESS:
        await testFunction.click(t, EaHomePage.elements.noFrillBusiness_BPID);
        break;
      case PlanType.TOTAL_BUSINESS:
        await testFunction.click(t, EaHomePage.elements.totalPlanBusiness_BPID);
        break;
      case PlanType.TOTAL_PLAN_PLUS_BUSINESS:
        await testFunction.click(t, EaHomePage.elements.totalPlanPlusBusiness_BPID);
        break;
      default:
        console.error("Invalid energy fact sheet is selected");
    }
  }

  public static async validateDisclaimer(t: any, dataTable, data: any) {
    console.log("Validating disclaimers on campaign page");
    const disclaimer = Selector(() => document.getElementById("condiDisclaimer"));
    const disclaimerText = await disclaimer().innerText;
    // if (dataTable[0].referencePriceComparison === 'Y') {
    //   await testFunction.assertText(t, disclaimer, data.disclaimers.referencePriceComparison.heading);
    //   await testFunction.assertText(t, disclaimer, data.disclaimers.referencePriceComparison.description);
    //   console.log("Reference disclaimer validated");
    // }
    if (dataTable[0].referencePriceComparison === 'Y') {
      await testFunction.assertText(t, disclaimer, data.disclaimers.referencePriceComparison.heading);
      if (dataTable[0].state === 'QLD') {
        await testFunction.assertText(t, disclaimer, data.disclaimers.referencePriceComparison.QLD.description);
      } else if (dataTable[0].state === 'VIC'){
        await testFunction.assertText(t, disclaimer, data.disclaimers.referencePriceComparison.VIC.description);
      }else if (dataTable[0].state === 'NSW'){
        await testFunction.assertText(t, disclaimer, data.disclaimers.referencePriceComparison.NSW.description);
      }else if (dataTable[0].state === 'SA'){
        await testFunction.assertText(t, disclaimer, data.disclaimers.referencePriceComparison.SA.description);
      }else if (dataTable[0].state === 'ACT'){
        await testFunction.assertText(t, disclaimer, data.disclaimers.referencePriceComparison.ACT.description);
      }
      //await testFunction.assertText(t, disclaimer, data.disclaimers.referencePriceComparison.description);
      console.log("Reference disclaimer validated");
    }
    if (dataTable[0].goNeutral === 'Y') {
      await testFunction.assertText(t, disclaimer, data.disclaimers.goNeutral.heading);
      if (dataTable[0].state === 'QLD') {
        await testFunction.assertText(t, disclaimer, data.disclaimers.goNeutral.QLD.description);
      } else {
        await testFunction.assertText(t, disclaimer, data.disclaimers.goNeutral.NonQLD.description);
      }
      console.log("Go neutral disclaimer validated");
    }
    if (dataTable[0].moveHomeCredit === 'Y') {
      await testFunction.assertText(t, disclaimer, data.disclaimers.moveHomeCredit.heading);
      if (dataTable[0].state === 'QLD') {
        await testFunction.assertText(t, disclaimer, data.disclaimers.moveHomeCredit.QLD.description);
      } else if (dataTable[0].state === 'VIC'){
        await testFunction.assertText(t, disclaimer, data.disclaimers.moveHomeCredit.VIC.description);
      }else if (dataTable[0].state === 'NSW'){
        await testFunction.assertText(t, disclaimer, data.disclaimers.moveHomeCredit.NSW.description);
      }else if (dataTable[0].state === 'SA'){
        await testFunction.assertText(t, disclaimer, data.disclaimers.moveHomeCredit.SA.description);
      }else if (dataTable[0].state === 'ACT'){
        await testFunction.assertText(t, disclaimer, data.disclaimers.moveHomeCredit.ACT.description);
      }
      console.log("Move Home Credit disclaimer validated");
    }
    if (dataTable[0].solarBuyBack === 'Y') {
      await testFunction.assertText(t, disclaimer, data.disclaimers.solarBuyBack.heading);
      if (dataTable[0].state === 'VIC') {
        await testFunction.assertText(t, disclaimer, data.disclaimers.solarBuyBack.VIC.description);
      } else {
        await testFunction.assertText(t, disclaimer, data.disclaimers.solarBuyBack.NonVIC.description);
      }
      console.log("Solar buyback disclaimer validated");
    }
    let planName = dataTable[0].planName;
    let state = dataTable[0].state;
    if (dataTable[0].signUpCredit === 'Y') {
      await this.validateSignUpCredit(t, disclaimer, data, state);
    }
    if (dataTable[0].chanceToWin === 'Y') {
      await this.validateChanceToWin(t, disclaimer, data, state);
    }
    if (dataTable[0].carbonNeutral === 'Y') {
      await this.validateCarbonNeutral(t, disclaimer, data, state);
    }
    if (dataTable[0].variableRates === 'Y') {
      await testFunction.assertText(t, disclaimer, data.disclaimers.variableRates.heading);
      await testFunction.assertText(t, disclaimer, data.disclaimers.variableRates.description);
      console.log("Variable rates disclaimer validated");
    }
    if( planName===PlanType.TOTAL_PLAN || planName===PlanType.FLEXI_PLAN || planName===PlanType.TOTAL_PLAN_PLUS || planName===PlanType.FAMILY_AND_FRIENDS || planName===PlanType.EMPLOYEE_PLAN || planName===PlanType.BUSINESS_BALANCE_PLAN || planName===PlanType.TOTAL_BUSINESS || planName===PlanType.FAMILY_AND_FRIENDS_BUSINESS || planName===PlanType.BUSINESS_CARBON_NEUTRAL){
      switch (state) {
        case AustralianState.NSW:
          await testFunction.assertText(t, disclaimer, data.disclaimers.plandisclaimer.NSW.heading);
          await testFunction.assertText(t, disclaimer, data.disclaimers.plandisclaimer.NSW.description);
          break;
        case AustralianState.VIC:
          await testFunction.assertText(t, disclaimer, data.disclaimers.plandisclaimer.VIC.heading);
          await testFunction.assertText(t, disclaimer, data.disclaimers.plandisclaimer.VIC.description);
          break;
        case AustralianState.SA:
          await testFunction.assertText(t, disclaimer, data.disclaimers.plandisclaimer.SA.heading);
          await testFunction.assertText(t, disclaimer, data.disclaimers.plandisclaimer.SA.description);
          break;
        case AustralianState.ACT:
          await testFunction.assertText(t, disclaimer, data.disclaimers.plandisclaimer.ACT.heading);
          await testFunction.assertText(t, disclaimer, data.disclaimers.plandisclaimer.ACT.description);
          break;
        case AustralianState.QLD:
          await testFunction.assertText(t, disclaimer, data.disclaimers.plandisclaimer.QLD.heading);
          await testFunction.assertText(t, disclaimer, data.disclaimers.plandisclaimer.QLD.description);
          break;
        default:
          console.log("Invalid state disclaimer");
      }
    }
  }

  public static async validateDisclaimerPlansPage(t: any, dataTable, data: any) {
    const disclaimer = Selector(() => document.getElementById("condiDisclaimer"));
    const disclaimerText = await disclaimer().innerText;
    if (dataTable[0].referencePriceComparison === 'Y') {
      await testFunction.assertText(t, disclaimer, data.disclaimers.referencePriceComparison.heading);
      if (dataTable[0].state === 'QLD') {
        await testFunction.assertText(t, disclaimer, data.disclaimers.referencePriceComparison.QLD.description);
      } else if (dataTable[0].state === 'VIC'){
        await testFunction.assertText(t, disclaimer, data.disclaimers.referencePriceComparison.VIC.description);
      }else if (dataTable[0].state === 'NSW'){
        await testFunction.assertText(t, disclaimer, data.disclaimers.referencePriceComparison.NSW.description);
      }else if (dataTable[0].state === 'SA'){
        await testFunction.assertText(t, disclaimer, data.disclaimers.referencePriceComparison.SA.description);
      }else if (dataTable[0].state === 'ACT'){
        await testFunction.assertText(t, disclaimer, data.disclaimers.referencePriceComparison.ACT.description);
      }
      //await testFunction.assertText(t, disclaimer, data.disclaimers.referencePriceComparison.description);
      console.log("Reference disclaimer validated");
    }
    if (dataTable[0].goNeutral === 'Y') {
      await testFunction.assertText(t, disclaimer, data.disclaimers.goNeutral.heading);
      if (dataTable[0].state === 'QLD') {
        await testFunction.assertText(t, disclaimer, data.disclaimers.goNeutral.QLD.description);
      } else {
        await testFunction.assertText(t, disclaimer, data.disclaimers.goNeutral.NonQLD.description);
      }
      console.log("Go neutral disclaimer validated");
    }
    if (dataTable[0].solarBuyBack === 'Y') {
      await testFunction.assertText(t, disclaimer, data.disclaimers.solarBuyBack.heading);
      if (dataTable[0].state === 'VIC') {
        await testFunction.assertText(t, disclaimer, data.disclaimers.solarBuyBack.VIC.description);
      } else {
        await testFunction.assertText(t, disclaimer, data.disclaimers.solarBuyBack.NonVIC.description);
      }
      console.log("Solar buyback disclaimer validated");
    }
    let planName = dataTable[0].planName;
    let state = dataTable[0].state;
    if(planName===PlanType.RESIDENTIAL_BALANCE_PLAN || planName===PlanType.FLEXI_PLAN || planName===PlanType.TOTAL_PLAN || planName===PlanType.BUSINESS_CARBON_NEUTRAL || planName===PlanType.TOTAL_BUSINESS || planName===PlanType.BUSINESS_BALANCE_PLAN){
      // await testFunction.assertText(t, disclaimer, data.disclaimers.plandisclaimer.heading);
      switch (state) {
        case AustralianState.NSW:
          await testFunction.assertText(t, disclaimer, data.disclaimers.plandisclaimer.NSW.heading);
          await testFunction.assertText(t, disclaimer, data.disclaimers.plandisclaimer.NSW.description);
          break;
        case AustralianState.VIC:
          await testFunction.assertText(t, disclaimer, data.disclaimers.plandisclaimer.VIC.heading);
          await testFunction.assertText(t, disclaimer, data.disclaimers.plandisclaimer.VIC.description);
          break;
        case AustralianState.SA:
          await testFunction.assertText(t, disclaimer, data.disclaimers.plandisclaimer.SA.heading);
          await testFunction.assertText(t, disclaimer, data.disclaimers.plandisclaimer.SA.description);
          break;
        case AustralianState.ACT:
          await testFunction.assertText(t, disclaimer, data.disclaimers.plandisclaimer.ACT.heading);
          await testFunction.assertText(t, disclaimer, data.disclaimers.plandisclaimer.ACT.description);
          break;
        case AustralianState.QLD:
          await testFunction.assertText(t, disclaimer, data.disclaimers.plandisclaimer.QLD.heading);
          await testFunction.assertText(t, disclaimer, data.disclaimers.plandisclaimer.QLD.description);
          break;
        default:
          console.log("Invalid state disclaimer");
      }
    }
    if (dataTable[0].signUpCredit === 'Y') {
      await this.validateSignUpCredit(t, disclaimer, data, state);
    }
    if (dataTable[0].chanceToWin === 'Y') {
      await this.validateChanceToWin(t, disclaimer, data, state);
    }
    if (dataTable[0].carbonNeutral === 'Y') {
      await this.validateCarbonNeutral(t, disclaimer, data, state);
    }
    if (dataTable[0].variableRates === 'Y') {
      await testFunction.assertText(t, disclaimer, data.disclaimers.variableRates.heading);
      await testFunction.assertText(t, disclaimer, data.disclaimers.variableRates.description);
      console.log("Variable rates disclaimer validated");
    }
  }

  public static async validateSignUpCredit(t, disclaimer, data, state) {
    switch (state) {
      case AustralianState.VIC:
        await testFunction.assertText(t, disclaimer, data.disclaimers.Credit50.VIC.heading);
        // await testFunction.assertText(t, disclaimer, data.disclaimers.Credit50.VIC.description);
        break;
      case AustralianState.NSW:
        await testFunction.assertText(t, disclaimer, data.disclaimers.Credit50.NSW.heading);
        await testFunction.assertText(t, disclaimer, data.disclaimers.Credit50.NSW.description);
        break;
      case AustralianState.ACT:
        await testFunction.assertText(t, disclaimer, data.disclaimers.Credit50.ACT.heading);
        await testFunction.assertText(t, disclaimer, data.disclaimers.Credit50.ACT.description);
        break;
      case AustralianState.QLD:
        await testFunction.assertText(t, disclaimer, data.disclaimers.Credit50.QLD.heading);
        await testFunction.assertText(t, disclaimer, data.disclaimers.Credit50.QLD.description);
        break;
      case AustralianState.SA:
        await testFunction.assertText(t, disclaimer, data.disclaimers.Credit50.SA.heading);
        await testFunction.assertText(t, disclaimer, data.disclaimers.Credit50.SA.description);
        break;
      default:
        throw Error("Invalid State");
    }
    console.log("Sign up credit disclaimer validated");
  }

  public static async validateChanceToWin(t, disclaimer, data, state) {
    switch (state) {
      case AustralianState.VIC:
        await testFunction.assertText(t, disclaimer, data.disclaimers.chanceToWin.heading);
        await testFunction.assertText(t, disclaimer, data.disclaimers.chanceToWin.VIC.description);
        break;
      case AustralianState.NSW:
        await testFunction.assertText(t, disclaimer, data.disclaimers.chanceToWin.heading);
        await testFunction.assertText(t, disclaimer, data.disclaimers.chanceToWin.NSW.description);
        break;
      case AustralianState.QLD:
        await testFunction.assertText(t, disclaimer, data.disclaimers.chanceToWin.heading);
        await testFunction.assertText(t, disclaimer, data.disclaimers.chanceToWin.QLD.description);
        break;
      default:
        throw Error("Invalid State");

    }
  }
  public static async validateCarbonNeutral(t, disclaimer, data, state) {
    switch (state) {
      case AustralianState.VIC:
        await testFunction.assertText(t, disclaimer, data.disclaimers.carbonNeutral.VIC.heading);
        await testFunction.assertText(t, disclaimer, data.disclaimers.carbonNeutral.VIC.description);
        break;
      case AustralianState.NSW:
        await testFunction.assertText(t, disclaimer, data.disclaimers.carbonNeutral.NSW.heading);
        await testFunction.assertText(t, disclaimer, data.disclaimers.carbonNeutral.NSW.description);
        break;
      case AustralianState.ACT:
        await testFunction.assertText(t, disclaimer, data.disclaimers.carbonNeutral.ACT.heading);
        await testFunction.assertText(t, disclaimer, data.disclaimers.carbonNeutral.ACT.description);
        break;
      case AustralianState.QLD:
        await testFunction.assertText(t, disclaimer, data.disclaimers.carbonNeutral.QLD.heading);
        await testFunction.assertText(t, disclaimer, data.disclaimers.carbonNeutral.QLD.description);
        break;
      case AustralianState.SA:
        await testFunction.assertText(t, disclaimer, data.disclaimers.carbonNeutral.SA.heading);
        await testFunction.assertText(t, disclaimer, data.disclaimers.carbonNeutral.SA.description);
        break;
      default:
        throw Error("Invalid State");
    }
    console.log("Carbon Neutral disclaimer validated");
  }

  public static async validatePlanDisclaimer(t, disclaimer, data, planName, state) {
    switch (planName) {
      case PlanType.BASIC_HOME:
        await testFunction.assertText(t, disclaimer, data.disclaimers.basicPlan.heading);
        switch (state) {
          case AustralianState.VIC:
            await testFunction.assertText(t, disclaimer, data.disclaimers.basicPlan.VIC.description);
            break;
          case AustralianState.NSW:
            await testFunction.assertText(t, disclaimer, data.disclaimers.basicPlan.NSW.description);
            break;
          case AustralianState.ACT:
            await testFunction.assertText(t, disclaimer, data.disclaimers.basicPlan.ACT.description);
            break;
          case AustralianState.SA:
            await testFunction.assertText(t, disclaimer, data.disclaimers.basicPlan.SA.description);
            break;
          case AustralianState.QLD:
            await testFunction.assertText(t, disclaimer, data.disclaimers.basicPlan.QLD.description);
            break;
          default:
            throw Error("Invalid State");
        }
        break;
      case PlanType.NO_FRILLS:
        await testFunction.assertText(t, disclaimer, data.disclaimers.noFrills.heading);
        switch (state) {
          case AustralianState.VIC:
            await testFunction.assertText(t, disclaimer, data.disclaimers.noFrills.VIC.description);
            break;
          case AustralianState.NSW:
            await testFunction.assertText(t, disclaimer, data.disclaimers.noFrills.NSW.description);
            break;
          case AustralianState.ACT:
            await testFunction.assertText(t, disclaimer, data.disclaimers.noFrills.ACT.description);
            break;
          case AustralianState.SA:
            await testFunction.assertText(t, disclaimer, data.disclaimers.noFrills.SA.description);
            break;
          case AustralianState.QLD:
            await testFunction.assertText(t, disclaimer, data.disclaimers.noFrills.QLD.description);
            break;
          default:
            throw Error("Invalid State");
        }
        break;
      case PlanType.FLEXI_PLAN:
        switch (state) {
          case AustralianState.VIC:
            await testFunction.assertText(t, disclaimer, data.disclaimers.totalPlan.VIC.heading);
            await testFunction.assertText(t, disclaimer, data.disclaimers.totalPlan.VIC.description);
            break;
          case AustralianState.NSW:
            await testFunction.assertText(t, disclaimer, data.disclaimers.totalPlan.NSW.heading);
            await testFunction.assertText(t, disclaimer, data.disclaimers.totalPlan.NSW.description);
            break;
          case AustralianState.ACT:
            await testFunction.assertText(t, disclaimer, data.disclaimers.totalPlan.ACT.heading);
            await testFunction.assertText(t, disclaimer, data.disclaimers.totalPlan.ACT.description);
            break;
          case AustralianState.SA:
            await testFunction.assertText(t, disclaimer, data.disclaimers.totalPlan.SA.heading);
            await testFunction.assertText(t, disclaimer, data.disclaimers.totalPlan.SA.description);
            break;
          case AustralianState.QLD:
            await testFunction.assertText(t, disclaimer, data.disclaimers.totalPlan.QLD.heading);
            await testFunction.assertText(t, disclaimer, data.disclaimers.totalPlan.QLD.description);
            break;
          default:
            throw Error("Invalid State");
        }
        break;
      case PlanType.TOTAL_PLAN:
        await testFunction.assertText(t, disclaimer, data.disclaimers.totalPlan.heading);
        switch (state) {
          case AustralianState.VIC:
            await testFunction.assertText(t, disclaimer, data.disclaimers.totalPlan.VIC.description);
            break;
          case AustralianState.NSW:
            await testFunction.assertText(t, disclaimer, data.disclaimers.totalPlan.NSW.description);
            break;
          case AustralianState.ACT:
            await testFunction.assertText(t, disclaimer, data.disclaimers.totalPlan.ACT.description);
            break;
          case AustralianState.SA:
            await testFunction.assertText(t, disclaimer, data.disclaimers.totalPlan.SA.description);
            break;
          case AustralianState.QLD:
            await testFunction.assertText(t, disclaimer, data.disclaimers.totalPlan.QLD.description);
            break;
          default:
            throw Error("Invalid State");
        }
        break;
      case PlanType.TOTAL_PLAN_PLUS:
        await testFunction.assertText(t, disclaimer, data.disclaimers.totalPlanPlus.heading);
        switch (state) {
          case AustralianState.VIC:
            await testFunction.assertText(t, disclaimer, data.disclaimers.totalPlanPlus.VIC.description);
            break;
          case AustralianState.NSW:
            await testFunction.assertText(t, disclaimer, data.disclaimers.totalPlanPlus.NSW.description);
            break;
          case AustralianState.ACT:
            await testFunction.assertText(t, disclaimer, data.disclaimers.totalPlanPlus.ACT.description);
            break;
          case AustralianState.SA:
            await testFunction.assertText(t, disclaimer, data.disclaimers.totalPlanPlus.SA.description);
            break;
          case AustralianState.QLD:
            await testFunction.assertText(t, disclaimer, data.disclaimers.totalPlanPlus.QLD.description);
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
        await testFunction.assertText(t, disclaimer, data.disclaimers.totalPlanBusiness.heading);
        switch (state) {
          case AustralianState.VIC:
            await testFunction.assertText(t, disclaimer, data.disclaimers.totalPlanBusiness.VIC.description);
            break;
          case AustralianState.NSW:
            await testFunction.assertText(t, disclaimer, data.disclaimers.totalPlanBusiness.NSW.description);
            break;
          case AustralianState.ACT:
            await testFunction.assertText(t, disclaimer, data.disclaimers.totalPlanBusiness.ACT.description);
            break;
          case AustralianState.SA:
            await testFunction.assertText(t, disclaimer, data.disclaimers.totalPlanBusiness.SA.description);
            break;
          case AustralianState.QLD:
            await testFunction.assertText(t, disclaimer, data.disclaimers.totalPlanBusiness.QLD.description);
            break;
          default:
            throw Error("Invalid State");
        }
        break;
      case PlanType.TOTAL_PLAN_PLUS_BUSINESS:
        await testFunction.assertText(t, disclaimer, data.disclaimers.totalPlanPlusBusiness.heading);
        switch (state) {
          case AustralianState.VIC:
            await testFunction.assertText(t, disclaimer, data.disclaimers.totalPlanPlusBusiness.VIC.description);
            break;
          case AustralianState.NSW:
            await testFunction.assertText(t, disclaimer, data.disclaimers.totalPlanPlusBusiness.NSW.description);
            break;
          case AustralianState.ACT:
            await testFunction.assertText(t, disclaimer, data.disclaimers.totalPlanPlusBusiness.ACT.description);
            break;
          case AustralianState.SA:
            await testFunction.assertText(t, disclaimer, data.disclaimers.totalPlanPlusBusiness.SA.description);
            break;
          case AustralianState.QLD:
            await testFunction.assertText(t, disclaimer, data.disclaimers.totalPlanPlusBusiness.QLD.description);
            break;
          default:
            throw Error("Invalid State");
        }
        break;
      case PlanType.FAMILY_AND_FRIENDS:
        await testFunction.assertText(t, disclaimer, data.disclaimers.familyAndFriends.heading);
        switch (state) {
          case AustralianState.VIC:
            await testFunction.assertText(t, disclaimer, data.disclaimers.familyAndFriends.VIC.description);
            break;
          case AustralianState.NSW:
            await testFunction.assertText(t, disclaimer, data.disclaimers.familyAndFriends.NSW.description);
            break;
          case AustralianState.ACT:
            await testFunction.assertText(t, disclaimer, data.disclaimers.familyAndFriends.ACT.description);
            break;
          case AustralianState.SA:
            await testFunction.assertText(t, disclaimer, data.disclaimers.familyAndFriends.SA.description);
            break;
          case AustralianState.QLD:
            await testFunction.assertText(t, disclaimer, data.disclaimers.familyAndFriends.QLD.description);
            break;
          default:
            throw Error("Invalid State");
        }
        break;
      case PlanType.FAMILY_AND_FRIENDS_BUSINESS:
        await testFunction.assertText(t, disclaimer, data.disclaimers.familyAndFriendsBusiness.heading);
        switch (state) {
          case AustralianState.VIC:
            await testFunction.assertText(t, disclaimer, data.disclaimers.familyAndFriendsBusiness.VIC.description);
            break;
          case AustralianState.NSW:
            await testFunction.assertText(t, disclaimer, data.disclaimers.familyAndFriendsBusiness.NSW.description);
            break;
          case AustralianState.ACT:
            await testFunction.assertText(t, disclaimer, data.disclaimers.familyAndFriendsBusiness.ACT.description);
            break;
          case AustralianState.SA:
            await testFunction.assertText(t, disclaimer, data.disclaimers.familyAndFriendsBusiness.SA.description);
            break;
          case AustralianState.QLD:
            await testFunction.assertText(t, disclaimer, data.disclaimers.familyAndFriendsBusiness.QLD.description);
            break;
          default:
            throw Error("Invalid State");
        }
        break;
      case PlanType.EMPLOYEE_PLAN:
        await testFunction.assertText(t, disclaimer, data.disclaimers.employeePlan.heading);
        switch (state) {
          case AustralianState.VIC:
            await testFunction.assertText(t, disclaimer, data.disclaimers.employeePlan.VIC.description);
            break;
          case AustralianState.NSW:
            await testFunction.assertText(t, disclaimer, data.disclaimers.employeePlan.NSW.description);
            break;
          case AustralianState.ACT:
            await testFunction.assertText(t, disclaimer, data.disclaimers.employeePlan.ACT.description);
            break;
          case AustralianState.SA:
            await testFunction.assertText(t, disclaimer, data.disclaimers.employeePlan.SA.description);
            break;
          case AustralianState.QLD:
            await testFunction.assertText(t, disclaimer, data.disclaimers.employeePlan.QLD.description);
            break;
          default:
            throw Error("Invalid State");
        }
        break;
      case PlanType.BUSINESS_CARBON_NEUTRAL:
        await testFunction.assertText(t, disclaimer, data.disclaimers.businessCarbonNeutral.heading);
        switch (state) {
          case AustralianState.VIC:
            await testFunction.assertText(t, disclaimer, data.disclaimers.businessCarbonNeutral.VIC.description);
            break;
          case AustralianState.NSW:
            await testFunction.assertText(t, disclaimer, data.disclaimers.businessCarbonNeutral.NSW.description);
            break;
          case AustralianState.ACT:
            await testFunction.assertText(t, disclaimer, data.disclaimers.businessCarbonNeutral.ACT.description);
            break;
          case AustralianState.SA:
            await testFunction.assertText(t, disclaimer, data.disclaimers.businessCarbonNeutral.SA.description);
            break;
          case AustralianState.QLD:
            await testFunction.assertText(t, disclaimer, data.disclaimers.businessCarbonNeutral.QLD.description);
            break;
          default:
            throw Error("Invalid State");
        }
        break;
      case PlanType.BUSINESS_BALANCE_PLAN:
        await testFunction.assertText(t, disclaimer, data.disclaimers.businessBalancePlan.heading);
        switch (state) {
          case AustralianState.VIC:
            await testFunction.assertText(t, disclaimer, data.disclaimers.businessBalancePlan.VIC.description);
            break;
          case AustralianState.NSW:
            await testFunction.assertText(t, disclaimer, data.disclaimers.businessBalancePlan.NSW.description);
            break;
          case AustralianState.ACT:
            await testFunction.assertText(t, disclaimer, data.disclaimers.businessBalancePlan.ACT.description);
            break;
          case AustralianState.SA:
            await testFunction.assertText(t, disclaimer, data.disclaimers.businessBalancePlan.SA.description);
            break;
          case AustralianState.QLD:
            await testFunction.assertText(t, disclaimer, data.disclaimers.businessBalancePlan.QLD.description);
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
    if (await testFunction.isElectricity(fuelType)) {
      await testFunction.assertText(t, EaHomePage.elements.eleDiscount, discount);
    } else if (await testFunction.isElectricity(fuelType)) {
      await testFunction.assertText(t, EaHomePage.elements.gasDiscount, discount);
    }
  }

  public static async validateDiscountPlansPage(t, fuelType, discount,planName) {
    console.log("planName",planName);
    console.log("fuelType",fuelType);
    switch (planName) {
      case PlanType.RESIDENTIAL_BALANCE_PLAN:
        if (await testFunction.isElectricity(fuelType)) {
          await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.residentialBalanceEleDiscount, discount);
        } else if (await testFunction.isGas(fuelType)) {
          await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.residentialBalanceGasDiscount, discount);
        }
        break;
      case PlanType.FLEXI_PLAN:
        if (await testFunction.isElectricity(fuelType)) {
          await testFunction.assertText(t, EaHomePage.elements.FlexiPlanTable.flexiPlanEleDiscount, discount);
        } else if (await testFunction.isGas(fuelType)) {
          await testFunction.assertText(t, EaHomePage.elements.FlexiPlanTable.flexiPlanGasDiscount, discount);
        }
        break;
      case PlanType.TOTAL_PLAN:
        if (await testFunction.isElectricity(fuelType)) {
          await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.totalPlanEleDiscount, discount);
        } else if (await testFunction.isGas(fuelType)) {
          await testFunction.assertText(t, EaHomePage.elements.ResidentialBalanceTable.totalPlanGasDiscount, discount);
        }
        break;
      case PlanType.BUSINESS_CARBON_NEUTRAL:
        if (await testFunction.isElectricity(fuelType)) {
          await testFunction.assertText(t, EaHomePage.elements.BusinessCarbonNeutralPlanTable.businessCarbonNeutralPlanEleDiscount, discount);
        }
        break;
      case PlanType.BUSINESS_CARBON_NEUTRAL_FLEXI:
        if (await testFunction.isElectricity(fuelType)) {
          await testFunction.assertText(t, EaHomePage.elements.BusinessCarbonNeutralFlexiPlanTable.businessCarbonNeutralFlexiPlanEleDiscount, discount);
        }
        break;
      case PlanType.BUSINESS_BALANCE_PLAN:
        if (await testFunction.isElectricity(fuelType)) {
          await testFunction.assertText(t, EaHomePage.elements.BusinessBalancePlanTable.businessBalancePlanEleDiscount, discount);
        }else if (await testFunction.isGas(fuelType)) {
        await testFunction.assertText(t, EaHomePage.elements.BusinessBalancePlanTable.businessBalancePlanGasDiscount, discount);
      }
        break;
      case PlanType.TOTAL_BUSINESS:
        if (await testFunction.isElectricity(fuelType)) {
          await testFunction.assertText(t, EaHomePage.elements.BusinessTotalPlanTable.businessTotalPlanEleDiscount, discount);
        }
        break;
      case PlanType.SOLAR_MAX_COMBO:
        if (await testFunction.isGas(fuelType)) {
          await testFunction.assertText(t, EaHomePage.elements.SolarMaxPlanTable.gasdiscountOffsMaxTitle, discount);
        }
        break;
      default:
        throw Error("Invalid plan");
    }
  }

  public static async enterNMIorMIRNorPostcode(t, NMIorMIRNorPostcodeValue, NMIorMIRNorPostcode) {
    if (NMIorMIRNorPostcode === 'NMI') {
      await testFunction.clearTextField(t, EaHomePage.elements.inputNMI);
      await testFunction.clearAndEnterText(t, EaHomePage.elements.inputNMI, NMIorMIRNorPostcodeValue);
    }
    if (NMIorMIRNorPostcode === 'MIRN') {
      await testFunction.clearAndEnterText(t, EaHomePage.elements.inputMIRN, NMIorMIRNorPostcodeValue);
    }
    if (NMIorMIRNorPostcode === 'POSTCODE') {
      await testFunction.click(t, EaHomePage.elements.rbPostcodePlansPage);
      await testFunction.clearAndEnterText(t, EaHomePage.elements.inputPostcode, NMIorMIRNorPostcodeValue);
    }

  }


  public static async verifyNMIorMIRNLookupMessage(t, NMIorMIRNType) {
    let errorMessage;
    switch (NMIorMIRNType) {
      case "ADDRESS_NOT_SERVICED":
        errorMessage = "Unfortunately we don\'t supply energy to this address. For more information please call us on 1800 596 517.";
        await testFunction.waitForElementToBeAppeared(t, EaHomePage.elements.txtAddressNotServicedMsg);
        await testFunction.assertText(t, EaHomePage.elements.txtAddressNotServicedMsg, errorMessage);
        break;
      case "GAS_NOT_SERVICED":
        errorMessage = "Please note: at 27 Munnell St GULARGAMBONE NSW 2828, we only supply electricity, so we\'ve removed the gas plan from your quote.";
        await testFunction.waitForElementToBeAppeared(t, EaHomePage.elements.txtAddressNotServicedMsg);
        await testFunction.assertText(t, EaHomePage.elements.txtAddressNotServicedMsg, errorMessage);
        await testFunction.assertText(t, EaHomePage.elements.basicResiPlanHeadingFuel, 'Electricity');
        break;
    }
  }

  public static async validateGeneralStateDisclaimer(t, customerType) {
    if (await testFunction.isResidential(customerType)) {
      //Residential customers
      await testFunction.assertText(t, EaHomePage.elements.disclaimer.generalStateDisclaimerP1, "When you choose us, you’ll be with a trusted power provider who supplies energy to 1.7 million Australian customers.");
      await testFunction.assertText(t, EaHomePage.elements.disclaimer.generalStateDisclaimerP2, "We are focusing on helping customers reduce their energy usage via tips in our blog on energy rating and how to be more energy efficient.");
      await testFunction.assertText(t, EaHomePage.elements.disclaimer.generalStateDisclaimerP3, "Compare energy plans from the options above and find our best electricity deals. Making an energy switch has never been so easy.");
    } else if (await testFunction.isBusiness(customerType)) {
      //Business customers
      await testFunction.assertText(t, EaHomePage.elements.disclaimer.generalStateDisclaimerOld, "Find a better deal for your business here at EnergyAustralia. Easily compare plans, rates and benefits then switch online for instant email confirmation.");
    }
    console.log("General state disclaimer validated successfully on plans page.");
  }

  public static async croRefineButtons(t, customerType) {
    if (await testFunction.isResidential(customerType)) {
      //Residential customers
      await testFunction.assertText(t, EaHomePage.elements.croRefineOptions.energyUsageButton, "Energy usage");
      await testFunction.assertText(t, EaHomePage.elements.croRefineOptions.addGreenEnergyButton, "Add green energy");
      await testFunction.assertText(t, EaHomePage.elements.croRefineOptions.moreOptionsButton, "More");
      await testFunction.takeScreenshot(t, 'Refine Options');
    } else if (await testFunction.isBusiness(customerType)) {
      await testFunction.assertText(t, EaHomePage.elements.croRefineOptions.energyUsageButton, "Energy usage");
      await testFunction.assertText(t, EaHomePage.elements.croRefineOptions.addGreenEnergyButton, "Add green energy");
      await testFunction.assertText(t, EaHomePage.elements.croRefineOptions.moreOptionsButton, "More");
      await testFunction.takeScreenshot(t, 'Refine Options');
    }
    console.log("Refine buttons are validated on plans page");
  }

  public static async validateSolarGovernmentSchemeDisclaimer(t) {
    let countOfElements = await testFunction.sizeOfElement(t, EaHomePage.elements.solarRateToolTip);
    for (let i = 0; i < countOfElements -1; i++) {
      await scrollTo(EaHomePage.elements.solarRateToolTip.nth(i));
      await testFunction.click(t, EaHomePage.elements.solarRateToolTip.nth(i));
      await testFunction.assertText(t, EaHomePage.elements.solarRateToolTipText.nth(i), "If you are eligible for a government solar rebate, the rebate will be reflected in your welcome pack and added to your account.");
    }
    console.log("Solar Government Scheme disclaimer validated successfully.");
  }

  public static async validateComparisonStatement(t, baseCreditCondition, rewardCreditCondition, planName) {
    let comparisonText;
    switch (planName) {
      case PlanType.NO_FRILLS:
        comparisonText = await testFunction.getElementText(t, EaHomePage.elements.noFrillsComparisonStatement);
        break;
      case PlanType.TOTAL_PLAN:
        comparisonText = await testFunction.getElementText(t, EaHomePage.elements.totalPlanComparisonStatement);
        break;
      case PlanType.TOTAL_PLAN_PLUS:
        comparisonText = await testFunction.getElementText(t, EaHomePage.elements.totalPlanPlusComparisonStatement);
        break;
      case PlanType.TOTAL_BUSINESS:
        comparisonText = await testFunction.getElementText(t, EaHomePage.elements.totalPlanBusinessComparisonStatement);
        break;
      case PlanType.TOTAL_PLAN_PLUS_BUSINESS:
        comparisonText = await testFunction.getElementText(t, EaHomePage.elements.totalPlanPlusBusinessComparisonStatement);
        break;

    }
    if (baseCreditCondition === 'UNCONDITIONAL' && rewardCreditCondition === null) {
      await t.expect(comparisonText).contains('and including credits');
      await t.expect(comparisonText).notContains('if eligible for credits');
    }
    if (baseCreditCondition === 'CONDITIONAL' && rewardCreditCondition === null) {
      await t.expect(comparisonText).contains('if eligible for credits');
      await t.expect(comparisonText).notContains('and including credits');
    }
    if (baseCreditCondition === null && rewardCreditCondition === 'UNCONDITIONAL') {
      await t.expect(comparisonText).notContains('and including credits');
      await t.expect(comparisonText).notContains('if eligible for credits');
    }
    if (baseCreditCondition === null && rewardCreditCondition === 'CONDITIONAL') {
      await t.expect(comparisonText).contains('if eligible for credits');
      await t.expect(comparisonText).notContains('and including credits');
    }
    if (baseCreditCondition === 'UNCONDITIONAL' && rewardCreditCondition === 'UNCONDITIONAL') {
      await t.expect(comparisonText).contains('and including credits');
      await t.expect(comparisonText).notContains('if eligible for credits');
    }
    if (baseCreditCondition === 'CONDITIONAL' && rewardCreditCondition === 'CONDITIONAL') {
      await t.expect(comparisonText).contains('if eligible for credits');
      await t.expect(comparisonText).notContains('and including credits');

    }
  }

  public static async validateReferencePrice(t, estimatedCost, referencePrice, percentageDiff, state, actualCustomerType) {
    if (percentageDiff < 0.5) {
      if (state !== 'QLD' && state !== 'ACT') {
        if (actualCustomerType === 'RES') {
          await testFunction.assertText(t, EaHomePage.elements.basicHomeReferencePrice, referencePrice.toString());
        } else {
          await testFunction.assertText(t, EaHomePage.elements.basicBusinessReferencePrice, referencePrice.toString());
        }
      }
      if (state === 'QLD') {
        if (actualCustomerType === 'RES') {
          await testFunction.assertText(t, EaHomePage.elements.basicHomeReferencePrice_QLD, referencePrice.toString());
        } else {
          await testFunction.assertText(t, EaHomePage.elements.basicBusinessReferencePrice_QLD, referencePrice.toString());
        }
      }
    }
    if (percentageDiff > 0.5) {
      if (state !== 'QLD' && state !== 'ACT') {
        if (actualCustomerType === 'RES') {
          await testFunction.assertText(t, EaHomePage.elements.basicHomeReferencePrice, estimatedCost.toString());
          await testFunction.assertText(t, EaHomePage.elements.basicHomeReferencePrice, percentageDiff.toString());
        } else {
          await testFunction.assertText(t, EaHomePage.elements.basicBusinessReferencePrice, estimatedCost.toString());
          await testFunction.assertText(t, EaHomePage.elements.basicBusinessReferencePrice, percentageDiff.toString());
        }

      }
      if (state === 'QLD') {
        if (actualCustomerType === 'RES') {
          await testFunction.assertText(t, EaHomePage.elements.basicHomeReferencePrice_QLD, estimatedCost.toString());
          await testFunction.assertText(t, EaHomePage.elements.basicHomeReferencePrice_QLD, percentageDiff.toString());
        } else {
          await testFunction.assertText(t, EaHomePage.elements.basicBusinessReferencePrice_QLD, estimatedCost.toString());
          await testFunction.assertText(t, EaHomePage.elements.basicBusinessReferencePrice_QLD, percentageDiff.toString());
        }
      }
    }
  }

  public static async validateEstimatedCost(t, planName, estimatedCost, actualCustomerType, state) {
    if (planName.includes('Basic - Home') || planName.includes('Basic - Business ')) {
      const estimatedCostBasic = Math.round(estimatedCost);
      if (state !== 'QLD' && state !== 'ACT') {
        if (actualCustomerType === 'RES') {
          await testFunction.assertText(t, EaHomePage.elements.basicHomePlanEstimate, estimatedCostBasic.toString());
        } else {
          await testFunction.assertText(t, EaHomePage.elements.basicBusinessPlanEstimate, estimatedCostBasic.toString());
        }
      }
      if (state === 'QLD') {
        if (actualCustomerType === 'RES') {
          await testFunction.assertText(t, EaHomePage.elements.basicHomePlanEstimate_QLD, estimatedCostBasic.toString());
        } else {
          await testFunction.assertText(t, EaHomePage.elements.basicBusinessPlanEstimate_QLD, estimatedCostBasic.toString());
        }
      }
    }
    if (planName.includes('No Frills (Home)')) {
      const estimatedCostNoFrills = Math.round(estimatedCost);
      await testFunction.assertText(t, EaHomePage.elements.noFrillsPlanEstimate, estimatedCostNoFrills.toString());
    }
    if (planName.includes('Total Plan (Home)')) {
      let discount = parseInt((await testFunction.getElementText(t, EaHomePage.elements.totalPlanDiscount)).split("%")[0]);
      let estimatedTotalPlanCost = Math.round(Number(estimatedCost * (1 - discount / 100)));
      await testFunction.assertText(t, EaHomePage.elements.totalPlanEstimate, estimatedTotalPlanCost.toString());
    }
    if (planName.includes('Total Plan (Business)')) {
      let discount = parseInt((await testFunction.getElementText(t, EaHomePage.elements.totalPlanBusinessDiscount)).split("%")[0]);
      let estimatedTotalPlanBusinessCost = Math.round(Number(estimatedCost * (1 - discount / 100)));
      await testFunction.assertText(t, EaHomePage.elements.totalPlanBusinessEstimate, estimatedTotalPlanBusinessCost.toString());
    }
  }

  public static async validateBestOfferEstimatedCost(t, planName, estimatedCost, percentageDiff, benchmarkUsage) {
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
    if (planName.includes('No Frills - Home')) {
      await testFunction.assertText(t, EaHomePage.elements.noFrillsPlanEstimate, estimatedCost.toString());
      if (benchmarkUsage !== "") {
        await testFunction.assertText(t, EaHomePage.elements.noFrillsComparisonStatement, percentageDiff.toString());
      }
    }
    if (planName.includes('Total Plan - Home')) {
      await testFunction.assertText(t, EaHomePage.elements.totalPlanEstimate, estimatedCost.toString());
      if (benchmarkUsage !== "") {
        await testFunction.assertText(t, EaHomePage.elements.totalPlanComparisonStatement, percentageDiff.toString());
      }
    }
    if (planName.includes('Total Plan Plus - Home')) {
      let basicHomePlanEstimate = Number(await testFunction.getElementText(t, EaHomePage.elements.basicHomePlanEstimate).substring(1));
      let expectedPercentageDiff = Math.round(Number(((basicHomePlanEstimate - estimatedCost) / basicHomePlanEstimate) * 100));
      await testFunction.assertTextValue(t, percentageDiff.toString(), expectedPercentageDiff.toString());
    }
    if (planName.includes('Total Plan - Business')) {
      await testFunction.assertText(t, EaHomePage.elements.totalPlanBusinessEstimate, estimatedCost.toString());
      if (benchmarkUsage !== "") {
        await testFunction.assertText(t, EaHomePage.elements.totalPlanBusinessComparisonStatement, percentageDiff.toString());
      }
    }
    if (planName.includes('Total Plan Plus - Business')) {
      let basicBusinessPlanEstimate = Number((await testFunction.getElementText(t, EaHomePage.elements.basicBusinessPlanEstimate)).substring(1));
      let expectedPercentageDiff = Math.round(Number(((basicBusinessPlanEstimate - estimatedCost) / basicBusinessPlanEstimate) * 100));
      await testFunction.assertTextValue(t, percentageDiff.toString(), expectedPercentageDiff.toString());
    }
  }

  public static async selectOption(t: any, option: any) {
    switch (option) {
      case 'Energy Usage':
        await testFunction.click(t, EaHomePage.elements.croRefineOptions.energyUsageButton);
        await testFunction.isElementDisplayed(t, EaHomePage.elements.croCustomiseEstimateSideBar.sideBar);
        await testFunction.takeScreenshot(t, 'energyusage_option');
        break;
      case 'Add Green Energy':
        await testFunction.click(t, EaHomePage.elements.croRefineOptions.addGreenEnergyButton);
        await testFunction.takeScreenshot(t, 'greenenergy_option');
        break;
      case 'More':
        await testFunction.click(t, EaHomePage.elements.croRefineOptions.moreOptionsButton);
        await testFunction.takeScreenshot(t, 'more_option');
        break;
    }
  }

  public static async validateEnergyUsageSideBar(t: any) {
    await testFunction.isElementDisplayed(t, EaHomePage.elements.croCustomiseEstimateSideBar.energyUsageAccordionHeader);
    await testFunction.isElementDisplayed(t, EaHomePage.elements.croCustomiseEstimateSideBar.greenEnergyAccordionHeader);
    await testFunction.isElementDisplayed(t, EaHomePage.elements.croCustomiseEstimateSideBar.billingPeriodAccordionHeader);
    await testFunction.isElementDisplayed(t, EaHomePage.elements.croCustomiseEstimateSideBar.enterNMIorMIRNAccordionHeader);
    await testFunction.isElementDisplayed(t, EaHomePage.elements.croCustomiseEstimateSideBar.uploadBillAccordionHeader);
    await testFunction.isElementDisplayed(t, EaHomePage.elements.croCustomiseEstimateSideBar.existingCustomerAccordionHeader);
  }

  public static async validateEnergyUsageToolTip(t: any, usage: any) {
    switch (usage) {
      case 'Electricity':
        await testFunction.click(t, EaHomePage.elements.croCustomiseEstimateSideBar.electricityUsageTooltip);
        await testFunction.isElementDisplayed(t, EaHomePage.elements.croCustomiseEstimateSideBar.electricityUsageTooltipText);
        await testFunction.assertText(t, EaHomePage.elements.croCustomiseEstimateSideBar.electricityUsageTooltipText, 'Households with 1-2 people doing one load of laundry per week are typically low usage.\n' +
          '\n' +
          'Households with 5 or more people are typically high usage.\n' +
          '\n' +
          '*The Low, Medium, High and Custom cost estimates below are calculated using the Australian Energy Regulator (AER) benchmark usage attribution, which may not reflect your actual usage patterns. You can verify your account to retrieve your own usage to receive a more accurate cost estimate.\n' +
          '\n' +
          '*Electricity estimates are based on the daily usage band you select. The amount you will be charged will be based on the actual energy you use which can vary throughout the year. This is not an official quote. Electricity daily usage must not exceed 499.99 kWh.');
        await testFunction.click(t, EaHomePage.elements.croCustomiseEstimateSideBar.electricityUsageTooltipCloseButton);
        await testFunction.takeScreenshot(t, 'elec_tooltip');
        break;
      case 'Gas':
        await testFunction.click(t, EaHomePage.elements.croCustomiseEstimateSideBar.gasUsageTooltip);
        await testFunction.isElementDisplayed(t, EaHomePage.elements.croCustomiseEstimateSideBar.gasUsageTooltipText);
        await testFunction.assertText(t, EaHomePage.elements.croCustomiseEstimateSideBar.gasUsageTooltipText, '');
        await testFunction.click(t, EaHomePage.elements.croCustomiseEstimateSideBar.gasUsageTooltipCloseButton);
        await testFunction.takeScreenshot(t, 'gas_tooltip');
        break;
    }
  }

  public static async selectSideBarUsage(t, fueltype: any, usage: any) {
    switch (fueltype) {
      case 'Electricity':
        switch (usage) {
          case 'Low':
            await testFunction.click(t, EaHomePage.elements.croCustomiseEstimateSideBar.electricityUsageLow);
            await testFunction.takeScreenshot(t, 'elec_usage_low');
            break;
          case 'Medium':
            await testFunction.click(t, EaHomePage.elements.croCustomiseEstimateSideBar.electricityUsageMedium);
            await testFunction.takeScreenshot(t, 'elec_usage_medium');
            break;
          case 'High':
            await testFunction.click(t, EaHomePage.elements.croCustomiseEstimateSideBar.electricityUsageHigh);
            await testFunction.takeScreenshot(t, 'elec_usage_high');
            break;
          case 'Custom':
            await testFunction.click(t, EaHomePage.elements.croCustomiseEstimateSideBar.electricityUsageCustom);
            await testFunction.takeScreenshot(t, 'elec_usage_custom');
            break;
        }
        break;
      case 'Gas':
        switch (usage) {
          case 'Low':
            await testFunction.click(t, EaHomePage.elements.croCustomiseEstimateSideBar.gasUsageLow);
            await testFunction.takeScreenshot(t, 'gas_usage_low');
            break;
          case 'Medium':
            await testFunction.click(t, EaHomePage.elements.croCustomiseEstimateSideBar.gasUsageMedium);
            await testFunction.takeScreenshot(t, 'gas_usage_medium');
            break;
          case 'High':
            await testFunction.click(t, EaHomePage.elements.croCustomiseEstimateSideBar.gasUsageHigh);
            await testFunction.takeScreenshot(t, 'gas_usage_high');
            break;
          case 'Custom':
            await testFunction.click(t, EaHomePage.elements.croCustomiseEstimateSideBar.gasUsageCustom);
            await testFunction.takeScreenshot(t, 'gas_usage_custom');
            break;
        }
        break;
    }
    console.log("User clicked on " + fueltype + usage + "option");
  }

  public static async enterSideBarCustomUsage(t: any, fueltype: any) {
    switch (fueltype) {
      case 'Electricity':
        await testFunction.enterText(t, EaHomePage.elements.croCustomiseEstimateSideBar.electricityUsageCustomText, '20');
        await testFunction.takeScreenshot(t, 'elec_custom_usage');
        break;
      case 'Gas':
        await testFunction.enterText(t, EaHomePage.elements.croCustomiseEstimateSideBar.gasUsageCustomText, '200');
        await testFunction.takeScreenshot(t, 'gas_custom_usage');
        break;
    }
  }

  public static async validateSideBarBillingPeriod(t: any) {
    await testFunction.isElementDisplayed(t, EaHomePage.elements.croCustomiseEstimateSideBar.billingPeriodAccordion.billingPeriodText);
    await testFunction.assertText(t, EaHomePage.elements.croCustomiseEstimateSideBar.billingPeriodAccordion.activeBillingPeriod, 'Monthly');
    console.log("User validated the active billing period");
    await testFunction.takeScreenshot(t, 'billing_period_accordion_section');
    await testFunction.click(t, EaHomePage.elements.croCustomiseEstimateSideBar.billingPeriodAccordion.openBillingPeriodOption);
    console.log("User clicked the billing period dropdown");
    await testFunction.isElementDisplayed(t, EaHomePage.elements.croCustomiseEstimateSideBar.billingPeriodAccordion.billingPeriodDropdownMonthlyValue);
    await testFunction.isElementDisplayed(t, EaHomePage.elements.croCustomiseEstimateSideBar.billingPeriodAccordion.billingPeriodDropdownBiMonthlyValue);
    await testFunction.isElementDisplayed(t, EaHomePage.elements.croCustomiseEstimateSideBar.billingPeriodAccordion.billingPeriodDropdownQuarterlyValue);
    await testFunction.isElementDisplayed(t, EaHomePage.elements.croCustomiseEstimateSideBar.billingPeriodAccordion.billingPeriodDropdownYearlyValue);
    console.log("User validated the billing period values");
    await testFunction.takeScreenshot(t, 'billing_period_dropdown_section');
    await testFunction.click(t, EaHomePage.elements.croCustomiseEstimateSideBar.billingPeriodAccordion.billingPeriodDropdownYearlyValue);
    console.log("User successfully clicked the Yearly billing period value");
  }

  public static async validateSideBarGreenEnergy(t: any, customer_type) {
    await testFunction.isElementDisplayed(t, EaHomePage.elements.croCustomiseEstimateSideBar.greenEnergyAccordion.greenEnergyText);
    await testFunction.isElementDisplayed(t, EaHomePage.elements.croCustomiseEstimateSideBar.greenEnergyAccordion.greenEnergyChargesText);
    await testFunction.takeScreenshot(t, 'green_energy_accordion_section');
    await testFunction.click(t, EaHomePage.elements.croCustomiseEstimateSideBar.greenEnergyAccordion.openGreenEnergyOption);
    switch (customer_type) {
      case 'RES':
        await testFunction.isElementDisplayed(t, EaHomePage.elements.croCustomiseEstimateSideBar.greenEnergyAccordion.greenEnergyDropdown0Value);
        await testFunction.isElementDisplayed(t, EaHomePage.elements.croCustomiseEstimateSideBar.greenEnergyAccordion.greenEnergyDropdown10Value);
        await testFunction.isElementDisplayed(t, EaHomePage.elements.croCustomiseEstimateSideBar.greenEnergyAccordion.greenEnergyDropdown20Value);
        await testFunction.isElementDisplayed(t, EaHomePage.elements.croCustomiseEstimateSideBar.greenEnergyAccordion.greenEnergyDropdown100Value);
        await testFunction.takeScreenshot(t, 'green_energy_dropdown_section');
        await testFunction.click(t, EaHomePage.elements.croCustomiseEstimateSideBar.greenEnergyAccordion.greenEnergyDropdown100Value);
        break;
      case 'BUS':
        await testFunction.isElementDisplayed(t, EaHomePage.elements.croCustomiseEstimateSideBar.greenEnergyAccordion.greenEnergyDropdown0Value);
        await testFunction.isElementDisplayed(t, EaHomePage.elements.croCustomiseEstimateSideBar.greenEnergyAccordion.greenEnergyDropdown10Value);
        await testFunction.isElementDisplayed(t, EaHomePage.elements.croCustomiseEstimateSideBar.greenEnergyAccordion.greenEnergyDropdown25Value);
        await testFunction.isElementDisplayed(t, EaHomePage.elements.croCustomiseEstimateSideBar.greenEnergyAccordion.greenEnergyDropdown100Value);
        await testFunction.takeScreenshot(t, 'green_energy_dropdown_section');
        await testFunction.click(t, EaHomePage.elements.croCustomiseEstimateSideBar.greenEnergyAccordion.greenEnergyDropdown100Value);
        break;
    }
  }

  public static async provideAddressOnPlansPage(t, address) {
    if (!await testFunction.isElementVisible(t, EaHomePage.elements.addressInput)) {
      await testFunction.click(t, EaHomePage.elements.rbAddressPlansPage);
    }
    await testFunction.clearAndEnterText(t, EaHomePage.elements.addressInput, address);
    await t.wait(2000);
    await testFunction.isElementVisible(t, EaHomePage.elements.addressList);
    await testFunction.clickElementFromList(t, EaHomePage.elements.addressList, address);
    await testFunction.waitForLoadingIconToClose();
    await t.wait(3000);
    await testFunction.waitForElementToBeDisappeared(t, EaHomePage.elements.eaSpinner);
    console.log(`${address} is provided`);
  }

  public static async providePostcodeOnPlansPage(t, postcode) {
    await testFunction.click(t, EaHomePage.elements.rbPostcodePlansPage);
    await testFunction.clearAndEnterText(t, EaHomePage.elements.inputPostcode, postcode);
    await testFunction.waitForLoadingIconToClose();
    await t.wait(3000);
    console.log(`${postcode} is provided`);
  }

  public static async selectStateFromDropdown(t, state) {
    await testFunction.click(t, EaHomePage.elements.stateDropdown);
    await testFunction.click(t, EaHomePage.elements.stateDropdownList.withText(state));
    await testFunction.waitForLoadingIconToClose();
    await t.wait(3000);
    console.log(`${state} is selected`);
  }

  public static async verifySolarDisclaimer(t: any, dataTable) {
    const disclaimer = Selector(() => document.getElementById("condiDisclaimer"));
    await testFunction.isElementDisplayed(t, disclaimer);
    if (dataTable[0].solarBuyBack === 'Y') {
      await testFunction.assertText(t, disclaimer, "Solar feed-in tariffs");
      if (dataTable[0].state === 'VIC') {
        await testFunction.assertText(t, disclaimer, "^^ Feed-in tariffs (FiT) are paid to eligible customers in accordance with our solar FiT Terms & Conditions, available here. We may vary our Retailer FiT rates and we'll notify you before this happens. Rates are GST-exclusive but we'll also pay you GST if you meet the requirements for GST registration for your solar generation. For more information about the Victorian FiT scheme see www.energy.vic.gov.au/renewable-energy/victorian-feed-in-tariff.");
      } else {
        await testFunction.assertText(t, disclaimer, "^^ Feed-in tariffs (FiT) are paid to eligible customers in accordance with our solar FiT Terms & Conditions, available here. We may vary our Retailer FiT rates and we'll let you know before this happens. Rates are GST-exclusive but we'll also pay you GST if you meet the requirements for GST registration for your solar generation.");
      }
      console.log("Solar buyback disclaimer validated");
    }
  }

  public static async validateAnalyticsSolarData(
    t: TestController,
    expectedFlag: ('yes' | 'no' | 'unknown' | 'blocked')
  ): Promise<void> {
    const solarIndicatorValue = await t.eval(
      () => window.ead.productInfo.electricity.solarPanels
    );
    await t.expect(solarIndicatorValue).eql(expectedFlag);
  }

  public static async validateAnalyticsbillingPref(
    t: TestController,
    expectedFlag: ('post' | 'email')
  ): Promise<void> {
    const billdeliveryPref = await t.eval(
      () => window.ead.user.billDelMethod
    );
    await t.expect(billdeliveryPref).eql(expectedFlag);
  }

  public static async validateAnalyticscontacttype(
    t: TestController,
    expectedFlag: ('post' | 'email')
  ): Promise<void> {
    const otherComPref = await t.eval(
      () => window.ead.user.otherComPref
    );
    await t.expect(otherComPref).eql(expectedFlag);
  }

  public static async validateAnalyticsCarbonNeutral(
    t: TestController,
    expectedFlag: (false | true)
  ): Promise<void> {
    let carbonNeutral = await t.eval(
      () => window.ead.user.isCarbonNeutralCurious
    );
    carbonNeutral=JSON.stringify(carbonNeutral);
    await t.expect(carbonNeutral).eql(expectedFlag);
    console.log("Carbon neutral sign up customer data validated "+carbonNeutral);
  }

  public static async validateUniqueCodeData(
    t: TestController,
    expectedFlag: ('NA' | 'BIZOFFER5')
  ): Promise<void> {
    const uniqueCodeValue = await t.eval(
      () => window.ead.productInfo.offerCode
    );
    await t.expect(uniqueCodeValue).eql(expectedFlag);
    console.log("Unique code validated as "+expectedFlag)
  }

  public static async validateAnalyticsForStateAndPostcodeUpdate(t: TestController, state: string, postcode: string) {
    const updatedStateData = await t.eval(() => window.ead.productInfo.state);
    await t.expect(updatedStateData).eql(state);
    const updatedPostcodeData = await t.eval(() => window.ead.productInfo.postcode);
    await t.expect(updatedPostcodeData).eql(postcode);
  }

  public static async validateComponentLibraryEvent(t:TestController,pageComponent:string, eventCall:string){
    eventCall = eventCall.toLowerCase();
    pageComponent = pageComponent.toLowerCase();
    let event_JSONObj;
    const eventFilePath='resources/AnalyticsData/analytics_ComponentLibrary_event.json';
    const doc = fs.readFileSync(eventFilePath,'utf8');
    event_JSONObj = JSON.parse(doc);
    const eventStatus=await t.eval(()=>window.ead.event);
    await t.expect(eventStatus).eql(event_JSONObj[pageComponent][eventCall]);
    console.log("Analytics Event validated for " +pageComponent+ " " +eventCall+ " event");
    let component_JSONObj;
    const componentFilePath='resources/AnalyticsData/analytics_ComponentLibrary_component.json';
    const document = fs.readFileSync(componentFilePath,'utf8');
    component_JSONObj = JSON.parse(document);
    const componentStatus=await t.eval(()=>window.ead.component);
    await t.expect(componentStatus).eql(component_JSONObj[pageComponent][eventCall]);
    console.log("Analytics Component validated for " +pageComponent+ " " +eventCall+ " component");
  }

  public static async validatePageName(t:TestController,journey:string, page:string){
    journey = journey.toLowerCase();
    page = page.toLowerCase();
    let page_JSONObj;
    const pageFilePath='resources/AnalyticsData/analytics_PageName.json';
    const doc = fs.readFileSync(pageFilePath,'utf8');
    page_JSONObj = JSON.parse(doc);
    const pageStatus=await t.eval(()=>window.ead.page);
    await t.expect(pageStatus).eql(page_JSONObj[journey][page]);
    console.log("Analytics Event validated for " +journey+ " " +page);
  }

  public static async validatePageNameCheckout(t:TestController,journey:string, page:string){
    journey = journey.toLowerCase();
    page = page.toLowerCase();
    let page_JSONObj;
    const pageFilePath='resources/AnalyticsData/analytics_PageName.json';
    const doc = fs.readFileSync(pageFilePath,'utf8');
    page_JSONObj = JSON.parse(doc);
    const pageStatus=await t.eval(()=>window.ead.page.pageName);
    if(page==='checkout_details'){
      await t.expect(pageStatus).eql("ea:home:checkout:mydetails");
    }else if(page==='checkout_review'){
      await t.expect(pageStatus).eql("ea:home:checkout:review-order");
    }else if(page==='checkout_complete'){
      await t.expect(pageStatus).eql("ea:home:checkout:complete");
    }else if(page==='business-checkout_details'){
      await t.expect(pageStatus).eql("ea:business:checkout:mydetails");
    }else if(page==='business-checkout_review'){
      await t.expect(pageStatus).eql("ea:business:checkout:review-order");
    }else if(page==='business-checkout_complete'){
      await t.expect(pageStatus).eql("ea:business:checkout:complete");
    }else if(page==='ma_move_checkout_details'){
      await t.expect(pageStatus).eql("ea:ma-move-home");
    }
    console.log("Analytics pagename validated for " +page);
  }

  public static async enterCostEstimatePeriod( t, period: any) {
    await testFunction.click(t, EaHomePage.elements.refinePeriod);
    await testFunction.click(t, EaHomePage.elements.refinePeriodDropdown.withText(period));
  }
  public static async selectUsagePerDay(t, usage: any, fueltype: any) {
    if (fueltype === 'Electricity'){
      await testFunction.click(t, EaHomePage.elements.refineEleUsage);
      await testFunction.click(t, EaHomePage.elements.refineEleUsageDropdown.withText(usage));
      if(usage === 'Custom'){
        await testFunction.enterText(t, EaHomePage.elements.refineElectrcityCustomInput,'25');
      }
    } else {
      await testFunction.click(t, EaHomePage.elements.refineGasUsage);
      await testFunction.click(t, EaHomePage.elements.refineGasUsageDropdown.withText(usage));
      if(usage === 'Custom'){
        await testFunction.enterText(t, EaHomePage.elements.refineGasCustomInput,'30');
      }
    }
  }
  public static async validateErrorMessageForNSWRemoteMeterRiskAccountsPlansPage(t) {
    await testFunction.waitForElementToBeAppeared(t, EaHomePage.elements.nswRemoterMeterMsgOnPlanPage);
    let expectedErrorMessage = "You have a remotely capable meter, so we're unable to proceed with your request online. Please call us on 133 466 to discuss your options.";
    let actualMessage = await testFunction.getElementText(t, EaHomePage.elements.nswRemoterMeterMsgOnPlanPage);
    await testFunction.assertText(t, EaHomePage.elements.nswRemoterMeterMsgOnPlanPage,actualMessage);
    console.log("NSW remote meter risk message validated on plans page");
  }

  public static async selectGreenEnergy(t, greenEnergyPercentage: string){
    await testFunction.click(t, EaHomePage.elements.refineGreenEnergy);
    await testFunction.click(t, EaHomePage.elements.refineGreenEnergyDropDown.withText(greenEnergyPercentage));
  }

  public  static  async  selectAddressOrPostcode(t, addressOrPostcode: string){
    if (addressOrPostcode === 'Address') {
      await testFunction.click(t, EaHomePage.elements.rbAddressPlansPage);
    }
    else
      await testFunction.click(t, EaHomePage.elements.rbPostcodePlansPage);
  }

  public static async validateAnalyticsLocationType(t: TestController, locationType: string){
    const updatedlocationType = await t.eval(() => window.ead.productInfo.locationType);
    await t.expect(updatedlocationType).eql(locationType);
  }

  public static async validateAnalyticsUsagePeriod(t: TestController, usagePeriod: string){
    const updatedUsagePeriodData = await t.eval(() => window.ead.productInfo.usagePeriod);
    await t.expect(updatedUsagePeriodData).eql(usagePeriod);
  }

  public static async validateAnalyticsSelectedPlan(t: TestController,
                                                    expectedFlag: ('both' | 'electricity' | 'gas')
  ): Promise<void> {
    const selectedPlanValue = await t.eval(
      () => window.ead.productInfo.selectedFuels
    );
    await t.expect(selectedPlanValue).eql(expectedFlag);
  }

  public static async validateAnalyticsAvailablePlan(t: TestController, journey: string, fuelType: string){
    let availableElectricityPlans = await t.eval(() => window.ead.productInfo.electricity.plan.availablePlans);
    availableElectricityPlans=availableElectricityPlans.toString();
    let availableGasPlans = await t.eval(() => window.ead.productInfo.gas.plan.availablePlans);
    availableGasPlans=availableGasPlans.toString();
    if(journey==='Residential'){
      if(fuelType==='Electricity') {
        await t.expect(availableElectricityPlans).eql("BASE_TAPR1-EN,BASE_RCPP-EN,BASE_TOPH-EN-AUSGRID");
      }else if(fuelType==='Gas'){
        await t.expect(availableGasPlans).eql("BASE_TAPR1-GN,BASE_RCPP-GN,BASE_TOPH-GN");
      }
      console.log("Analytics data validated for " + journey + " page for available plans for " +fuelType);
    }else if (journey==='Business'){
      if(fuelType==='Electricity') {
        await t.expect(availableElectricityPlans).eql("BASE_TOPB-EN-AUSGRID,BASE_BCNP-EN-AUSGRID,BASE_BSPB2-EN-AUSGRID");
      }else if(fuelType==='Gas'){
        await t.expect(availableGasPlans).eql("BASE_TOPB-GN,BASE_BSPB2-GN");
      }
      console.log("Analytics data validated for " + journey + " page for available plans for " +fuelType);
    }else if (journey==='Campaign'){
      if(fuelType==='Electricity') {
        await t.expect(availableElectricityPlans).eql("CAM_OFFER_TOPH-EN-AUSGRID");
      }else if(fuelType==='Gas'){
        await t.expect(availableGasPlans).eql("CAM_OFFER_TOPH-GN");
      }
      console.log("Analytics data validated for " + journey + " page for available plans for " +fuelType);
    }
  }

  public static async validateQuoteStartPage(t: TestController, page: string){
    let quoteStartPage = await t.eval(() => window.ead.productInfo.quoteStartPage);
    if(page==='Residential Page') {
      await t.expect(quoteStartPage).eql('/home/electricity-and-gas/plans');
    }else if(page==='Business Page') {
      await t.expect(quoteStartPage).eql('/business/electricity-and-gas/small-business/plans');
    }else if(page==='Offer Page') {
      await t.expect(quoteStartPage).eql('/offer');
    }else if(page==='movingHome Page') {
      await t.expect(quoteStartPage).eql('/home/moving-house/move-home');
    }
      console.log("Analytics data validated for " + page + " page for quote start page");
  }

  public static async validateQuoteTrackStatus(t: TestController, page: string){
    let quoteStatus = await t.eval(() => window.ead.productInfo.quoteStatus);
    if(page==='Plan View') {
      await t.expect(quoteStatus).eql('viewed');
    }else if(page==='Plan selected') {
      await t.expect(quoteStatus).eql('in_cart');
    }else if(page==='in qualifier') {
      await t.expect(quoteStatus).eql('in_qual');
    }else if(page==='in checkout') {
      await t.expect(quoteStatus).eql('in_checkout');
    }else if(page==='in review') {
      await t.expect(quoteStatus).eql('in_review');
    }else if(page==='in complete') {
      await t.expect(quoteStatus).eql('complete');
    }else if(page==='email') {
      await t.expect(quoteStatus).eql('emailed');
    }else if(page==='quote decline') {
      await t.expect(quoteStatus).eql('declined');
    }
    console.log("Analytics data validated for " + page + " page for quote start page");
  }

  public static async validateAnalyticsSelectedPlanDetails(t: TestController, plan: string, fuelType: string){
    let event_JSONObj;
    const eventFilePath='resources/AnalyticsData/analytics_selected_plan.json';
    const doc = fs.readFileSync(eventFilePath,'utf8');
    event_JSONObj = JSON.parse(doc);
    if(plan===PlanType.TOTAL_PLAN){
      if(fuelType==='Electricity'){
        let selectedPlanDetails = await t.eval(() => window.ead.productInfo.electricity.plan);
        await t.expect(selectedPlanDetails).eql(event_JSONObj[plan][fuelType]);
      }else if(fuelType==='Gas'){
        let selectedPlanDetails = await t.eval(() => window.ead.productInfo.gas.plan);
        await t.expect(selectedPlanDetails).eql(event_JSONObj[plan][fuelType]);
      }
    }
    else if(plan===PlanType.NO_FRILLS){
      if(fuelType==='Electricity'){
        let selectedPlanDetails = await t.eval(() => window.ead.productInfo.electricity.plan);
        await t.expect(selectedPlanDetails).eql(event_JSONObj[plan][fuelType]);
      }else if(fuelType==='Gas'){
        let selectedPlanDetails = await t.eval(() => window.ead.productInfo.gas.plan);
        await t.expect(selectedPlanDetails).eql(event_JSONObj[plan][fuelType]);
      }
    }
    else if(plan===PlanType.TOTAL_BUSINESS){
      if(fuelType==='Electricity'){
        let selectedPlanDetails = await t.eval(() => window.ead.productInfo.electricity.plan);
        await t.expect(selectedPlanDetails).eql(event_JSONObj[plan][fuelType]);
      }else if(fuelType==='Gas'){
        let selectedPlanDetails = await t.eval(() => window.ead.productInfo.gas.plan);
        await t.expect(selectedPlanDetails).eql(event_JSONObj[plan][fuelType]);
      }
    }
  }
  public static async validateAnalyticsGreenEnergyPercentage(t: TestController, greenEnergyPercentage: string){
    const updatedGreenEnergyData = await t.eval(() => window.ead.productInfo.electricity.estGreenEnergyPercentage);
    await t.expect(updatedGreenEnergyData).eql(greenEnergyPercentage);
  }

  public static async validateAnalyticsForUsagePerDay(t: TestController,  estUsage: string, usageValue, fuelType) {
    await t.wait(1000);
    if (fuelType === FUEL_TYPE_OPTIONS.ELE.value) {
      const updatedElecUsageData = await t.eval(() => window.ead.productInfo.electricity.estElecUsage);
      await t.expect(updatedElecUsageData).eql(estUsage);
      const updatedEleUsageValue: number = await t.eval(() => window.ead.productInfo.electricity.usageVolume)
      if(estUsage === 'custom'){
        usageValue = await testFunction.getInputText(t,EaHomePage.elements.refineElectrcityCustomInput);
      }
      if(estUsage === 'customer'){
        usageValue = await testFunction.getElementText(t, EaHomePage.elements.refineEleUsageActiveOption);
        usageValue = usageValue.replace(/[^0-9\.]+/g,"");
      }
      await t.expect(updatedEleUsageValue).eql(parseFloat(usageValue));

    } else {
      const updatedGasUsageData = await t.eval(() => window.ead.productInfo.gas.estGasUsage);
      await t.expect(updatedGasUsageData).eql(estUsage);
      const updatedGasUsageValue = await t.eval(() => window.ead.productInfo.gas.usageVolume);
      if(estUsage === 'custom'){
        usageValue = await testFunction.getInputText(t,EaHomePage.elements.refineGasCustomInput);
      }
      if(estUsage === 'customer'){
        usageValue = await testFunction.getElementText(t, EaHomePage.elements.refineGasUsageActiveOption);
        usageValue = usageValue.replace(/[^0-9\.]+/g,"");
      }
      await t.expect(updatedGasUsageValue).eql(parseFloat(usageValue));
      }
    }

    public static async verifyAddressLookup(t, addressType) {
      let errorMessage;
      switch (addressType) {
        case "STATE_NOT_SERVICED":
          errorMessage = "Unfortunately we don't supply energy to postcode 6000. For more information please call us on";
          await testFunction.waitForElementToBeAppeared(t, EaHomePage.elements.txtStateNotServicedMsg);
          await testFunction.assertText(t, EaHomePage.elements.txtStateNotServicedMsg, errorMessage);
          break;
        case "POSTCODE_NOT_SERVICED":
          errorMessage = "Unfortunately we don't supply energy to postcode 4600. For more information please call us on";
          await testFunction.waitForElementToBeAppeared(t, EaHomePage.elements.txtPostcodeNotServicedMsg);
          await testFunction.assertText(t, EaHomePage.elements.txtPostcodeNotServicedMsg, errorMessage);
          break;
        case "NMI_BLOCKED":
          errorMessage = "We’re unable to sign you up online for Electricity because of the meter type detected at this address. For more information please call us on";
          await testFunction.waitForElementToBeAppeared(t, EaHomePage.elements.txtBlockedNMIMsg);
          await testFunction.assertText(t, EaHomePage.elements.txtBlockedNMIMsg, errorMessage);
          await testFunction.assertText(t, EaHomePage.elements.basicResiPlanHeadingFuel, 'Gas');
          break;
        case "NSW_REMOTE_METER":
            errorMessage = "This electricity meter has been remotely disconnected and can't be reconnected by us (you need a retailer that can remotely connect meters).";
            await testFunction.waitForElementToBeAppeared(t, EaHomePage.elements.txtBlockedNMIMsg);
            await testFunction.assertText(t, EaHomePage.elements.txtBlockedNMIMsg, errorMessage);
            await testFunction.assertText(t, EaHomePage.elements.basicResiPlanHeadingFuel, 'Gas');
            break;
        case "NMI_NOT_FOUND":
          errorMessage = "Unfortunately we don't recognise NMI . You can enter your postcode instead to get the rates for your area, or give us a call us on";
          await testFunction.waitForElementToBeAppeared(t, EaHomePage.elements.txtNMINotFoundMsg);
          await testFunction.assertText(t, EaHomePage.elements.txtNMINotFoundMsg, errorMessage);
          break;
        case "MIRN_NOT_FOUND":
          errorMessage = "Unfortunately we don't recognise MIRN . You can enter your postcode instead to get the rates for your area, or give us a call us on";
          await testFunction.waitForElementToBeAppeared(t, EaHomePage.elements.txtMIRNNotFoundMsg);
          await testFunction.assertText(t, EaHomePage.elements.txtMIRNNotFoundMsg, errorMessage);
          break;
        case "INVALID_CUSTOMER_TYPE":
          errorMessage = "Meter detected";
          await testFunction.waitForElementToBeAppeared(t, EaHomePage.elements.changeCustomerModal);
          await testFunction.isElementDisplayed(t, EaHomePage.elements.changeCustomerModal);
          await testFunction.assertText(t, EaHomePage.elements.headingOnChangePlanSelectionModal, errorMessage);
          break;
        case "CAMPAIGN_NOT_SERVICED":
          errorMessage = "This offer is not available in";
          await testFunction.waitForElementToBeAppeared(t, EaHomePage.elements.txtCampaignNotServicedMsg);
          await testFunction.assertText(t, EaHomePage.elements.txtCampaignNotServicedMsg, errorMessage);
          break;
        case "ADDRESS_NOT_SERVICED":
          errorMessage = "Unfortunately we don't supply energy to this address. For more information please call us on";
          await testFunction.waitForElementToBeAppeared(t, EaHomePage.elements.txtAddressNotServicedMsg);
          await testFunction.assertText(t, EaHomePage.elements.txtAddressNotServicedMsg, errorMessage);
          break;
        case "GAS_NOT_SERVICED":
          errorMessage = "we only supply electricity.";
          await testFunction.waitForElementToBeAppeared(t, EaHomePage.elements.txtAddressNotServicedMsg);
          await testFunction.assertText(t, EaHomePage.elements.txtAddressNotServicedMsg, errorMessage);
          await testFunction.assertText(t, EaHomePage.elements.basicResiPlanHeadingFuel, 'Electricity');
          break;
        case "ELE_NOT_SERVICED":
          errorMessage = "we only supply gas.";
          await testFunction.waitForElementToBeAppeared(t, EaHomePage.elements.txtAddressNotServicedMsg);
          await testFunction.assertText(t, EaHomePage.elements.txtAddressNotServicedMsg, errorMessage);
          await testFunction.assertText(t, EaHomePage.elements.basicResiPlanHeadingFuel, 'Electricity');
          break;
        case "SYSTEM_ERROR":
          errorMessage = "We're sorry, there has been an unexpected error and we're unable to process your request online. Please contact our team on 1800 596 517 and they'd be happy to assist.";
          await testFunction.assertText(t, EaHomePage.elements.txtSystemErrorMsg, errorMessage);
          break;
        case "SUCCESS":
          await testFunction.waitForElementToBeAppeared(t, EaHomePage.elements.eaSpinner);
          await testFunction.waitForElementToBeDisappeared(t, EaHomePage.elements.eaSpinner);
          let NMI = await EaHomePage.elements.inputNMI.textContent;
          let MIRN = await EaHomePage.elements.inputMIRN.textContent;
          await testFunction.assertText(t, EaHomePage.elements.txtElectricityBasedOn, 'Electricity based on NMI ' + NMI);
          await testFunction.assertText(t, EaHomePage.elements.txtGasBasedOn, 'Gas based on MIRN ' + MIRN);
          await testFunction.takeScreenshot(t, 'plans_page');//disabled UI Validation
          await this.selectPlan(t, 'Total Plan');
          await cartsMethod.clickContinueCartsPage(t);
          await qualifierMethod.selectCustomerStatus(t, 'New');
          await qualifierMethod.provideMovingType(t, 'Non-Moving');
          await testFunction.takeScreenshot(t, 'plans_page');//disabled UI Validation
          //await testFunction.click(t, eaQualifierPage.elements.addressContinue);
          await testFunction.isElementDisplayed(t, eaQualifierPage.elements.owner);
          break;
        default:
          throw Error("Invalid Error Code");
      }
    }
  }

export class selectionOptionModalWindowMethod {
    public static async selectOptionsModalWindow(t, modalWindowValue) {
        if (modalWindowValue.toLowerCase() === 'verify account') {
          await testFunction.click(t,EaHomePage.elements.modalVerifyAccountOption);
          if(validateAnalyticsEvent==='Y'){
            await plansMethod.validateComponentLibraryEvent(t,"refine_modal","verify_account_button");
          }
        } else if (modalWindowValue.toLowerCase() === 'bill upload') {
          await testFunction.click(t,EaHomePage.elements.modalBillUploadOption);
          if(validateAnalyticsEvent==='Y'){
          await plansMethod.validateComponentLibraryEvent(t,"refine_modal","bill_upload_button");
          }
        } else if (modalWindowValue === 'enter usage') {
          await testFunction.click(t, EaHomePage.elements.modalEnterUsageOption);
            if(validateAnalyticsEvent==='Y'){
          await plansMethod.validateComponentLibraryEvent(t,"refine_modal","enter_usage_button");
            }
        }
    }
}


export class verifyAccountMethod {
  public static async verifyAccountIsDisplayed(t, fuelType, customerType) {
    if (customerType === CustomerType.RESIDENTIAL) {
      switch (fuelType) {
        case FUEL_TYPE_OPTIONS.BOTH.value:
          await testFunction.isElementDisplayed(t, EaHomePage.elements.elecAccountNo);
          await testFunction.isElementDisplayed(t, EaHomePage.elements.gasAccountNo);
          break;
        case FUEL_TYPE_OPTIONS.ELE.value:
          await testFunction.isElementDisplayed(t, EaHomePage.elements.elecAccountNo);
          break;
        case FUEL_TYPE_OPTIONS.GAS.value:
          await testFunction.isElementDisplayed(t, EaHomePage.elements.gasAccountNo);
          break;
      }
      await testFunction.isElementDisplayed(t, EaHomePage.elements.nextAccountNumber);
      await testFunction.isElementDisplayed(t, EaHomePage.elements.backAccountNumber);
    }
  }

  public static async provideAccountDetails(t, fuel, accountNumber) {
    switch (fuel) {
      case FUEL_TYPE_OPTIONS.ELE.value:
        await testFunction.clearAndEnterText(t, EaHomePage.elements.elecAccountNo, accountNumber);
        break;
      case FUEL_TYPE_OPTIONS.GAS.value:
        await testFunction.clearAndEnterText(t, EaHomePage.elements.gasAccountNo, accountNumber);
        break;
      default:
        console.error('Couldnot provide account details as the page didnot load properly');
    }
  }

  public static async provideAccountInformation(t, accountInformation, customerType) {
    switch (customerType) {
      case CustomerType.RESIDENTIAL:
        await testFunction.clearAndEnterText(t, EaHomePage.elements.postcodeVerifyAccount, accountInformation);
        break;
      case CustomerType.BUSINESS:
        await testFunction.clearAndEnterText(t, EaHomePage.elements.businessInformation, accountInformation);
        break;
    }
  }

    public static async verifyAccountDetails(t){
      await testFunction.click(t, EaHomePage.elements.nextAccountNumber);
      await testFunction.waitForElementToBeDisappeared(t,EaHomePage.elements.eaSpinner);
      if(validateAnalyticsEvent==='Y'){
        await plansMethod.validateComponentLibraryEvent(t,"refine_modal","verify_account_next_button");
      }
    }
  public static async verifyAccountDetailsIdentity(t){
    await testFunction.click(t, EaHomePage.elements.nextAccountNumber);
    await testFunction.waitForElementToBeDisappeared(t,EaHomePage.elements.eaSpinner);
    /*if(validateAnalyticsEvent==='Y'){
      await plansMethod.validateComponentLibraryEvent(t,"refine_modal","verify_account_next_button");
    }*/
  }
  public static async verifyAccountNext(t){
    await testFunction.click(t, EaHomePage.elements.croCustomiseEstimateSideBar.existingCustomerAccordion.nextButton);
    await testFunction.waitForElementToBeDisappeared(t, EaHomePage.elements.eaSpinner);
  }

  public static async provideIdentityDetails(t, idType, idValue) {
    switch (idType) {
      case IdType.DOB:
        await this.provideIdValue(t, idValue, EaHomePage.elements.idTypeDOBValueVerifyAccount);
        break;
      case IdType.DL:
        await this.selectIdType(t, EaHomePage.elements.idTypeDlVerifyAccount);
        await this.provideIdValue(t, idValue, EaHomePage.elements.idTypeValueVerifyAccount);
        break;
      case IdType.PIN:
        await this.selectIdType(t, EaHomePage.elements.idTypePinVerifyAccount);
        await this.provideIdValue(t, idValue, EaHomePage.elements.idTypeValueVerifyAccount);
        break;
      case IdType.MEDICARE:
        await this.selectIdType(t, EaHomePage.elements.idTypeMedicareVerifyAccount);
        await this.provideIdValue(t, idValue, EaHomePage.elements.idTypeValueVerifyAccount);
        break;
      case IdType.PASSPORT:
        await this.selectIdType(t, EaHomePage.elements.idTypePassportVerifyAccount);
        await this.provideIdValue(t, idValue, EaHomePage.elements.idTypeValueVerifyAccount);
        break;
    }
  }

  public static async verifyUsageData(t, fuelType) {
    switch (fuelType) {
      case FUEL_TYPE_OPTIONS.BOTH.value:
        await testFunction.isElementDisplayed(t, EaHomePage.elements.usageData_ele);
        await testFunction.isElementDisplayed(t, EaHomePage.elements.usageData_gas);
        break;
      case FUEL_TYPE_OPTIONS.ELE.value:
        await testFunction.isElementDisplayed(t, EaHomePage.elements.usageData_ele);
        break;
      case FUEL_TYPE_OPTIONS.GAS.value:
        await testFunction.isElementDisplayed(t, EaHomePage.elements.usageData_gas);
        break;
    }
  }

  public static async verifyFamilyViolenceMessage(t, value) {
    await testFunction.assertText(t, EaHomePage.elements.familyViolenceMessage, value);
  }

    public static async showCostEstimates(t){
        let expectedLoyaltyPlanMessage = 'As a valued customer who\'s been with us for at least six consecutive months, you can sign up to Total Plan Plus. It\'s got the same features as Total Plan, but with a higher discount off your total energy bill. So you can enjoy a higher discount on both usage and supply charges for 12 months. Click \'Show estimates\' to compare Total Plan Plus against our other plans.';
        await testFunction.isElementDisplayed(t,EaHomePage.elements.getCostEstimatesChangeButton);
       // await testFunction.assertText(t, EaHomePage.elements.txtLoyaltyPlanMsg, expectedLoyaltyPlanMessage);
        await testFunction.click(t, EaHomePage.elements.getCostEstimatesChangeButton);
        await testFunction.waitForElementToBeDisappeared(t,EaHomePage.elements.eaSpinner);
        if(validateAnalyticsEvent==='Y'){
          await plansMethod.validateComponentLibraryEvent(t,"refine_modal","verify_account_show_estimates_button");
        }

    }

  public static async selectIdType(t, itemToClick) {
    await testFunction.click(t, EaHomePage.elements.idTypeDropDownVerifyAccount);
    await testFunction.click(t, itemToClick);
  }

  public static async provideIdValue(t, idValue, inputField) {
    await testFunction.clearAndEnterText(t, inputField, idValue);
  }

  public static async validateErrorMessageForBlockerAccounts(t) {
    let expectedErrorMessage = "We are currently unable to retrieve your information. Please call 133 466 (Monday – Friday, 8am – 8pm AEST)";
    await testFunction.assertText(t, EaHomePage.elements.safetyFlagMsgOnVAModal, expectedErrorMessage);
  }

  public static async verifySuccessfulAccountVerification(t) {
    await testFunction.isElementDisplayed(t, EaHomePage.elements.getCostEstimatesChangeButton);
  }

  public static async navigateBackToVerifyIdentity(t) {
    await testFunction.isElementDisplayed(t, EaHomePage.elements.btnBackOnVerifyAccountModal);
    await testFunction.click(t, EaHomePage.elements.btnBackOnVerifyAccountModal);
    // if(await testFunction.isElementExists(t,EaHomePage.elements.idTypeDlValueVerifyAccount))
    //   await testFunction.clearTextField(t,EaHomePage.elements.idTypeDlValueVerifyAccount);
    // if(await testFunction.isElementExists(t,EaHomePage.elements.idTypeDOBValueVerifyAccount))
    //   await testFunction.clearTextField(t,EaHomePage.elements.idTypeDOBValueVerifyAccount);

  }

  public static async navigateBackToVerifyAccount(t) {
    await testFunction.isElementDisplayed(t, EaHomePage.elements.btnBackOnVerifyAccountModal);
    await testFunction.click(t, EaHomePage.elements.btnBackOnVerifyAccountModal);
    if (await testFunction.isElementExists(t, EaHomePage.elements.elecAccountNo)) {
      await testFunction.clearTextField(t, EaHomePage.elements.elecAccountNo);
    }
    if (await testFunction.isElementExists(t, EaHomePage.elements.gasAccountNo)) {
      await testFunction.clearTextField(t, EaHomePage.elements.gasAccountNo);
    }
    if (await testFunction.isElementExists(t, EaHomePage.elements.postcodeVerifyAccount)) {
      await testFunction.clearTextField(t, EaHomePage.elements.postcodeVerifyAccount);
    }
    if (await testFunction.isElementExists(t, EaHomePage.elements.businessInformation)) {
      await testFunction.clearTextField(t, EaHomePage.elements.businessInformation);
    }
  }

  public static async enterSampleAccountDetails(t, customerType) {
    if (await testFunction.isResidential(customerType)) {
      await verifyAccountMethod.provideAccountDetails(t, "ELE", config.sampleResiAccount.eleAccount);
      await verifyAccountMethod.provideAccountDetails(t, "GAS", config.sampleResiAccount.gasAccount);
      await verifyAccountMethod.provideAccountInformation(t, config.sampleResiAccount.postcode, customerType);
    } else {
      await verifyAccountMethod.provideAccountDetails(t, "ELE", config.sampleBsmeAccount.eleAccount);
      await verifyAccountMethod.provideAccountDetails(t, "GAS", config.sampleBsmeAccount.gasAccount);
      await verifyAccountMethod.provideAccountInformation(t, config.sampleBsmeAccount.abn, customerType);
    }
  }

  public static async resetVerifiedAccount(t) {
    await testFunction.click(t, EaHomePage.elements.resetCTALink);
    await testFunction.click(t, EaHomePage.elements.resetConfirmButton);
    //await testFunction.click(t, eaQualifierPage.elements.selectNewPlan);
    await testFunction.waitForElementToBeAppeared(t, EaHomePage.elements.refineModalCloseButton);
    await testFunction.click(t, EaHomePage.elements.refineModalCloseButton);
    await testFunction.waitForElementToBeAppeared(t, EaHomePage.elements.totalPlan);
  }

  public static async verifyRetrievedDetails(t, address, NMI, MIRN) {
    await testFunction.isElementDisplayed(t, EaHomePage.elements.serviceAddressText);
    await testFunction.assertText(t, EaHomePage.elements.serviceAddressText, address);
    await testFunction.assertText(t, EaHomePage.elements.NMIText, NMI);
    await testFunction.assertText(t, EaHomePage.elements.MIRNText, MIRN);
  }

  public static async closeRefineModal(t) {
    await testFunction.waitForElementToBeAppeared(t, EaHomePage.elements.refineModalCloseButton);
    await testFunction.click(t, EaHomePage.elements.refineModalCloseButton);
  }
}

export class campaignMethod {
  public static async enterPostcodeOnCampaign(t, postcode) {
    // await testFunction.click(t, EaHomePage.elements.rbPostcodeOnModal);
    await t.wait(1000);
    await testFunction.clearAndEnterText(t, EaHomePage.elements.postcodeOnCampaignPageOnModal, postcode);
    await testFunction.click(t, EaHomePage.elements.btnCampaignSearchOnModal);
    await testFunction.waitForElementToBeDisappeared(t, EaHomePage.elements.eaSpinner);
  }

  public static async enterOfferCodeAndPostcodeOnCampaign(t, offerCode, postcode) {
    if (await this.isPga()) {
      await testFunction.click(t, EaHomePage.elements.rbPostcodeOnModal);
      await t.wait(1000);
      await testFunction.clearAndEnterText(t, EaHomePage.elements.postcodeOnCampaignPageOnModal, postcode);
      await testFunction.clearAndEnterText(t, EaHomePage.elements.rbOffercodeOnModal, offerCode);
      await testFunction.click(t, EaHomePage.elements.btnCampaignSearchOnModal);
    } else {
      // if (await this.isNswSeniors()) {
      //   await testFunction.clearAndEnterText(t, EaHomePage.elements.txtOfferCodeSeniorsCard, offerCode);
      // }else if (await this.isVicSeniors()) {
      //   await testFunction.clearAndEnterText(t, EaHomePage.elements.txtVicOfferCodeSeniorsCard, offerCode);
      // }
      if (await this.isSeniors()) {
        await testFunction.clearAndEnterText(t, EaHomePage.elements.txtOfferCodeGenericSeniorsCard, offerCode);
      }
      else {
        await testFunction.clearAndEnterText(t, EaHomePage.elements.txtOfferCode, offerCode);
      }
      await t.wait(1000);
      await testFunction.click(t, EaHomePage.elements.rbPostcode);
      await testFunction.clearAndEnterText(t, EaHomePage.elements.postcodeOnCampaignPage, postcode);
      await testFunction.click(t, EaHomePage.elements.btnCampaignSearch);
    }
    await testFunction.waitForElementToBeDisappeared(t, EaHomePage.elements.eaSpinner);

  }

  public static async enterEmailEmployeeidAndPostcodeOnCampaign(t, email, employeeId, postcode) {
    await testFunction.clearAndEnterText(t, EaHomePage.elements.txtEmail, email);
    await t.wait(1000);
    await testFunction.clearAndEnterText(t, EaHomePage.elements.txtEmployeeid, employeeId);
    await t.wait(1000);
    await testFunction.click(t, EaHomePage.elements.rbPostcode);
    await testFunction.clearAndEnterText(t, EaHomePage.elements.postcodeOnCampaignPage, postcode);
    await testFunction.click(t, EaHomePage.elements.btnCampaignSearch);
    await testFunction.waitForElementToBeDisappeared(t, EaHomePage.elements.eaSpinner);
  }

  public static async enterEmailAndPostcodeOnCampaign(t, email, postcode) {
    await testFunction.clearAndEnterText(t, EaHomePage.elements.txtEmailFF, email);
    await t.wait(1000);
    await testFunction.click(t, EaHomePage.elements.rbPostcode);
    await testFunction.clearAndEnterText(t, EaHomePage.elements.postcodeOnCampaignPage, postcode);
    await testFunction.click(t, EaHomePage.elements.btnCampaignSearch);
    await testFunction.waitForElementToBeDisappeared(t, EaHomePage.elements.eaSpinner);
  }

  public static async addPlanOnCampaign(t) {
    await testFunction.click(t, EaHomePage.elements.selectCampaignPlans);
  }
  public static async selectPlanOnCampaign(t) {
    await testFunction.click(t, EaHomePage.elements.selectCampaignPlan);
  }
  public static async selectPlansOnCampaign(t) {
    await testFunction.click(t, EaHomePage.elements.selectCampaignPlans);
  }

  public static async isNswSeniors() {
    let pageUrl = await testFunction.getPageURL();
    return pageUrl.includes("/nsw-seniors");
  }
  public static async isSeniors() {
    let pageUrl = await testFunction.getPageURL();
    return pageUrl.includes("/seniors");
  }
  public static async isVicSeniors() {
    let pageUrl = await testFunction.getPageURL();
    return pageUrl.includes("/vic-seniors");
  }

  public static async isPga() {
    let pageUrl = await testFunction.getPageURL();
    return pageUrl.includes("/pga");
  }


}
