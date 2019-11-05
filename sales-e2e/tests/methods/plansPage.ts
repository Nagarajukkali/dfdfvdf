const EaHomePage = require('../pages/energy-australia-home.page');
import {CustomerType, FuelType, IdType, PlanType, testFuncs} from '../../global_methods/helper';
const helper  = testFuncs();

export function plansPageFunction() {
    async function clickPlansPageModal(t, customerType) {
        if(customerType===CustomerType.RESIDENTIAL || customerType===CustomerType.BUSINESS){
            await helper.click(t,EaHomePage.elements.ModalWindow);
          }
          else {
              console.log('Modal window could not be opened due to page error')
          }
    }

    async function verifyVerifyAccountChangeButton(t){
      await helper.isElementDisplayed(t,EaHomePage.elements.changeLinkVerifyAccount);
    }

    async function selectFuel(t,fuelType){
      switch(fuelType){
        case FuelType.DUAL:
          await helper.click(t,EaHomePage.elements.fuelSelectorOption);
          await helper.click(t,EaHomePage.elements.fuelSelectorOptionDual);
          break;
        case FuelType.ELECTRICITY:
          await helper.click(t,EaHomePage.elements.fuelSelectorOption);
          await helper.click(t,EaHomePage.elements.fuelSelectorOptionEle);
          break;
        case FuelType.GAS:
          await helper.click(t,EaHomePage.elements.fuelSelectorOption);
          await helper.click(t,EaHomePage.elements.fuelSelectorOptionGas);
          break;
        default:
          console.log("Invalid fuel type is selected");
      }
    }

    async function selectPlan(t, planName, customerType){
      if (customerType===CustomerType.RESIDENTIAL) {
        await selectResiPlan(t,planName);
      }
      else if(customerType===CustomerType.BUSINESS){
        await selectBSMEPlan(t,PlanType);
      }
      else {
        console.log("Please provide valid customer type");
      }
    }

    async function selectResiPlan(t,planName){
      switch(planName){
        case PlanType.BASICHOME:
          await helper.click(t,EaHomePage.elements.basicPlan);
          break;
        case PlanType.NOFRILLS:
          await helper.click(t,EaHomePage.elements.noFrillsPlan);
          break;
        case PlanType.TOTALPLAN:
          await helper.click(t,EaHomePage.elements.totalPlan);
          break;
        case PlanType.TOTALPLANPLUS:
          await helper.click(t,EaHomePage.elements.totalPlusPlan);
          break;
        default:
          console.log("Invalid plan is selected");
      }
    }

  async function selectBSMEPlan(t,planName){
    switch(planName){
      case PlanType.BASICBUSINESS:
        await helper.click(t,EaHomePage.elements.basicBusiness);
        break;
      case PlanType.NOFRILLS:
        await helper.click(t,EaHomePage.elements.noFrillBusiness);
        break;
      case PlanType.TOTALPLAN:
        await helper.click(t,EaHomePage.elements.totalPlanBusiness);
        break;
      case PlanType.TOTALPLANPLUS:
        await helper.click(t,EaHomePage.elements.totalPlanPlusBusiness);
        break;
      default:
        console.log("Invalid plan is selected");
    }
  }

    return {
        clickPlansPageModal,
        verifyVerifyAccountChangeButton,
        selectFuel,
        selectPlan,
        selectResiPlan,
        selectBSMEPlan,
      };
}

export function selectionOptionModalWindow() {
    async function selectOptionsModalWindow(t, modalWindowValue) {
        if (modalWindowValue==='verify account') {
            await helper.click(t,EaHomePage.elements.modalVerifyAccountOption);
          } else if (modalWindowValue==='Bill upload') {
            await helper.click(t,EaHomePage.elements.modalBillUploadOption);
          }
    }
    return {
        selectOptionsModalWindow,
      };
}

