import {AustralianState} from '@ea/ea-commons-models';

const cartsPage=require('../pages/carts.page');
import {testFunction } from '../../global_methods/helper';

export class cartsMethod {
  public static async clickContinueCartsPage(t) {
      await testFunction.click(t, cartsPage.elements.cartsPageContinueButton);
  }

  public static async validatePlanName(t: any, json: any, dataTable) {
    if(await testFunction.isElectricity(dataTable[0].fuelType)) {
      await testFunction.assertText(t, cartsPage.elements.elePlanName, json.planName);
    }
    if(await testFunction.isGas(dataTable[0].fuelType)) {
      await testFunction.assertText(t, cartsPage.elements.gasPlanName, json.planName)
    }
  }

  public static async validateFeatures(t: any, dataTable, json: any) {
    if(await testFunction.isElectricity(dataTable[0].fuelType)) {
      if(dataTable[0].Feature_50Credit === "Y") {
        await testFunction.assertText(t, cartsPage.elements.eleFeature50Credit, json.electricity.feature.postSelect.Credit50);
      }
      if(dataTable[0].Feature_carbonNeutral === "Y") {
        await testFunction.assertText(t, cartsPage.elements.eleFeatureCN, json.electricity.feature.postSelect.carbonNeutral);
      }
      if(dataTable[0].Feature_peaceOfMind === "Y") {
        await testFunction.assertText(t, cartsPage.elements.eleFeaturePeaceOfMind, json.electricity.feature.postSelect.peaceOfMind);
      }
      if(dataTable[0].Feature_discountOffTotalEnergyBill === "Y") {
        await testFunction.assertText(t, cartsPage.elements.eleFeatureDiscountOffTotal, json.electricity.feature.postSelect.discountOffTotalEnergyBill);
      }
    }
    if(await testFunction.isGas(dataTable[0].fuelType)) {
      if(dataTable[0].Feature_50Credit === "Y") {
        await testFunction.assertText(t, cartsPage.elements.gasFeature50Credit, json.gas.feature.postSelect.Credit50);
      }
      if(dataTable[0].Feature_carbonNeutral === "Y") {
        await testFunction.assertText(t, cartsPage.elements.gasFeatureCN, json.gas.feature.postSelect.carbonNeutral);
      }
      if(dataTable[0].Feature_peaceOfMind === "Y") {
        await testFunction.assertText(t, cartsPage.elements.gasFeaturePeaceOfMind, json.gas.feature.postSelect.peaceOfMind);
      }
      if(dataTable[0].Feature_discountOffTotalEnergyBill === "Y") {
        await testFunction.assertText(t, cartsPage.elements.gasFeatureDiscountOffTotal, json.gas.feature.postSelect.discountOffTotalEnergyBill);
      }
    }
  }
}
