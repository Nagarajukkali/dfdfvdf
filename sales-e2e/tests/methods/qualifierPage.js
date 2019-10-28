const qualifierPage = require('../pages/qualifier.page');
import {testFuncs } from '../../global_methods/helper';
const helper  = testFuncs();

export function qualifierPageFunction() {
    async function clickContinueCartsPage(t) {
        await helper.click(t,qualifierPage.elements.cartsPageContinueButton); 
    }
    return {
        clickContinueCartsPage,     
      };
}