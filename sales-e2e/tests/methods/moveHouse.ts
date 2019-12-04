const moveHouse=require('../pages/moveHouse.page');
import {testFunction } from '../../global_methods/helper';

export class moveHouseMethod {
    public static async enterYourAddress(t,address) {
        await testFunction.click(t, moveHouse.elements.linkExistingCustomer);
        await testFunction.click(t,moveHouse.elements.btnEnterYourNewAddress);
        await testFunction.clearAndEnterText(t,moveHouse.elements.txtAddress,address);
        await testFunction.isElementVisible(t,moveHouse.elements.listOfAddresses);
        await testFunction.clickElementFromList(t,moveHouse.elements.listOfAddresses,address);
        await testFunction.waitForLoadingIconToClose();
        for(let i=0;i<10;i++){
          let strVal=await testFunction.getElementAttribute(t,moveHouse.elements.btnSelectMoveDate,`value`);
          if(strVal.includes("Please wait")){
            await t.wait(2000);
          }
          else{
            break;
          }
        }
    }
    public static  async selectMovingDate(t){
      await testFunction.click(t,moveHouse.elements.btnSelectMoveDate);
      await testFunction.selectDateFromCalendar(t,moveHouse.elements.tableCalendar);
      await testFunction.click(t,moveHouse.elements.btnMoving);
    }

}
