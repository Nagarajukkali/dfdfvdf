const eaQualifierPage = require('../pages/qualifier.page');
import {testFuncs } from '../../global_methods/helper';
import {verifyAccount} from '../methods/plansPage';
const helper  = testFuncs();

export function qualifierPageFunction() {

  async function selectCustomerStatus(t, customerType,accountNumber,accDetail,idType,idValue) {
    if(customerType==='New'){
        await helper.click(t,eaQualifierPage.elements.newCustomerBtn);
      }
      else if(customerType==='Existing'){
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
        if(movingType==='Non Moving'){
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
        await helper.click(t,eaQualifierPage.elements.serviceAddressList.withText(address));
    }

    async function selectDateFromCalendar(t){
      table=eaQualifierPage.elements.calendarTable;
      rowCount=table.childElementCount;
      for(i=0;i<rows;i++){
        rows=table.child(i);
        colCount=rows.childElementCount;
        cols=eaQualifierPage.elements.calendarTable.child(i).child(j);
        for(j=1;j<cols;j++){
          await helper.click(t,cols.filter(button.btn-day.active));s
        }
      }
    }
    return {
        selectCustomerStatus,
        provideMovingtype,
        provideAddress,
        selectDateFromCalendar,
        verifyFamilyViolenceMessage,
      };
}