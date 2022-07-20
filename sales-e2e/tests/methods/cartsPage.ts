import {AustralianState} from '@ea/ea-commons-models';
import {PlanType, testFunction} from '../../global_methods/helper';

const cartsPage = require('../pages/carts.page');

export class cartsMethod {
  public static async clickContinueCartsPage(t) {
    await testFunction.click(t, cartsPage.elements.cartsPageContinueButton);
  }

  public static async validatePlanName(t: any, json: any, dataTable) {
    if (await testFunction.isElectricity(dataTable[0].fuelType)) {
      switch (dataTable[0].state) {
        case AustralianState.NSW:
          await testFunction.assertText(t, cartsPage.elements.elePlanName, json.planDetails.NSW.planName);
          break;
        case AustralianState.VIC:
          await testFunction.assertText(t, cartsPage.elements.elePlanName, json.planDetails.VIC.planName);
          break;
        case AustralianState.SA:
          await testFunction.assertText(t, cartsPage.elements.elePlanName, json.planDetails.SA.planName);
          break;
        case AustralianState.ACT:
          await testFunction.assertText(t, cartsPage.elements.elePlanName, json.planDetails.ACT.planName);
          break;
        case AustralianState.QLD:
          await testFunction.assertText(t, cartsPage.elements.elePlanName, json.planDetails.QLD.planName);
          break;
        default:
          console.log("Invalid Electricity cart details for state");
      }

    }
    if (await testFunction.isGas(dataTable[0].fuelType)) {
      switch (dataTable[0].state) {
        case AustralianState.NSW:
          await testFunction.assertText(t, cartsPage.elements.gasPlanName, json.planDetails.NSW.planName);
          break;
        case AustralianState.VIC:
          await testFunction.assertText(t, cartsPage.elements.gasPlanName, json.planDetails.VIC.planName);
          break;
        case AustralianState.SA:
          await testFunction.assertText(t, cartsPage.elements.gasPlanName, json.planDetails.SA.planName);
          break;
        case AustralianState.ACT:
          await testFunction.assertText(t, cartsPage.elements.gasPlanName, json.planDetails.ACT.planName);
          break;
        case AustralianState.QLD:
          await testFunction.assertText(t, cartsPage.elements.gasPlanName, json.planDetails.QLD.planName);
          break;
        default:
          console.log("Invalid Gas cart details for state");
      }
    }
  }

