const EaHomePage = require('../pages/energy-australia-home.page');
import {testFuncs } from '../../global_methods/helper';
const helper  = testFuncs();

export function plansPageFunction() {
    async function clickPlansPageModal(t, customerType) {
        if(customerType==='Residential'){
            await helper.click(t,EaHomePage.elements.residentialModalWindow);
          }
          else {
              console.log('Modal window could not be opened due to page error')
          }
    }

    async function verifyVerifyAccountChangeButton(t){
      await helper.isElementDisplayed(t,EaHomePage.elements.changeLinkVerifyAccount);
    }

    async function selectPlan(t, planName, customerType){
      if (customerType==='Residential') {
        if (planName==='Basic') {
            await helper.click(t,EaHomePage.elements.basicPlan);
        } else if (planName==='No Frills') {
            await helper.click(t,EaHomePage.elements.noFrillsPlan);
        } else if (planName==='Total') {
            await helper.click(t,EaHomePage.elements.totalPlan);
        } else if (planName==='Total Plan Plus') {
            await helper.click(t,EaHomePage.elements.totalPlusPlan);
        }else{
          console.log("Please provide valid plan name");
        }
      } else {
        console.log("Please provide valid customer type");
      }
    }

    return {
        clickPlansPageModal, 
        verifyVerifyAccountChangeButton,
        selectPlan,      
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
        if (customerType==='Residential') {
            switch (fuelType) {
              case 'Both':
                await helper.isElementDisplayed(t,EaHomePage.elements.elecAccountNo);
                await helper.isElementDisplayed(t,EaHomePage.elements.gascAccountNo);
                break;
              case 'Elec':
                  await helper.isElementDisplayed(t,EaHomePage.elements.elecAccountNo);
                break;
              case 'Gas':
                  await helper.isElementDisplayed(t,EaHomePage.elements.gascAccountNo);
                break;
            }
            await helper.isElementDisplayed(t,EaHomePage.elements.postcodeVerifyAccount);
            await helper.isElementDisplayed(t,EaHomePage.elements.nextAccountNumber);
            await helper.isElementDisplayed(t,EaHomePage.elements.backAccountNumber);
          }
    }

    async function provideAccountDetails(t,fuel,accountNumber){
        switch(fuel){
            case 'Electricity':
              await helper.clearAndText(t,EaHomePage.elements.elecAccountNo, accountNumber);
              break;
            case 'Gas':
              await helper.clearAndText(t,EaHomePage.elements.gasAccountNo, accountNumber);
              break;
            default:
              console.log('Couldnot provide account details as the page didnot load properly');
          }
    }

    async function provideAccountInformation(t, accountInformation, customerType ){
        switch(customerType){
            case 'Residential':
                await helper.clearAndText(t,EaHomePage.elements.postcodeVerifyAccount, accountInformation);
              break;
            case 'Business':
                await helper.clearAndText(t,EaHomePage.elements.gascAccountNo, accountInformation);
              break;
          }
    }

    async function verifyAccountDetails(t){
        await helper.click(t, EaHomePage.elements.nextAccountNumber);
    }

    async function provideIdentityDetails(t, idType, idValue){
        switch(idType){
            case 'dob':
               await provideIdValue(t, idValue,EaHomePage.elements.idTypeDOBValueVerifyAccount);
               break;
            case 'dl':
                await selectIdType(t, EaHomePage.elements.idTypeDlVerifyAccount);
                await provideIdValue(t, idValue,EaHomePage.elements.idTypeDlValueVerifyAccount);
                break;
            case 'pin':
                await selectIdType(t, EaHomePage.elements.idTypePinVerifyAccount);
                await provideIdValue(t, idValue,EaHomePage.elements.idTypeDlValueVerifyAccount);
                break;
          }
    }

    async function verifyUsageData(t, fuelType){
        switch (fuelType) {
            case "Dual":
                await helper.isElementDisplayed(t,EaHomePage.elements.usageData_ele);
                await helper.isElementDisplayed(t,EaHomePage.elements.usageData_gas);
              break;
            case "Elec":
                await helper.isElementDisplayed(t,EaHomePage.elements.usageData_ele);
              break;
            case "Gas":
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
        await helper.clearAndText(t,inputField, idValue);
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

      };
}