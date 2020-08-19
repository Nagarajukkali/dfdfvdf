import {FUEL_TYPE_OPTIONS} from '@ea/ea-commons-models';
const eaMyAccount=require('../pages/myAccount.page');
import {testFunction } from '../../global_methods/helper';
import {checkoutDetailsMethod} from './checkoutDetailsPage';
const cryptoJS = require('crypto-js');
const { config }=require('../../resources/resource');
let isSolar: boolean = true;

export class myAccountMethod{

  public static map=new Map();

  public static async loginToMyAccount(t,username,password){
    await testFunction.clearAndEnterText(t, eaMyAccount.elements.tfUsername, username);
    //console.log(cryptoJS.AES.encrypt("TestPass1", username).toString());
    await testFunction.clearAndEnterText(t, eaMyAccount.elements.tfPassword, cryptoJS.AES.decrypt(password, username).toString(cryptoJS.enc.Utf8));
    await testFunction.click(t, eaMyAccount.elements.btnSignIn);
    await testFunction.waitForElementToBeAppeared(t,eaMyAccount.elements.eaSpinner);
    await testFunction.waitForElementToBeDisappeared(t,eaMyAccount.elements.eaSpinner);
    await testFunction.isElementDisplayed(t,eaMyAccount.elements.eleViewAndChangePlan);
    await testFunction.takeScreenshot(t,"my_account_dashboard");
    console.log("User lands on my account dashboard.");
  }

  public static async navigateToViewAndChangePlan(t,fuelType){
    if(fuelType === FUEL_TYPE_OPTIONS.ELE.value) {
      await testFunction.click(t, eaMyAccount.elements.eleViewAndChangePlan);
      isSolar = true;
    } else if(fuelType === FUEL_TYPE_OPTIONS.GAS.value) {
      await testFunction.click(t, eaMyAccount.elements.gasViewAndChangePlan);
      isSolar = false;
    }
    await testFunction.waitForElementToBeDisappeared(t,eaMyAccount.elements.eaSpinner);
    await testFunction.takeScreenshot(t,"my_account_view_and_change_plan");
    console.log("User lands on 'View or change plan' page.");
  }

  public static async navigateToMoveHome(t,fuelType){
    await testFunction.waitForLoadingIconToClose_MA(t);
    if(fuelType === FUEL_TYPE_OPTIONS.ELE.value) {
      await testFunction.click(t, eaMyAccount.elements.eleMoveHome);
    } else if(fuelType === FUEL_TYPE_OPTIONS.GAS.value) {
      await testFunction.click(t, eaMyAccount.elements.gasMoveHome);
    }
    await testFunction.isElementDisplayed(t,eaMyAccount.elements.moveHeader);
    await t.wait(10000);
    await testFunction.takeScreenshot(t,"my_account_move_home");
  }

  public static async getPlanDetailsFromViewPlan(t){
    this.map.set('isCurrentPlanDisplayed_'+checkoutDetailsMethod.getScenarioId(t),true);
    await testFunction.waitForElementToBeDisappeared(t,eaMyAccount.elements.eaSpinner);
    let discountText,discount,exitFees;
    let discountsItemCount=await testFunction.sizeOfElement(t,eaMyAccount.elements.discounts);
    if(discountsItemCount===1){
      discountText=await testFunction.getElementText(t,eaMyAccount.elements.discounts);
      if(discountText.includes('0% discount')){
        this.map.set('discount_'+checkoutDetailsMethod.getScenarioId(t),'No');
        this.map.set('estimatePeriod_'+checkoutDetailsMethod.getScenarioId(t),'Your estimated monthly cost');
      }
      else{
        discount=discountText.split(":")[1].trim().split(" ")[0].trim();
      }
    }
    else if(discountsItemCount>1){
      discountText=await testFunction.getElementText(t,eaMyAccount.elements.discounts.nth(0));
      let discountType=discountText.split("(")[0].trim();
      let discountOnRates=discountText.split("(")[1].split(")")[0].trim();
      discount=Number(discountText.split(":")[1].trim().split(" ")[0].trim().slice(0,-1));
      for(let i=1;i<discountsItemCount;i++){
        let nextDiscountText=await testFunction.getElementText(t,eaMyAccount.elements.discounts.nth(i));
        if(nextDiscountText.includes(discountType) && nextDiscountText.includes(discountOnRates)){
          let nextDiscount=Number(nextDiscountText.split(":")[1].trim().split(" ")[0].trim().slice(0,-1));
          discount=discount+nextDiscount;
        }
        else{
          this.map.set('isCurrentPlanDisplayed_'+checkoutDetailsMethod.getScenarioId(t),false);
          console.log("Different type of discounts available. Current plan should not display.");
          break;
        }
      }
      discount=discount.toString()+"%";
    }
    else{
      console.log("Discounts are not available.");
    }
    if(discountText.toLowerCase().includes("guaranteed discount")){
      if(discountText.includes("Usage and Supply charges")){
        this.map.set('discount_'+checkoutDetailsMethod.getScenarioId(t),discount+' off usage and supply rates');
      }
      if(discountText.includes("Usage only")){
        this.map.set('discount_'+checkoutDetailsMethod.getScenarioId(t),discount+' off usage rates');
      }
      this.map.set('estimatePeriod_'+checkoutDetailsMethod.getScenarioId(t),'Your estimated monthly cost with discount');
    }
    if(discountText.toLowerCase().includes("pay by due date")){
      if(discountText.includes("Usage and Supply charges")){
        this.map.set('discount_'+checkoutDetailsMethod.getScenarioId(t),discount+' off usage and supply rates when you pay on time');
      }
      if(discountText.includes("Usage only")){
        this.map.set('discount_'+checkoutDetailsMethod.getScenarioId(t),discount+' off usage rates when you pay on time');
      }
      this.map.set('estimatePeriod_'+checkoutDetailsMethod.getScenarioId(t),'Your estimated monthly cost with pay on time discount');
    }
    exitFees=await testFunction.getElementText(t,eaMyAccount.elements.exitFees);
    this.map.set('exitFees_'+checkoutDetailsMethod.getScenarioId(t),exitFees);

  }
  public static async loginAsGhostingUser(t) {
    const username = config.ghostingUserCreds.username;
    const password = config.ghostingUserCreds.password;
    await testFunction.clearAndEnterText(t, eaMyAccount.elements.tfUsername, username);
    await testFunction.clearAndEnterText(t, eaMyAccount.elements.tfPassword, cryptoJS.AES.decrypt(password, username).toString(cryptoJS.enc.Utf8));
    await testFunction.click(t, eaMyAccount.elements.btnSignIn);
    await testFunction.takeScreenshot(t,"ghosting search page");
  }

  public static async searchAccountNumber(t,accountNumber) {
    await testFunction.clearAndEnterText(t, eaMyAccount.elements.tfAccountNumber, accountNumber);
    await testFunction.click(t, eaMyAccount.elements.btnSearch);
  }

  public static async clickOnImpersonateButton(t) {
    await testFunction.click(t, eaMyAccount.elements.btnImpersonate);
    await testFunction.waitForElementToBeAppeared(t,eaMyAccount.elements.eaSpinner);
    await testFunction.waitForElementToBeDisappeared(t,eaMyAccount.elements.eaSpinner);
  }


}
