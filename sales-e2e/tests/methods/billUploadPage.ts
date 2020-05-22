const eaBillUpload=require('../pages/billUpload.page');
import {testFunction } from '../../global_methods/helper';

export class billUploadMethod {
  public static async clickOnUploadBill(t){
    await testFunction.click(t,eaBillUpload.elements.btnUploadBill);
  }
  public static async uploadBill(t,billName){
    await t.setFilesToUpload(
      eaBillUpload.elements.billUploadInput,
      `../../resources/Bills/${billName.toLowerCase()}`
    );
    await testFunction.waitForElementToBeDisappeared(t,eaBillUpload.elements.eaSpinner);
  }
  public static async verifyRecommendationDetails(t){
    await testFunction.assertText(t,eaBillUpload.elements.txtRecommendationDetails,"We can see you're already on a better deal with your current provider by $10 a month. Did you know that with our plans you can opt in to carbon neutral electricity at no extra cost?");
  }
  public static async selectRecommendedPlan(t){
    await testFunction.click(t,eaBillUpload.elements.btnRecommendedPlanSelect);
  }
}