  public static async validateFeatures(t: any, dataTable, json: any, numOfExpectedFeatures) {
    console.log("Validating plan features on cart page.");
    if (await testFunction.isElectricity(dataTable[0].fuelType)) {
       await t.expect(await testFunction.sizeOfElement(t, cartsPage.elements.eleFeatures)).eql(numOfExpectedFeatures);
      if (dataTable[0].Feature_50Credit === "Y") {
        switch (dataTable[0].state) {
          case AustralianState.VIC:
            await testFunction.assertText(t, cartsPage.elements.eleFeature50Credit, json.electricity.feature.postSelect.Credit50.VIC);
            break;
          case AustralianState.NSW:
            await testFunction.assertText(t, cartsPage.elements.eleFeature50Credit, json.electricity.feature.postSelect.Credit50.NSW);
            break;
          case AustralianState.ACT:
            await testFunction.assertText(t, cartsPage.elements.eleFeature50Credit, json.electricity.feature.postSelect.Credit50.ACT);
            break;
          case AustralianState.QLD:
            await testFunction.assertText(t, cartsPage.elements.eleFeature50Credit, json.electricity.feature.postSelect.Credit50.QLD);
            break;
          case AustralianState.SA:
            await testFunction.assertText(t, cartsPage.elements.eleFeature50Credit, json.electricity.feature.postSelect.Credit50.SA);
            break;
          default:
            throw Error("Invalid State");
        }
      }
      if(dataTable[0].Feature_carbonNeutral === "Y") {
        if (t.testRun.test.name.includes('familyandfriends')|| t.testRun.test.name.includes('mcc') || t.testRun.test.name.includes('mcdonalds') || t.testRun.test.name.includes('employee')) {
          await testFunction.assertText(t, cartsPage.elements.eleFeatureCNEG, json.electricity.feature.postSelect.carbonNeutral);
        }
        else {
        await testFunction.assertText(t, cartsPage.elements.eleFeatureCN, json.electricity.feature.postSelect.carbonNeutral);
        }
      }
      if (dataTable[0].Feature_moveHomeCredit === "Y") {
        await testFunction.assertText(t, cartsPage.elements.eleFeatureMoveHome, json.electricity.feature.postSelect.moveHomeCredit);
      }
      if (dataTable[0].Feature_peaceOfMind === "Y") {
        if (t.testRun.test.name.includes('employee')){
          await testFunction.assertText(t, cartsPage.elements.eleFeaturePeaceOfMindEE, json.electricity.feature.postSelect.peaceOfMind);
        }
          else{
          await testFunction.assertText(t, cartsPage.elements.eleFeaturePeaceOfMind, json.electricity.feature.postSelect.peaceOfMind);
        }
      }
      if (dataTable[0].Feature_XX_discountOffTotalEnergyBill === "Y") {
        switch (dataTable[0].state) {
          case AustralianState.VIC:
            await testFunction.assertText(t, cartsPage.elements.eleFeatureDiscountOffTotal, json.electricity.feature.postSelect.discountOffTotalEnergyBill.VIC);
            break;
          case AustralianState.NSW:
            if (t.testRun.test.name.includes('Essential')) {
              await testFunction.assertText(t, cartsPage.elements.eleFeatureDiscountOffTotal, json.electricity.feature.postSelect.discountOffTotalEnergyBill.NSW.Essential);
            } else if (t.testRun.test.name.includes('Endeavour')) {
              await testFunction.assertText(t, cartsPage.elements.eleFeatureDiscountOffTotal, json.electricity.feature.postSelect.discountOffTotalEnergyBill.NSW.Endeavour);
            } else if (t.testRun.test.name.includes('Ausgrid')) {
              await testFunction.assertText(t, cartsPage.elements.eleFeatureDiscountOffTotal, json.electricity.feature.postSelect.discountOffTotalEnergyBill.NSW.Ausgrid);
            } else {
              await testFunction.assertText(t, cartsPage.elements.eleFeatureDiscountOffTotal, json.electricity.feature.postSelect.discountOffTotalEnergyBill.NSW);
            }
            break;
          case AustralianState.ACT:
            await testFunction.assertText(t, cartsPage.elements.eleFeatureDiscountOffTotal, json.electricity.feature.postSelect.discountOffTotalEnergyBill.ACT);
            break;
          case AustralianState.QLD:
            await testFunction.assertText(t, cartsPage.elements.eleFeatureDiscountOffTotal, json.electricity.feature.postSelect.discountOffTotalEnergyBill.QLD);
            break;
          case AustralianState.SA:
            await testFunction.assertText(t, cartsPage.elements.eleFeatureDiscountOffTotal, json.electricity.feature.postSelect.discountOffTotalEnergyBill.SA);
            break;
          default:
            throw Error("Invalid State");
        }
      }
      if (dataTable[0].Feature_discountOffTotalEnergyBill === "Y") {
        await testFunction.assertText(t, cartsPage.elements.eleFeatureDiscountOffTotal, json.electricity.feature.postSelect.discountOffTotalEnergyBill);
      }
      if (dataTable[0].Feature_defaultOffer === "Y") {
        if ( dataTable[0].state ===AustralianState.VIC)
        {await testFunction.assertText(t, cartsPage.elements.eleFeatureDefaultOffer, json.electricity.feature.postSelect.defaultOffer.VIC);
        }else {
          await testFunction.assertText(t, cartsPage.elements.eleFeatureDefaultOffer, json.electricity.feature.postSelect.defaultOffer.NonVIC);
        }
      }
      if (dataTable[0].Feature_vipPriorityService === "Y") {
        await testFunction.assertText(t, cartsPage.elements.eleFeatureVipPriorityService, json.electricity.feature.postSelect.vipPriorityService);
      }
      if (dataTable[0].Feature_variableRates === "Y") {
        await testFunction.assertText(t, cartsPage.elements.eleFeatureVariableRates, json.electricity.feature.postSelect.variableRates);
      }
      if (dataTable[0].Feature_chanceToWin === "Y") {
        if (dataTable[0].state === 'VIC') {
          await testFunction.assertText(t, cartsPage.elements.eleFeatureChanceToWin, json.electricity.feature.postSelect.chanceToWin.VIC);
        } else if (dataTable[0].state === 'NSW') {
          await testFunction.assertText(t, cartsPage.elements.eleFeatureChanceToWin, json.electricity.feature.postSelect.chanceToWin.NSW);
        } else if (dataTable[0].state === 'QLD') {
          await testFunction.assertText(t, cartsPage.elements.eleFeatureChanceToWin, json.electricity.feature.postSelect.chanceToWin.QLD);
        } else {
          throw Error("Invalid State");
        }
      }
    }
    if (await testFunction.isGas(dataTable[0].fuelType)) {
      await t.expect(await testFunction.sizeOfElement(t, cartsPage.elements.gasFeatures)).eql(numOfExpectedFeatures);
      if (dataTable[0].Feature_50Credit === "Y") {
        switch (dataTable[0].state) {
          case AustralianState.VIC:
            await testFunction.assertText(t, cartsPage.elements.gasFeature50Credit, json.gas.feature.postSelect.Credit50.VIC);
            break;
          case AustralianState.NSW:
            await testFunction.assertText(t, cartsPage.elements.gasFeature50Credit, json.gas.feature.postSelect.Credit50.NSW);
            break;
          case AustralianState.ACT:
            await testFunction.assertText(t, cartsPage.elements.gasFeature50Credit, json.gas.feature.postSelect.Credit50.ACT);
            break;
          case AustralianState.QLD:
            await testFunction.assertText(t, cartsPage.elements.gasFeature50Credit, json.gas.feature.postSelect.Credit50.QLD);
            break;
          case AustralianState.SA:
            await testFunction.assertText(t, cartsPage.elements.gasFeature50Credit, json.gas.feature.postSelect.Credit50.SA);
            break;
          default:
            throw Error("Invalid State");
        }}
      if(dataTable[0].Feature_carbonNeutral === "Y") {
        if (t.testRun.test.name.includes('familyandfriends')|| t.testRun.test.name.includes('mcc') || t.testRun.test.name.includes('mcdonalds') || t.testRun.test.name.includes('employee')) {
          await testFunction.assertText(t, cartsPage.elements.gasFeatureCNEG, json.gas.feature.postSelect.carbonNeutral);
        }
        else {
        await testFunction.assertText(t, cartsPage.elements.gasFeatureCN, json.gas.feature.postSelect.carbonNeutral);
        }
      }
      if (dataTable[0].Feature_moveHomeCredit === "Y") {
        await testFunction.assertText(t, cartsPage.elements.gasFeatureMoveHome, json.gas.feature.postSelect.moveHomeCredit);
      }
      if (dataTable[0].Feature_peaceOfMind === "Y") {
        if (t.testRun.test.name.includes('employee')){
          await testFunction.assertText(t, cartsPage.elements.gasFeaturePeaceOfMindEE, json.gas.feature.postSelect.peaceOfMind);
        } else {
          await testFunction.assertText(t, cartsPage.elements.gasFeaturePeaceOfMind, json.gas.feature.postSelect.peaceOfMind);
        }
      }
      if (dataTable[0].Feature_XX_discountOffTotalEnergyBill === "Y") {
        switch (dataTable[0].state) {
          case AustralianState.VIC:
            await testFunction.assertText(t, cartsPage.elements.gasFeatureDiscountOffTotal, json.gas.feature.postSelect.discountOffTotalEnergyBill.VIC);
            break;
          case AustralianState.NSW:
            await testFunction.assertText(t, cartsPage.elements.gasFeatureDiscountOffTotal, json.gas.feature.postSelect.discountOffTotalEnergyBill.NSW);
            break;
          case AustralianState.ACT:
            await testFunction.assertText(t, cartsPage.elements.gasFeatureDiscountOffTotal, json.gas.feature.postSelect.discountOffTotalEnergyBill.ACT);
            break;
          case AustralianState.QLD:
            await testFunction.assertText(t, cartsPage.elements.gasFeatureDiscountOffTotal, json.gas.feature.postSelect.discountOffTotalEnergyBill.QLD);
            break;
          case AustralianState.SA:
            await testFunction.assertText(t, cartsPage.elements.gasFeatureDiscountOffTotal, json.gas.feature.postSelect.discountOffTotalEnergyBill.SA);
            break;
          default:
            throw Error("Invalid State");
        }
      }
      if (dataTable[0].Feature_discountOffTotalEnergyBill === "Y") {
        await testFunction.assertText(t, cartsPage.elements.gasFeatureDiscountOffTotal, json.gas.feature.postSelect.discountOffTotalEnergyBill);
      }
      if (dataTable[0].Feature_vipPriorityService === "Y") {
        await testFunction.assertText(t, cartsPage.elements.gasFeatureVipPriorityService, json.gas.feature.postSelect.vipPriorityService);
      }
      if (dataTable[0].Feature_variableRates === "Y") {
        await testFunction.assertText(t, cartsPage.elements.gasFeatureVariableRates, json.gas.feature.postSelect.variableRates);
      }
      if (dataTable[0].Feature_chanceToWin === "Y") {
        if (dataTable[0].state === 'VIC') {
          await testFunction.assertText(t, cartsPage.elements.gasFeatureChanceToWin, json.gas.feature.postSelect.chanceToWin.VIC);
        } else if (dataTable[0].state === 'NSW') {
          await testFunction.assertText(t, cartsPage.elements.gasFeatureChanceToWin, json.gas.feature.postSelect.chanceToWin.NSW);
        } else {
          throw Error("Invalid State");
        }
      }
    }
  }
}
