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
}
