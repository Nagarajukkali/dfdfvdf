const eaQualifierPage = require('../pages/qualifier.page');
import {testFuncs } from '../../global_methods/helper';
import {verifyAccount} from './plansPage';
const helper  = testFuncs();

export function qualifierPageFunction() {

  async function selectCustomerStatus(t, customerType,accountNumber,accDetail,idType,idValue) {
    if(customerType.toUpperCase()==='NEW'){
        await helper.click(t,eaQualifierPage.elements.newCustomerBtn);
      }
      else if(customerType.toUpperCase()==='EXISTING'){
          await helper.click(t,eaQualifierPage.elements.existingCustomerBtn);
          await helper.clearAndText(t, eaQualifierPage.elements.accountNumber, accountNumber);
          await helper.clearAndText(t, eaQualifierPage.elements.accountDetail, accDetail);
          await helper.isElementVisible(t, eaQualifierPage.elements.accountDetailValidate);
          await helper.click(t, eaQualifierPage.elements.verifyAccountSubmit);
          switch(idType){
            case 'dob':
               await verifyAccount().provideIdValue(t, idValue,eaQualifierPage.elements.idTypeDOBValue);
               break;
            case 'dl':
                await verifyAccount().selectIdType(t, eaQualifierPage.elements.idTypeDl);
                await verifyAccount().provideIdValue(t, idValue,eaQualifierPage.elements.idTypeDlValue);
                break;
            case 'pin':
                await verifyAccount().selectIdType(t, eaQualifierPage.elements.idTypePin);
                await verifyAccount().provideIdValue(t, idValue,eaQualifierPage.elements.idTypeDl);
                break;
          }
          await helper.click(t, eaQualifierPage.elements.verifyIdentitySubmit);
      }
      else{
        console.log('customer status option is not selected.');
      }
    }

    async function verifyFamilyViolenceMessage(t, value){
      await helper.assertText(t, eaQualifierPage.elements.familyViolenceMessage, value);
    }

    async function provideMovingType(t, movingType) {
        if(movingType==='Non-Moving'){
            await helper.click(t,eaQualifierPage.elements.nonMoving);
          }
          else if(movingType==='Moving'){
              await helper.click(t,eaQualifierPage.elements.moving);
          }
          else{
            console.log('moving option is not selected.');
          }
    }

    async function provideAddress(t, address) {
        await helper.clearAndText(t,eaQualifierPage.elements.serviceAddress,address);
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
      if(propertyType ==='Owner'){
        await helper.click(t,eaQualifierPage.elements.owner);
      }
      else if(propertyType ==='Renter'){
        await helper.click(t,eaQualifierPage.elements.renter);
      }
      else{
        console.log('Property type is not selected');
      }
    }
    async function selectSolarOption(t,solarOpt){
      if(solarOpt==='Yes'){
        await helper.click(t,eaQualifierPage.elements.solarYes);
      }
      else if(solarOpt==='No'){
        await helper.click(t,eaQualifierPage.elements.solarNo);
      }
      else{
        console.log('Solar option is not selected');
      }
    }
    return {
        selectCustomerStatus,
        provideMovingType,
        provideAddress,
        selectDateFromCalendar,
        verifyFamilyViolenceMessage,
        selectPropertyType,
        selectSolarOption,
      };
}
