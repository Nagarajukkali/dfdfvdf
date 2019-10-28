const EaQualifierPage = require('../pages/qualifier.page');
import {testFuncs } from '../../global_methods/helper';
const helper  = testFuncs();

export function qualifierPageFunction() {

  async function selectCustomerStatus(t, customerType) {
    if(customerType==='New'){
        await helper.click(t,EaQualifierPage.elements.newCustomerBtn);
      }
      else if(mcustomerType==='Existing'){
          await helper.click(t,EaQualifierPage.elements.existingCustomerBtn);
      }
      else{
        console.log('customer status option is not selected.');
      }
}
    async function provideMovingtype(t, movingType) {
        if(movingType==='Non Moving'){
            await helper.click(t,EaQualifierPage.elements.nonMoving);
          }
          else if(movingType==='Moving'){
              await helper.click(t,EaQualifierPage.elements.moving);
          }
          else{
            console.log('moving option is not selected.');
          }
    }

    async function provideAddress(t, address) {
        await helper.clearAndText(t,EaQualifierPage.elements.serviceAddress,address);
        await helper.click(t,EaQualifierPage.elements.serviceAddressList.withText(address));
    }

    async function selectDateFromCalendar(t){
      table=EaQualifierPage.elements.calendarTable;
      rowCount=table.childElementCount;
      for(i=0;i<rows;i++){
        rows=table.child(i);
        colCount=rows.childElementCount;
        cols=EaQualifierPage.elements.calendarTable.child(i).child(j);
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
      };
}