export function verifyAccount() {
    async function verifyAccountIsDisplayed(t, fuelType, customerType) {
        if (customerType===CustomerType.RESIDENTIAL) {
            switch (fuelType) {
              case FuelType.DUAL:
                await helper.isElementDisplayed(t,EaHomePage.elements.elecAccountNo);
                await helper.isElementDisplayed(t,EaHomePage.elements.gasAccountNo);
                break;
              case FuelType.ELECTRICITY:
                  await helper.isElementDisplayed(t,EaHomePage.elements.elecAccountNo);
                break;
              case FuelType.GAS:
                  await helper.isElementDisplayed(t,EaHomePage.elements.gasAccountNo);
                break;
            }
            await helper.isElementDisplayed(t,EaHomePage.elements.nextAccountNumber);
            await helper.isElementDisplayed(t,EaHomePage.elements.backAccountNumber);
          }
    }

    async function provideAccountDetails(t,fuel,accountNumber){
        switch(fuel){
            case FuelType.ELECTRICITY:
              await helper.clearAndEnterText(t,EaHomePage.elements.elecAccountNo, accountNumber);
              break;
            case FuelType.GAS:
              await helper.clearAndEnterText(t,EaHomePage.elements.gasAccountNo, accountNumber);
              break;
            default:
              console.log('Couldnot provide account details as the page didnot load properly');
          }
    }

    async function provideAccountInformation(t, accountInformation, customerType ){
        switch(customerType){
            case CustomerType.RESIDENTIAL:
                await helper.clearAndEnterText(t,EaHomePage.elements.postcodeVerifyAccount, accountInformation);
              break;
            case CustomerType.BUSINESS:
                await helper.clearAndEnterText(t,EaHomePage.elements.businessInformation, accountInformation);
              break;
          }
    }

    async function verifyAccountDetails(t){
        await helper.click(t, EaHomePage.elements.nextAccountNumber);
    }

    async function provideIdentityDetails(t, idType, idValue){
        switch(idType){
            case IdType.DOB:
               await provideIdValue(t, idValue,EaHomePage.elements.idTypeDOBValueVerifyAccount);
               break;
            case IdType.DL:
                await selectIdType(t, EaHomePage.elements.idTypeDlVerifyAccount);
                await provideIdValue(t, idValue,EaHomePage.elements.idTypeDlValueVerifyAccount);
                break;
            case IdType.PIN:
                await selectIdType(t, EaHomePage.elements.idTypePinVerifyAccount);
                await provideIdValue(t, idValue,EaHomePage.elements.idTypeDlValueVerifyAccount);
                break;
          }
    }

    async function verifyUsageData(t, fuelType){
        switch (fuelType) {
            case FuelType.DUAL:
                await helper.isElementDisplayed(t,EaHomePage.elements.usageData_ele);
                await helper.isElementDisplayed(t,EaHomePage.elements.usageData_gas);
              break;
            case FuelType.ELECTRICITY:
                await helper.isElementDisplayed(t,EaHomePage.elements.usageData_ele);
              break;
            case FuelType.GAS:
                await helper.isElementDisplayed(t,EaHomePage.elements.usageData_gas);
              break;
          }
    }

    async function verifyFamilyViolenceMessage(t, value){
      await helper.assertText(t, EaHomePage.elements.familyViolenceMessage, value);
    }

    async function showCostEstimates(t){
        await helper.click(t, EaHomePage.elements.getCostEstimatesChangeButton);
    }

    async function selectIdType(t, itemToClick) {
        await helper.click(t, EaHomePage.elements.idTypeDropDownVerifyAccount);
        await helper.click(t, itemToClick);
      }
    async function provideIdValue(t,idValue, inputField) {
        await helper.clearAndEnterText(t,inputField, idValue);
    }
    return {
        verifyAccountIsDisplayed,
        provideAccountDetails,
        provideAccountInformation,
        verifyAccountDetails,
        provideIdentityDetails,
        verifyUsageData,
        showCostEstimates,
        verifyFamilyViolenceMessage,
        selectIdType,
        provideIdValue,
      };
}
