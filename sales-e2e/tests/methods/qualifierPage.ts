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

    async function provideMovingtype(t, movingType) {
        if(movingType.toUpperCase()==='NON MOVING'){
            await helper.click(t,eaQualifierPage.elements.nonMoving);
          }
          else if(movingType.toUpperCase()==='MOVING'){
              await helper.click(t,eaQualifierPage.elements.moving);
          }
          else{
            console.log('moving option is not selected.');
          }
    }

    async function provideAddress(t, address) {
        await helper.clearAndText(t,eaQualifierPage.elements.serviceAddress,address);
        await helper.click(t,eaQualifierPage.elements.serviceAddressList.withText(address));
    }

    async function selectDateFromCalendar(t){
      let table=eaQualifierPage.elements.calendarTable;
      let rowCount=table.childElementCount;
      for(let i=0;i<rowCount;i++){
        let rows=table.child(i);
        let colCount=rows.childElementCount;
        for(let j=1;j<colCount;j++){
          let cols=rows.child(j);
          await helper.click(t,cols.filter(eaQualifierPage.elements.calendarSelection));
        }
      }
    }
    async function selectPropertyType(t,propertyType){
      if(propertyType.toUpperCase()==='OWNER'){
        await helper.click(t,eaQualifierPage.elements.owner);
      }
      else if(propertyType.toUpperCase()==='RENTER'){
        await helper.click(t,eaQualifierPage.elements.renter);
      }
      else{
        console.log('Property type is not selected');
      }
    }
    async function selectSolarOption(t,solarOpt){
      if(solarOpt.toUpperCase()==='YES'){
        await helper.click(t,eaQualifierPage.elements.solarYes);
      }
      else if(solarOpt.toUpperCase()==='NO'){
        await helper.click(t,eaQualifierPage.elements.solarNo);
      }
      else{
        console.log('Solar option is not selected');
      }
    }
    return {
        selectCustomerStatus,
        provideMovingtype,
        provideAddress,
        selectDateFromCalendar,
        verifyFamilyViolenceMessage,
        selectPropertyType,
        selectSolarOption,
      };
}
