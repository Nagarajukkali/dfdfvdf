const eaQualifierPage=require('../pages/qualifier.page');
import {CustomerStatus, IdType, Moving, Property, Solar, testFunction} from '../../global_methods/helper';

export class qualifierMethod{

  public static async selectCustomerStatus(t, customerStatus,accountNumber,accDetail,accountIdentityType,idType,idValue,customerType) {
    if(customerStatus===CustomerStatus.NEW){
        await testFunction.click(t,eaQualifierPage.elements.newCustomerBtn);
      }
    else if(customerStatus===CustomerStatus.EXISTING){
        await testFunction.click(t,eaQualifierPage.elements.existingCustomerBtn);
        await testFunction.clearAndEnterText(t, eaQualifierPage.elements.accountNumber, accountNumber);
          if(customerType==='Business' && accountIdentityType==='ABN'){
            await testFunction.click(t,eaQualifierPage.elements.existingCustomerAbn);
            await testFunction.clearAndEnterText(t, eaQualifierPage.elements.abnAcnField, accDetail);
            await t.wait(2000);
          }else if(customerType==='Business' && accountIdentityType==='ACN'){
            await testFunction.click(t,eaQualifierPage.elements.existingCustomerAcn);
            await testFunction.clearAndEnterText(t, eaQualifierPage.elements.abnAcnField, accDetail);
            await t.wait(2000);
          }else{
            await testFunction.clearAndEnterText(t, eaQualifierPage.elements.accountDetail, accDetail);
            await testFunction.isElementVisible(t, eaQualifierPage.elements.accountDetailValidate);
          }
        await testFunction.click(t, eaQualifierPage.elements.verifyAccountSubmit);
        switch(idType){
          case IdType.DOB:
             await this.provideIdValue(t, idValue,eaQualifierPage.elements.idTypeDOBValue);
             break;
          case IdType.DL:
              await this.selectIdTypeQualifier(t, eaQualifierPage.elements.idTypeDl);
              await this.provideIdValue(t, idValue,eaQualifierPage.elements.idTypeDlValue);
              break;
          case IdType.PIN:
              await this.selectIdTypeQualifier(t, eaQualifierPage.elements.idTypePin);
              await this.provideIdValue(t, idValue,eaQualifierPage.elements.idTypeDlValue);
              break;
        }
        await testFunction.waitForLoadingIconToClose();
        await t.wait(3000);
        await testFunction.click(t, eaQualifierPage.elements.verifyIdentitySubmit);
    }
    else{
      console.log('customer status option is not selected.');
    }
    }
    public static async selectIdTypeQualifier(t, itemToClick) {
      /*let val=await eaQualifierPage.elements.idTypeDropDown.count
        .then(result=>result);*/
      let val =await testFunction.sizeOfElement(t, eaQualifierPage.elements.idTypeDropDown);
      if(val!==1) {
        await testFunction.click(t, eaQualifierPage.elements.idTypeDropDownVerifyAccount);
        await testFunction.click(t, itemToClick);
      }
    }
    public static async provideIdValue(t,idValue, inputField) {
      await testFunction.clearAndEnterText(t,inputField, idValue);
    }

  public static async verifyFamilyViolenceMessage(t, value){
    await testFunction.assertText(t, eaQualifierPage.elements.familyViolenceMessage, value);
  }

  public static async provideMovingType(t, movingType) {
    if(movingType===Moving.NONMOVING){
        await testFunction.click(t,eaQualifierPage.elements.nonMoving);
      }
      else if(movingType===Moving.MOVING){
          await testFunction.click(t,eaQualifierPage.elements.moving);
      }
      else{
        console.log('moving option is not selected.');
      }
  }

  public static async provideAddress(t, address) {
      await testFunction.clearAndEnterText(t,eaQualifierPage.elements.serviceAddress,address);
      await testFunction.isElementVisible(t,eaQualifierPage.elements.serviceAddressList);
      await testFunction.clickElementFromList(t,eaQualifierPage.elements.serviceAddressList,address);
      await testFunction.isElementVisible(t, eaQualifierPage.elements.addressLoadingIcon);
      await testFunction.waitForLoadingIconToClose();
      await testFunction.click(t, eaQualifierPage.elements.addressContinue);
  }

  public static async selectDateFromCalendar(t){
    let table=eaQualifierPage.elements.calendarTable;
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
          await testFunction.click(t,cols);
          flag=true;
          break;
        }
      }
      if(flag) break;
    }
  }
  public static async selectPropertyType(t,propertyType){
    if(propertyType ===Property.OWNER){
      await testFunction.click(t,eaQualifierPage.elements.owner);
    }
    else if(propertyType ===Property.RENTER){
      await testFunction.click(t,eaQualifierPage.elements.renter);
    }
    else{
      console.log('Property type is not selected');
    }
  }
  public static async selectSolarOption(t,solarOpt){
    if(solarOpt===Solar.YES){
      await testFunction.click(t,eaQualifierPage.elements.solarYes);
    }
    else if(solarOpt===Solar.NO){
      await testFunction.click(t,eaQualifierPage.elements.solarNo);
    }
    else{
      console.log('Solar option is not selected');
    }
  }
}
