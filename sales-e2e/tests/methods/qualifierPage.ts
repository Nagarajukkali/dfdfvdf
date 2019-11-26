const eaQualifierPage = require('../pages/qualifier.page');
import {BusinessType, CustomerStatus, Moving, Property, Solar, testFuncs} from '../../global_methods/helper';
const helper  = testFuncs();

export function qualifierPageFunction() {

  async function selectCustomerStatus(t, customerStatus) {
    if(customerStatus===CustomerStatus.NEW){
        await helper.click(t,eaQualifierPage.elements.newCustomerBtn);
      }
    else if(customerStatus===CustomerStatus.EXISTING){
        await helper.click(t,eaQualifierPage.elements.existingCustomerBtn);
    }
    else{
      console.log('customer status option is not selected.');
    }
    }
    async function verifyAccount(t,accountNumber,accountIdentityType,postcodeOrABNACN){
      await helper.clearAndEnterText(t, eaQualifierPage.elements.accountNumber, accountNumber);
      switch(accountIdentityType){
        case BusinessType.ABN:
          await helper.click(t,eaQualifierPage.elements.existingCustomerAbn);
          await helper.clearAndEnterText(t, eaQualifierPage.elements.abnAcnField, postcodeOrABNACN);
          await t.wait(2000);
        case BusinessType.ACN:
          await helper.click(t,eaQualifierPage.elements.existingCustomerAcn);
          await helper.clearAndEnterText(t, eaQualifierPage.elements.abnAcnField, postcodeOrABNACN);
          await t.wait(2000);
        case 'Postcode':
          await helper.clearAndEnterText(t, eaQualifierPage.elements.accountDetail, postcodeOrABNACN);
          await helper.isElementVisible(t, eaQualifierPage.elements.accountDetailValidate);
        default:
          console.log('account identity type is not valid');
      }
      await helper.click(t, eaQualifierPage.elements.verifyAccountSubmit);
    }
    async function selectIdTypeQualifier(t, itemToClick) {
      let val =await helper.sizeOfElement(t, eaQualifierPage.elements.idTypeDropDown);
      if(val!==1) {
        await helper.click(t, eaQualifierPage.elements.idTypeDropDownVerifyAccount);
        await helper.click(t, itemToClick);
      }
    }
    async function verifyIdentity(t,idType,idValue){
      switch(idType){
        case 'dob':
          await provideIdValue(t, idValue,eaQualifierPage.elements.idTypeDOBValue);
          break;
        case 'dl':
          await selectIdTypeQualifier(t, eaQualifierPage.elements.idTypeDl);
          await provideIdValue(t, idValue,eaQualifierPage.elements.idTypeDlValue);
          break;
        case 'pin':
          await selectIdTypeQualifier(t, eaQualifierPage.elements.idTypePin);
          await provideIdValue(t, idValue,eaQualifierPage.elements.idTypeDlValue);
          break;
        default:
          console.log('Invalid id type');
      }
      await helper.waitForLoadingIconToClose();
      await t.wait(3000);
      await helper.click(t, eaQualifierPage.elements.verifyIdentitySubmit);
    }
    async function provideIdValue(t,idValue, inputField) {
      await helper.clearAndEnterText(t,inputField, idValue);
    }

  async function verifyFamilyViolenceMessage(t, value){
    await helper.assertText(t, eaQualifierPage.elements.familyViolenceMessage, value);
  }

  async function provideMovingType(t, movingType) {
    if(movingType===Moving.NONMOVING){
        await helper.click(t,eaQualifierPage.elements.nonMoving);
      }
      else if(movingType===Moving.MOVING){
          await helper.click(t,eaQualifierPage.elements.moving);
      }
      else{
        console.log('moving option is not selected.');
      }
  }

  async function provideAddress(t, address) {
      await helper.clearAndEnterText(t,eaQualifierPage.elements.serviceAddress,address);
      await helper.isElementVisible(t,eaQualifierPage.elements.serviceAddressList);
      await helper.clickElementFromList(t,eaQualifierPage.elements.serviceAddressList,address);
      await helper.isElementVisible(t, eaQualifierPage.elements.addressLoadingIcon);
      await helper.waitForLoadingIconToClose();
      await helper.click(t, eaQualifierPage.elements.addressContinue);
  }

  async function selectDateFromCalendar(t){
    let table = eaQualifierPage.elements.calendarTable;
    let tableElement=await table();
    const  rowCount=tableElement.childElementCount;
    let flag=false;
    for(let i=0;i<rowCount;i++){
      let rows=table.child(i);
      let row=await rows();
      let colCount=row.childElementCount;
      for(let j=1;j<colCount;j++){
        let cols=rows.child(j);
        let dateBtn=cols.child(0);
        if(await dateBtn.hasClass('active')){
          await helper.click(t,cols);
          flag=true;
          break;
        }
      }
      if(flag) break;
    }
  }
  async function selectPropertyType(t,propertyType){
    if(propertyType ===Property.OWNER){
      await helper.click(t,eaQualifierPage.elements.owner);
    }
    else if(propertyType ===Property.RENTER){
      await helper.click(t,eaQualifierPage.elements.renter);
    }
    else{
      console.log('Property type is not selected');
    }
  }
  async function selectSolarOption(t,solarOpt){
    if(solarOpt===Solar.YES){
      await helper.click(t,eaQualifierPage.elements.solarYes);
    }
    else if(solarOpt===Solar.NO){
      await helper.click(t,eaQualifierPage.elements.solarNo);
    }
    else{
      console.log('Solar option is not selected');
    }
  }
  return {
      selectCustomerStatus,
      verifyAccount,
      verifyIdentity,
      provideMovingType,
      provideAddress,
      selectDateFromCalendar,
      verifyFamilyViolenceMessage,
      selectPropertyType,
      selectSolarOption,
    };
}
